open Util
open SolverData
open SolverUtil
open SlnLib
open SolverData
open Search
open SearchData

open MathData

open Globals
open Interactive
open GoalLib

open SolverCompLib

open HWLib

exception SolverSearchLibError of string

let error n m = raise (SolverSearchLibError (n^":"^m))


let debug : string -> unit = print_debug 4 "slvrsearch"
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
    | SGAddGoal(g) -> "add-goal "^(GoalLib.goal2str g)
    | SGRemoveGoal(g) -> "remove-goal "^(GoalLib.goal2str g)
    | SGChangeGoalStatus(gid,st) -> "change-goal-status "^(string_of_int gid)^" to "^
                                    (if st then "enabled" else "disabled")


  let slnstep2str (n:sslnctx) = match n with
    | SSlnAddConn(conn) -> "[sln] conn "^(SlnLib.wireconn2str conn)
    | SSlnAddRoute(label) -> "[sln] route "^(SlnLib.label2str label ident mid2str)
    | SSlnAddGen(label) -> "[sln] generate "^(SlnLib.label2str label ident mid2str)

  let mapstep2str (n:smapctx) = match n with
    | _ -> "<mapstep2str UNIMPLEMENTED>"

  let compstep2str (n:scmpctx) = match n with
    | SCMakeConcComp(c) ->
      "[comp] make-comp "^(HwLib.hwcompname2str c.d.name)^(string_of_int c.inst)
    | SCAddInCfg(id,p,v) -> "[comp] "^(HwLib.hwcompinst2str id)^" cfg-in "^p
                            ^"="^(uast2str v.expr)
    | SCAddOutCfg(id,p,v) -> "[comp] "^(HwLib.hwcompinst2str id)^" cfg-out "^p
                            ^"="^(uast2str v.expr)
    | SCAddParCfg(id,p,v) -> "[comp] "^(HwLib.hwcompinst2str id)^" cfg-param "^p
                            ^"="^(string_of_number v)


  let step2str (n:sstep) = match n with
    | SModCompCtx(c) -> compstep2str c
    | SModGoalCtx(c) -> goalstep2str c
    | SModMapCtx(c) -> mapstep2str c
    | SModSln(c) -> slnstep2str c
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

  let apply_goal_step (tbl:gltbl) (s:sgoalctx) : unit = match s with
    | SGAddGoal(g) -> noop (MAP.put tbl.goals g.id g)
    | SGRemoveGoal(g) -> noop (MAP.rm tbl.goals g.id)
    | SGChangeGoalStatus(gid,st) -> 
      let goal = GoalLib.get_goal_by_id tbl gid in
      goal.active <- st

  let apply_sln_step (tbl:gltbl) (s:sslnctx) : unit = match s with
    | SSlnAddConn(conn) -> SlnLib.add_conn tbl.sln_ctx conn 
    | SSlnAddGen(label) -> SlnLib.add_generate tbl.sln_ctx label
    | SSlnAddRoute(label) -> SlnLib.add_route tbl.sln_ctx label

  let apply_comp_step (tbl:gltbl) (s:scmpctx) : unit = match s with
    | SCMakeConcComp(cmp) -> SolverCompLib.add_conc_comp tbl cmp
    | SCAddInCfg(cmpid,inp,ctx) -> SolverCompLib.conc_in tbl cmpid inp ctx
    | SCAddOutCfg(cmpid,out,ctx) -> SolverCompLib.conc_out tbl cmpid out ctx
    | SCAddParCfg(cmpid,v,num) -> SolverCompLib.conc_param tbl cmpid v num

  let apply_step (tbl:gltbl) (s:sstep) : gltbl =
      debug  ("> do step "^(step2str s)^"\n");
      begin
        match s with
        | SModGoalCtx(g) -> apply_goal_step tbl g 
        | SModSln(s) -> apply_sln_step tbl s
        | SModCompCtx(c) -> apply_comp_step tbl c
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

  let priority x : int = match x with
    | SModGoalCtx(SGAddGoal(_)) -> 1
    | SModGoalCtx(SGChangeGoalStatus(_)) ->2
    | SModCompCtx(SCMakeConcComp(_)) -> 3
    | SModSln(_) -> 4
    | SModMapCtx(_) -> 5
    | SModCompCtx(_) -> 6
    | SModGoalCtx(SGRemoveGoal(_)) -> 7
    
  let order_steps x y =
    let score_x = priority x in
    let score_y = priority y in
    score_y - score_x

  let unapply_goal_step (tbl:gltbl) (s:sgoalctx) : unit = match s with
    | SGAddGoal(g) ->  noop (MAP.rm tbl.goals g.id)
    | SGRemoveGoal(g) -> noop (MAP.put tbl.goals g.id g)
    | SGChangeGoalStatus(gid,st) -> 
      if GoalLib.has_goal_of_id tbl gid then
        let goal = GoalLib.get_goal_by_id tbl gid in
        goal.active <- true

  let unapply_sln_step (tbl:gltbl) (s:sslnctx) : unit = match s with
    | SSlnAddConn(conn) -> SlnLib.rm_conn tbl.sln_ctx conn 
    | SSlnAddGen(label) -> SlnLib.rm_generate tbl.sln_ctx label
    | SSlnAddRoute(label) -> SlnLib.rm_route tbl.sln_ctx label

  let unapply_comp_step (tbl:gltbl) (s:scmpctx) : unit = match s with
    | SCMakeConcComp(cmp) -> SolverCompLib.rm_conc_comp tbl cmp
    | SCAddInCfg(cmpid,inp,ctx) -> SolverCompLib.abs_in tbl cmpid inp ctx
    | SCAddOutCfg(cmpid,out,ctx) -> SolverCompLib.abs_out tbl cmpid out ctx
    | SCAddParCfg(cmpid,v,num) -> SolverCompLib.abs_param tbl cmpid v num


  let unapply_step (tbl:gltbl) (s:sstep) =
      debug  ("> undo step %s\n"^(step2str s));
      begin
        match s with
        | SModGoalCtx(g) -> unapply_goal_step tbl g 
        | SModSln(s) -> unapply_sln_step tbl s
        | SModCompCtx(c) -> unapply_comp_step tbl c
        | _ -> error "unapply_step" "unimplemented"
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
