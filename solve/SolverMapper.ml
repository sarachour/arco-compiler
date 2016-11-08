open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open Search
open SearchData

open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open Z3Data
open Z3Lib

exception SolverMapperError of string

let error n m = raise (SolverMapperError (n^":"^m))

let debug = print_debug 2 "eqn"
(*determines the kind of variable*)
type linear_slack_dir =
  | SVMin | SVMax

type linear_id =
  | SVScaleVar of wireid
  | SVOffsetVar of wireid

type linear_smt_id =
  | SVLinVar of linear_id
  | SVSlackVar of linear_slack_dir*float*wireid

type linear_stmt =
  | SVEquals of (linear_id ast) list
  | SVCoverEq of (linear_smt_id ast) list
  | SVCoverLTE of (linear_smt_id ast) list
  | SVCoverGTE of (linear_smt_id ast) list
  | SVDeclMapVar of linear_smt_id
  | SVLTE of (linear_id ast*linear_id ast)

type linear_mapping = {
  scale : linear_id ast;
  offset : linear_id ast;
  term: hwvid ast;
}

let dumb_cstrs_DBG = false

(*disable this if you aren't getting anything*)
let no_number_cstrs_DBG =false

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
      |HNParam(cmp,x) -> error "compute_hw_interval" "must be fully specified"
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





(*
   Compute the noise with proapgaiton
*)
module NoiseCompute =
struct

  let mk_no_noise (mean:interval) =
    StochLib.mk_rand_var mean (IntervalLib.mk_ival_from_floats 0. 0.)
      

  let _compute_mid_noise tbl (id:mid) (mexpr2noise:gltbl->mid ast->rand_var)= match id with
      |MNVar(MInput,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs,mvar.bhvr with
          | MDefVar(def),MBhvInput-> mk_no_noise (def.ival)
          | _ -> error "ccompute_math_noise" "state variable cannot be input" 
        end
      |MNVar(_,v) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          (**)
          match mvar.bhvr with
          | MBhvStateVar(bhv) ->
            let this_noise : rand_var = mexpr2noise tbl bhv.stoch.std in
            let prop_noise : rand_var = (mexpr2noise tbl bhv.rhs) in
            let noise = StochLib.add this_noise prop_noise in
            noise
          | MBhvVar(bhv) ->
            let this_noise : rand_var =  mexpr2noise tbl bhv.stoch.std in
            let prop_noise : rand_var = (mexpr2noise tbl bhv.rhs) in
            let noise = StochLib.add this_noise prop_noise in
            noise
          | _ -> error "mnvar" "no expected an input or undefined"
        end
      
      | MNParam(par,num) ->
        mk_no_noise(IntervalLib.mk_ival_from_floats (float_of_number num) (float_of_number num)) 
      | _ ->
        error "compute_math_noise" "time id undefined"


(*if you have a dangling math expression on a port, find the [expr], and then*)
  let rec compute_mexpr_noise (tbl:gltbl) (uast:mid ast) : rand_var =
    let math_noise =
      try
        StochLib.derive_noise uast
          (fun x -> _compute_mid_noise tbl x compute_mexpr_noise)
      with
      | StochLibError(e) ->
        warn "derive_math_noise" ("in the following expr:"^(MathLib.mast2str uast));
        raise (StochLibError e)
    in
    math_noise


  let compute_mid_noise tbl x = _compute_mid_noise tbl x compute_mexpr_noise
  

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
    debug ("computing noise "^(HwLib.hast2str conc_rhs));
    let ival = StochLib.derive_noise conc_rhs
        (fun x -> _compute_hwid_noise tbl comp inst cfg x hwvar2noise) in
    debug ("  -> "^StochLib.randvar2str ival);
    ival

(*
     for hardware, backpropagate to compute noise. I.E. find connected output.
  *)
  let rec compute_hwvar_noise (tbl:gltbl) (comp:hwvid hwcomp) inst (cfg:hwcompcfg) (port:string) =
    let compute_propagating_noise  (prop:hwvid ast) (std:hwvid ast) : rand_var =
        let this_noise : rand_var =
          compute_hwexpr_noise tbl comp inst cfg std compute_hwvar_noise
        in
        (*determine the noise of the propagating function*)
        let prop_noise : rand_var = compute_hwexpr_noise tbl comp inst cfg prop compute_hwvar_noise in
        let noise = StochLib.add this_noise prop_noise in
        noise
    in
    let vr = HwLib.comp_getvar comp port in
    match vr.bhvr,vr.defs with
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
      compute_propagating_noise bhv.rhs bhv.stoch.std 

    | HWBDigital(bhv),_ ->
      compute_propagating_noise bhv.rhs (Integer(0)) 
    | _ -> error "compute_hw_noise" "unexpected bhvr/defs match"
      
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


module MappingResolver =
struct

  type symtbl = {
    id2w: (int,wireid) map;
    w2id: (wireid,int) map;
  }
  let wire2id symtbl w : int=
    if MAP.has symtbl.w2id w then
      begin
        MAP.get symtbl.w2id w
      end
    else
      let id = MAP.size symtbl.w2id in 
      begin
        MAP.put symtbl.w2id w id;
        MAP.put symtbl.id2w id w;
        id
      end

  let id2wire symtbl id : wireid =
    MAP.get symtbl.id2w id

  let linearid2name symtbl x = match x with
    | (SVScaleVar(w)) ->
      let id = wire2id symtbl w in
      "sc_"^(string_of_int id)
    | (SVOffsetVar(w)) ->
      let id = wire2id symtbl w in
      "of_"^(string_of_int id)

  let linearsmtid2name symtbl x = match x with
    | SVLinVar(x) ->
      linearid2name symtbl x
    | SVSlackVar(SVMin,_,w) ->
      let id = wire2id symtbl w in
      "slbot_"^(string_of_int id)
    | SVSlackVar(SVMax,_,w) ->
      let id = wire2id symtbl w in
      "sltop_"^(string_of_int id)

  let name2linearsmtid symtbl x : linear_smt_id option=
    match STRING.split x "_" with
    | ["sc";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVLinVar(SVScaleVar(w)))
    | ["of";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVLinVar(SVOffsetVar(w)))
    | ["slbot";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVSlackVar(SVMin,-1.0,w))
    | ["sltop";id] ->
      let id = int_of_string id in
      let w = id2wire symtbl id in 
      Some (SVSlackVar(SVMax,-1.0,w))
    | h::t -> None 
    | [] -> error "name2linearsmtid" ("empty string ")

  let linearid2str (x:linear_id) = match x with
    | (SVScaleVar(w)) -> "sc."^(SlnLib.wireid2str w)
    | (SVOffsetVar(w)) -> "of."^(SlnLib.wireid2str w)

  let linearsmtid2str (x:linear_smt_id) : string = match x with
    | SVLinVar(x) -> linearid2str x
    | SVSlackVar(SVMin,_,w) -> "sl.min."^(SlnLib.wireid2str w)
    | SVSlackVar(SVMax,_,w) -> "sl.max."^(SlnLib.wireid2str w)

  let linearexpr2str (x:linear_id ast) : string =
    ASTLib.ast2str x linearid2str

  let linearsmtexpr2str (x:linear_smt_id ast) : string =
    ASTLib.ast2str x linearsmtid2str


  let linearstmt2str (x:linear_stmt) :string =
    let _plst (lst) (f) :string =
      List.fold_left (fun r x -> r^" {"^(f x)^"}") "" lst 
    in
    match x with
    | SVEquals(lst) ->
      "= "^(_plst lst linearexpr2str)
    | SVCoverEq(lst) ->
      "= "^(_plst lst linearsmtexpr2str)
    | SVCoverGTE(lst) ->
      "<= "^(_plst lst linearsmtexpr2str)
    | SVCoverLTE(lst) ->
      ">= "^(_plst lst linearsmtexpr2str)
    | SVDeclMapVar(id) ->
      "decl "^(linearsmtid2str id)



  let mkhwmapping () =
    {
      offset=999.;
      scale=999.;
      mrng = IntervalLib.mk_num_ival ();
      hrng = IntervalLib.mk_num_ival ();
      wire = SlnLib.mkdflt_wire ();
      expr = Term(MathId(MNVar(MInput,"UNSET")));
    }

  let hwmapping2str (x:hw_mapping) =
    let f2s x = if x = 999. then "?" else string_of_float x in
    let eff_hrng = IntervalLib.clamp x.hrng (IntervalLib.transform x.mrng x.scale x.offset) in 
    let eff_mrng = IntervalLib.inv_transform eff_hrng x.scale x.offset in 
    (SlnLib.wireid2str x.wire)^"  = "^(uast2str x.expr)^"\n"^
    "LIN: "^(f2s x.scale)^"* @ + "^(f2s x.offset)^"\n"^
    "   [H]:"^(IntervalLib.numinterval2str x.hrng)^"\n"^
    "   [M]:"^(IntervalLib.numinterval2str x.mrng)^"\n"^
    "   [h]:"^(IntervalLib.numinterval2str eff_hrng)^"\n"^
    "   [m]:"^(IntervalLib.numinterval2str eff_mrng)^"\n"

  let z3result2mapping gltbl symtbl (asgns:z3assign list): (wireid,hw_mapping) map =
    let data = MAP.make () in
    let upd_map_result id fxn =
      if MAP.has data id = false then
        noop (MAP.put data id (mkhwmapping()));
        fxn (MAP.get data id)
    in
    let upd_map_result_of_id s f =
      let wire = match s with
      | Some(SVLinVar(SVOffsetVar(w))) ->
        upd_map_result w (fun x -> x.offset <- f); Some w

      | Some(SVLinVar(SVScaleVar(w))) ->
        upd_map_result w (fun x -> x.scale <- f); Some w

      | _ -> None
      in
      match wire with
      | Some(wire) ->
        let math_ival = IntervalCompute.compute_wire_label_interval gltbl wire in
        let math_expr = IntervalCompute.get_wire_label_expr gltbl wire in
        let hw_ival = IntervalCompute.compute_wire_interval gltbl wire in
        upd_map_result wire (fun x -> x.wire<- wire);
        begin
          match math_expr with
          | Some(expr) -> upd_map_result wire (fun x -> x.expr <- mast2uast expr)
          | _ -> ()
        end;
        upd_map_result wire (fun x -> x.mrng <- math_ival);
        upd_map_result wire (fun x -> x.hrng <- hw_ival);
        ()
      | None -> ()
    in
    (*create result map*)
    List.iter (fun asgn -> match asgn with
        | Z3Set(s,Z3QFloat(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_map_result_of_id id f 
          
        | Z3Set(s,Z3QInt(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_map_result_of_id id (float_of_int f)

        | Z3Set(s,Z3QInterval(Z3QRange(min,max))) ->
          let id = name2linearsmtid symtbl s in
          if MATH.cmp min max 1e-6  then
            upd_map_result_of_id id (max)
          else
            begin
            warn "z3result2mapsln" ("interval is not equal: "^
                  (string_of_float min)^" "^(string_of_float max));
            upd_map_result_of_id id (max)
            end
        | Z3Set(s,Z3QInterval(Z3QInfinite(dir))) -> 
                warn "z3result2mapsln" "interval is infinite"

        | Z3Set(s,Z3QInterval(_)) ->
          error "z3result2mapresult" "unhandled quantity:interval"
        | _ ->
          error "z3result2mapresult" "unhandled"
    ) asgns;
    MAP.iter data (fun wire data ->
        debug ("[MAP]>> "^hwmapping2str data);
        ()
      );
    data

  let to_z3prob stmts : (symtbl*z3st list*z3expr) =
    let tbl = {id2w=MAP.make();w2id=MAP.make()} in
    let slackvars : (string,float) map= MAP.make() in
    let stmtq = QUEUE.make () in
    let enq x = begin QUEUE.enqueue stmtq x; () end in
    let smtexpr_to_z3prob (s:linear_smt_id ast) :z3expr =
      match ASTLib.compute s with 
      | Some(f) -> Z3Real(f)
      | None -> Z3Lib.ast2z3 s (fun x -> Z3Var(linearsmtid2name tbl x))
    in
    let expr_to_z3prob (s:linear_id ast) :z3expr =
      match ASTLib.compute s with
      | Some(f) ->Z3Real(f)
      | None -> Z3Lib.ast2z3 s (fun x -> Z3Var(linearid2name tbl x))
    in
    let mkeq lst = match lst with
      | h::h2::t ->
        Z3Assert(Z3Lib.fn_all
                   (List.map (fun x -> Z3Eq(h,x))(h2::t))
                   (fun x y -> Z3And(x,y))
                )
      | [h] -> Z3Comment("removed single elem eq")
      | [] -> Z3Comment("removed zero elem eq")
    in
    let stmt_to_z3prob s = match s with
      | SVDeclMapVar(SVLinVar(x)) ->
        enq (Z3ConstDecl(linearid2name tbl x,Z3Real))
      | SVDeclMapVar(SVSlackVar(dir,weight,x)) ->
        let svar_name = linearsmtid2name tbl (SVSlackVar(dir,weight,x)) in
        MAP.put slackvars svar_name weight;
        enq (Z3ConstDecl(svar_name,Z3Real))
      | SVEquals(lst) ->
        let z3lst : z3expr list= List.map expr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(linearstmt2str s));
        enq (mkeq (z3lst))
      | SVCoverGTE(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(linearstmt2str s));
        enq (Z3Assert(Z3Lib.fn_all z3lst (fun x y -> Z3GTE(x,y))))
      | SVCoverLTE(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(linearstmt2str s));
        enq (Z3Assert(Z3Lib.fn_all z3lst (fun x y -> Z3LTE(x,y))))
      | SVCoverEq(lst) ->
        let z3lst : z3expr list= List.map smtexpr_to_z3prob lst in
        enq (Z3Comment "");
        enq (Z3Comment(linearstmt2str s));
        enq (mkeq (z3lst))
      | SVLTE(a,b) ->
        let asmt = expr_to_z3prob a in
        let bsmt = expr_to_z3prob b in
        enq (Z3Assert(Z3LTE(asmt,bsmt)))
    in
    (*traverse statements*)
    List.iter stmt_to_z3prob stmts;
    let z3stmts = QUEUE.to_list stmtq in 
    QUEUE.destroy stmtq;
    let absval (expr) =
      Z3IfThenElse(Z3GTE(expr,Z3Int(0)),expr, Z3Neg(expr))
    in
    let z3minterms : z3expr list = MAP.map slackvars
        (fun svar weight ->
           Z3Mult(absval(Z3Var(svar)),Z3Real(weight)))
    in
    match z3minterms with
    | h::h2::t ->
      tbl,z3stmts,(Z3Lib.fn_all z3minterms (fun x y -> Z3Plus(x,y)))
    | [stmt] ->
      tbl,z3stmts,stmt
    | [] ->
     tbl,z3stmts,Z3Int(0)


  let solve gltbl (stmts:linear_stmt list) : (wireid,hw_mapping) map option =
    (*helper function*)
    let tbl,stmts,minexpr = to_z3prob stmts in 
    let result : z3sln =
      Z3Lib.minimize "mapper" (stmts) minexpr 0. 1. true in
    if result.sat then
      begin
      match result.model with
      | Some(model) ->
        begin
        let mappings = z3result2mapping gltbl tbl model in
        Some(mappings)
        end
      | None ->
        warn "solve" "no model";
        None
      end
    else
      begin
        warn "solve" "!!>> NO MODEL <!!";
        None
      end

end

module SolverMapper =
struct




  (*propagate wire rules for scaling factors *)
  let derive_scaling_factor (node:hwvid ast) (feedback:wireid list) (cfg:hwcompcfg)
    : (linear_stmt list)*linear_mapping =
    let decompose_list (args:hwvid ast list) (fn:hwvid ast -> linear_mapping)  =
      List.fold_right (fun farg (scales,offsets,terms) ->
          let arg = fn farg in 
          (arg.scale::scales,arg.offset::offsets,arg.term::terms)
        ) args ([],[],[])
    in
    let cstrs : linear_stmt queue = QUEUE.make () in 
    let add_cstr x =
      debug ("expr+ "^(MappingResolver.linearstmt2str x));
      noop (QUEUE.enqueue cstrs x)
    in
    let rec _derive_scaling_factor (node) : (linear_mapping) =
      match node with
      | Term(HNPort(knd,HCMGlobal(cmp),port,prop)) ->
        let wire = SlnLib.mkwire cmp.name cmp.inst port in
        begin
          match LIST.has feedback wire with
          | true ->
            {
              scale=Integer(1);
              offset=Integer(0);
              term=node;
            }
          | false ->
            let new_node = match ConcCompLib.get_var_config cfg port with
              | Some(Integer(i)) -> Integer(i)
              | Some(Decimal(i)) -> Decimal(i)
              | Some(_) -> node
              | None -> node
            in
            {
              scale=Term(SVScaleVar(wire));
              offset=Term(SVOffsetVar(wire));
              term=node;
            }
        end
         
      | Term(HNParam(cmp,name)) ->
        begin
          match ConcCompLib.get_param_config cfg name with
          | Some(Decimal value) ->
            {scale=Integer(1); offset=Integer(0);term=Decimal(value);}
          | Some(Integer value) ->
            {scale=Integer(1); offset=Integer(0);term=Integer(value);}
          | None ->
            {scale=Integer(1); offset=Integer(0);term=node;}
        end

      | Term(HNTime) ->
        {scale=Integer(1); offset=Integer(0);term=node;}
      (*no offset unless the value is resolvable as a number*)

      | OpN(Mult,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        (*if this aggregate term is zero, then*)
        if LIST.count terms (fun term -> term = Integer(0) || term = Decimal(0.)) > 0 then
          {scale=OpN(Mult,scales);offset=Integer(0);term=Integer(0);}
        else
          begin
          (*all offsets must equal zero*)
          add_cstr (SVEquals(Integer(0)::offsets));
          {scale=OpN(Mult,scales);offset=Integer(0);term=node;}
          end

      | OpN(Add,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        add_cstr (SVEquals(scales));
        {scale=List.nth scales 0; offset=OpN(Add,offsets); term=node;
        }
        
      | OpN(Sub,args) ->
        let (scales,offsets,terms) = decompose_list args _derive_scaling_factor in
        add_cstr (SVEquals(scales));
        {scale=List.nth scales 0;offset=OpN(Sub,offsets);term=node;}
        
      | Op2(Div,num,denom) ->
        let ln = _derive_scaling_factor num in
        let ld = _derive_scaling_factor denom in
        (*all offsets must equal zero*)
        add_cstr (SVEquals([Integer(0);ln.offset;ld.offset]));
        {scale=Op2(Div,ln.scale,ld.scale);offset=Integer(0);term=node;}

      | Op1(Exp,expr) ->
        let expr = _derive_scaling_factor expr in
        add_cstr (SVEquals([Integer(1);expr.scale]));
        {scale=Op1(Exp,expr.offset); offset=Integer(0); term=node; }

      | Op1(Neg,expr) ->
        let expr = _derive_scaling_factor expr in
        {scale=Op1(Neg,expr.scale);offset=Op1(Neg,expr.offset);term=node;}

      | Op2(Power,base,exp) ->
        let exp = _derive_scaling_factor exp in
        let base = _derive_scaling_factor base in
        add_cstr (SVEquals([Integer(1);base.scale;exp.scale]));
        add_cstr (SVEquals([Integer(0);base.offset;exp.offset]));
        {scale=Integer(1); offset=Integer(0);term=node;}

      | Integer(0) ->
        {scale=Integer(0); offset=Integer(0);term=node;}

      | Decimal(0.) ->
        {scale=Integer(0); offset=Integer(0);term=node;}

      | Integer(i) -> 
        {scale=Integer(1); offset=Integer(0);term=node;}

      | Decimal(d) ->
        {scale=Integer(1); offset=Integer(0);term=node;}
      | _ -> error "derive_scaling_factor" "unhandled"
    in
    let scaling = _derive_scaling_factor node in
    let stmts = QUEUE.to_list cstrs in 
    QUEUE.destroy cstrs;
    stmts,scaling

  let hwvar_derive_scaling_factors (comp:hwcompinst) cfg (v:hwvid hwportvar) : linear_stmt list =
      let wire = SlnLib.mkwire comp.name comp.inst v.port in
      let stmtq = QUEUE.make() in
      let enq x =
        debug ("+ hwvar "^(MappingResolver.linearstmt2str x));
        noop (QUEUE.enqueue stmtq x)
      in
      let enqs x = List.iter enq x in
      (*stupidly enforce linear*)
      begin
        match v.bhvr with
          | HWBAnalog(bhvr) ->
            let cstrs,linear = derive_scaling_factor bhvr.rhs [] cfg in
            begin
              if dumb_cstrs_DBG then
                enqs [
                  SVEquals([Term(SVScaleVar(wire));Integer(1)]);
                  SVEquals([Term(SVOffsetVar(wire));Integer(0)]);
                ]
              else
                enqs cstrs;
            end;
            enq (SVEquals([Term(SVScaleVar(wire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(wire));linear.offset]));
            ()
          | HWBAnalogState(bhvr) ->
            let icport,_ = bhvr.ic in 
            let cstrs,linear = derive_scaling_factor bhvr.rhs [wire] cfg in
            let icwire = SlnLib.mkwire comp.name comp.inst icport in
            begin
              if dumb_cstrs_DBG then
                enqs [
                  SVEquals([Term(SVScaleVar(wire));Integer(1)]);
                  SVEquals([Term(SVOffsetVar(wire));Integer(0)]);
                ]
              else
                enqs cstrs;
            end;
            enq (SVEquals([Term(SVScaleVar(wire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(wire));linear.offset;Integer(0)]));
            (*initial condition constraints*)
            enq (SVEquals([Term(SVScaleVar(icwire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(icwire));linear.offset])); 
            ()

          | _ -> error "hw_derive_scaling_factor" "unhandled"
      end;
      let lst = QUEUE.to_list stmtq in
      QUEUE.destroy stmtq;
      lst

  (*derive scaling factors from the component*)
  let hwcomp_derive_scaling_factors tbl (comp:hwvid hwcomp) inst (cfg:hwcompcfg) = 
    let stmts = QUEUE.make () in
    let enq xs = List.iter (fun x -> noop(QUEUE.enqueue stmts x)) xs in
    let decl_mapvar (n:wireid) =
      enq [
        SVDeclMapVar(SVLinVar(SVScaleVar(n)));
        SVDeclMapVar(SVLinVar(SVOffsetVar(n)))
      ]
    in
    (*add decls*)
    HwLib.comp_iter_vars comp (fun var ->
        let wire = SlnLib.mkwire comp.name inst var.port in 
        noop (decl_mapvar wire)
    );
    (*add behavior cstrs*)
    HwLib.comp_iter_outs comp (fun outvar ->
        let cstrlst : linear_stmt list =
          hwvar_derive_scaling_factors {name=comp.name;inst=inst} cfg outvar 
        in
        enq cstrlst;
        ()
      );
    let scale wire mval : linear_smt_id ast =
      OpN(Add,[
          OpN(Mult,[
              Term(SVLinVar(SVScaleVar(wire)));
                   Decimal(mval)
            ]);
          Term(SVLinVar(SVOffsetVar(wire)))
        ])
    in
    let decl_slack wire =
      enq [SVDeclMapVar(SVSlackVar(SVMin,1.0,wire));
           SVDeclMapVar(SVSlackVar(SVMax,1.0,wire))]
    in
    let add_slack dir id expr =
      OpN(Add,[expr;Term(SVSlackVar(dir,1.0,id))])
    in
    let bound_to_number bnd = match bnd with
      | BNDNum(x) -> x
      | _ -> error "bound_to_number" "expected a finite numerical bound"
    in
    (*iterate for each math variable*)
    ConcCompLib.iter_var_cfg cfg
      (fun (port:string) (x:hwvarcfg) ->
        let wire = SlnLib.mkwire comp.name inst port in
        let mival : interval = IntervalCompute.compute_mexpr_interval tbl (uast2mast x.expr) in
        let hival : interval = IntervalCompute.compute_hwport_interval tbl comp inst cfg port in
        let queue_quant v (h:interval_data) =
          if no_number_cstrs_DBG then
            ()
          else
            enq [
              SVCoverLTE([(scale wire v);Decimal(bound_to_number h.max)]);
              SVCoverGTE([(scale wire v);Decimal(bound_to_number h.min)])
            ]
        in
        match mival,hival with
        | (Quantize([v]),Interval(h)) ->
          queue_quant v h
        | (Interval(m),Interval(h)) ->
          begin
            let mmin = bound_to_number m.min and mmax = bound_to_number m.max in
            if mmin =mmax then
              queue_quant mmin h
            else
              begin
                decl_slack wire;
                enq [
                  SVCoverEq([add_slack SVMin wire (scale wire (mmin));
                        Decimal(bound_to_number h.min)]);
                  SVCoverEq([add_slack SVMax wire (scale wire (mmax));
                        Decimal(bound_to_number h.max)])
                ]
              end
          end
        | (Quantize([v]),MixedInterval(_)) ->
          error "compute_cover" "quantize-mixed-interval"
        | (Interval(ival),MixedInterval(_)) ->
          error "compute_cover" "interval-mixed-interval"
        | (Quantize(_),Quantize(_)) ->
          error "compute_cover" "quantize-quantize"
        | (IntervalUnknown(_),_) ->
          error "compute_cover" "unknown interval"
        | (_,IntervalUnknown(_)) ->
          error "compute_cover" "unknown interval"

        | _ -> error "compute cover" "unsupported"
      )
      (fun (param:string) (x:number) -> ());
    let cstrs = QUEUE.to_list stmts in
    QUEUE.destroy stmts;
    cstrs

  let hwconn_derive_scaling_cstrs (tbl:gltbl) =
    let cstrq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue cstrq x) in
    SlnLib.iter_conns tbl.sln_ctx (fun src dst ->
        q (SVEquals([(Term(SVScaleVar(src)));(Term(SVScaleVar(dst)))]));
        q (SVEquals([Term(SVOffsetVar(src));Term(SVOffsetVar(dst))]));
        ()
      );
    let cstrs = QUEUE.to_list cstrq in
    QUEUE.destroy(cstrq);
    cstrs

  (*
    for each generated statevar def, ensure that the state variable we mapped to
     has the same speed. Also ensure the speed combined with any sort of output measurement
     for that property has a period less than or equal to the sampling rate
  *)
  let hwgen_derive_speed_cstrs (tbl:gltbl) =
    let cstrq = QUEUE.make () in
    let stvars = QUEUE.make () in
    let q x = noop (QUEUE.enqueue cstrq x) in
    let qstvar x = noop (QUEUE.enqueue stvars x) in
    (*derive the speed equivalence relation*)
    SlnLib.iter_generates tbl.sln_ctx (fun (x:ulabel) (routes) ->
        let vr_maybe = match x with
          | MOutLabel(v)-> Some (v.wire,MathLib.getvar tbl.env.math v.var)
          | MLocalLabel(v)->Some (v.wire,MathLib.getvar tbl.env.math v.var)
          | _ -> None
        in
        match vr_maybe with
        | Some(wire,vr) ->
          begin
            match vr.defs with
            | MDefStVar(stvar) ->
              begin
                qstvar(wire);
                let math_sample = ASTLib.number2ast stvar.sample in 
                begin
                  match wire.comp.name with
                  | HWCmOutput(_) ->
                    let ovar = HwLib.wire2hwvar tbl.env.hw wire in
                    (*get the sampling rate.*)
                    begin
                      match ovar.defs with
                      | HWDDigital(dig) ->
                        let hw_sample,_ = dig.sample in
                        let hw_sample_expr = OpN(Mult,[
                            Term(SVScaleVar(wire));
                            ASTLib.number2ast hw_sample
                          ]) in
                        q (SVLTE(hw_sample_expr,math_sample))
                      | _ ->
                        error "hwconn_derive_speed_constraints" "cannot derive speed of analog port"
                    end
                  | _ -> ()
                end
              
              end
            | _ -> ()
          end
        | None -> ()
   );
  let args = QUEUE.map stvars (fun stvar -> Term(SVScaleVar(stvar))) in
  q (SVEquals(args));
  let cstrs = QUEUE.to_list cstrq in
  QUEUE.destroy(cstrq);
  cstrs

  (*given the scaling factor, scale up the noise + noise propagation*)
  let hwgen_derive_noise_cstrs (tbl:gltbl) =[]

  let mappings2str (lst:(wireid,hw_mapping) map ) =
    MAP.fold lst (fun wire mapping str ->
        str^(MappingResolver.hwmapping2str mapping)
      ) "" 

  let infer (tbl:gltbl)  : (wireid,hw_mapping) map option =
    let stmtq = QUEUE.make () in
    let valid = REF.mk true in 
    let enq stmts = List.iter (fun st -> noop (QUEUE.enqueue stmtq st)) stmts in
    (*iter used comps to generate coverage constraints.*)
    SolverCompLib.iter_used_comps tbl (fun inst ccomp ->
        let steps =
          try
            hwcomp_derive_scaling_factors tbl ccomp.d ccomp.inst ccomp.cfg
          with
          | IntervalLibError(e) -> REF.upd valid (fun x -> false); []
        in
        enq (steps)
      );
    (*derive constraints from connections made by the solution*)
    enq (hwconn_derive_scaling_cstrs tbl);
    (*derive constraints on the uniformity of the speed*)
    enq (hwgen_derive_speed_cstrs tbl);
    (*derive constraints that ensure the noise is minimized*)
    enq (hwgen_derive_noise_cstrs tbl);
    if REF.dr valid then
      let stmts = QUEUE.to_list stmtq in 
      let sln : (wireid,hw_mapping) map option = MappingResolver.solve tbl stmts in
      QUEUE.destroy stmtq;
      sln
    else
      None
end

module SolverMapperHeuristics =
struct


  let noise_summary (tbl:gltbl) =
    (*for each generated output*)
    SlnLib.iter_generates tbl.sln_ctx (fun (g:ulabel) routes ->
        let wire = SlnLib.label2wire g in
        let hwnoise = NoiseCompute.compute_wire_noise tbl wire in
        let mnoise = NoiseCompute.compute_wire_label_noise tbl wire in
        debug ((SlnLib.ulabel2str g)^":"
               ^(StochLib.randvar2str hwnoise)^" -> "^
               (StochLib.randvar2str mnoise))
      )


  let map_summary (tbl:gltbl) =
    SlnLib.iter_generates tbl.sln_ctx (fun (g:ulabel) routes ->
        let wire = SlnLib.label2wire g in
        let hwival = IntervalCompute.compute_wire_interval tbl wire in
        let mival = IntervalCompute.compute_wire_label_interval tbl wire in
        debug ((SlnLib.ulabel2str g)^":"^
               (IntervalLib.numinterval2str hwival)^" -> "^
               (IntervalLib.numinterval2str mival))
      )

  let mapping_heuristic (tbl:gltbl) = ()

  let noise_heuristic (tbl:gltbl) = ()

  let sample_heuristic (tbl:gltbl) = ()


end
