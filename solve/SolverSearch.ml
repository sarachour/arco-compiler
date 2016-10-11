open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData
open Search
open SearchData

open Globals
(*
module SlvrSearchLib =
struct


  (*
  select table with most trivial to non-trivial goals

  higher score is better
  *)
  let triv_cost = 0.01;;
  
  let score_goal_complexity ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let score_goal (g:goal) =
      let r : uvar = GoalStubLib.unwrap_goal g in
      if GoalStubLib.is_trivial tbl r then triv_cost else
        let cplx = (UnivLib.goal2complexity r) in
        let score = cplx in
        score
    in
    let goals : goal set = tbl.goals in
    let pscore = SET.fold goals (fun x r -> r +. (score_goal x) ) 0. in
    let state = -.pscore in
    let delta = 0. in
    SearchLib.mkscore state delta
  
  let score_goal_complexity_and_comps_used ((slvenv,tbl):slvr*gltbl) (s:sstep list) = 
        let base = score_goal_complexity (slvenv,tbl) s  in 
        let comps_used = SlnLib.n_used tbl.sln in 
        let newstate = base.state +. (float_of_int comps_used)*.0.5 in
        SearchLib.mkscore newstate (base.delta+.0.2)

  let score_goal_complexity_and_depth ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let score_goal (g:goal) =
      let r : uvar = GoalStubLib.unwrap_goal g in
      if GoalStubLib.is_trivial tbl r then triv_cost  else
        let cplx = (UnivLib.goal2complexity r) in
        let score = cplx in
        score
    in
    let goals : goal set = tbl.goals in
    let pscore = SET.fold goals (fun x r -> r +. (score_goal x) ) 0. in
    let state = -.pscore in
    let delta = -0.2 in
    SearchLib.mkscore state delta


  (*the higher the score, the deeper the thing*)
  let score_ngoals ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let goals : goal set = tbl.goals in
    let trivial : float = SET.fold goals (fun x r -> if GoalStubLib.is_trivial tbl (GoalStubLib.unwrap_goal x) then r+.1. else r) 0. in
    let nontrivial = (float_of_int (SET.size tbl.goals)) -. trivial in
    let state = -.nontrivial in
    let delta = -0.0 in
    SearchLib.mkscore state delta

  let score_triv_goals ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let goals : goal set = tbl.goals in
    let trivial : float = SET.fold goals (fun x r -> if GoalStubLib.is_trivial tbl (GoalStubLib.unwrap_goal x) then r+.1. else r) 0. in
    let nontrivial = (float_of_int (SET.size tbl.goals)) -. trivial in
    let nontrivial = if nontrivial = 0. then 0.0000001 else nontrivial in
    let state = trivial/.nontrivial in
    let delta = 0. in
    SearchLib.mkscore state delta

  let score_random ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let state = RAND.rand_norm () in
    let delta = 0. in
    SearchLib.mkscore state delta

  let score_uniform ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let state = 0. in
    let delta = 0. in
    SearchLib.mkscore state delta
  
  let score_step () =
    let typ = get_glbl_string "eqn-selector-branch" in
    match typ with
    | "uniform" -> score_uniform
    | "random" -> score_random
    | "trivial-ratio" -> score_triv_goals
    | "ngoals" -> score_ngoals
    | "goal-complexity" -> score_goal_complexity
    | "goal-complexity-and-depth" -> score_goal_complexity_and_depth
    | "goal-complexity-and-used-comps" -> score_goal_complexity_and_comps_used
    | _ ->
      error "best_path_function" "path selector doesn't exist"


  let step2str (n:sstep) = match n with
  | SAddGoal(v) -> "add "^(UnivLib.goal2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.goal2str v)
  | SAddNodeRel(id,i,rel) ->
    (*)"SLN ADDNODE "^(UnivLib.unodeid2name id)^"."^(string_of_int i)^(List.fold_right (fun x r -> r^"; "^(UnivLib.urel2str x)) rels "")*)
    "s.addnode "^(UnivLib.unodeid2name id)^"."^(string_of_int i)^" :=: "^(UnivLib.uvar2str rel)
  | SSolUseNode(id,i) -> "s.use "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
  | SSolAddConn(src,snk) -> "s.mkconn "^(SlnLib.wire2str src)^" <-> "^(SlnLib.wire2str snk)
  | SSolAddLabel(w,p,l) -> "s.mklbl "^(SlnLib.wire2str w)^"."^p^" -> "^(SlnLib.label2str l)
  | SSolRemoveLabel(w,p,l) -> "s.rmlbl "^(SlnLib.wire2str w)^"."^p^" -> "^(SlnLib.label2str l)
  | SMakeGoalActive(v) -> "activate "^(UnivLib.goal2str v)
  | SMakeGoalPassive(v) -> "inactive "^(UnivLib.goal2str v)


  let mksearch () =
    let apply_step ((slvenv,tbl):slvr*gltbl) (s:sstep) =
      (*let _ = Printf.printf "> do step %s\n" (step2str s) in*)
      let _ = match s with
      | SAddGoal(g) ->
        let _ = GoalStubLib.add_goal tbl g in ()
      | SRemoveGoal(g) ->
        let _ = GoalStubLib.remove_goal tbl g in ()
      | SAddNodeRel(id,i,r) ->
        let _ = GoalStubLib.add_rel_to_partial_comp tbl id i r in ()
      | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_mark tbl.sln id i in ()
      | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn tbl.sln src snk in ()
      | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel tbl.sln wid prop lbl in ()
      | SSolRemoveLabel(wid,prop,lbl) -> let _ = SlnLib.mklabel_undo tbl.sln wid prop lbl in ()
      | SMakeGoalActive(g) -> let _ = GoalStubLib.activate_goal tbl g in ()
      | SMakeGoalPassive(g) -> let _ = GoalStubLib.deactivate_goal tbl g in ()
      in
      (slvenv,tbl)
    in
    let order_steps x y = match (x,y) with
    | (_,SRemoveGoal(_)) -> 1
    | (SRemoveGoal(_),_) -> -1
    | (SAddGoal(_),_) -> 1
    | (_,SAddGoal(_)) -> -1
    | _ -> 0
    in
    let unapply_step ((slvenv,tbl):slvr*gltbl) (s:sstep) =
      (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
      let _ = match s with
      | SAddGoal(g) ->
        let _ = GoalStubLib.remove_goal tbl g in ()
      | SRemoveGoal(g) ->
        let _ = GoalStubLib.add_goal tbl g in ()
      | SAddNodeRel(id,i,r) ->
        let _ = GoalStubLib.rm_rel_from_partial_comp tbl id i r in ()
      | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_unmark tbl.sln id i in ()
      | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn_undo tbl.sln src snk in ()
      | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel_undo tbl.sln wid prop lbl in ()
      | SSolRemoveLabel(wid,prop,lbl) -> let _ = SlnLib.mklabel tbl.sln wid prop lbl in ()
      | SMakeGoalActive(g) -> let _ = GoalStubLib.deactivate_goal tbl g in ()
      | SMakeGoalPassive(g) -> let _ = GoalStubLib.activate_goal tbl g in ()
      in
      (slvenv,tbl)
    in
    let score_step = score_step () in
    let search : (sstep,slvr*gltbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_steps score_step step2str
    in
    search



end
*)
