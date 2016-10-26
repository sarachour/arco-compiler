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
type 'a inf_cstr_expr = {
  expr: 'a ast;
  knd: inf_var_type;
  wire: wireid;
}
type inf_scratch = {
  mutable cls:(mapvar,inf_var list) map;
  mutable cstr:mapvar inf_cstr_expr list;
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
module InferenceProblem =
struct


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

  let z3result2mapresult infprob (asgns:z3assign list) =
    let data = MAP.make () in
    let upd_map_result id fxn =
      if MAP.has data id = false then
        noop (MAP.put data id {
            offset=999.;
            scale=999.;
            slack_min=999.;
            slack_max=999.});
      fxn (MAP.get data id)
    in
    let var2infvar v (e:float) =
      let parts = STRING.split v "_" in
      let prefix = List.nth parts 0 in
      match prefix with
      | "os" ->
        let id = int_of_string (List.nth parts 1) in
        upd_map_result id (fun x -> x.offset <- e)
      | "sc" ->
        let id = int_of_string (List.nth parts 1) in
        upd_map_result id (fun x -> x.scale <- e)
      | "slmin" ->
        let id = int_of_string (List.nth parts 1) in
        upd_map_result id (fun x -> x.slack_min <- e)
      | "slmax" ->
        let id = int_of_string (List.nth parts 1) in
        upd_map_result id (fun x -> x.slack_max <- e)
      | _ -> warn
               "z3result2mapresult.var2infvar" ("unexpected variable prefix "^prefix)
    in
    List.iter (fun asgn -> match asgn with
        | Z3Set(s,Z3QFloat(f)) -> var2infvar s f
        | Z3Set(s,Z3QInt(f)) -> var2infvar s (float_of_int f)
        | Z3Set(s,Z3QInterval(Z3QRange(min,max))) -> var2infvar s (max)
        | _ -> error "z3result2mapresult" "unhandled"
    ) asgns;
    MAP.iter data (fun id tmpdata ->
        match MAP.get infprob.vars id with
        | INFMVar(m) ->
          begin
            let mdata = MAP.get infprob.mvars m in
            debug ("[math] math-var "^m^
                   ": "^(string_of_float tmpdata.scale)^"*@ + "^(string_of_float tmpdata.offset));
            debug ("> hw-slack ["^(string_of_float tmpdata.slack_min)^", "^(string_of_float tmpdata.slack_max)^"]");
            ()
          end
        | INFHVar(h) ->
          begin
          debug ("[hw] "^(SlnLib.wireid2str h)^
                 ": "^(string_of_float tmpdata.scale)^"*@ + "^(string_of_float tmpdata.offset));
          ()
          end

      );
    ()
  
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
    
end

module SolverMapper =
struct



  (*if you have a dangling math expression on a port, find the [expr], and then*)
  let infer_dangling_math_expr (tbl:gltbl) (uast:unid ast) =
    let unid2ival (id:unid) = match id with
      |MathId(MNVar(MInput,v)) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | _ -> error "infer_dangling_math_expr" "state variable cannom be input" 
        end
      |MathId(MNVar(MInput,v)) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(_) -> error "infer_dangling_math_expr" "unimplemented out var"
          | MDefStVar(_) -> error "infer_dangling_math_expr" "unimplmenented out stvar" 
        end

      | MathId(MNParam(par,num)) ->
        Quantize([float_of_number num])
      | _ ->
        error "infer_dangling_math_expr" "hwid id undefined"
    in
    let math_interval = IntervalLib.derive_interval uast unid2ival in
    math_interval

  (*declare equivalence classes for a mapping*)
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
      InferenceProblem.declare_wire infprob wire hival;
      ()
    | HWBAnalog(hbhv),HWDAnalog(hdef) ->
      let hival: interval = hdef.ival in 
      InferenceProblem.declare_wire infprob wire hival;
      ()
    | _ ->
      error "infer_dangling_output_wire" "unexpected combo"

  let infer (tbl:gltbl) =
    let infprob = InferenceProblem.mk() in 
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


end
