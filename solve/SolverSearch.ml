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
open HWData
open MathLib
exception SolverSearchLibError of string

let error n m = raise (SolverSearchLibError (n^":"^m))


let debug : string -> unit = print_debug 1 "slvrsearch"
let m_menu = menu 1
let m_print_inter = print_inter 1

module SlvrSearchLib =
struct

  let weights : string search_weights =
    let compute x =
      1.
    in
    SearchWeights.mk_weights (compute)
  

  let __goal2weightkey (g:goal_data) :string = match g with
    | GUnifiable(GUMathGoal(mvar)) -> "<mvar-goal>"^(mvar.d.name)
    | GUnifiable(GUHWInExprGoal(goal)) -> (MathLib.mast2str goal.expr)
    | GUnifiable(GUHWConnOutBlock(goal)) ->
      "<conn-out-goal>"^(HwLib.hwcompname2str goal.wire.comp.name)^"."^goal.wire.port
    | GUnifiable(GUHWConnInBlock(goal)) -> 
      "<conn-in-goal>"^(HwLib.hwcompname2str goal.wire.comp.name)^"."^goal.wire.port
    | GUnifiable(GUHWConnPorts(goal)) ->
         "<conn-ports-goal>"^(HwLib.hwcompname2str goal.src.comp.name)^"."^goal.src.port
                       ^"->"^(HwLib.hwcompname2str goal.dst.comp.name)^"."^goal.dst.port

  let increase_goal_weight tree (g:goal_data) scale : unit =
    debug ("> weight++: "^(__goal2weightkey g));
    SearchWeights.increase_weight weights (__goal2weightkey g) scale;
    SearchLib.upd_score_frontier tree

  let decrease_goal_weight tree (g:goal_data) scale : unit =
    debug ("> weight--: "^(__goal2weightkey g));
    SearchWeights.decrease_weight weights (__goal2weightkey g) scale;
    SearchLib.upd_score_frontier tree



  let get_goal_weight (g:goal) : float =
    SearchWeights.get_weight weights (__goal2weightkey g.d)

  let get_weight (s:sstep) =
    match s with
    | SModGoalCtx(SGAddGoal(goal)) ->
      get_goal_weight goal
    | SModGoalCtx(SGRemoveGoal(goal)) ->
      0. -. get_goal_weight goal
    | _ -> 0.

  let clear_weights () =
    SearchWeights.clear_weights weights

  let score_uniform  (s:sstep list) =
    let state = 0. in
    let delta = 0. in
    SearchLib.mkscore state delta
  
  let score_by_goal_count  (s:sstep list) =
    let score_single st = match st with
      | SModGoalCtx(SGAddGoal(g)) -> 0. -. (GoalLib.goal_difficulty g.d)
      | SModGoalCtx(SGRemoveGoal(g)) ->  (GoalLib.goal_difficulty g.d)
      | SModGoalCtx(_) ->  0.
      | _ -> 0.
    in
    let state = 0. in
    let delta = LIST.sum score_single s in
    SearchLib.mkscore state delta
 
 
  let score_by_weighed_goal_count  (s:sstep list) =
    let score_single st = match st with
      | SModGoalCtx(SGAddGoal(g)) ->
        0. -. (GoalLib.goal_difficulty g.d)*.(1. +. get_goal_weight g)
      | SModGoalCtx(SGRemoveGoal(g)) ->
        (GoalLib.goal_difficulty g.d)*.(1. +. get_goal_weight g)
      | SModGoalCtx(_) ->  0.
      | _ -> 0.
    in
    let delta = 0. in
    let state = LIST.sum score_single s in
    SearchLib.mkscore state delta
  
  let score_by_weighed_goal_count_and_depth  (s:sstep list) =
    let score_single st = match st with
      | SModGoalCtx(SGAddGoal(g)) ->
        0. -. ((GoalLib.goal_difficulty g.d)/.100.)*.(1. +. get_goal_weight g)
      | SModGoalCtx(SGRemoveGoal(g)) ->
        ((GoalLib.goal_difficulty g.d)/.100.)*.(1. +. get_goal_weight g)
      | SModGoalCtx(_) ->  0.
      | _ -> 0.
    in
    let state = 0. in
    let delta = LIST.sum score_single s in
    SearchLib.mkscore state delta

  let score_by_weighed_goal_count_and_depth_jitter  (s:sstep list) =
    let score_single st = match st with
      | SModGoalCtx(SGAddGoal(g)) ->
        let goal_score =
            ((GoalLib.goal_difficulty g.d)/.100.)*.(1. +. get_goal_weight g)
        in
        0. -. goal_score*.1.5 
      | SModGoalCtx(SGRemoveGoal(g)) ->
        let goal_score =
            ((GoalLib.goal_difficulty g.d)/.100.)*.(1. +. get_goal_weight g)
        in
        0. +. goal_score  
      | SModGoalCtx(_) ->  0.
      | _ -> 0.
    in
    let state = 0.0001*. RAND.rand_norm()   in
    let delta =  (LIST.sum score_single s) in
    SearchLib.mkscore state delta


    
  let score_step () =
    let typ = get_glbl_string "eqn-selector-branch" in
    match typ with
    | "goals" -> score_by_goal_count
    | "goal-weight" -> score_by_weighed_goal_count
    | "goal-weight-and-depth-jitter" ->
      score_by_weighed_goal_count_and_depth_jitter
    | "uniform" -> score_uniform
    | "_" ->   error "score_step" "unknown strategy for eqn-selector-branch"

  let goalstep2str (n:sgoalctx) = match n with
    | SGAddGoal(g) -> "add-goal "^(GoalLib.goal2str g)
    | SGRemoveGoal(g) -> "remove-goal "^(GoalLib.goal2str g)
    | SGChangeGoalStatus(gid,st) -> "change-goal-status "^(string_of_int gid)^" to "^
                                    (if st then "enabled" else "disabled")


  let slnstep2str (n:sslnctx) = match n with
    | SSlnAddConn(conn) -> "[sln] conn "^(SlnLib.wireconn2str conn)
    | SSlnAddRoute(label) -> "[sln] route "^(SlnLib.label2str label ident mid2str)
    | SSlnAddGen(label) -> "[sln] generate "^(SlnLib.label2str label ident mid2str)
    | SSlnRmRoute(label) -> "[sln] rm-route "^(SlnLib.label2str label ident mid2str)
    | SSlnAddComp(comp) -> "[sln] add-comp "^(HwLib.hwcompinst2str comp
                                             )
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

  let inst2inst_goal_step (s:sgoalctx) (fn:hwcompinst->hwcompinst) : sgoalctx = match s with
    | SGAddGoal(g) -> SGAddGoal(GoalLib.inst2inst_goal g fn)
    | SGRemoveGoal(g) -> SGRemoveGoal(GoalLib.inst2inst_goal g fn)
    | SGChangeGoalStatus(gid,st) -> SGChangeGoalStatus(gid,st)

  let inst2inst_sln_step (s:sslnctx) (fn:hwcompinst->hwcompinst) : sslnctx = match s with
    | SSlnAddConn(conn) -> SSlnAddConn(SlnLib.inst2inst_conn conn fn)
    | SSlnAddGen(label) -> SSlnAddGen(SlnLib.inst2inst_label label fn)
    | SSlnAddRoute(label) -> SSlnAddRoute(SlnLib.inst2inst_label label fn)
    | SSlnRmRoute(label) -> SSlnRmRoute(SlnLib.inst2inst_label label fn)
    | SSlnAddComp(compinst) -> SSlnAddComp(fn compinst)

  let inst2inst_comp_step (s:scmpctx) (fn:hwcompinst->hwcompinst): scmpctx = match s with
    | SCMakeConcComp(cmp) -> SCMakeConcComp(SolverCompLib.inst2inst_conc_comp cmp fn)
    | SCAddInCfg(cmpid,inp,ctx) -> SCAddInCfg(fn cmpid,inp,ctx)
    | SCAddOutCfg(cmpid,inp,ctx) -> SCAddInCfg(fn cmpid,inp,ctx)
    | SCAddParCfg(cmpid,v,num) -> SCAddParCfg(fn cmpid,v,num)

  let inst2inst_step (s:sstep) (fn:hwcompinst->hwcompinst)= match s with
    | SModGoalCtx(g) -> SModGoalCtx(inst2inst_goal_step g fn)
    | SModSln(g) -> SModSln(inst2inst_sln_step g fn)
    | SModCompCtx(g) -> SModCompCtx(inst2inst_comp_step g fn)
    | _ -> error "inst2inst step" "unimplemented"

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
    | SSlnRmRoute(label) -> SlnLib.rm_route tbl.sln_ctx label
    | SSlnAddComp(compinst) -> SlnLib.add_comp tbl.sln_ctx compinst
  
  let apply_comp_step (tbl:gltbl) (s:scmpctx) : unit = match s with
    | SCMakeConcComp(cmp) ->
      begin
               SolverCompLib.add_conc_comp tbl cmp
      end
    | SCAddInCfg(cmpid,inp,ctx) -> SolverCompLib.conc_in tbl cmpid inp ctx
    | SCAddOutCfg(cmpid,out,ctx) -> SolverCompLib.conc_out tbl cmpid out ctx
    | SCAddParCfg(cmpid,v,num) -> SolverCompLib.conc_param tbl cmpid v num

  let apply_step (tbl:gltbl) (s:sstep) : gltbl =
      begin
        match s with
        | SModGoalCtx(g) -> apply_goal_step tbl g 
        | SModSln(s) -> apply_sln_step tbl s
        | SModCompCtx(c) -> apply_comp_step tbl c
        | _ -> error "apply_step" "unimplemented"
      end;
      tbl


  let priority x : int = match x with
    | SModGoalCtx(SGAddGoal(_)) -> 1
    | SModGoalCtx(SGChangeGoalStatus(_)) ->2
    | SModCompCtx(SCMakeConcComp(_)) -> 3
    | SModSln(SSlnAddRoute(_)) -> 4
    | SModSln(SSlnRmRoute(_)) -> 5
    | SModSln(_) -> 5
    | SModMapCtx(_) -> 6
    | SModCompCtx(_) -> 7
    | SModGoalCtx(SGRemoveGoal(_)) -> 8
    
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
    | SSlnRmRoute(label) -> SlnLib.add_route tbl.sln_ctx label
    | SSlnAddComp(compinst) -> SlnLib.rm_comp tbl.sln_ctx compinst
    | _ -> error "unapply_sln_step" "handler for step casedoes not exist"

  let unapply_comp_step (tbl:gltbl) (s:scmpctx) : unit = match s with
    | SCMakeConcComp(cmp) -> SolverCompLib.rm_conc_comp tbl cmp
    | SCAddInCfg(cmpid,inp,ctx) -> SolverCompLib.abs_in tbl cmpid inp ctx
    | SCAddOutCfg(cmpid,out,ctx) -> SolverCompLib.abs_out tbl cmpid out ctx
    | SCAddParCfg(cmpid,v,num) -> SolverCompLib.abs_param tbl cmpid v num


  let unapply_step (tbl:gltbl) (s:sstep) =
      begin
        match s with
        | SModGoalCtx(g) -> unapply_goal_step tbl g 
        | SModSln(s) -> unapply_sln_step tbl s
        | SModCompCtx(c) -> unapply_comp_step tbl c
        | _ -> error "unapply_step" "unimplemented"
      end;
      tbl


  let mksearch () =
    let score_step = score_step () in
    let search : (sstep,gltbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_steps score_step step2str
    in
    search



end
