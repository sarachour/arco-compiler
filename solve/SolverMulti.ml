open Util

open ASTUnifyData
open ASTUnify


open Interactive
open Globals

open HWData
open Math
open HW

open Search
open SearchData

open SolverGoalTable
open SolverData
open SolverUtil
open SolverSln
open SolverTrivial
open SolverSearch
open SolverEqn

open SolverMultiData


exception SolverMultiError of string

let error n m = raise (SolverMultiError (n^":"^m))



let m_print_debug : string -> unit = print_debug 1 "multi"
let m_menu = menu 1

module MultiSearchTree =
struct
  let step2str x = match x with
    | MSSolveVar(id) -> "-var "^(UnivLib.unid2var id)
    | MSPartialApp(id,i) -> "#partial"^(UnivLib.unid2var id)^"."^(string_of_int i)
    | MSGlobalApp(_) -> "#global"


  let apply_step (env:mutbl) (x:mustep) : mutbl =
    let _ = m_print_debug ("apply "^step2str x) in
    match x with
    | MSPartialApp(id,i) ->
      let search = MAP.get env.partials id in
      (*get solution node to apply by id*)
      let node : sstep snode = SearchLib.id2node search i in
      (*get the subset of steps*)
      let steps : sstep list = SearchLib.get_path search node in
      let _ = SearchLib.apply_steps search (env.slvr,env.mtbl) steps in
      env
    | MSGlobalApp(steps) ->
      let _,search = MAP.rand env.partials in
      let _ = SearchLib.apply_steps search (env.slvr,env.mtbl) steps in
      env
    | MSSolveVar(id) ->
      let _ = SET.add env.solved id in
      env

  let unapply_step (env:mutbl) (x:mustep) : mutbl =
    let _ = m_print_debug ("unapply "^step2str x) in
    match x with
    | MSPartialApp(id,i) ->
      let search = MAP.get env.partials id in
      let node : sstep snode = SearchLib.id2node search i in
      let steps : sstep list = SearchLib.get_path search node in
      let _ = SearchLib.unapply_steps search (env.slvr, env.mtbl) steps in
      env
    | MSGlobalApp(steps) ->
      let _,search = MAP.rand env.partials in
      let _ = SearchLib.unapply_steps search (env.slvr,env.mtbl) steps in
      env
    | MSSolveVar(id) ->
      let _ = SET.rm env.solved id in
      env

  let order_step x y = 0

  let score_step env x =
    SearchLib.mkscore 0. 0.

  let mksearch () =
    let search : (mustep,mutbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_step score_step step2str
    in
      search


end

(*
The multi-solution search tree tries patterns of solutions

*)
module MultiSearch =
struct
  let mkmenu (s:musearch)  =
    let menu_desc = "t=search-tree, s=sol, o=order, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str s.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "o" then
        let _ = Printf.printf "\n%s\n\n" (QUEUE.tostr s.order UnivLib.unid2var) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let _ = Printf.printf "\n%s\n\n" (SlnLib.tostr s.state.mtbl.sln) in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = slvr_menu "multi-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle


  let mk_partial_tbl (ms:musearch) (id:unid) =
    (*make the current search state*)
    let _ = if MAP.has ms.state.partials id = false then
      error "mk_partial_tbl" "doesn't exist"
    in
    (*get the current state*)
    let search = MAP.get ms.state.partials id in
    let tbl = GoalTableLib.mktbl ms.state.slvr ms.state.mtbl.is_trivial in
    (*ban everything but current variable*)
    let _ = (tbl.search <- search) in
    tbl



  let get_labels tbl valfilt varfilt : (wireid*propid*label) list =
    let results = MAP.fold tbl.sln.labels (fun wire pmap rest ->
        let rr = MAP.fold pmap (fun p xset rest ->
            let flt : label list = SET.filter xset (fun x ->
              match x with
              | LBindVar(knd,name) -> varfilt knd name
              | LBindValue(knd,v) -> valfilt knd v
            ) in
            let res : (wireid*propid*label) list = List.map (fun x -> (wire,p,x)) flt in
            res @ rest
          ) []
        in
        rr @ rest
      ) []
      in
      results



  (*
    create global circuit from the partial solution buffer
  *)
  let get_global_context ms : sstep list =
    let tbl = ms.state.mtbl in
    let menv : menv = ms.state.slvr.prob in
    let hwenv : hwenv=  ms.state.slvr.hw  in
    let proc_local_var name =
      let olabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNOutput) in
      let ilabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNInput) in
      match olabels with
      | [(owire,oprop,olabel)] ->
        let _ = m_print_debug "noted! we found an output label. Let's connect all inputs." in
        (*lets create goals for the tableau to map*)
        let add_goals : sstep list = List.map (fun (iwire,iprop,ilbl) ->
          let ihwid = UnivLib.wire2uid hwenv iwire iprop in
          let ohwid = UnivLib.wire2uid hwenv owire oprop in
          let rel = UFunction(ohwid,Term(ihwid)) in
          let goal = UnivLib.wrap_goal tbl rel in
          SAddGoal(goal)
        ) ilabels in
        add_goals
      | [] ->
        let _ = m_print_debug "this local variable is not bound yet, so we're not going to loop back." in
        []
      | h::t -> error "proc_local" "cannot have more than one output variable"

    in
    let proc_out_var (name:string) =
      let olabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNOutput) in
      match olabels with
      | [(wwire,wprop,wlabel)] ->
        let _ = m_print_debug "found the output label" in
        let cmpname,ihwid,ohwid = HwLib.getout hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let steps= [
          (*node utilization*)
          SSolUseNode(cmpid,inst_id);
          (*wire connection*)
          SAddGoal(UnivLib.wrap_goal tbl (UFunction(whwid,Term(ohwid))));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ]
        in
        steps
    in
    let proc_in_var (name:string) =
      let ilabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNInput) in
      let res : sstep list = LIST.fold ilabels (fun (wwire,wprop,wlabel) rest ->
        let _ = m_print_debug "found the input label" in
        let cmpname,ihwid,ohwid = HwLib.getin hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let steps= [
          SSolUseNode(cmpid,inst_id);
          (*connection*)
          SAddGoal(UnivLib.wrap_goal tbl (UFunction(whwid,Term(ohwid))));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ]
        in
        steps @ rest
      ) []
      in
        res
    in
    let proc_in_val () =
      let ilabels : (wireid*propid*label) list = get_labels tbl (fun k v -> k = HNInput) (fun k v -> false) in
      let res : sstep list = LIST.fold ilabels (fun (wwire,wprop,wlabel) rest ->
        let _ = m_print_debug "found the input label" in
        let cmpname,ihwid,ohwid = HwLib.getin hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let steps= [
          SSolUseNode(cmpid,inst_id);
          (*connection*)
          SAddGoal(UnivLib.wrap_goal tbl (UFunction(whwid,Term(ohwid))));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ] in
        steps @ rest
      ) []
      in
        res
    in
    let var_steps : sstep list = MAP.fold menv.vars (fun name mid (rest:sstep list) ->
      match MathLib.getkind menv name with
      (*input variable*)
      | Some MInput ->
        let insteps : sstep list = proc_in_var name in
        insteps @ rest
      (*output variable*)
      | Some MOutput ->
        let lclsteps = proc_local_var name in
        let outsteps = proc_out_var name in
        lclsteps @ outsteps @ rest
      (*local variable*)
      | Some MLocal ->
        let lclsteps = proc_local_var name in
        lclsteps @ rest
      | None ->
        error "var_steps" ("cannot find variable of : "^name)
    ) []
    in
    let val_steps = proc_in_val () in
    val_steps @ var_steps

      (* find n more solutions *)
      (*
      let expand_search (sl:musearch) (id:unid) (nsols:int) : unit =
        (*mktable*)
        let multi = sl.search in
        let curs = SearchLib.cursor multi in
        let partial_tbl = mk_partial_tbl sl id in
        let slvr = sl.state.slvr in
        (*get partial search tree*)
        let partial = MAP.get sl.state.partials id in
        let currsols : int = SearchLib.num_solutions partial None in
        let r : ((sstep snode) list) option = SolverEqn.solve slvr partial_tbl (nsols+currsols) in
        match r with
        | Some(nodes) ->
          let proc_node (n:sstep snode) : _ =
            let _ = SearchLib.move_cursor multi sl.state curs in
            let steps : sstep list = SearchLib.get_path partial n in
            let _ = SearchLib.start multi in
            let _ = List.iter (fun x -> match x with
              | SRemoveGoal(g) ->
                let lhs = Shim.goal2lhs g in
                if QUEUE.has sl.order lhs then
                  SearchLib.add_step multi (MSSolveVar(lhs))
              | _ -> ()

            ) steps
            in
            let _ = SearchLib.add_step multi (MSPartialApp(id,n.id)) in
            let _ = SearchLib.commit multi sl.state in
            ()
          in
          let nns = List.map (fun (x:sstep snode) -> proc_node x) nodes in
          ()
        | None ->
          let _ = SearchLib.deadend multi curs in
          ()
    *)

    (*find a partial solution*)
    let find_partial_solution (ms:musearch) (pvar) (nslns) : ((sstep snode) list) option =
      let slvr = ms.state.slvr in
      let partial_search = MAP.get ms.state.partials pvar in
      let partial_tbl = mk_partial_tbl ms pvar in
      let currsols : int = SearchLib.num_solutions partial_search None in
      (*original solution set*)
      let orig : (sstep snode) list= SearchLib.get_solutions partial_search None in
      let is_new q = List.length (LIST.filter (fun x -> q.id = x.id) orig) = 0 in
      let _ = m_print_debug "find a partial solution" in
      let r : ((sstep snode) list) option = SolverEqn.solve slvr partial_tbl (nslns+currsols) in
      let _ = m_print_debug "found partial solutions" in
      match r with
      | None -> None
      | Some(nw) ->
        let diff = List.filter (fun q ->  is_new q) nw in
        begin
        match diff with
        | [] -> None
        | h::t -> Some(h::t)
        end

    (*find a global solution, given the set of partials that have been applied*)
    let find_global_solution (ms:musearch) (nsols:int)=
      let mtbl = ms.state.mtbl in
      let mglbl = ms.state.glbl in
      let dummy = SlvrSearchLib.mksearch () in
      let st =  (ms.state.slvr,ms.state.mtbl) in
      let _ = SearchLib.apply_steps dummy st mglbl in
      let results = SolverEqn.solve ms.state.slvr ms.state.mtbl nsols in
      let _ = SearchLib.unapply_steps dummy st mglbl in
      results

    (*Find and add a new partial *)
    let augment_with_partial_solution (ms:musearch) (pvar) (slns) :  unit =
      let curs = SearchLib.cursor ms.search in
      let proc_step x = match x with
        | SRemoveGoal(g) ->
          let lhs = Shim.goal2lhs g in
          if QUEUE.has ms.order lhs then
            SearchLib.add_step ms.search (MSSolveVar(lhs))
        | _ -> ()
      in
      (*attempt to add a new solution*)
      let add_solution (sln:sstep snode) =
        let partial = MAP.get ms.state.partials pvar in
        let _ = SearchLib.move_cursor ms.search ms.state curs in
        let _ = SearchLib.start ms.search in
        (*partial application of solution*)
        let _ = (SearchLib.add_step ms.search (MSPartialApp(pvar,sln.id))) in
        let _ = List.iter (fun x -> proc_step x) (SearchLib.get_path partial sln) in
        let pnode = SearchLib.commit ms.search ms.state in
        let _ = SearchLib.move_cursor ms.search ms.state pnode in
        (*create global context node*)
        let glblctx = get_global_context ms in
        let _ = SearchLib.start ms.search in
        let _ = SearchLib.add_step ms.search (MSGlobalApp glblctx) in
        let gnode = SearchLib.commit ms.search ms.state in
        let _ = SearchLib.move_cursor ms.search ms.state gnode in
        match find_global_solution ms 1 with
        | Some(_) -> (*this is valid*) ()
        | None ->
          let _ = SearchLib.deadend ms.search gnode in
          let _ = SearchLib.deadend ms.search pnode in
          ()
      in
      match slns with
      | Some(slns) ->
        let _ = m_print_debug "found some partial solutions. Will add partial solution node and global" in
        let _ = List.iter (fun x -> add_solution x) slns in
        ()
      | None ->
        let _ = m_print_debug "could not find any more partial solutions." in
        ()

    let augment_with_new_partial_sln (ms:musearch) (pvar) (nslns) =
      let _ = m_print_debug "finding new partial solution" in
      let slns : (sstep snode list) option = find_partial_solution ms pvar nslns in
      let _ = m_print_debug "done with search" in
      let _ = augment_with_partial_solution ms pvar slns in
      ()

    let augment_with_existing_partial_sln (ms:musearch) (pvar) =
      let _ = m_print_debug "finding existing partial solution" in
      let partial_search = MAP.get ms.state.partials pvar in
      let slns  = SearchLib.get_solutions partial_search None in
      let slns = if List.length slns = 0 then None else Some(slns) in
      let _ = augment_with_partial_solution ms pvar slns in
      ()

    let n_existing_partial_slns (ms:musearch) (pvar) =
      0

    (*get the best valid node. If there is no valid node, return none *)
    let rec get_best_valid_node (ms:musearch)  : (mustep snode) option =
      let collate_score old_score (score:sscore) : float =
        score.state
      in
      SearchLib.select_best_node ms.search collate_score None


    (*choose a variable, if there are no variables left, don't do anything.*)
    let choose_var (ms:musearch) : unid option=
      if QUEUE.empty ms.order then
        None
      else Some (QUEUE.front ms.order)
    (*
      Choose a variable that has not been solved yet
      If there are existing solutions, collate those onto tree.

    *)
    let msolve sl (ms:musearch) (nslns:int): (sln list) option =
      let mint,musr = mkmenu ms in
      let rec _msolve () =
        let _msolve_next () =
          let _ = musr () in
          let maybe_next_node = get_best_valid_node ms in
          match maybe_next_node with
          | Some(curs) ->
            let _ = SearchLib.move_cursor ms.search ms.state curs in
            let _ = _msolve() in
            ()
          | None ->
            let _ = m_print_debug "[search_tree] is exhausted" in
            let _ = _msolve() in
            ()

        in
        match choose_var ms with
        (*no variables left, mark a sa solution*)
        | None ->
          let cnode = SearchLib.cursor ms.search in
          let _ = SearchLib.solution ms.search cnode in
          if SearchLib.num_solutions ms.search None >= nslns then
           let _ = m_print_debug "[search_tree] Found enough solutions" in
           ()
          else
            let _ = m_print_debug ("must find next solution") in
            let _ = _msolve_next () in
            ()

        | Some(id) ->
          let _ = m_print_debug ("solving target: "^(UnivLib.unid2var id)) in
          if SearchLib.is_exhausted ms.search None then
            let _ = m_print_debug ("search tree is exhausted. adding new.") in
            let _  = augment_with_new_partial_sln ms id 1 in
            let _ = _msolve_next () in
            ()
          else
            let _ = m_print_debug ("search tree is not exhausted. adding existing.") in
            let _ = augment_with_existing_partial_sln ms id in
            let _ = _msolve_next () in
            ()

      in
      let _ = _msolve () in
      let snodes = SearchLib.get_solutions ms.search None in
      let slns = List.map (fun x ->
        let _ = SearchLib.move_cursor ms.search ms.state x in
        let gltbl = ms.state.mtbl in
        gltbl.sln
      ) snodes
      in
      match slns with
      | h::t -> Some(h::t)
      |[] ->None

  let mkmulti (slvr:slvr) =
    let mult_tbl = GoalTableLib.mktbl slvr (TrivialLib.is_trivial) in
    let scratch_partial_table = GoalTableLib.mktbl slvr (TrivialLib.is_trivial) in
    let order = QUEUE.make () in
    let _ =SET.iter mult_tbl.goals (fun g -> let v = Shim.goal2lhs g in
      return (QUEUE.enqueue order v) ()
    ) in
    (*initialize partial tree*)
    let partial_tree = MAP.make () in
    let mult_tree =  MultiSearchTree.mksearch () in
    let make_partial_tree v =
      let sr = SlvrSearchLib.mksearch() in
      let blacklist = SET.filter mult_tbl.goals (fun g -> Shim.goal2lhs g <> v) in
      let bansteps = List.map (fun x -> SMakeGoalPassive(x)) blacklist in
      let _ = SearchLib.setroot sr (slvr,scratch_partial_table) (bansteps) in
      let _ = MAP.put partial_tree v sr in
      ()
    in
    let _ = QUEUE.iter order (fun q -> make_partial_tree q) in
    let mtbl : mutbl = {
      mtbl = mult_tbl;
      partials = partial_tree;
      glbl =  [];
      solved = SET.make_dflt ();
      slvr = slvr;
    } in
    let _ = SearchLib.setroot mult_tree mtbl [] in
    let msearch : musearch = {
      nodes = mult_tbl.nodes;
      goals = mult_tbl.goals;
      order = order;
      search = mult_tree;
      state = mtbl;
    }
    in
    msearch




end
