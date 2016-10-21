
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

open SolverSearch

open GoalLib

exception GoalTableError of string

let error n m = raise (GoalTableError (n^":"^m))

module GoalTableLib =
struct

  let get_active_goals (t:gltbl) =
    GoalLib.fold_goals t (fun g lst -> if g.active then g::lst else lst) []

  let num_active_goals (t:gltbl) =
    List.length (get_active_goals t)


(*
  let wrap_goal = GoalStubLib.wrap_goal
  let unwrap_goal = GoalStubLib.unwrap_goal
  let add_goal = GoalStubLib.add_goal
  let deactivate_goal = GoalStubLib.deactivate_goal
  let activate_goal = GoalStubLib.activate_goal
  let has_partial_comp = GoalStubLib.has_partial_comp
  let get_partial_comp = GoalStubLib.get_partial_comp

  let get_goal_from_rel (t:gltbl) (clhs:unid) (crhs:unid ast): goal option =
    let is_var (x:goal) =
      let vr = unwrap_goal x in 
      match vr.bhvr with
      |UBhvVar(bhv) -> vr.lhs = clhs && crhs = bhv.rhs 
      |UBhvState(bhv) -> vr.lhs = clhs && crhs =bhv.rhs 
    in
    match SET.filter t.goals (fun x -> is_var x ) with
    | [h] -> Some(h)
    | [] -> None
    | lst -> 
        let goal_str = LIST.fold lst (fun el str -> str^"\n "^(UnivLib.goal2str el) ) "" in 
        error "get_goal_from_var" ("multiple goals with the same identifier: "^goal_str)


  let get_goal_from_var (t:gltbl) (vr:unid) : goal option =
    let is_var (x:goal) (v:unid) = (unwrap_goal x).lhs =v  in
    match SET.filter t.goals (fun x -> is_var x vr) with
    | [h] -> Some(h)
    | [] -> None
    | lst -> 
        let goal_str = LIST.fold lst (fun el str -> str^"\n "^(UnivLib.goal2str el) ) "" in 
        error "get_goal_from_var" ("multiple goals with the same identifier: "^goal_str)

  let get_actionable_goals (t:gltbl) =
    let act = SET.filter t.goals (fun x -> SET.has t.blacklist x = false) in
    act

  let num_actionable_goals (t:gltbl) =
    List.length (get_actionable_goals t)

  let is_actionable (t:gltbl) (x:goal) =
    (SET.has t.blacklist x) = false

  let goal2str g = UnivLib.goal2str g

  let goals2str (tbl:gltbl) (gset:goal set) =
    let proc_goal g v =
      let is_disabled : bool = SET.has tbl.blacklist g in
      if is_disabled then
        (*v^"\n[X]"^(goal2str g)*)
        v
      else
        v^"\n"^(goal2str g)
    in
    SET.fold gset proc_goal ""

  let newtbl (s:slvr) (rf:gltbl) (gls:goal list) (triv:uvar->bool):gltbl =
    let st =  SlvrSearchLib.mksearch () in
    let sln = SlnLib.mksln () in
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let handle_component (x) =
       let nid = UnivLib.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_component x) (MAP.to_values rf.nodes) in
    let v =  {
       goals = SET.make_dflt ();
       nodes = nodetbl;
       used_nodes = MAP.make();
       is_trivial = triv;
       blacklist = SET.make_dflt ();
       search= st;
       sln= sln;
    } in
    let steps = List.map (fun x -> SAddGoal x) gls in
    let _ = SearchLib.setroot st (s,v) steps in
    (v)

  let _rm_pars (s:slvr) x : unid ast option =
    match x with
    | Term(HwId(HNParam(HCMLocal(c),n))) ->
      let pars : number list = (HwLib.getparam s.hw c n).value in
      begin match pars with
        | [v] -> Some (ast_of_number (v))
        | [] -> error "_rm_pars" "parameter is not set"
        | _ -> None
      end
    | Term(MathId(MNParam(n,v))) ->
      Some (ast_of_number (v))
    | _ -> None

  *)
  (*make an empty node without the goals*)
  let mktbl (env:uenv) : gltbl =
    let comptbl : (hwcompname,ucomp) map = MAP.make () in
    let compctxtbl : (hwcompname,ucomp_ctx) map = MAP.make () in
    let sln = SlnLib.mksln () in
    List.iter (fun (hwcomp:hwvid hwcomp)  ->
        MAP.put comptbl hwcomp.name {d=hwcomp};
        MAP.put compctxtbl hwcomp.name {insts=MAP.make();cnt=0};
        ()
    ) (MAP.to_values env.hw.comps);
    let search= SlvrSearchLib.mksearch () in
    let tbl : gltbl = {
        env=env;
        map_ctx=IntervalLib.mk_map_ctx ();
        goals=MAP.make();
        avail_comps=comptbl;
        comp_ctx=compctxtbl;
        sln_ctx=sln;
        search=search;
      } in
    tbl



  let mkgoalroot (tbl:gltbl) (enable:mid mvar->bool) : unit =
    let steps :sstep list = MathLib.fold_vars tbl.env.math (fun v r ->
        let goal : goal = GoalLib.mk_mathgoal tbl v in
        let step = SModGoalCtx(SGAddGoal(goal)) in
        if enable v then step::r
        else step::SModGoalCtx(SGChangeGoalStatus(goal.id,false))::r
      ) []
    in
    SearchLib.setroot tbl.search tbl steps;
    ()

  let mknullroot tbl =
    SearchLib.setroot tbl.search tbl [];
    ()

  let mkroot tbl steps =
    SearchLib.setroot tbl.search tbl steps;
    ()
end
