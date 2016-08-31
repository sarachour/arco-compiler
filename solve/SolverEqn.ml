open Util
open Common

open ASTUnifyData
open ASTUnify
open ASTXUnify

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
open SolverRslv
open SolverSln
open SolverTrivial

open HW

exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let _print_debug = print_debug 2 "eqn"
let _menu = menu 2
let _print_inter = print_inter 2

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
    let rec user_menu_handle () = _menu "goal-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
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

  let feasible_component_goal_combo (s:slvr) (g:goal) (node_id:unodeid) =
    let node_name = UnivLib.unodeid2name node_id in
    let test_conn (src:hwvid) (snk:hwvar) =
      let wsrc : wireid = UnivLib.hwid2wire src in
      let wsnk : wireid = UnivLib.hwvar2wire node_name snk in
      let result = HwConnRslvr.valid_conn s wsrc wsnk in
      result
    in
    match g with
    | NonTrivialGoal(UFunction(HwId(id),lhs)) ->
      let outputs = HwLib.get_port_by_kind s.hw  HNOutput node_name in
      let success = List.fold_right (fun snk r -> test_conn id snk || r) outputs false in
      if success then
        true
      else
        let _ = _print_debug ("[OPTIMIZE ] no connections: "^node_name^" to "^(UnivLib.hwid2var id)) in
        false
    | NonTrivialGoal(UFunction(MathId(id),lhs)) -> true
    | NonTrivialGoal(UState(MathId(id),_,_,_)) -> true
    | _ -> error "feasible_component_goal_combo" "unexpected"



  let apply_component (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (iid:int option) : int option =
    
    if get_glbl_bool "test-component-reachability" && feasible_component_goal_combo s g node_id = false then
      None
    else
    let rel2info (rel:urel) : unid rarg =
      match rel with
      | UState(lhs,rhs,ICVar(v),t) -> (lhs,rhs,RKDeriv(ICVar(v)))
      | UState(lhs,rhs,ICVal(v),t) -> (lhs,rhs,RKDeriv(ICVal(v)))
      | UFunction(lhs,rhs) -> (lhs,rhs,RKFunction)
    in
    let goal2info (g:goal) =
      let rel = GoalTableLib.unwrap_goal g in
      rel2info rel
    in
    let mkfxn inst lhs rhs mp =
        let lhs = Shim.lclid2glblid inst lhs in
        let rhs = Shim.lcl2glbl inst rhs in
        mp lhs rhs
    in
    let add_fuse (f:unid fuse) inst : unit =
      let steps : sstep list = match f with
        | USAddRel(lhs,rhs) ->
          let rel = mkfxn inst lhs rhs (fun l r -> UFunction(l,r)) in
          let _ = _print_debug ("<@> Add Partially Concretized Relation: "^(UnivLib.urel2str rel)) in
          [SAddNodeRel(node_id,inst,rel)]

        | USRmGoal(vr,rhs) ->
          let _ = _print_debug ("<@> Remove Goal: "^(UnivLib.unid2str vr)^(UnivLib.uast2str rhs)) in
          let goal = GoalTableLib.get_goal_from_rel gtbl vr rhs in
          begin
          match goal with
            | Some(goal) -> [SRemoveGoal(goal)]
            | None -> 
               let _ = _print_debug "<@> warning... goal listed in fuse not found" in 
               []
          end
        | USAssign(HwId(lhs),Term(HwId(rhs))) ->
            let rel : urel = match HwLib.var2kind lhs, HwLib.var2kind rhs with 
            | (HNOutput, HNInput)  -> 
               mkfxn inst (HwId rhs) (Term(HwId lhs)) (fun l r -> UFunction(l,r))             
            | (HNInput, HNOutput) -> 
               mkfxn inst (HwId lhs) (Term(HwId rhs)) (fun l r -> UFunction(l,r))
            | (HNInput, HNInput) ->           
                error "unify_rels" ("cannot connect INPUT ports: "^(HwLib.hwvid2str lhs)^" <-> "^(HwLib.hwvid2str rhs))
            | _ -> 
                error "unify_rels" ("cannot connect OUTPUT ports: "^(HwLib.hwvid2str lhs)^" <-> "^(HwLib.hwvid2str rhs))
            in
            let goal = GoalTableLib.wrap_goal gtbl rel in 
            [SAddGoal(goal)] 
                

        | USAssign(lhs,rhs) ->
          let rel = mkfxn inst lhs rhs (fun l r -> UFunction(l,r)) in
          let _ = _print_debug ("<@> Add Assignment: "^(UnivLib.urel2str rel)) in
          let goal = GoalTableLib.wrap_goal gtbl rel in
          [SAddGoal(goal)]
      in
      let _ = SearchLib.add_steps gtbl.search steps in
      ()
    in
    let add_unification (root:sstep snode) (u:unid fusion) inst =
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) root in
      let _ = SearchLib.start gtbl.search in
      let _ = List.iter (fun f -> add_fuse f inst) u in
      let r = SearchLib.commit gtbl.search (s,gtbl) in
      ()
    in
    (*only hardware ids belonging to the template count*)
    let freshvar (n:int) (k:unifytype) = match k with
      | UTypTempl -> HwId(HNPort(HNInput,HCMLocal("tvar"^(string_of_int n)),"null","none","nil"))
      | UTypTarg -> MathId(MNVar(MInput,"tvar"^(string_of_int n),UNone))
    in
    (*determine if this is a filler nodes*)
    let comp_info : (unode*int*(sstep snode)*(unit->unit)) option=
      (*specific instance*)
      if iid <> None then
        (*get the concrete nodes*)
        let inst_id = OPTION.force_conc iid in
        let node = MAP.get gtbl.used_nodes (node_id,inst_id) in
        let _ = SearchLib.start gtbl.search in
        (*remove all the relations in the used node, any remaining relations will be added back in*)
        let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
        let curs = SearchLib.commit gtbl.search (s,gtbl) in
        let cleanup () = () in
        Some(node,inst_id,curs,cleanup)
    (*non-specific instance*)  
    else
        (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
        if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then
          None
        else
          let inst_id = SlnLib.usecomp gtbl.sln node_id in
          let node = MAP.get gtbl.nodes node_id in
          (*the cursor associated with the goal*)
          let goal_cursor = SearchLib.cursor gtbl.search in
          (*update search algorithm to include the usage*)
          let _ = SearchLib.start gtbl.search in
          let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
          (*the cursor associated with the component*)
          let curs : sstep snode = SearchLib.commit gtbl.search (s,gtbl) in
          let cleanup () =
            let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in 
            ()
          in
          Some(node,inst_id,curs,cleanup)
    in
    let testwc v = match v with 
    | MathId(_) -> false
    | _ -> true
    in
    match comp_info with
    | Some(node,iid, comp_cursor,cleanup) ->
      (*use node*)
      let goal_cursor = SearchLib.cursor gtbl.search in
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) comp_cursor in
      let templ : (unid rarg) list = SET.map node.rels (fun x -> rel2info x)  in
      let targ : (unid rarg) list = SET.map gtbl.goals (fun x -> goal2info x) in
      if List.length templ = 0 || List.length targ = 0 then
        None
      else
        let vgl,_,_ = goal2info g in
        let nunify = Globals.get_glbl_int "eqn-unifications" in
        let slns : (unid fusion) set =
          (*Hint: Unification routine here*)
          ASTXUnify.ASTUnifier.multipattern templ targ vgl nunify
          (testwc)
          (UnivLib.unid2var)
          (UnivLib.var2unid (s))
          freshvar
          (UnivLib.unid2var)
        in
        let _ = SearchLib.move_cursor gtbl.search (s,gtbl) goal_cursor in
        let nslns = SET.size slns in
        if nslns = 0 then
          let _ = _print_debug ("no solutions for comp...") in 
          let _ = SearchLib.rm gtbl.search comp_cursor in
          let _ = cleanup () in
          None
        else
          let _ = SearchLib.visited gtbl.search comp_cursor in
          let _ = SET.iter slns (fun x -> add_unification comp_cursor x iid)  in
          Some(nslns)
    | None -> None



  let apply_components (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let goal_cursor = SearchLib.cursor tbl.search in
    let handle_component (id:unodeid) (inst: int option) (status:bool) : bool =
      let _ = SearchLib.move_cursor tbl.search (slvenv,tbl) goal_cursor in
      let results = apply_component slvenv tbl g id inst in
      match results with
      | Some(q) -> true
      | None -> status
    in
    let has_results = false in
    (*apply partially filled nodes*)
    let has_results = MAP.fold tbl.used_nodes (fun (id,i) x status -> handle_component id (Some i) status) has_results  in
    (**apply component if there is a possible connection *)
    let has_results = MAP.fold tbl.nodes (fun id x status -> match id with
      | UNoComp(_) ->
        handle_component id None status
      | _ -> status
    ) has_results in
    (* failed to find any solutions.. *)
    if has_results = false then
      let _ =  SearchLib.deadend tbl.search goal_cursor in
      ()
    else ()


  let mark_if_solution (s:slvr) (v:gltbl) (curr:(sstep snode)) = 
    let _ = _print_debug "[mark-if-solution] testing if solution." in
    let _ = SearchLib.move_cursor v.search (s,v) curr in
    let is_conn_cons = SlnLib.mkconn_cons s v.sln in
    let is_usecomp_cons = SlnLib.usecomp_cons s v.sln in
    if is_conn_cons && is_usecomp_cons then 
      SearchLib.solution v.search curr
    else
      SearchLib.deadend v.search curr 



  (*test whether the node is valid, if it is valid, return true. Otherwise, return false*)
  let test_node_validity (s:slvr) (v:gltbl) (c:sstep snode) (depth:int)=
    let _ = _print_debug ("-> testing validity: "^(string_of_int c.id)) in
    let old_cursor = SearchLib.cursor v.search in
    let _ = SearchLib.move_cursor v.search (s,v) c in
    let currdepth =  List.length (TREE.get_path v.search.tree c) in
    let is_valid = if currdepth >= depth then
      let _ = _print_debug "[test-node-validity] hit max depth:" in
      let _ = SearchLib.deadend v.search c in
      false
    else
        (*determine if there are any goals left*)
        if (GoalTableLib.num_actionable_goals v) = 0 then
          (*found all goals*)
          let _ = _print_debug "[test-node-validity] found a valid solution" in
          let _ = mark_if_solution s v c in 
          true
        else
          true
    in
    let _ = SearchLib.move_cursor v.search (s,v) old_cursor in
    is_valid


  (*get the best valid node. If there is no valid node, return none *)
  let rec get_best_valid_node (s:slvr) (v:gltbl) (root:(sstep snode) option) (depth:int)  : (sstep snode) option =
    match SearchLib.select_best_node v.search root with
    | Some(newnode) ->
        if test_node_validity s v newnode depth then
          Some(newnode)
        else
          get_best_valid_node s v root depth
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
    let cursor = SearchLib.cursor v.search in
    let goals = GoalTableLib.get_actionable_goals v in
    let score_goal = best_goal_function() in
    if List.length goals > 0  then
      let _,targ_goal = LIST.max (fun x -> score_goal x) goals in
      targ_goal
    else
      error "get_best_valid_goal" ("non-visited node has no goals: "^(string_of_int cursor.id))

  let no_more_nodes (v:gltbl) (head:(sstep snode) option) =
    (List.length (SearchLib.get_paths v.search head))

    (*solve a goal*)
  let solve_subtree (s:slvr) (v:gltbl) (root:(sstep snode)) (nslns:int) (depth:int) : unit =
   let downgrade_enable = get_glbl_bool "downgrade-trivial" in 
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
        let _ = _print_debug "[search_tree] successfully applied components." in
        let _ = musr () in
        ()
      (* if we're looking at a trivial goal, try to solve everything under the goal*)
      | TrivialGoal(grel) ->
        let mktrv = TrivialLib.resolve_trivial_step s v g in
        let triv = mknode ((SRemoveGoal g)::mktrv) curr in
        (*test the validity of the trival node*)
        let _ = SearchLib.move_cursor v.search (s,v) triv in
        let _ = SearchLib.visited v.search curr in 
        (**)
        let is_usecomp_cons = SlnLib.usecomp_cons s v.sln in
        let is_conn_cons = if get_glbl_bool "eqn-smt-defer" then
          SlnLib.mkconn_cons_shallow s v.sln 
        else
          SlnLib.mkconn_cons s v.sln
        in  
        if is_usecomp_cons && is_conn_cons then
          let _ = _print_debug "[search_tree] no goals left. Testing if trivial solution is successful: " in
          let _ = if List.length ( GoalTableLib.get_actionable_goals v ) = 0 then
            return (mark_if_solution s v triv) () else ()
          in
          let _ = _print_debug "[search_tree] trivial solution is successful: " in
          let _ = musr () in
          ()
        else
          (*this trivial resolution does not work*)
          let _ = SearchLib.deadend v.search triv in
          let _ = _print_debug "[search_tree] FAILURE trivial solution not resolved." in
          (*downgrade goal*)
          let _ = if downgrade_enable then 
                let _ = _print_debug "[search_tree] Relaxed resolution mode enabled. Downgrading solution." in
                let gnt = NonTrivialGoal (UnivLib.unwrap_goal g) in
                let downgrade_triv = mknode ([SRemoveGoal g; SAddGoal gnt]) curr in
                ()
          in
          let _ = musr () in
          ()

    in
    let mint,musr = mkmenu s v (None) in
    let rec rec_solve_subtree (root:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      let currslns = SearchLib.num_solutions v.search (Some root) in 
      if currslns >= nslns then
         let _ = _print_debug "[search_tree] Found enough solutions" in
         let _ = musr () in
         ()
      else
        let _ = _print_debug ("[search_tree] found "^(string_of_int currslns)^" / "^(string_of_int nslns)) in 
        if SearchLib.is_exhausted v.search (Some root) then
          let _ = _print_debug "[search_tree] is exhausted" in
          let _ = musr () in
          ()
        else
          (*get the next node*)
          let maybe_next_node = get_best_valid_node s v (Some root) depth in
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
      let _ = _print_debug "[search-tree] starting" in
      let _ = mint "g" in
      let _ = musr () in
      let r = SearchLib.root v.search in
      let _ = SearchLib.move_cursor v.search (s,v) (OPTION.force_conc r) in
      let _ = _print_debug "[search-tree] positioned cursor" in
      if List.length ( GoalTableLib.get_actionable_goals v ) = 0 then
        let _ = mark_if_solution s v root in 
        let _ = _print_debug "[search-tree] begin search" in
        let _ = rec_solve_subtree root in
        ()
      else
        let _ = _print_debug "[search-tree] get best valid goal" in
        let next_goal = get_best_valid_goal v in
        let _ = _print_debug "[search-tree] solve the best valid goal" in
        let _ = solve_goal next_goal in
        let _ = _print_debug "[search-tree] begin search" in
        let _ = rec_solve_subtree root in
        ()



    let solve (s:slvr) (v:gltbl) (nslns:int) (depth:int) : ((sstep snode) list) option =
      let _ = _print_debug ("find # solutions: "^(string_of_int nslns)) in
      let root = OPTION.force_conc (SearchLib.root v.search) in
      let _ : unit= solve_subtree s v root nslns depth in
      let slns = SearchLib.get_solutions v.search (Some root) in
      match slns with
      | h::t -> Some slns
      | _ -> None

end
