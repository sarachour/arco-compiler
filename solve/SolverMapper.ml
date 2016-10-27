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

open SolverGoalTable
open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open IntervalData
open IntervalLib

open Z3Data
open Z3Lib

exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let debug = print_debug 2 "eqn"
(*declare math scale variables*)

(*defines the inference variable, including a slack variable,
  a scaling and descaling value*)
(*
type inf_abs_var_knd =
  | INFMVar of string
  | INFHVar of wireid

type inf_abs_var = {
  ival:interval;
  id:int;
}
type inf_cover = {
  wire:wireid;
  weight:float;
}
type inf_var_type = Offset | Scale

type inf_var = {
  wire: wireid;
  knd: inf_var_type;
}

type scratch_inf_wire_data = {
  expr: mapvar ast;
  knd: inf_var_type;
  wire: wireid;
}
type scratch_inf_cstr =
  | IScratchCSTWireExpr of scratch_inf_wire_data
  | IScratchCSTGenEquals of (inf_var ast)*(inf_var ast)

type inf_scratch = {
  mutable cls:(mapvar,inf_var list) map;
  mutable cstr:mapvar scratch_inf_cstr list;
}
type inf_cstr =
  | ICSTEquiv of inf_var list
  | ICSTEqExpr of inf_var inf_cstr_expr

type inf_problem = {
  mutable mvars: (string,inf_abs_var) map;
  mutable hvars: (wireid,inf_abs_var) map;
  mutable vars: (int,inf_abs_var_knd) map;
  (**)
  mutable cover: (string,inf_cover) map;
  mutable cstrs : inf_cstr list;
  mutable cnt : int;
  mutable scratch: inf_scratch;
}
*)

module InferenceProblem =
struct

