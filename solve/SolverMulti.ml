open Util

open ASTUnifyData
open ASTUnify


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
open SolverSearch
open SolverEqn


type mtbl = {
  (*subtrees*)
  st: (unid,(sstep,slvr*gltbl) ssearch) map;
  slvr: slvr;
  multtbl: gltbl;
  (*the order to process the expressions*)
  mutable order: unid queue;
}
type msstep =
  | MSSlnApp of unid*int
  | MSAddVar of unid
  | MSRmVar of unid

type msearch = {
  (*determine which solution of which variable to apply,
  solutions modify*)
  multst: (msstep,mtbl) ssearch;
  tbl: mtbl;
  (*invariants*)
  is_trivial: urel->bool;
  mutable nodes : (unodeid, unode) map;
  mutable goals : goal set;
}

let m_print_debug = print_debug 1
let m_menu = menu 1

module MultiSearchTree =
struct
  let apply_step (env:mtbl) (x:msstep) : mtbl = match x with
    | MSSlnApp(id,i) ->
      let search = MAP.get env.st id in
      (*get solution node to apply by id*)
      let node : sstep snode = SearchLib.id2node search i in
      (*get the subset of steps*)
      let steps : sstep list = SearchLib.get_path search node in
      let _ = SearchLib.apply_steps search (env.slvr,env.multtbl) steps in
      env
    | MSRmVar(id) ->
      if QUEUE.front env.order = id then
        let _ = QUEUE.dequeue env.order in
        env
      else
        error "apply_step" ("inconsistent queue: top="
        ^(UnivLib.unid2var (QUEUE.front env.order))^" != "^(UnivLib.unid2var id))
    | MSAddVar(id) ->
      let _ = QUEUE.enqueue env.order id in
      env

  let unapply_step (env:mtbl) (x:msstep) : mtbl = match x with
    | MSSlnApp(id,i) ->
      let search = MAP.get env.st id in
      let node : sstep snode = SearchLib.id2node search i in
      let steps : sstep list = SearchLib.get_path search node in
      let _ = SearchLib.unapply_steps search (env.slvr, env.multtbl) steps in
      env
    | MSAddVar(id) ->
      if QUEUE.front env.order = id then
        let _ = QUEUE.dequeue env.order in
        env
      else
        error "unapply_step" ("inconsistent queue: back="
        ^(UnivLib.unid2var (QUEUE.front env.order))^" != "^(UnivLib.unid2var id))
    | MSRmVar(id) ->
      let _ = QUEUE.enqueue_front env.order id in
      env

  let order_step x y = 0

  let score_step env x =
    SearchLib.mkscore 0. 0.

  let step2str x = match x with
    | MSAddVar(id) -> "+var "^(UnivLib.unid2var id)
    | MSRmVar(id) -> "-var "^(UnivLib.unid2var id)
    | MSSlnApp(id,i) -> "#sln"^(UnivLib.unid2var id)^"."^(string_of_int i)

  let mksearch () =
    let search : (msstep,mtbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_step score_step step2str
    in
      search


end

(*
The multi-solution search tree tries patterns of solutions

*)
module MultiSearch =
struct
  let mkmenu (s:msearch)  =
    let menu_desc = "t=search-tree, s=sol, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str s.multst) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let _ = Printf.printf "\n%s\n\n" (SlnLib.tostr s.tbl.multtbl.sln) in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = slvr_menu "multi-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle



  let mk_partial_tbl (ms:msearch) (id:unid) =
    (*make the current search state*)
    let _ = if MAP.has ms.tbl.st id = false then
      error "mk_partial_tbl" "doesn't exist"
    in
    (*get the current state*)
    let search = MAP.get ms.tbl.st id in
    let tbl = GoalTableLib.mktbl ms.tbl.slvr ms.is_trivial in
    (*ban everything but current variable*)
    let _ = (tbl.search <- search) in
    tbl


  (* find n more solutions *)
  let expand_search (sl:msearch) (id:unid) (nsols:int) : unit =
    (*mktable*)
    let multi = sl.multst in
    let curs = SearchLib.cursor multi in
    let partial_tbl = mk_partial_tbl sl id in
    let slvr = sl.tbl.slvr in
    (*get partial search tree*)
    let partial = MAP.get sl.tbl.st id in
    let currsols : int = SearchLib.num_solutions partial None in
    let r : ((sstep snode) list) option = SolverEqn.solve slvr partial_tbl (nsols+currsols) in
    match r with
    | Some(nodes) ->
      let proc_node (n:sstep snode) : _ =
        let _ = SearchLib.move_cursor multi sl.tbl curs in
        let steps : sstep list = SearchLib.get_path partial n in
        let _ = SearchLib.start multi in
        let _ = List.iter (fun x -> match x with
          | SRemoveGoal(g) ->
            let lhs = Shim.goal2lhs g in
            if QUEUE.has sl.tbl.order lhs then
              SearchLib.add_step multi (MSRmVar(lhs))
          | SAddGoal(g) ->
            let lhs = Shim.goal2lhs g in
            if QUEUE.has sl.tbl.order lhs then
              SearchLib.add_step multi (MSAddVar(lhs))
          | _ -> ()

        ) steps
        in
        let _ = SearchLib.add_step multi (MSSlnApp(id,n.id)) in
        let _ = SearchLib.commit multi sl.tbl in
        ()
      in
      let nns = List.map (fun (x:sstep snode) -> proc_node x) nodes in
      ()
    | None ->
      let _ = SearchLib.deadend multi curs in
      ()

    let test_node_validity (ms:msearch) newnode =
      true

    (*get the best valid node. If there is no valid node, return none *)
    let rec get_best_valid_node (ms:msearch)   : (msstep snode) option =
      let collate_score old_score score : float =
        score.state
      in
      match SearchLib.select_best_node ms.multst collate_score None with
      | Some(newnode) ->
          if test_node_validity ms newnode then
            Some(newnode)
          else
            get_best_valid_node ms
      | None -> None



    let msolve sl (ms:msearch) (nslns:int): (sln list) option =
      let mint,musr = mkmenu ms in
      let rec _msolve () =
        if SearchLib.is_exhausted ms.multst None then
          let _ = m_print_debug "[search_tree] is exhausted" in
          ()
        else
          let _ = musr () in
          let maybe_next_node = get_best_valid_node ms in
          (*found enough solutions*)
          if SearchLib.num_solutions ms.multst None >= nslns then
           let _ = slvr_print_debug "[search_tree] Found enough solutions" in
           ()
          else
            match maybe_next_node with
            | Some(curs) ->
              let _ = SearchLib.move_cursor ms.multst ms.tbl curs in
              let _ = musr () in
              let id : unid = QUEUE.front ms.tbl.order in
              (*if we find a solution*)
              if QUEUE.empty ms.tbl.order then
                let _ = SearchLib.solution ms.multst curs in
                let _ = m_print_debug ("Solved all equations.") in
                let _ = _msolve () in
                ()
              else
                let _ = m_print_debug ("Solving Target: "^(UnivLib.unid2var id)) in
                let _  : unit= expand_search ms id 1 in
                let _ = _msolve () in
                ()
            | None ->
              ()
      in
      let root = SearchLib.cursor ms.multst in 
      let _ = if QUEUE.empty ms.tbl.order then
        let _ = SearchLib.solution ms.multst root in
        let _ = _msolve () in
        ()
      else
        let id : unid = QUEUE.front ms.tbl.order in
          let _  : unit= expand_search ms id 1 in
          let _ = _msolve () in
          ()
      in
      let snodes = SearchLib.get_solutions ms.multst None in
      let slns = List.map (fun x ->
        let _ = SearchLib.move_cursor ms.multst ms.tbl x in
        let gltbl = ms.tbl.multtbl in
        gltbl.sln
      ) snodes
      in
      match slns with
      | h::t -> Some(h::t)
      |[] ->None

  let mkmulti (slvr:slvr) =
    let mult_tbl = GoalTableLib.mktbl slvr (TrivialLib.is_trivial) in
    let scratch_partial_table = GoalTableLib.mktbl slvr (TrivialLib.is_trivial) in
    let order = QUEUE.from_list (SET.map mult_tbl.goals (fun g -> Shim.goal2lhs g)) in
    let partial_tree = MAP.make () in
    (*initialize partial tree*)
    let mult_tree =  MultiSearchTree.mksearch () in
    let mult_steps = QUEUE.map order (fun q -> MSAddVar(q)) in
    let make_partial_tree v =
      let sr = SlvrSearchLib.mksearch() in
      let blacklist = SET.filter mult_tbl.goals (fun g -> Shim.goal2lhs g <> v) in
      let bansteps = List.map (fun x -> SMakeGoalPassive(x)) blacklist in
      let _ = SearchLib.setroot sr (slvr,scratch_partial_table) (bansteps) in
      let _ = MAP.put partial_tree v sr in
      ()
    in
    let _ = QUEUE.iter order (fun q -> make_partial_tree q) in
    let mtbl : mtbl = {
      multtbl = mult_tbl;
      st = partial_tree;
      order = order;
      slvr = slvr;
    } in
    let _ = SearchLib.setroot mult_tree mtbl mult_steps in
    let msearch : msearch = {
      nodes = mult_tbl.nodes;
      goals = mult_tbl.goals;
      is_trivial = mult_tbl.is_trivial;
      multst = mult_tree;
      tbl = mtbl;
    }
    in
    msearch




end
