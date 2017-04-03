open Util

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open SolverData
open SolverUtil
open SolverCompLib

open SlnLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open MapData
open MapUtil

open MapIntervalCompute

exception MapNoiseComputeError of string

let error n m = raise (MapNoiseComputeError (n^":"^m))



(*
   Compute the noise with proapgaiton
*)
module NoiseCompute =
struct

  let mk_no_noise (mean:interval) =
    StochLib.mk_rand_var mean (IntervalLib.mk_ival_from_floats 0. 0.)

  let mk_zero_mean (noise:interval) =
    StochLib.mk_rand_var
      (IntervalLib.mk_ival_from_floats 0. 0.)
      noise

  let mk_zero_dist () =
    StochLib.mk_rand_var
      (IntervalLib.mk_ival_from_floats 0. 0.)
      (IntervalLib.mk_ival_from_floats 0. 0.)

  let _stack = STACK.make ()
  let _stack_push x = STACK.push _stack x
  let _stack_pop () = STACK.pop _stack
  let _stack_has x = STACK.has _stack x 


  let _compute_mid_noise tbl (id:mid) (mvar2noise:gltbl->string->rand_var)= match id with
      |MNVar(MInput,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs,mvar.bhvr with
          | MDefVar(def),MBhvInput-> mk_no_noise (def.ival)
          | _ -> error "ccompute_math_noise" "state variable cannot be input" 
        end
      |MNVar(_,v) ->
        begin
          mvar2noise tbl v
          (**)
        end
      
      | MNParam(par,num) ->
        mk_no_noise(IntervalLib.mk_ival_from_floats (float_of_number num) (float_of_number num)) 
      | _ ->
        error "compute_math_noise" "time id undefined"


(*if you have a dangling math expression on a port, find the [expr], and then*)
  let _compute_mexpr_noise (tbl:gltbl) (uast:mid ast) mvar2noise : rand_var =
    let math_noise =
      try
        StochLib.derive_noise uast
          (fun x -> _compute_mid_noise tbl x mvar2noise)
      with
      | StochLibError(e) ->
        warn "derive_math_noise" ("in the following expr:"^(MathLib.mast2str uast));
        raise (StochLibError e)
    in
    math_noise


  let rec compute_mvar_noise (tbl:gltbl) (vr:string) : rand_var =
    let mvar = MathLib.getvar tbl.env.math vr in
    if _stack_has vr then
      match mvar.defs with
      | MDefVar(defs) ->
        mk_no_noise defs.ival
      | MDefStVar(defs) ->
        mk_no_noise defs.stvar.ival
    else
      begin
        _stack_push vr;
        let noise = match mvar.bhvr with
          | MBhvStateVar(bhv) ->
            let prop_noise : rand_var =
              _compute_mexpr_noise tbl bhv.rhs compute_mvar_noise
            in
            (*compute the noise*)
            let _this_noise : rand_var =
              _compute_mexpr_noise tbl bhv.stoch.std compute_mvar_noise
            in
            let this_noise = mk_zero_mean _this_noise.mean in
            let noise = StochLib.add this_noise prop_noise in
            noise
          | MBhvVar(bhv) ->
            let prop_noise : rand_var =
              _compute_mexpr_noise tbl bhv.rhs compute_mvar_noise
            in
            let _this_noise : rand_var =
              _compute_mexpr_noise tbl bhv.stoch.std compute_mvar_noise
            in
            let this_noise = mk_zero_mean _this_noise.std in
            let noise = StochLib.add this_noise prop_noise in
            noise
          | _ -> error "mnvar" "no expected an input or undefined"
        in
        _stack_pop ();
        noise
      end


  let compute_mid_noise tbl x = _compute_mid_noise tbl x compute_mvar_noise

  let compute_mexpr_noise tbl uast =
    _compute_mexpr_noise tbl uast compute_mvar_noise

  let rec _compute_hwid_noise tbl comp inst cfg (x:hwvid) hwvar2noise : rand_var=
    match x with
      |HNParam(cmp,x) ->
        error "compute_hw_noise" "must be fully specified"
      |HNPort(knd,cmp,port,param) ->
        let vr = HwLib.comp_getvar comp port in
        hwvar2noise tbl comp inst cfg port
          
      |HNTime ->
        error "compute_hw_noise" "unexpected time"


  let compute_hwexpr_noise tbl comp inst cfg (rhs:hwvid ast) hwvar2noise : rand_var =
    let conc_rhs =
      ConcCompLib.specialize_params_hwexpr_from_compinst comp inst cfg rhs
    in
    let ival = StochLib.derive_noise conc_rhs
        (fun x -> _compute_hwid_noise tbl comp inst cfg x hwvar2noise) in
    ival

(*
     for hardware, backpropagate to compute noise. I.E. find connected output.
  *)
  let rec compute_hwvar_noise (tbl:gltbl) (comp:hwvid hwcomp) inst (cfg:hwcompcfg) (port:string) =
    let compute_propagating_noise  (prop:hwvid ast) (std:hwvid ast) : rand_var =
      let prop_noise : rand_var =
        compute_hwexpr_noise tbl comp inst cfg prop compute_hwvar_noise
      in
      let _this_noise : rand_var =
        compute_hwexpr_noise tbl comp inst cfg std compute_hwvar_noise
      in
      let this_noise = mk_zero_mean _this_noise.mean in
      (*determine the noise of the propagating function*)
      let noise = StochLib.add this_noise prop_noise in
      noise
    in
    let vr = HwLib.comp_getvar comp port in
    let stack_vr :string =
      SlnLib.wireid2str ({comp={name=comp.name;inst=inst};port=port})
    in
    if _stack_has stack_vr then
      match vr.defs with
      | HWDAnalog(defs) -> mk_no_noise defs.ival 
      | HWDAnalogState(defs) -> mk_no_noise defs.stvar.ival 
      | HWDDigital(defs) -> mk_no_noise defs.ival 
    else
      begin
        _stack_push stack_vr;
        let noise = match vr.bhvr,vr.defs with
          (*analog input produces noise*)
          | HWBInput,HWDAnalog(defs) ->
            begin
              let wire = (HwLib.port2wire comp.name inst port) in
              match (SlnLib.getsrcs tbl.sln_ctx wire) with
              | WCollEmpty -> mk_no_noise (defs.ival)
              | WCollOne(src_wire) ->
                (*get the originating wire*)
                let ccomp : ucomp_conc = SolverCompLib.get_conc_comp tbl src_wire.comp in
                compute_hwvar_noise tbl ccomp.d ccomp.inst ccomp.cfg src_wire.port

              | WCollMany(_) ->
                error "compute_hw_noise" "multiple source wires unhandled"
            end
          (*digital input produces no noise*)
          | HWBInput,HWDDigital(defs) ->
            mk_no_noise (defs.ival)
          (*compute hwexpr noise*)
          | HWBAnalog(bhv),_ ->
            compute_propagating_noise bhv.rhs bhv.stoch.std 
          (*compute hwexpr noise*)
          | HWBAnalogState(bhv),HWDAnalogState(defs) ->
            let stvar = compute_propagating_noise bhv.rhs bhv.stoch.std in
            {mean=defs.stvar.ival;std=stvar.std}
          | HWBDigital(bhv),_ ->
            compute_propagating_noise bhv.rhs (Integer(0)) 
          | _ -> error "compute_hw_noise" "unexpected bhvr/defs match"
        in
        _stack_pop ();
        noise
      end


  (*declare equivalence classes for a mapping*)

  let compute_hwid_noise tbl comp inst cfg port = _compute_hwid_noise tbl comp inst cfg port compute_hwvar_noise
   
  let compute_wire_noise tbl (wire:wireid) =
    let ccomp = SolverCompLib.get_conc_comp tbl wire.comp in
    let ival = compute_hwvar_noise tbl ccomp.d wire.comp.inst ccomp.cfg wire.port in
    ival

  let compute_wire_label_noise tbl (wire:wireid) : rand_var =
    let ccomp = SolverCompLib.get_conc_comp tbl wire.comp in
    let cfg_maybe :mid ast option = IntervalCompute.get_wire_label_expr tbl wire in
    match cfg_maybe with
    |Some(cfg) -> (compute_mexpr_noise tbl cfg )
    | _ -> mk_no_noise (IntervalLib.mk_ival_from_floats 0. 0.)
      
end

