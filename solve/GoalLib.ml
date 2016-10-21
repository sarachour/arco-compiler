
open Globals

open HWLib
open HWData

open MathData
open MathLib

open AST
open Util
open Unit

open IntervalLib

open SymCamlData

open SearchData
open Search 

open SolverData
open SolverUtil
open SlnLib 


exception GoalLibError of string

let error n m = raise (GoalLibError (n^":"^m))

module GoalLib =
struct
  let mk_goal (tbl:gltbl) (g:goal_data) =
    let cnt = tbl.env.goal_cnt in
    let goal = {d=g;active=true;id=cnt} in
    tbl.env.goal_cnt <- tbl.env.goal_cnt + 1;
    goal

  let mk_mathgoal (tbl:gltbl) (m:mid mvar) =
    let mgoal = GUnifiable(GUMathGoal({d=m})) in
    mk_goal tbl mgoal
    

  let mk_conn_goal (tbl:gltbl) (src:wireid) (dest:wireid) =
    error "mk_conn_goal" "unimpl"

  let mk_inblock_goal (tbl:gltbl) (src:wireid) =
    error "mk_iblock_goal" "unimpl"

  let mk_outblock_goal (tbl:gltbl) (src:wireid) =
    error "mk_oblock_goal" "unimpl"

  let mk_hexpr_goal (tbl:gltbl) (src:wireid) (expr:mid ast)=
    error "mk_hexpr_goal" "unimpl"



  let fold_goals (type a) (tbl:gltbl) (f:goal->a->a) (r0:a) =
    MAP.fold tbl.goals (fun gid goal  r -> f goal r) r0

  let goal2str (g:goal) =
    let data_str =
      match g.d with
      | GUnifiable(GUMathGoal(mvar)) ->
        MathLib.mvar2str mvar.d (fun x -> MathLib.mid2str x)
      | _ -> "goal2str: unimplemented"
    in
    "["^(string_of_int g.id)^"] "^data_str 

  let goals2str tbl : string=
    fold_goals tbl (fun x r -> r^(goal2str x)^"\n") ""

  let num_goals tbl : int =
    MAP.size tbl.goals

  let has_goal_of_id tbl (i:int) =
    MAP.has tbl.goals i

  let get_goal_by_id tbl (i:int) =
    if has_goal_of_id tbl i then
      MAP.get tbl.goals i
    else
      error "get_goal_by_id" ("goal with id "^(string_of_int i)^" does not exist")
end


