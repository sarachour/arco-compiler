
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
    

  let find_goals (tbl:gltbl) (gd:goal_data) =
    MAP.filter tbl.goals (fun id (g:goal) -> g.d = gd)

  let mk_conn_goal (tbl:gltbl) (src:wireid) (dest:wireid) =
    error "mk_conn_goal" "unimpl"

  let mk_inblock_goal (tbl:gltbl) (src:wireid) =
    error "mk_iblock_goal" "unimpl"

  let mk_outblock_goal (tbl:gltbl) (src:wireid) =
    error "mk_oblock_goal" "unimpl"

  let mk_hexpr_goal (tbl:gltbl) (src:wireid) (expr:mid ast)=
    let prop = HwLib.getprop tbl.env.hw src.comp.name src.port in
    let data : goal_hw_expr =
      {wire=src; prop=prop;expr=expr}
    in
    let goal : goal_data = GUnifiable(GUHWInExprGoal(data)) in
    mk_goal tbl goal
      



  let _get_goal (type a) (tbl:gltbl) (filter:goal_data->bool) : goal option =
    let results =
      MAP.fold tbl.goals (fun id (goal:goal) (lst:goal list) ->
          if filter goal.d
          then goal::lst
          else lst
        ) []
    in
    match results with
    | [h] -> Some h
    | [] -> None
    | _ -> error "_get_goal" "more than one match"

  let get_math_goal (type a) (tbl:gltbl) (targ:string) =
    let filter g = match g with
      | GUnifiable(GUMathGoal(v)) -> v.d.name = targ
      | _ -> false
    in
    match _get_goal tbl filter with
    | Some(g) -> g
    | _ -> error "get_math_goal" "goal doesn't exist"

  let get_hwexpr_goal (type a) (tbl:gltbl) (wire:wireid) (expr:mid ast) =
    let filter g = match g with
      | GUnifiable(GUHWInExprGoal(v)) -> error "get_hwexpr_goal" "unimpl"
      | _ -> false
    in
    match _get_goal tbl filter with
    | Some(g) -> g
    | _ -> error "get_math_goal" "goal doesn't exist"


  let fold_goals (type a) (tbl:gltbl) (f:goal->a->a) (r0:a) =
    MAP.fold tbl.goals (fun gid goal  r -> f goal r) r0

  let portprop2str wire prop =
    (SlnLib.wireid2str wire)^"<"^prop^">" 

  let goal2str (g:goal) =
    let data_str =
      match g.d with
      | GUnifiable(GUMathGoal(mvar)) ->
        MathLib.mvar2str mvar.d (fun x -> MathLib.mid2str x)
      | GUnifiable(GUHWInExprGoal(dat)) ->
        (portprop2str dat.wire dat.prop)^"="^(MathLib.mast2str dat.expr)
      | GUnifiable(GUHWConnInBlock(dat)) ->
        "in-block "^(portprop2str dat.wire dat.prop)
      | GUnifiable(GUHWConnOutBlock(dat)) ->
        "out-block "^(portprop2str dat.wire dat.prop)
      | GUnifiable(GUHWConnPorts(dat)) ->
        "conn "^(SlnLib.wireconn2str dat)
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


