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
    iprob.cnt <- iprob.cnt + 1;
    ()

  let declare_wire (iprob:inf_problem) wire ival =
    MAP.put iprob.hvars wire {ival=ival;id=iprob.cnt};
    iprob.cnt <- iprob.cnt + 1;
    ()

  (*cover*)
  let declare_cover (iprob:inf_problem) wire expr weight =
    let mstr = uast2str expr in
    MAP.put iprob.cover mstr {wire=wire;weight=weight}

  let solve (iprob:inf_problem) =
    (*helper function*)
    let id2offset s = "os_"^(string_of_int s) in
    let id2scale s = "sc_"^(string_of_int s) in
    let id2minslack s = "sl_min_"^(string_of_int s) in
    let id2maxslack s = "sl_min_"^(string_of_int s) in
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
    (*declare variables*)
    MAP.iter iprob.mvars (fun mvar mdata ->
        enq [
          Z3ConstDecl(id2scale mdata.id,Z3Real);
          Z3ConstDecl(id2offset mdata.id,Z3Real);
          Z3ConstDecl(id2minslack mdata.id,Z3Real);
          Z3ConstDecl(id2maxslack mdata.id,Z3Real)
        ]
      );
    MAP.iter iprob.hvars (fun wire wdata ->
        enq [
          Z3ConstDecl(id2scale wdata.id,Z3Real);
          Z3ConstDecl(id2offset wdata.id,Z3Real);
        ]
      );
    MAP.iter iprob.cover (fun mvar cover ->
        let mi = MAP.get iprob.mvars mvar in
        let hi = MAP.get iprob.hvars cover.wire in
        let mexpr =
          Z3Plus(
            Z3Plus(
              Z3Mult(Z3Var(id2scale mi.id),Z3Real(IntervalLib.get_max mi.ival)),
              Z3Var(id2offset mi.id)
            ),
            Z3Var(id2maxslack mi.id)
          )
        in
        enq [Z3Assert(Z3Eq(mexpr,Z3Real(IntervalLib.get_max hi.ival)))]
        
    );
    LIST.iter  (fun cstr -> match cstr with
        | ICSTEqExpr(varexpr) ->
          let expr = Z3Lib.ast2z3 varexpr.expr infvar_to_z3var in 
          enq [Z3Assert(Z3Eq(wire_to_z3var varexpr.knd varexpr.wire,expr))]
        | ICSTEquiv(varids) ->
          if List.length varids > 1 then
            enq [Z3Assert(Z3Lib.eq_all (List.map (fun vid -> infvar_to_z3var vid) varids))]
    ) iprob.cstrs;
    enq [Z3SAT;Z3DispModel];
    let result = Z3Lib.exec "mapper" (QUEUE.to_list insts) in
    QUEUE.destroy insts;
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
      InferenceProblem.declare_cover infprob wire cfg.expr;
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