(*
  let mkscratch () =
    {
      cls=MAP.make();
      cstr=[];
    }

  let clear_scratch inf =
    MAP.clear inf.scratch.cls;
    inf.scratch.cstr <- [];
    ()

  let mk () =
    {
      mvars=MAP.make();
      hvars=MAP.make();
      vars=MAP.make();
      cover=MAP.make();
      scratch=mkscratch();
      cstrs=[];
      cnt=0;
    }

  let scratch_declare_class inf v =
    debug ("class-var: declaring "^v);
    MAP.put inf.scratch.cls v []

  let scratch_add_to_class inf knd cls wire =
    if MAP.has inf.scratch.cls cls = false then
      error "scratch_add_to_class" ("could not find map-var "^cls)
    else
      let curr_list = MAP.get inf.scratch.cls cls in
      let entry = {knd=knd;wire=wire} in
      MAP.put inf.scratch.cls cls (entry::curr_list);
      ()

  let scratch_add_class_cstr inf knd clsexpr wire =
    let curr_list = inf.scratch.cstr in
    let entry = {wire=wire;knd=knd;expr=clsexpr} in
    inf.scratch.cstr <- entry::curr_list;
    ()

  let apply_scratch inf =
    let cstrs = QUEUE.make() in
    let enq x = QUEUE.enqueue cstrs x in
    let cls2infrvar x =
      if MAP.has inf.scratch.cls x then
        let infvars = MAP.get inf.scratch.cls x in
        if List.length infvars > 0 then
          List.nth infvars 0
        else
          error "apply_scratch" "expected at least one var mapping"
      else
        error "apply_scratch" "map variable is undeclared in spec"
    in
    MAP.iter inf.scratch.cls (fun cls infvars ->
        noop (enq (ICSTEquiv infvars))
      );
    List.iter (fun cstr_eq ->
        let expr = ASTLib.map cstr_eq.expr cls2infrvar in
        let entry = {wire=cstr_eq.wire;knd=cstr_eq.knd;expr=expr} in
        noop (enq (ICSTEqExpr(entry)))
      ) inf.scratch.cstr;
    inf.cstrs <- inf.cstrs @ (QUEUE.to_list cstrs);
    QUEUE.destroy cstrs;
    clear_scratch inf;
    ()
  let declare_mexpr (iprob:inf_problem) expr ival =
    let mstr = uast2str expr in
    MAP.put iprob.mvars mstr {ival=ival;id=iprob.cnt};
    MAP.put iprob.vars iprob.cnt (INFMVar mstr);
    iprob.cnt <- iprob.cnt + 1;
    ()

  let declare_wire (iprob:inf_problem) wire ival =
    MAP.put iprob.hvars wire {ival=ival;id=iprob.cnt};
    MAP.put iprob.vars iprob.cnt (INFHVar wire);
    iprob.cnt <- iprob.cnt + 1;
    ()

  (*cover*)
  let declare_cover (iprob:inf_problem) wire expr weight =
    let mstr = uast2str expr in
    MAP.put iprob.cover mstr {wire=wire;weight=weight};
    ()

  type tmp_map_result = {
    mutable offset:float;
    mutable scale:float;
    mutable slack_min: float;
    mutable slack_max: float;
  }


  
  let infprob2z3prob (iprob) =
    let id2offset s = "os_"^(string_of_int s) in
    let id2scale s = "sc_"^(string_of_int s) in
    let id2minslack s = "slmin_"^(string_of_int s) in
    let id2maxslack s = "slmax_"^(string_of_int s) in
    let wire_to_z3var (knd:inf_var_type) (wire:wireid) =
      let wid = (MAP.get iprob.hvars wire).id in
      match knd with
      | Offset -> Z3Var(id2offset wid)
      | Scale -> Z3Var(id2scale wid)
    in
    let infvar_to_z3var (v:inf_var) = wire_to_z3var v.knd v.wire in 
    (*Instruction Queue*)
    let insts = QUEUE.make() in
    let enq inststk =
      List.iter (fun inst -> noop (QUEUE.enqueue insts inst)) inststk
    in
    let absval (expr) =
      Z3IfThenElse(Z3GTE(expr,Z3Int(0)),expr, Z3Neg(expr))
    in
    (*declare variables*)
    enq [(Z3Comment "");(Z3Comment "math variable decls")];
    MAP.iter iprob.mvars (fun mvar mdata ->
        let mmax = IntervalLib.get_max mdata.ival in
        let mmin= IntervalLib.get_min mdata.ival in
        enq [
          Z3ConstDecl(id2scale mdata.id,Z3Real);
          Z3ConstDecl(id2offset mdata.id,Z3Real);
        ];
        begin
          if mmax != mmin then
            enq [
            Z3ConstDecl(id2minslack mdata.id,Z3Real);
            Z3ConstDecl(id2maxslack mdata.id,Z3Real)
            ]
        end
      );
    enq [(Z3Comment "");(Z3Comment "hw variable decles")];
    MAP.iter iprob.hvars (fun wire wdata ->
        enq [
          Z3ConstDecl(id2scale wdata.id,Z3Real);
          Z3ConstDecl(id2offset wdata.id,Z3Real);
        ]
      );

    (*add cover expressions*)
    enq [(Z3Comment "");(Z3Comment "covers")];
    MAP.iter iprob.cover (fun mvar cover ->
        let mi = MAP.get iprob.mvars mvar in
        let hi = MAP.get iprob.hvars cover.wire in
        let mmax = IntervalLib.get_max mi.ival and mmin= IntervalLib.get_min mi.ival in
        let hmax = IntervalLib.get_max hi.ival and hmin =IntervalLib.get_min hi.ival in
        if mmax = mmin then
          let mnumexpr =
              Z3Plus(
                Z3Mult(Z3Var(id2scale mi.id),Z3Real(mmax)),
                Z3Var(id2offset mi.id)
              )
          in
          enq [
            Z3Comment("");
            Z3Comment(mvar^" -> "^(SlnLib.wireid2str cover.wire));
            Z3Assert(Z3LTE(mnumexpr,Z3Real(hmax)));
            Z3Assert(Z3GTE(mnumexpr,Z3Real(hmin)));

            Z3Assert(Z3Eq(Z3Var(id2scale mi.id),Z3Var(id2scale hi.id)));
            Z3Assert(Z3GT(Z3Var(id2scale mi.id),Z3Real(0.)));

            Z3Assert(Z3Eq(Z3Var(id2offset mi.id),Z3Var(id2offset hi.id)));
            Z3Assert(Z3LTE(Z3Var(id2offset mi.id),Z3Real(hmax)));
          ]
        else
          let mmaxexpr =
            Z3Plus(
              Z3Plus(
                Z3Mult(Z3Var(id2scale mi.id),Z3Real(mmax)),
                Z3Var(id2offset mi.id)
              ),
              Z3Var(id2maxslack mi.id)
            )
          in
          let mminexpr =
            Z3Plus(
              Z3Plus(
                Z3Mult(Z3Var(id2scale mi.id),Z3Real(mmin)),
                Z3Var(id2offset mi.id)
              ),
              Z3Var(id2minslack mi.id)
            )
          in
          enq [
            Z3Comment("");
            Z3Comment(mvar^" -> "^(SlnLib.wireid2str cover.wire));
            Z3Assert(Z3Eq(mmaxexpr,Z3Real(hmax)));
            Z3Assert(Z3Eq(mminexpr,Z3Real(hmin)));
            Z3Assert(Z3Eq(Z3Var(id2scale mi.id),Z3Var(id2scale hi.id)));
            Z3Assert(Z3LTE(Z3Var(id2scale mi.id),Z3Real((hmax-.hmin)/.(mmax-.mmin))));
            Z3Assert(Z3GT(Z3Var(id2scale mi.id),Z3Real(0.)));

            Z3Assert(Z3Eq(Z3Var(id2offset mi.id),Z3Var(id2offset hi.id)));
            Z3Assert(Z3LTE(Z3Var(id2offset mi.id),Z3Real(hmax)));
          ]
        
      );

    enq [(Z3Comment "");(Z3Comment "expression constraints")];
    (*add expression constraints*)
    LIST.iter  (fun cstr -> match cstr with
        | ICSTEqExpr(varexpr) ->
          let expr = Z3Lib.ast2z3 varexpr.expr infvar_to_z3var in 
          enq [Z3Assert(Z3Eq(wire_to_z3var varexpr.knd varexpr.wire,expr))]
        | ICSTEquiv(varids) ->
          if List.length varids > 1 then
            enq [Z3Assert(Z3Lib.eq_all (List.map (fun vid -> infvar_to_z3var vid) varids))]
      ) iprob.cstrs;

    (*add minimization function*)
    let summands = MAP.fold iprob.cover (fun mvar cover summands ->
        let mdata = (MAP.get iprob.mvars mvar) in
        let mmin = IntervalLib.get_min mdata.ival in 
        let mmax = IntervalLib.get_max mdata.ival in 
        let min_slack = id2minslack mdata.id and max_slack = id2maxslack mdata.id in
        if mmin = mmax then
          summands
        else
          let expr =
            Z3Mult(absval (Z3Plus(Z3Var(min_slack),Z3Var(max_slack))),Z3Real(cover.weight))
          in
          expr::summands
      ) []
    in
    (*query solving problem*)
    let stmts = QUEUE.to_list insts in
    QUEUE.destroy insts;
    stmts,(Z3Lib.plus_all summands)
  let solve (iprob:inf_problem) =
    (*helper function*)
    let stmts,minexpr = infprob2z3prob iprob in 
    let result : z3sln =
      Z3Lib.minimize "mapper" (stmts) minexpr 0. 1. in
    if result.sat then
      begin
      match result.model with
      | Some(model) ->
        begin
        z3result2mapresult iprob model;
        debug "found model"
        end
      | None -> debug "no model"
      end;
    ()
    (*instructions*)
    
*)

