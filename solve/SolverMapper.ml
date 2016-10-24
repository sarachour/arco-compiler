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

exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let debug = print_debug 2 "eqn"

module SolverMapper =
struct

  let derive_var_wire_mapping (tbl:gltbl) (wire:wireid) (mvar:mid mvar) =
    let hwcomp = SolverCompLib.get_conc_comp tbl wire.comp in
    let hwvar = HwLib.comp_getvar hwcomp.d wire.port in
    match mvar.defs,hwvar.defs with
    | MDefVar(mdef),HWDAnalog(hwdef) ->
      debug ("Math Range: "^(IntervalLib.interval2str mdef.ival)^" "
             ^"HW Range: "^(IntervalLib.interval2str hwdef.ival))
    | MDefStVar(mdef),HWDAnalogState(hwdef) ->
      debug ("Deriv Math Range: "^(IntervalLib.interval2str mdef.deriv.ival)^" "
             ^"HW Range: "^(IntervalLib.interval2str hwdef.deriv.ival));
      debug ("Stvar Math Range: "^(IntervalLib.interval2str mdef.deriv.ival)^" "
             ^"HW Range: "^(IntervalLib.interval2str hwdef.deriv.ival))
    | _ ->
      error "derive_var_wire_mapping" "unimplemented"

  let derive_mapping (tbl:gltbl) (var:string) =
    let sln = tbl.sln_ctx in
    let mvar = MathLib.getvar tbl.env.math var in 
    debug ("getting derivation for: "^var);
    match SlnLib.get_generating_wires sln var with
    | Some(wcoll) ->
      begin
        match wcoll with
        |WCollEmpty -> error "derive_mapping" "unmapped"
        |WCollOne(wire) ->
          begin
            debug ("Mapped to "^(SlnLib.wireid2str wire));
            derive_var_wire_mapping tbl wire mvar;
            ()
          end
        | WCollMany(wires) ->
          begin
            error "derive_mapping" "unhandled"
          end

      end
    | None ->
      debug ("unmapped: "^var)

  let infer_dangling_math_expr (tbl:gltbl) (uast:unid ast) =
    let unid2ival (id:unid) = match id with
      |MathId(MNVar(MInput,v)) ->
        begin
          let mvar = MathLib.getvar tbl.env.math v in
          match mvar.defs with
          | MDefVar(def) -> def.ival
          | _ -> error "infer_dangling_math_expr" "state variable cannot be input" 
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
    IntervalLib.derive_interval uast unid2ival

  (*an unconnected input that may route local and outputs that are mapped*)
  let infer_dangling_input_wire (tbl:gltbl) (cmp:ucomp_conc) (wire:wireid) (cfg:hwvarcfg) =
    let hvar = HwLib.comp_getvar cmp.d wire.port in
    let ival2str (x:interval) = IntervalLib.interval2str x in 
    let mival = infer_dangling_math_expr tbl cfg.expr in 
    match hvar.defs with
    | HWDAnalogState(hdef) ->
      error "infer_dangling_input_wire" "analog state" 

    | HWDAnalog(hdef) ->
      let hival : interval = hdef.ival in
      debug ((wire.port)^"="^(uast2str cfg.expr)^
             " / map "^(ival2str mival)^" to "^(ival2str hival));
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
                infer_dangling_input_wire tbl hwcomp ({comp=wire.comp;port=inp}) varcfg  
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
