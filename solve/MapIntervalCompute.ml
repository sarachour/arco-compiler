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




exception MapIntervalComputeError of string
    

let debug = print_debug 2 "eqn"

let error n m = raise (MapIntervalComputeError (n^":"^m))


module IntervalCompute =
struct
  let compute_mid_interval tbl (id:mid) = match id with
      |MNVar(MInput,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | _ -> error "ccompute_math_interval" "state variable cannom be input" 
        end
      |MNVar(MOutput,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | MDefStVar(def) -> def.stvar.ival
        end

      |MNVar(MLocal,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | MDefStVar(def) -> def.stvar.ival
        end


      | MNParam(par,num)->
        Quantize([float_of_number num])
      | MNTime ->
        error "compute_mid_interval" "time not expected"

  (*if you have a dangling math expression on a port, find the [expr], and then*)
  let compute_mexpr_interval (tbl:gltbl) (uast:mid ast) : interval =
    let math_interval =
      try
        IntervalLib.derive_interval uast (compute_mid_interval tbl) 
      with
      | IntervalLibError(e) ->
        warn "derive_math_interval" ("in the following expr:"^(MathLib.mast2str uast));
        raise (IntervalLibError e)
    in
    math_interval

  let compute_hwid_interval comp (x:hwvid) : interval=
      match x with
      |HNParam(cmp,x) -> error "compute_hw_interval" ("must be fully specified: "^x)
      |HNPort(knd,cmp,port,param) ->
        begin
          match (HwLib.comp_getvar comp port).defs with
          | HWDAnalog(d) -> d.ival
          | HWDAnalogState(x) -> x.stvar.ival
          | HWDDigital(d) -> d.ival
        end
      |HNTime -> error "compute_hw_interval" "unexpected time"

  let compute_hwexpr_interval comp inst cfg rhs : interval =
    let conc_rhs =
        ConcCompLib.specialize_params_hwexpr_from_compinst comp inst cfg rhs
      in
      debug ("computing interval "^(HwLib.hast2str conc_rhs));
      let ival = IntervalLib.derive_interval conc_rhs (compute_hwid_interval comp) in
      debug ("  -> "^IntervalLib.interval2str ival);
      ival

  let compute_hwport_interval (tbl:gltbl) (comp:hwvid hwcomp) inst (cfg:hwcompcfg) (port:string) =
    let vr = HwLib.comp_getvar comp port in
    match vr.bhvr,vr.defs with
    | HWBInput,HWDAnalog(defs) ->
      defs.ival
    | HWBInput,HWDDigital(defs) ->
      defs.ival
    | HWBAnalog(bhvr),_ ->
      compute_hwexpr_interval comp inst cfg bhvr.rhs 
    | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
      defs.stvar.ival
    | HWBDigital(bhvr),_ ->
      compute_hwexpr_interval comp inst cfg bhvr.rhs
      
    | _ -> error "compute_hw_interval" "unexpected bhvr/defs match"
      
      (*declare equivalence classes for a mapping*)

  let compute_deriv_hwport_interval (tbl:gltbl) (comp:hwvid hwcomp) inst (cfg:hwcompcfg) (port:string) =
    let vr = HwLib.comp_getvar comp port in
    match vr.bhvr,vr.defs with
    | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
      compute_hwexpr_interval comp inst cfg bhvr.rhs
    | _ -> error "compute_deriv_hw_interval" "unexpected bhvr/defs match"
   
  let compute_wire_interval tbl (wire:wireid) =
    let ccomp = SolverCompLib.get_conc_comp tbl wire.comp in
    let ival = compute_hwport_interval tbl ccomp.d wire.comp.inst ccomp.cfg wire.port in
    let min,max = IntervalLib.interval2numbounds ival in
    {min=min;max=max}

  let get_wire_label_expr (tbl) (wire:wireid) : mid ast option =
    let ccomp = SolverCompLib.get_conc_comp tbl wire.comp in
    match ConcCompLib.get_var_config ccomp.cfg wire.port with
    | Some(uast) -> Some(uast2mast uast)
    | None -> None

  let compute_wire_label_interval tbl (wire:wireid) : num_interval =
    let ccomp = SolverCompLib.get_conc_comp tbl wire.comp in
    match get_wire_label_expr tbl wire with
    |Some(cfg) -> IntervalLib.interval2numinterval
      (compute_mexpr_interval tbl cfg)
    | _ ->
      {min=999.;max=999.}
end

