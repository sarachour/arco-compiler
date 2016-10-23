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

end
