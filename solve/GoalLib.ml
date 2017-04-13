
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
  let mk_goal (tbl:gltbl) (g:goal_data) : goal =
    let cnt = tbl.env.goal_cnt in
    let goal = {d=g;active=true;id=cnt} in
    tbl.env.goal_cnt <- tbl.env.goal_cnt + 1;
    goal

  let mk_mathgoal (tbl:gltbl) (m:mid mvar) =
    let mgoal = GUnifiable(GUMathGoal({d=m})) in
    mk_goal tbl mgoal
    

  let find_goals (tbl:gltbl) (gd:goal_data) =
    MAP.filter tbl.goals (fun id (g:goal) -> g.d = gd)

  let filter_goals (tbl:gltbl) fn =
    MAP.fold tbl.goals (fun id (g:goal) rest ->
        if fn g.d then
          g.d::rest else rest
      ) []

  let mk_conn_goal (tbl:gltbl) (src:wireid) (dest:wireid) (expr:mid ast)=
    let mgoal = GUnifiable(GUHWConnPorts({src=src;dst=dest;expr=expr})) in
    mk_goal tbl mgoal

  let mk_inblock_goal (tbl:gltbl) (src:wireid) (expr:mid ast) =
    let hvar = HwLib.getvar tbl.env.hw src.comp.name src.port in
    let data : goal_ioblock = {wire=src;prop=hvar.prop;expr=expr} in 
    mk_goal tbl (GUnifiable(GUHWConnInBlock data))

  let mk_outblock_goal (tbl:gltbl) (src:wireid) (expr:mid ast)=
    let hvar = HwLib.getvar tbl.env.hw src.comp.name src.port in
    let data :goal_ioblock = {wire=src;prop=hvar.prop;expr=expr} in 
    mk_goal tbl (GUnifiable(GUHWConnOutBlock data))

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
    | _ -> error "_get_goal" ("more than one match")

  let _get_goals (type a) (tbl:gltbl) (filter:goal_data->bool) : goal list =
    let results =
      MAP.fold tbl.goals (fun id (goal:goal) (lst:goal list) ->
          if filter goal.d
          then goal::lst
          else lst
        ) []
    in
    results

  let get_math_goal (type a) (tbl:gltbl) (targ:string) =
    let filter g = match g with
      | GUnifiable(GUMathGoal(v)) -> v.d.name = targ
      | _ -> false
    in
    match _get_goal tbl filter with
    | Some(g) -> g
    | _ -> error "get_math_goal" "goal doesn't exist"

  let has_hwexpr_goal (type a) (tbl:gltbl) (wire:wireid) =
    let filter g = match g with
      | GUnifiable(GUHWInExprGoal(v)) ->
        v.wire = wire 
      | _ -> false
    in
    List.length (_get_goals tbl filter) > 0

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

  let get_active_goals (t:gltbl) =
    fold_goals t (fun g lst -> if g.active then g::lst else lst) []


 let num_active_goals (t:gltbl) =
    List.length (get_active_goals t)


  let portprop2str wire prop =
    (SlnLib.wireid2str wire)^"<"^prop^">" 

  let inst2inst_goal (g:goal) fn =
    let i2i_w x = HwLib.inst2inst_wire x fn in
    match g.d with
    | GUnifiable(GUMathGoal(mvar)) -> g
    | GUnifiable(GUHWInExprGoal(hwexpr)) ->
      let data : goal_hw_expr=
        {prop=hwexpr.prop;wire=i2i_w hwexpr.wire;expr=hwexpr.expr}
      in
      {d=GUnifiable(GUHWInExprGoal(data)); active=g.active; id = g.id}
    | GUnifiable(GUHWConnInBlock(ioblock)) ->
      let data : goal_ioblock=
        {prop=ioblock.prop;wire=i2i_w ioblock.wire;expr=ioblock.expr}
      in
      {d=GUnifiable(GUHWConnInBlock(data)); active=g.active; id = g.id}

    | GUnifiable(GUHWConnOutBlock(ioblock)) ->
      let data : goal_ioblock=
        {prop=ioblock.prop;wire=i2i_w ioblock.wire;expr=ioblock.expr}
      in
      {d=GUnifiable(GUHWConnOutBlock(data)); active=g.active; id = g.id}

    | GUnifiable(GUHWConnPorts(hwconn)) ->
      let data : goal_conn = {src=i2i_w hwconn.src; dst=i2i_w hwconn.dst;expr=hwconn.expr} in
      {d=GUnifiable(GUHWConnPorts(data)); active=g.active; id = g.id}

  let goal2str (g:goal) =
    let data_str =
      match g.d with
      | GUnifiable(GUMathGoal(mvar)) ->
        ("[MATH]")^MathLib.mvar2str mvar.d (fun x -> MathLib.mid2str x)
      | GUnifiable(GUHWInExprGoal(dat)) ->
        ("[EXPR]")^(portprop2str dat.wire dat.prop)^"="^(MathLib.mast2str dat.expr)
      | GUnifiable(GUHWConnInBlock(dat)) ->
        "[IN] "^(portprop2str dat.wire dat.prop)^"="^(MathLib.mast2str dat.expr)
      | GUnifiable(GUHWConnOutBlock(dat)) ->
        "[OUT] "^(portprop2str dat.wire dat.prop)^"="^(MathLib.mast2str dat.expr)
      | GUnifiable(GUHWConnPorts(dat)) ->
        "[CONN] "^(SlnLib.wireid2str dat.src)^" => "^(SlnLib.wireid2str dat.dst)^
        " ("^(MathLib.mast2str dat.expr)^")"
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

  (*higher is more valuable*)
  let scalar_goal_difficulty (g) = match g with
    | GUnifiable(GUMathGoal(_)) -> 3.
    | GUnifiable(GUHWInExprGoal(_)) -> 2.
    | GUnifiable(GUHWConnInBlock(_)) -> 1.
    | GUnifiable(GUHWConnOutBlock(_)) -> 1.
    | GUnifiable(GUHWConnPorts(_)) -> 1.

  let ast_size_goal_difficulty (g) = match g with
    | GUnifiable(GUMathGoal(e)) -> 50.
    | GUnifiable(GUHWInExprGoal(e)) -> 2.*.(float_of_int (ASTLib.score e.expr))
    | GUnifiable(GUHWConnInBlock(_)) -> 1.
    | GUnifiable(GUHWConnOutBlock(_)) -> 1.
    | GUnifiable(GUHWConnPorts(_)) -> 1.


  let goal_difficulty = ast_size_goal_difficulty 

end