end
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


type linear_mapping = {
  scale : linear_id ast;
  offset : linear_id ast;
  term: hwvid ast;
}
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


  type hw_mapping = {
    mutable scale:float;
    mutable offset:float;
    mutable slack_min:float;
    mutable slack_max:float;
  }
  let mkhwmapping () =
    {
      offset=999.;
      scale=999.;
      slack_min=999.;
      slack_max=999.
    }

  let hwmapping2str (wire:wireid) (x:hw_mapping) =
    let f2s x = if x = 999. then "?" else string_of_float x in
    (SlnLib.wireid2str wire)^": "^(f2s x.scale)^"* [ ] + "^(f2s x.offset)^"\n"^
    "-> ["^(f2s x.slack_min)^","^(f2s x.slack_max)^"]"

  let z3result2mapping symtbl (asgns:z3assign list) =
    let data = MAP.make () in
    let upd_map_result id fxn =
      if MAP.has data id = false then
        noop (MAP.put data id (mkhwmapping()));
        fxn (MAP.get data id)
    in
    let upd_result_of_id s f = match s with
      | Some(SVLinVar(SVOffsetVar(w))) ->
        upd_map_result w (fun x -> x.offset <- f)
      | Some(SVLinVar(SVScaleVar(w))) ->
        upd_map_result w (fun x -> x.scale <- f)
      | Some(SVSlackVar(SVMax,_,w)) ->
        upd_map_result w (fun x -> x.slack_max <- f)
      | Some(SVSlackVar(SVMin,_,w)) ->
        upd_map_result w (fun x -> x.slack_min <- f)
      | _ -> ()
    in
    (*create result map*)
    List.iter (fun asgn -> match asgn with
        | Z3Set(s,Z3QFloat(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_result_of_id id f
        | Z3Set(s,Z3QInt(f)) ->
          let id = name2linearsmtid symtbl s in
          upd_result_of_id id (float_of_int f)
        | Z3Set(s,Z3QInterval(Z3QRange(min,max))) ->
          let id = name2linearsmtid symtbl s in
          if min = max then
            upd_result_of_id id (max)
          else
            begin
            warn "z3result2mapsln" ("interval is not equal: "^
                  (string_of_float min)^" "^(string_of_float max));
            upd_result_of_id id (max)
            end
             
        | _ -> error "z3result2mapresult" "unhandled"
    ) asgns;
    MAP.iter data (fun wire data ->
        debug (hwmapping2str wire data) 
    ); 
    ()

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
      error "error" "how are there no slack variables"
     (*tbl,z3stmts,Z3Int(0)*)


  let solve (stmts:linear_stmt list) =
    (*helper function*)
    let tbl,stmts,minexpr = to_z3prob stmts in 
    let result : z3sln =
      Z3Lib.minimize "mapper" (stmts) minexpr 0. 1. in
    if result.sat then
      begin
      match result.model with
      | Some(model) ->
        begin
        z3result2mapping tbl model;
        debug "<<< MODEL EXISTS >>>"
        end
      | None -> debug "no model"
      end
    else
      debug "===[[[NO MODEL]]]==="
end

module SolverMapper =
struct



  (*if you have a dangling math expression on a port, find the [expr], and then*)
  let compute_math_interval (tbl:gltbl) (uast:unid ast) : interval =
    let unid2ival (id:unid) = match id with
      |MathId(MNVar(MInput,v)) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | _ -> error "ccompute_math_interval" "state variable cannom be input" 
        end
      |MathId(MNVar(MOutput,v)) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | MDefStVar(def) -> def.stvar.ival
        end

      | MathId(MNParam(par,num)) ->
        Quantize([float_of_number num])
      | HwId(_) ->
        error "compute_math_interval" "unexpected hardware id"
      | _ ->
        error "compute_math_interval" "hwid id undefined"
    in
    let math_interval = IntervalLib.derive_interval uast unid2ival in
    math_interval

  let compute_hw_interval (tbl:gltbl) (comp:hwvid hwcomp) inst (cfg:hwcompcfg) (port:string) =
    let hwid2ival (x:hwvid) : interval=
      match x with
      |HNParam(cmp,x) -> error "compute_hw_interval" "must be fully specified"
      | HNPort(knd,cmp,port,param) ->
        begin
          match (HwLib.comp_getvar comp port).defs with
          | HWDAnalog(x) -> x.ival
          | HWDAnalogState(x) -> x.stvar.ival
        end
      | _ -> error "compute hw interval" "unexpected"
    in
    let vr = HwLib.comp_getvar comp port in
    match vr.bhvr,vr.defs with
    | HWBInput,HWDAnalog(defs) ->
      defs.ival
    | HWBAnalog(bhvr),_ ->
      let conc_rhs =
        ConcCompLib.specialize_params_hwexpr_from_compinst comp inst cfg bhvr.rhs
      in
      debug ("computing interval "^(HwLib.hast2str conc_rhs));
      let ival = IntervalLib.derive_interval conc_rhs hwid2ival in
      debug ("  -> "^IntervalLib.interval2str ival);
      ival

    | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
      defs.stvar.ival
    | _ -> error "compute_hw_interval" "unexpected"
      
      (*declare equivalence classes for a mapping*)
  (*
  let _infer_fxn_mapping (infprob) (map:std_mapper) (wire:wireid) =
    let declare_class knd expr wire = match expr with
      | Term(x) -> InferenceProblem.scratch_add_to_class infprob knd x wire
      | expr -> InferenceProblem.scratch_add_class_cstr infprob knd expr wire
    in
    match map with
    | MAPLinear(data) ->
      begin
        declare_class Scale data.scale wire;
        declare_class Offset data.offset wire;
        ()
      end
    | MAPScale(data) ->
      begin
        declare_class Scale data.scale wire;
        declare_class Offset (Integer 0) wire;
        ()
      end
    | MAPOffset(data) ->
      begin
        declare_class Scale (Integer 1) wire;
        declare_class Offset data.offset wire;
        ()
      end
    | MAPDirect ->
      begin
        declare_class Scale (Integer 1) wire;
        declare_class Offset (Integer 0) wire;
        ()
      end

*)
  (*
      K*M/N = A*B, K, M, N already have hardware variables
      (A_k*K + B_k)*(A_m*M+B_m)/(A_n*N + B_n) = A*B*strip(K*M/N)
      (we need a derivation function)
      where K must be numerical.

      if it isn't numerical, then the mapping must be direct
  *)


  (*propagate wire rules for *)
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
      begin
        match v.bhvr with
          | HWBAnalog(bhvr) ->
            let cstrs,linear = derive_scaling_factor bhvr.rhs [] cfg in
            enqs cstrs;
            enq (SVEquals([Term(SVScaleVar(wire));linear.scale]));
            enq (SVEquals([Term(SVOffsetVar(wire));linear.offset]));
            ()
          | HWBAnalogState(bhvr) ->
            let icport,_ = bhvr.ic in 
            let cstrs,linear = derive_scaling_factor bhvr.rhs [wire] cfg in
            let icwire = SlnLib.mkwire comp.name comp.inst icport in
            enqs cstrs;
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
      | _ -> error "bound_to_number" "expected number"
    in
    (*iterate for each math variable*)
    ConcCompLib.iter_var_cfg cfg
      (fun (port:string) (x:hwvarcfg) ->
        let wire = SlnLib.mkwire comp.name inst port in
        let mival : interval = compute_math_interval tbl x.expr in
        let hival : interval = compute_hw_interval tbl comp inst cfg port in
        let queue_quant v h =
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
        | _ -> error "compute cover" "unsupported"
      )
      (fun (param:string) (x:number) -> ());
    let cstrs = QUEUE.to_list stmts in
    QUEUE.destroy stmts;
    cstrs

  (*
  let __infer_stvar_mapping infprob
      (tbl:gltbl) (bhvr:hwvid hwbhvr) (cfg:hwcompcfg)
      (conv:std_mapper) (proxy:hwvid mapper) (wire:wireid) =
    let is_numeric : bool ref = true in
    let conv_ast_to_infvar_ast (x:hwvid) : inf_var ast = match x with
      | HNPort(knd,HCMGlobal(data),port,prop) ->
        let wire : wireid = SlnLib.mkwire data.name data.inst port in
        let mexpr = MAP.get (ConcCompLib.get_var_config port) in
        begin
          let scale = {wire=wire;knd=Scale} in
          let offset = {wire=wire;knd=Offset} in
          match mexpr with
          | Integer(x) ->
            Some (OpN(Add,[OpN(Mult,[scale;Integer(x)]);offset]))
          | Decimal(x) ->
            Some(OpN(Sub,[OpN(Mult,[scale;Decimal(x)]);offset]))
        end
      | HNParam(_,v) -> Decimal(v)
  (*an unconnected input that may route local and outputs that are mapped*)
  let infer_dangling_input_wire (infprob) (tbl:gltbl) (cmp:ucomp_conc) (wire:wireid) (cfg:hwvarcfg) =
    let ival2str (x:interval) = IntervalLib.interval2str x in 
    let hvar : hwvid hwportvar = HwLib.comp_getvar cmp.d wire.port in
    let mival = infer_dangling_math_expr tbl cfg.expr in 
    match hvar.defs with
    | HWDAnalogState(hdef) ->
      error "infer_dangling_input_wire" "cannot have analog state wire"

    | HWDAnalog(hdef) ->
      let hival : interval = hdef.ival in
      debug ((wire.port)^"="^(uast2str cfg.expr)^
             " / map "^(ival2str mival)^" to "^(ival2str hival));
      (*
      declare the expression variable and the wire, and then
      maximize the mapping onto the wire
      *)
      InferenceProblem.declare_mexpr infprob cfg.expr mival;
      InferenceProblem.declare_wire infprob wire hival;
      InferenceProblem.declare_cover infprob wire cfg.expr 1.0;
      _infer_fxn_mapping infprob hdef.conv wire;
      ()
    | _ ->
      error "infer_dangling_input_wire" "unknown"

  (*equivalence*)
  let infer_dangling_output_wire infprob (tbl:gltbl) (cmp:ucomp_conc) (wire:wireid) (cfg:hwvarcfg) =
    let hvar = HwLib.comp_getvar cmp.d wire.port in
    match hvar.bhvr,hvar.defs with
    | HWBAnalogState(hbhv),HWDAnalogState(hdef) ->
      let hival: interval = hdef.stvar.ival in 
      (*get the mapping functions*)
      InferenceProblem.declare_wire infprob wire hival;
      InferenceProblem.declare_cover infprob wire cfg.expr 1.0;
      __infer_stvar_mapping infprob hbhv.rhs hdef.conv hdef.proxy wire;
      ()
    | HWBAnalog(hbhv),HWDAnalog(hdef) ->
      let hival: interval = hdef.ival in 
      InferenceProblem.declare_wire infprob wire hival;
      ()
    | _ ->
      error "infer_dangling_output_wire" "unexpected combo"
  *)
  let infer (tbl:gltbl) =
 MAP.iter tbl.sln_ctx.generate.outs (fun (mvar:string) (wires:wire_coll) ->
        match wires with
        | WCollEmpty -> error "infer" "does not exist"
        | WCollOne(wire) ->
          let conc_comp = ConcCompLib.get_conc_comp tbl wire.comp in
          let stmts = hwcomp_derive_scaling_factors tbl conc_comp.d conc_comp.inst conc_comp.cfg in
          let sln = MappingResolver.solve stmts in
          sln
        | WCollMany(_) -> error "infer" "many is unhandled"
      );   

    (*let infprob = InferenceProblem.mk() in
    let infer_comp (tbl:gltbl) (mvar:string) (wire:wireid) =
      let hwcomp : ucomp_conc = ConcCompLib.get_conc_comp tbl wire.comp in
      let hwcfg : hwcompcfg = hwcomp.cfg in
      (*compute mapping information for inputs*)
      InferenceProblem.clear_scratch infprob;
      List.iter (fun mvar ->
          noop (InferenceProblem.scratch_declare_class infprob mvar)
      ) hwcomp.d.vars;
      MAP.iter hwcomp.d.ins (fun (inp:string) (v:hwvid hwportvar) ->
          match MAP.ifget hwcfg.inps inp with
          | Some(varcfg) ->
            begin
              match SlnLib.getsrcs tbl.sln_ctx (wire) with
              | WCollEmpty ->
                infer_dangling_input_wire infprob tbl hwcomp ({comp=wire.comp;port=inp}) varcfg  
              | WCollOne(_) ->
                error "infer_comp" "unimpl 1"
              | WCollMany(_) ->
                error "infer_comp" "unimpl n"
            end
          | None ->
            debug ("[unmapped] input "^inp)
        );
      MAP.iter hwcomp.d.outs (fun (out:string) (v:hwvid hwportvar) ->
          match MAP.ifget hwcfg.outs out with
          | Some(varcfg) ->
            begin
              match SlnLib.getdests tbl.sln_ctx (wire) with
              | WCollEmpty ->
                infer_dangling_output_wire infprob tbl hwcomp ({comp=wire.comp;port=out}) varcfg
              | WCollOne(_) ->
                error "infer_comp" "unimpl out 1"
              | WCollMany(_) ->
                error "infer_comp" "unimpl out n"

              debug ("[mapped] output "^out)
            end
          | None ->
            debug ("[unmapped] output "^out)
        );
      InferenceProblem.apply_scratch infprob
    in
    MAP.iter tbl.sln_ctx.generate.outs (fun (mvar:string) (wires:wire_coll) ->
        match wires with
        | WCollEmpty -> error "infer" "does not exist"
        | WCollOne(wire) -> infer_comp tbl mvar wire
        | WCollMany(_) -> error "infer" "many is unhandled"
      );
    InferenceProblem.solve infprob;
    ()
    *)

end
