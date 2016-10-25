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

type inf_var = {
  ival:interval;
  id:int;
}
type inf_cover = {
  wire:wireid;
  weight:float;
}
type inf_problem = {
  mutable mvars: (string,inf_var) map;
  mutable inhvars: (wireid,inf_var) map;
  mutable outhvars: (wireid,inf_var) map;
  mutable cover: (string,inf_cover) map;
  mutable cnt : int;
}
module InferenceProblem =
struct


  let mk () =
    {
      mvars=MAP.make();
      inhvars=MAP.make();
      outhvars=MAP.make();
      cover=MAP.make();
      cnt=0;
    }

  let declare_mexpr (iprob:inf_problem) expr ival =
    let mstr = uast2str expr in
    MAP.put iprob.mvars mstr {ival=ival;id=iprob.cnt};
    iprob.cnt <- iprob.cnt + 1;
    ()

  let declare_inp_wire (iprob:inf_problem) wire ival =
    MAP.put iprob.inhvars wire {ival=ival;id=iprob.cnt};
    iprob.cnt <- iprob.cnt + 1;
    ()

  let declare_out_wire (iprob:inf_problem) (wire) (ival) =
    MAP.put iprob.outhvars wire {ival=ival;id=iprob.cnt};
    iprob.cnt <- iprob.cnt + 1;
    ()

  (*cover*)
  let declare_cover (iprob:inf_problem) wire expr weight =
    let mstr = uast2str expr in
    MAP.put iprob.cover mstr {wire=wire;weight=weight}

  let generate (iprob:inf_problem) =
    (*helper function*)
    let id2offset s = "os_"^(string_of_int s) in
    let id2scale s = "sc_"^(string_of_int s) in
    let id2minslack s = "sl_min_"^(string_of_int s) in
    let id2maxslack s = "sl_min_"^(string_of_int s) in
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
    MAP.iter iprob.outhvars (fun wire wdata ->
        enq [
          Z3ConstDecl(id2scale wdata.id,Z3Real);
          Z3ConstDecl(id2offset wdata.id,Z3Real);
          Z3ConstDecl(id2minslack wdata.id,Z3Real);
          Z3ConstDecl(id2maxslack wdata.id,Z3Real)
        ]
      );
    enq [Z3SAT;Z3DispModel];
    let result = Z3Lib.exec "mapper" (QUEUE.to_list insts) in
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
      InferenceProblem.declare_inp_wire infprob wire hival;
      InferenceProblem.declare_cover infprob wire cfg.expr;
      ()
    | _ ->
      error "infer_dangling_input_wire" "unknown"

  let infer_dangling_output_wire (tbl:gltbl) (cmp:ucomp_conc) (wire:wireid) (cfg:hwvarcfg) =
    let hvar = HwLib.comp_getvar cmp.d wire.port in
    match hvar.bhvr,hvar.defs with
    | HWBAnalogState(hbhv),HWDAnalogState(hdef) ->
      error "infer_dangling_output_wire" "infer st"
    | HWBAnalog(hbhv),HWDAnalog(hdef) ->
      error "infer_dangling_output_wire" "infer fxn"
    | _ ->
      error "infer_dangling_output_wire" "unexpected combo"

  let infer (tbl:gltbl) =
    let infprob = InferenceProblem.mk() in 
    let infer_comp (tbl:gltbl) (mvar:string) (wire:wireid) =
      let hwcomp : ucomp_conc = ConcCompLib.get_conc_comp tbl wire.comp in
      let hwcfg : hwcompcfg = hwcomp.cfg in
      (*compute mapping information for inputs*)
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
                infer_dangling_output_wire tbl hwcomp ({comp=wire.comp;port=out}) varcfg
              | WCollOne(_) ->
                error "infer_comp" "unimpl out 1"
              | WCollMany(_) ->
                error "infer_comp" "unimpl out n"

              debug ("[mapped] output "^out)
            end
          | None ->
            debug ("[unmapped] output "^out)
      )
    in
    MAP.iter tbl.sln_ctx.generate.outs (fun (mvar:string) (wires:wire_coll) ->
        match wires with
        | WCollEmpty -> error "infer" "does not exist"
        | WCollOne(wire) -> infer_comp tbl mvar wire
        | WCollMany(_) -> error "infer" "many is unhandled"
    )


end
