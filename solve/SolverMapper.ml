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


exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let debug = print_debug 2 "eqn"

module SolverMapper =
struct


  let derive_mapping (sln:sln) (tbl:gltbl) (var:string) =
    debug ("getting derivation for: "^var);
    match SlnLib.get_generating_wires sln var with
    | Some(hvar) ->
      debug ("mapped to "^(HwLib.hwvid2str hvar))
    | None ->
      debug ("unmapped.")

end
