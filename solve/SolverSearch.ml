open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData
open Search
open SearchData


module SlvrSearchLib =
struct
  (*)
  (*uniform scoring*)
  let score_path_uniform (sts:sstep set) (tbl:goal set) (past:float) : float = 0.
  (*random scoring*)
  let score_path_random (sts:sstep set) (tbl:goal set) (past:float) : float = RAND.rand_norm ()

  (*select table with most trivial to non-trivial goals*)

  let score_path_trivial_ratio (sts:sstep set) (tbl:goal set) (past:float) : float =
    let ntrivial : float = SET.fold tbl (fun x r -> if GoalTableLib.is_trivial x then r+.1. else r) 0. in
    let nnontrivial = (float_of_int (SET.size tbl)) -. ntrivial in
    let nnontrivial = if nnontrivial = 0. then 0.0000001 else nnontrivial in
    ntrivial/.nnontrivial

  let score_path_ngoals (sts:sstep set) (tbl:goal set) (past:float) : float =
    let ntrivial : float = SET.fold tbl (fun x r -> if GoalTableLib.is_trivial x then r+.1. else r) 0. in
    let nontrivial = (float_of_int (SET.size tbl)) -. ntrivial in
    -.nontrivial -. (ntrivial*.0.2)

  let score_path_gcomplex (sts:sstep set) (tbl:goal set) (past:float) : float =
    let score_goal g = if GoalTableLib.is_trivial g then 0. else
      let r = GoalTableLib.unwrap_goal g in
      let cplx = (UnivLib.goal2complexity r) in
      let score = cplx in
      score
    in
    let pscore = SET.fold tbl (fun x r -> r +. (score_goal x) ) 0. in
    -.pscore

  let score_path_pcomplex (sts:sstep set) (tbl:goal set) (past:float) : float =
    let score_goal g = if GoalTableLib.is_trivial g then 0. else
      let r = GoalTableLib.unwrap_goal g in
      let cplx = (UnivLib.goal2complexity r) in
      let score = cplx in
      score
    in
    let score_node p = match p with
      |SAddGoal(g) -> -.(score_goal g)
      |SRemoveGoal(g) -> (score_goal g)
      | _ -> 0.
    in
    let pscore = SET.fold sts (fun x r -> r +. (score_node x) ) past in
    -.pscore


  let best_path_function () =
    let typ = get_glbl_string "path_search_selector_type" in
    match typ with
    | "uniform" -> score_path_uniform
    | "random" -> score_path_random
    | "trivial-ratio" -> score_path_trivial_ratio
    | "ngoals" -> score_path_ngoals
    | "goal-complexity" -> score_path_gcomplex
    | "path-complexity" -> score_path_gcomplex
    | _ ->
      error "best_path_function" "path selector doesn't exist"
      *)

  let score_step_uniform ((slvenv,tbl):slvr*gltbl) (s:sstep list) =
    let state = 0. in
    let delta = 0. in
    SearchLib.mkscore state delta


  let score_step () =
    score_step_uniform

  let step2str (n:sstep) = match n with
  | SAddGoal(v) -> "add "^(UnivLib.goal2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.goal2str v)
  | SAddNode(id,i,rels) ->
    (*)"SLN ADDNODE "^(UnivLib.unodeid2name id)^"."^(string_of_int i)^(List.fold_right (fun x r -> r^"; "^(UnivLib.urel2str x)) rels "")*)
    "SLN ADDNODE "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
  | SSolUseNode(id,i) -> "s.use "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
  | SSolAddConn(src,snk) -> "s.mkconn "^(SlnLib.wire2str src)^" <-> "^(SlnLib.wire2str snk)
  | SSolAddLabel(w,p,l) -> "s.mklbl "^(SlnLib.wire2str w)^"."^p^(SlnLib.label2str l)
  | SSolRemoveLabel(w,p,l) -> "s.rmlbl "^(SlnLib.wire2str w)^"."^p^(SlnLib.label2str l)
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
      | SAddNode(id,i,u) ->
        let partial_comp = {name=(UnivLib.unodeid2name id);rels=SET.to_set u (fun x y -> x = y)} in
        let _ = GoalStubLib.add_partial_comp tbl id i partial_comp in ()
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
    | (SAddGoal(_),SRemoveGoal(_)) -> -1
    | (SRemoveGoal(_),SAddGoal(_)) -> 1
    | (_,SRemoveGoal(_)) -> 1
    | (_,SAddGoal(_)) -> 1
    | _ -> 0
    in
    let unapply_step ((slvenv,tbl):slvr*gltbl) (s:sstep) =
      (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
      let _ = match s with
      | SAddGoal(g) ->
        let _ = GoalStubLib.remove_goal tbl g in ()
      | SRemoveGoal(g) ->
        let _ = GoalStubLib.add_goal tbl g in ()
      | SAddNode(id,i,rels) ->
        let _ = GoalStubLib.remove_partial_comp tbl id i  in ()
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
