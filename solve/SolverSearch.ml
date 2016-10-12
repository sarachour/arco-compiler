open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData
open Search
open SearchData

open Globals
open Interactive

let debug : string -> unit = print_debug 4 "multi"
let m_menu = menu 1
let m_print_inter = print_inter 1

module SlvrSearchLib =
struct

(*

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

  
*)
  let score_uniform (tbl:gltbl) (s:sstep list) =
    let state = 0. in
    let delta = 0. in
    SearchLib.mkscore state delta
  


  let score_step () =
    let typ = get_glbl_string "eqn-selector-branch" in
    match typ with
    | _ -> score_uniform

  let goalstep2str (n:sgoalctx) = match n with
    | _ -> "<goalstep2str UNIMPLEMENTED>"

  let slnstep2str (n:sslnctx) = match n with
    | _ -> "<slnstep2str UNIMPLEMENTED>"

  let mapstep2str (n:smapctx) = match n with
    | _ -> "<mapstep2str UNIMPLEMENTED>"

  let compstep2str (n:scmpctx) = match n with
    | _ -> "<compstep2str UNIMPLEMENTED"

  let step2str (n:sstep) = match n with
    | SModifyCompCtx(c) -> compstep2str c
    | SModifyGoalCtx(c) -> goalstep2str c
    | SModifyMapCtx(c) -> mapstep2str c
    | SModifySln(c) -> slnstep2str c
    | _ -> error "step2str" "unimplemented"

  (*
  match n with
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
  *)
    "<step2str UNIMPLEMENTED>"

  let apply_goal_step (tbl:gltbl) (s:sgoalctx) : unit = match s with
    | SGAddGoal(g) -> noop (MAP.put tbl.goals g.id g)
    | SGRemoveGoal(g) -> noop (MAP.rm tbl.goals g.id)
    | SGChangeGoalStatus(gid,st) -> let goal = MAP.get tbl.goals gid in
      goal.active <- st

  let apply_step (tbl:gltbl) (s:sstep) : gltbl =
      debug  ("> do step %s\n"^(step2str s));
      begin
        match s with
        | SModifyGoalCtx(g) -> apply_goal_step tbl g 
        | _ -> error "apply_step" "unimplemented"
      end;
      tbl
       (*
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
      *)

  let order_steps x y = match (x,y) with
    | (_,SModifyGoalCtx(SGRemoveGoal(_))) -> 1
    | (SModifyGoalCtx(SGRemoveGoal(_)),_) -> -1
    | (SModifyGoalCtx(SGAddGoal(_)),_) -> 1
    | (_,SModifyGoalCtx(SGAddGoal(_))) -> -1
    | _ -> 0

  let unapply_goal_step (tbl:gltbl) (s:sgoalctx) : unit = match s with
    | SGAddGoal(g) -> noop (MAP.rm tbl.goals g.id)
    | SGRemoveGoal(g) -> noop (MAP.put tbl.goals g.id g)
    | SGChangeGoalStatus(gid,st) -> let goal = MAP.get tbl.goals gid in
      goal.active <- true


  let unapply_step (tbl:gltbl) (s:sstep) =
      debug  ("> undo step %s\n"^(step2str s));
      begin
        match s with
        | SModifyGoalCtx(g) -> unapply_goal_step tbl g 
        | _ -> error "apply_step" "unimplemented"
      end;
      tbl
    (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
      (*
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
      *)

  let mksearch () =
        let score_step = score_step () in
    let search : (sstep,gltbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_steps score_step step2str
    in
    search



end
