open Util

open ASTUnifyData
open ASTUnify

open AST
open Interactive
open Globals

open HWData
open Math

open Search
open SearchData

open SolverGoalTable
open SolverData
open SolverUtil
open SolverSln
open SolverTrivial

exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let slvr_print_debug = print_debug 2 "slvr"
let slvr_menu = menu 2
let slvr_print_inter = print_inter 2

module SolverEqn =
struct
  let mkmenu (s:slvr) (v:gltbl) (currgoal:goal option) =
    let menu_desc = "t=search-tree, s=sol, g=goals, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str v.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let _ = Printf.printf "\n%s\n\n" (SlnLib.tostr v.sln) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "goto" then
        let _ = match STRING.split inp " " with
        | [_;id] ->
          let nid = int_of_string id in
          let _ = SearchLib.move_cursor v.search (s,v) (SearchLib.id2node v.search nid) in
          ()
        | _ -> ()
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "g" then
        let _ = Printf.printf "==== Goals ===" in
        let _ = Printf.printf "%s\n" (GoalTableLib.goals2str v v.goals) in
        let _ = Printf.printf "============\n" in
        let _ = match currgoal with
          | Some(currgoal) -> Printf.printf ">> Current Goal: %s\n" (GoalTableLib.goal2str currgoal)
          | _ -> Printf.printf ">> CurrentGoal: (none)"
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "c" then
        let _ = match currgoal with
          | Some(g) -> let _ = Printf.printf ">>> target goal: %s\n\n\n" (UnivLib.goal2str g)  in ()
          | None -> Printf.printf "<no goal>\n\n\n"
        in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = slvr_menu "goal-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle



  (*
  let unify_exprs (s:slvr) (name:string) (inst_id:int) (gl:unid) (gr:unid ast) (nl:unid) (nr:unid ast) : ((unid,unid ast) map) list option =
    (*declare event*)
    let declwcunid = Shim.unid2wcsym name inst_id in
    let n_tries = get_glbl_int "search_n_patterns_found" in
    let res = ASTLib.pattern nr gr UnivLib.unid2var (UnivLib.var2unid (s)) declwcunid n_tries in
    res
 *)
 (*TODO Fix*)
  let apply_component (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : int option =
    let rel2info (rel:urel) : unid rarg =
      match rel with
      | UState(lhs,rhs,t,ic) -> (lhs,rhs,RKDeriv)
      | UFunction(lhs,rhs) -> (lhs,rhs,RKFunction)
    in
    let goal2info (g:goal) =
      let rel = GoalTableLib.unwrap_goal g in
      rel2info rel
    in
    let mappings = MAP.make () in
    let clear_fuse_state () =
      let _ = MAP.clear mappings in
      ()
    in
    let proc_fuse f inst : unit =
      let mkassign lhs rhs =
        let lhs = Shim.lclid2glblid inst lhs in
        let rhs = Shim.lcl2glbl inst rhs in
        let _ = MAP.put mappings lhs rhs in
        ()
      in
      let _ : unit = match f with
        | USAdd(lhs,rhs,UTypTarg) -> (*technically a partial solution*)
          let _ = mkassign lhs rhs in
          let _ = slvr_print_debug ("add-targ: "^(UnivLib.unid2str lhs)) in
          ()
        | _ -> ()
      in
      ()
    in
    let add_fuse f inst : unit =
      let mkfxn lhs rhs =
        let lhs = Shim.lclid2glblid inst lhs in
        let rhs = Shim.lcl2glbl inst rhs in
        let rhs = ASTLib.sub rhs mappings in
        let _ = slvr_print_debug ((UnivLib.unid2var lhs)^" = "^(ASTLib.ast2str rhs UnivLib.unid2var)) in
        if MAP.has mappings lhs then
          error "apply_component" "impossible to enforce added relation"
        else
          let rel = UFunction(lhs,rhs) in
          rel
      in
      let steps = match f with
        | USAdd(lhs,rhs,UTypTarg) -> []
        | USAdd(lhs,rhs,UTypTempl) ->
          let rel = mkfxn lhs rhs in
          [SAddNodeRel(node_id,inst,rel)]

        | USRm(vr,_) ->
          let goal = GoalTableLib.get_goal_from_var gtbl vr in
          begin
          match goal with
            | Some(goal) -> [SRemoveGoal(goal)]
            | None -> []
          end
        | USAssign(lhs,rhs) ->
          let rel = mkfxn lhs rhs in
          let goal = GoalTableLib.wrap_goal gtbl rel in
          [SAddGoal(goal)]
      in
      let _ = SearchLib.add_steps gtbl.search steps in
      ()
    in
    let add_unification (root:sstep snode) (u:unid fusion) inst =
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) root in
      let _ = SearchLib.start gtbl.search in
      let _ = clear_fuse_state () in
      let _ = List.iter (fun f -> proc_fuse f inst) u in
      let _ = List.iter (fun f -> add_fuse f inst) u in
      let r = SearchLib.commit gtbl.search (s,gtbl) in
      ()
    in
    (*only hardware ids belonging to the template count*)
    let freshvar (n:int) (k:unifytype) = match k with
      | UTypTempl -> HwId(HNPort(HNInput,HCMLocal("tvar"^(string_of_int n)),"null","none","nil"))
      | UTypTarg -> MathId(MNVar(MInput,"tvar"^(string_of_int n),UNone))
    in
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then None else
      (*let comp = HwLib.getcomp s.hw node.name in*)
      let _ = print_debug 0 ("==> Component "^node.name) in
      let inst_id = SlnLib.usecomp gtbl.sln node_id in
      (*the cursor associated with the goal*)
      let goal_cursor = SearchLib.cursor gtbl.search in
      (*update search algorithm to include the usage*)
      let _ = SearchLib.start gtbl.search in
      let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
      (*the cursor associated with the component*)
      let comp_cursor : sstep snode = SearchLib.commit gtbl.search (s,gtbl) in
      (*use node*)
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) comp_cursor in
      let templ : (unid rarg) list = SET.map node.rels (fun x -> rel2info x)  in
      let targ : (unid rarg) list = SET.map gtbl.goals (fun x -> goal2info x) in
      let vgl,_,_ = goal2info g in
      let nunify = Globals.get_glbl_int "eqn-unifications" in
      let slns : (unid fusion) set =
        ASTUnifier.multipattern templ targ vgl nunify
        (UnivLib.unid2var)
        (UnivLib.var2unid (s))
        freshvar
        (UnivLib.unid2var)
      in
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) goal_cursor in
      let nslns = SET.size slns in
      if nslns = 0 then
        let _ = SearchLib.rm gtbl.search comp_cursor in
        let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in
        None
      else
        let _ = SearchLib.visited gtbl.search comp_cursor in
        let _ = SET.iter slns (fun x -> add_unification comp_cursor x inst_id)  in
        Some(nslns)



  let apply_components (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let comps = MAP.filter tbl.nodes (fun k v -> match k with UNoComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with UNoConcComp(_) -> true | _ -> false)  in
    let goal_cursor = SearchLib.cursor tbl.search in
    let handle_component (id,x) status =
      let _ = SearchLib.move_cursor tbl.search (slvenv,tbl) goal_cursor in
      let yielded_results = apply_component slvenv tbl g id x in
      match yielded_results with
      | Some(q) -> Some(q)
      | None -> status
    in
    let res = List.fold_right handle_component rels None  in
    let res = List.fold_right handle_component comps res  in
    (*mark goal as explored.*)
    let goal_cursor = SearchLib.cursor tbl.search in
    (*let _ = SearchLib.deadend tbl.search goal_cursor in*)
    (* failed to find any solutions.. *)
    if res = None then
      let _ =  SearchLib.deadend tbl.search goal_cursor in
      ()
    else ()



  (*test whether the node is valid, if it is valid, return true. Otherwise, return false*)
  let test_node_validity (s:slvr) (v:gltbl) (c:sstep snode) =
    let old_cursor = SearchLib.cursor v.search in
    let _ = SearchLib.move_cursor v.search (s,v) c in
    let depth =  List.length (TREE.get_path v.search.tree c) in
    let is_valid = if depth >= get_glbl_int "eqn-depth" then
      let _ = slvr_print_debug "[test-node-validity] hit max depth" in
      let _ = SearchLib.deadend v.search c in
      false
    else
      if SlnLib.usecomp_cons s v.sln  then
      if SlnLib.mkconn_cons s v.sln then
        (*determine if there are any goals left*)
        if (GoalTableLib.num_actionable_goals v) = 0 then
          (*found all goals*)
          let _ = slvr_print_debug "[test-node-validity] found a valid solution" in
          let _ = SearchLib.solution v.search c in
          true
        else
          true
      else
        let _ = slvr_print_debug "[test-node-validity] impossible set of connections" in
        let _ = SearchLib.deadend v.search c in
        false
      else
        let _ = slvr_print_debug "[test-node-validity] impossible set of component uses" in
        let _ = SearchLib.deadend v.search c in
        false
    in
    let _ = SearchLib.move_cursor v.search (s,v) old_cursor in
    is_valid


  (*get the best valid node. If there is no valid node, return none *)
  let rec get_best_valid_node (s:slvr) (v:gltbl) (root:(sstep snode) option)  : (sstep snode) option =
    let collate_score (o:sscore) (n:sscore) : sscore =
      SearchLib.mkscore n.state (o.delta +. n.delta)
    in
    match SearchLib.select_best_node v.search collate_score root with
    | Some(newnode) ->
        if test_node_validity s v newnode then
          Some(newnode)
        else
          get_best_valid_node s v root
    | None -> None

  (*
    Scoring the goal: higher = better
  *)
  let score_goal_uniform g = 0.
  let score_goal_random g = RAND.rand_norm()

  let score_goal_trivial_preferred g = match g with
    | TrivialGoal(v) -> 1. +. RAND.rand_norm ()
    | NonTrivialGoal(v) -> RAND.rand_norm()

  let score_goal_nontrivial_preferred g = match g with
    | TrivialGoal(v) -> RAND.rand_norm ()
    | NonTrivialGoal(v) -> 1. +. RAND.rand_norm()

  let best_goal_function () =
    let typ = get_glbl_string "eqn-selector-goal" in
    match typ with
    | "uniform" -> score_goal_uniform
    | "random" -> score_goal_random
    | "trivial" -> score_goal_trivial_preferred
    | "nontrivial" -> score_goal_nontrivial_preferred
    | _ ->
      error "best_goal_function" ("goal selector named <"^typ^"> doesn't exist")

  let get_best_valid_goal (v:gltbl) : goal =
    let goals = GoalTableLib.get_actionable_goals v in
    let score_goal = best_goal_function() in
    let _,targ_goal = LIST.max (fun x -> score_goal x) goals in
    targ_goal


  let no_more_nodes (v:gltbl) (head:(sstep snode) option) =
    (List.length (SearchLib.get_paths v.search head))

  (*solve a goal*)

  let solve_subtree (s:slvr) (v:gltbl) (root:(sstep snode)) (nslns:int) : unit =
    let solve_goal (g:goal) =
      let curr = SearchLib.cursor v.search in
      let mint,musr = mkmenu s v (Some g) in
      let _ = mint "g" in
      let _ = musr () in
      let mknode steps (cursor:(sstep snode)) =
        let _ = SearchLib.move_cursor v.search (s,v) cursor in
        let _ = SearchLib.start v.search in
        let _ = SearchLib.add_steps v.search steps in
        let no = SearchLib.commit v.search (s,v) in
        no
      in
      match g with
      (*if we're solvinga nontrivial goal. Apply components and then redo*)
      | NonTrivialGoal(_) ->
        (*found a nontrivial goal -> applying components*)
        let _ = apply_components s v g in
        ()
      (* if we're looking at a trivial goal, try to solve everything under the goal*)
      | TrivialGoal(grel) ->
        let mktrv = TrivialLib.resolve_trivial_step s v g in
        let triv = mknode ((SRemoveGoal g)::mktrv) curr in
        (*test the validity of the trival node*)
        let _ = SearchLib.move_cursor v.search (s,v) triv in
        (**)
        if SlnLib.usecomp_cons s v.sln && SlnLib.mkconn_cons s v.sln then
          let _ = SearchLib.move_cursor v.search (s,v) curr in
          ()
        else
          (*this trivial resolution does not work*)
          let _ = slvr_print_debug "[search_tree] trivial solution is invalid. downgrade." in
          let _ = SearchLib.deadend v.search triv in
          (*downgrade goal*)
          let gnt = NonTrivialGoal (UnivLib.unwrap_goal g) in
          let downgrade_triv = mknode ([SRemoveGoal g; SAddGoal gnt]) curr in
          let _ = musr () in
          ()

    in
    let rec rec_solve_subtree (root:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      if SearchLib.is_exhausted v.search (Some root) then
        let _ = slvr_print_debug "[search_tree] is exhausted" in
        ()
      else
        (*get the next node*)
        let maybe_next_node = get_best_valid_node s v (Some root) in
        if SearchLib.num_solutions v.search (Some root) >= nslns then
         let _ = slvr_print_debug "[search_tree] Found enough solutions" in
         ()
        else
          match maybe_next_node with
          | Some(next_node) ->
            (*move to node*)
            let _ = SearchLib.move_cursor v.search (s,v) next_node in
            let next_goal = get_best_valid_goal v in
            (*solves the goal*)
            let _ = solve_goal next_goal in
            rec_solve_subtree root
          (*No more subgoals*)
          | None ->
            ()
      in
      let _ = slvr_print_debug "[search-tree] starting" in
      let mint,musr = mkmenu s v (None) in
      let _ = mint "g" in
      let _ = musr () in
      let r = SearchLib.root v.search in
      let _ = SearchLib.move_cursor v.search (s,v) (OPTION.force_conc r) in
      if List.length ( GoalTableLib.get_actionable_goals v ) = 0 then
        let _ = SearchLib.solution v.search root in
        let _ = rec_solve_subtree root in
        ()
      else
        let next_goal = get_best_valid_goal v in
        let _ = solve_goal next_goal in
        let _ = rec_solve_subtree root in
        ()

    let solve (s:slvr) (v:gltbl) (nslns:int) : ((sstep snode) list) option =
      let _ = slvr_print_debug ("find # solutions: "^(string_of_int nslns)) in
      let root = SearchLib.cursor v.search in
      let _ : unit= solve_subtree s v root nslns in
      let slns = SearchLib.get_solutions v.search (Some root) in
      match slns with
      | h::t -> Some slns
      | _ -> None

end
