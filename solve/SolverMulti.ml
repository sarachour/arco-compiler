open Util

open ASTUnifyData
open ASTUnify


open Interactive
open Globals
open AST

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


  let apply_step (env:mutbl) (x:mustep) : mutbl =
    let _ = m_print_debug ("apply "^step2str x) in
    match x with
    | MSPartialApp(id,i) ->
      let _ = SET.add env.local (id,i) in
      env

    | MSSolveVar(id) ->
      let _ = SET.add env.solved id in
      env

  let unapply_step (env:mutbl) (x:mustep) : mutbl =
    let _ = m_print_debug ("unapply "^step2str x) in
    match x with
    | MSPartialApp(id,i) ->
      let _ = SET.rm env.local (id,i) in
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
    let menu_desc = "t=search-tree, o=order, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str s.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "o" then
        let _ = Printf.printf "\n%s\n\n" (QUEUE.tostr s.order UnivLib.unid2var) in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = slvr_menu "multi-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle


  let set2key (x:(unid*int) set) : string =
    let xsort = SET.sort x (fun (unid1,i1) (unid2,i2) ->
      let s1 = UnivLib.unid2str unid1 in
      let s2 = UnivLib.unid2str unid2 in
      if s1 = s2 then
        i1 - i2
      else
        STRING.compare s1 s2
    )
    in
    let str = List.fold_right (fun (x,i) r->
      let s = UnivLib.unid2str x in
      s^"~"^(string_of_int i)^r
    ) xsort "" in
    str


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
  let get_global_context ms tbl : sstep list =
    let menv : menv = ms.state.slvr.prob in
    let hwenv : hwenv=  ms.state.slvr.hw  in
    (*process a local variable*)
    let proc_local_var name =
      let olabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNOutput) in
      let ilabels : (wireid*propid*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNInput) in
      match olabels with
      | [(owire,oprop,olabel)] ->
        let _ = m_print_debug "noted! we found an output label. Let's connect all inputs." in
        let ohwid = UnivLib.wire2uid hwenv owire oprop in
        let omid = UnivLib.label2uid olabel in
        (*lets create goals for the tableau to map*)
        let connect_ports : sstep list = List.map (fun (iwire,iprop,ilbl) ->
          let ihwid = UnivLib.wire2uid hwenv iwire iprop in
          let rel = UFunction(ohwid,Term(ihwid)) in
          let goal = UnivLib.wrap_goal tbl rel in
          (*this is the connection goal*)
          SAddGoal(goal)
        ) ilabels in
        let remove_existing_goal = match GoalTableLib.get_goal_from_var tbl omid with
         | Some(v) -> [SRemoveGoal(v)]
         | _ -> []
        in
        remove_existing_goal @ connect_ports
      | [] ->
        let _ = m_print_debug "this local variable is not bound yet, so we're not going to loop back." in
        []
      | h::t -> error "proc_local" ("cannot have more than one output variable: "^name)

    in
    (*process a strict output*)
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
          SAddGoal(UnivLib.wrap_goal tbl (UFunction(whwid,Term(ihwid))));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ]
        in
        steps
    | [] ->
      let _ = m_print_debug ("no bindings yet: "^name) in
      []
    | h::t ->
      error "proc_out_bar" ("multiple bindings: "^name)
    in
    (*process a strict input*)
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
    (*iterate over values*)
    let proc_in_val () =
      let valassign2ast wlabel : unid ast = match wlabel with
      | LBindValue(_,Integer(i)) -> Integer(i)
      | LBindValue(_,Decimal(i)) -> Decimal(i)
      | _ -> error "valaasign2ast" "expected value assign"
      in
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
        let vv = valassign2ast wlabel in
        let steps= [
          SSolUseNode(cmpid,inst_id);
          SAddNodeRel(cmpid,inst_id,UFunction(ohwid,vv));
          (*add the nontrivialgoal*)
          SAddGoal(NonTrivialGoal (UFunction(whwid,vv)));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ] in
        steps @ rest
      ) []
      in
        res
    in
    (*iterate over variables*)
    let var_steps : sstep list = MAP.fold menv.vars (fun name mid (rest:sstep list) ->
      if MathLib.isvar menv name then
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
      else
        rest
    ) []
    in
    let val_steps = proc_in_val () in
    val_steps @ var_steps



    (*normalize partial steps so there are no id conflicts *)
    let build_partial_steps ms (ctx:sstep list) (id:unid) (i:int) : sstep list =
      let idalloc : (unodeid,int set) map = MAP.make () in
      let idmapper : (unodeid*int,int) map = MAP.make () in
      let proc_ctx s = match s with
        | SSolUseNode(id,i) ->
            let _ = if MAP.has idalloc id = false then
              return (MAP.put idalloc id (SET.make_dflt ())) ()
            in
              return (SET.add (MAP.get idalloc id) i) ()
        | _ -> ()
      in
      let rec find_fresh allocs id =
        if SET.has allocs id then
          find_fresh allocs (id+1)
        else
          id
      in
      let has_mapping id i =
        MAP.has idalloc id && SET.has (MAP.get idalloc id) i
      in
      let add_mapping id i = (*collision*)
        if has_mapping id i then
          let alloced = MAP.get idalloc id in
          let fid = find_fresh alloced 0 in
          if MAP.has idmapper (id,i) then
            error "proc_lcl" "cannot use the same node multiple times"
          else
            return (MAP.put idmapper (id,i) fid) ()
        else
          return (MAP.put idmapper (id,i) i) ()
      in
      let proc_lcl s = match s with
        | SSolUseNode(id,i) -> add_mapping id i
        | SAddNodeRel(id,i,_) -> add_mapping id i
        | _ -> ()
      in
      let trans_wire (w:wireid) =
        let cid,i,lc = w in
        let ni = MAP.get idmapper (cid,i) in
        (cid,ni,lc)
      in
      let trans_unid (u:unid) : unid = match u with
        | HwId(HNPort(knd,HCMGlobal(c,i),p,pr,u)) ->
          let id = UnivLib.name2unodeid c in
          let ni = MAP.get idmapper (id,i) in
          HwId(HNPort(knd,HCMGlobal(c,ni),p,pr,u))
        | _ -> u
      in
      let trans_urel (u:urel) =
        match u with
        | UFunction(rhs,lhs) -> UFunction(trans_unid rhs, ASTLib.map lhs trans_unid)
        | UState(rhs,lhs,deriv,time) -> UState(trans_unid rhs, ASTLib.map lhs trans_unid,
            trans_unid deriv, trans_unid time)
      in
      let trans_goal (g:goal) =
        (UnivLib.wrap_goal_fun ms.is_trivial (trans_urel (UnivLib.unwrap_goal g)))
      in
      let trans_lcl s = match s with
        | SSolUseNode(id,i) ->
          let ni = MAP.get idmapper (id,i) in
           SSolUseNode (id,ni)
        | SSolAddConn(w1,w2) -> SSolAddConn(trans_wire w1, trans_wire w2)
        | SSolAddLabel(w,lbl,k) -> SSolAddLabel(trans_wire w,lbl,k)
        | SSolRemoveLabel(w,lbl,k) -> SSolRemoveLabel(trans_wire w,lbl,k)
        | SRemoveGoal(g) -> SRemoveGoal (trans_goal g)
        | SAddGoal(g) -> SAddGoal (trans_goal g)
        | SMakeGoalActive(g) -> SMakeGoalActive(g)
        | SMakeGoalPassive(g) -> SMakeGoalPassive(g)
        | SAddNodeRel(n,i,rs) ->
          let ni = MAP.get idmapper (n,i) in
          SAddNodeRel(n,ni,trans_urel rs)
      in
      let psearch = MAP.get ms.state.partials id in
      let lclnode = SearchLib.id2node psearch i in
      let lclsteps = LIST.rev (SearchLib.get_path psearch lclnode) in
      let _ = List.iter (fun x -> proc_ctx x) ctx in
      let _ = List.iter (fun x -> proc_lcl x) lclsteps in
      let nlcl = List.map (fun x -> trans_lcl x) lclsteps in
      let _ = m_print_debug "=== Mappings ===" in
      let _ = MAP.iter idmapper (fun (uid,i) (fi) ->
        let  _ = m_print_debug (" "^(UnivLib.unodeid2name uid)^" "^(string_of_int i)^" -> "^(string_of_int fi)^"\n") in
        ()
      ) in
      let _ = m_print_debug "=== Normalized Partial Solution ===" in
      let _ = List.iter (fun x ->
        let _ = m_print_debug ("  "^(SlvrSearchLib.step2str x)) in
        ()
      ) nlcl in
      let _ = m_print_debug "================" in
      nlcl



  let build_partials_steps ms (ids:(unid*int) set) : sstep list =
    let _ = m_print_debug ("Number of partials applied: "^(string_of_int (SET.size ids))) in
    let steps = SET.fold ids (fun (id,i) steps -> steps @ (build_partial_steps ms steps id i)) [] in
    steps

  let build_global_steps ms =
    let dummy = GoalTableLib.mktbl ms.state.slvr ms.is_trivial in
    let _ = GoalTableLib.mknullroot ms.state.slvr dummy in
    let steps = build_partials_steps ms ms.state.local in
    let _ = SearchLib.apply_steps dummy.search (ms.state.slvr,dummy) steps in
    let glsteps = get_global_context ms dummy in
    glsteps @ steps

  let mk_global_tbl (ms:musearch) =
    let tbl = GoalTableLib.mktbl ms.state.slvr ms.is_trivial in
    let key = (set2key ms.state.local) in
    (*if this table already exists*)
    if MAP.has ms.state.globals key = false then
      let steps = build_global_steps ms in
      let _ = m_print_debug "======= Global Steps =======" in
      let _ = List.iter (fun x -> m_print_debug ("   "^(SlvrSearchLib.step2str x))) steps in
      let _ = m_print_debug "============================" in
      let _ = GoalTableLib.mkroot ms.state.slvr tbl steps in
      let _ = MAP.put ms.state.globals key tbl.search in
      tbl
    else
      let search = MAP.get ms.state.globals key in
      let _ = (tbl.search <- search) in
      tbl


  (*find a global solution, given the set of partials that have been applied*)
  let find_global_solution (ms:musearch) (nsols:int)=
    let tbl = mk_global_tbl ms in
    (*find the global steps *)
    let depth = get_glbl_int "slvr-global-depth" in
    let results = SolverEqn.solve ms.state.slvr tbl nsols depth in
    let root = OPTION.force_conc (SearchLib.root tbl.search) in
    let _ = SearchLib.clear_cursor tbl.search in
    results

  let get_existing_global_solutions (ms:musearch) =
    let handle_sln search (s:sstep snode) (tbl:gltbl) =
      let _ = SearchLib.move_cursor search (ms.state.slvr,tbl) s in
      let ss = tbl.sln in
      ss
    in
    let handle_msln sln : sln list =
      let _ = SearchLib.move_cursor ms.search ms.state sln in
      let key = (set2key ms.state.local) in
      let stree,snodes =
        if MAP.has ms.state.globals key then
          let _ = m_print_debug "found existing tree" in
          let tree = MAP.get ms.state.globals key in
          (tree,SearchLib.get_solutions tree None)
        else
          let _ = m_print_debug "find new tree" in
          let slns = find_global_solution ms 1 in
          let tree = MAP.get ms.state.globals key in
          match slns with
          | Some(s) -> (tree,s)
          | None -> (tree,[])
      in
      let ptbl = GoalTableLib.mktbl ms.state.slvr ms.is_trivial in
      let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str stree) in
      let slns : sln list = List.fold_right (fun x r -> (handle_sln stree x ptbl)::r) snodes [] in
      slns
    in
    let mslns = SearchLib.get_solutions ms.search None in
    let slns = List.fold_right (fun x r -> (handle_msln x) @ r) mslns [] in
    slns

  let mk_partial_tbl (ms:musearch) (id:unid) =
    (*make the current search state*)
    let _ = if MAP.has ms.state.partials id = false then
        let tbl = GoalTableLib.mktbl ms.state.slvr ms.is_trivial in
        (*make passive bans*)
        let blacklist = SET.filter ms.goals (fun g -> Shim.goal2lhs g <> id) in
        let bansteps = List.map (fun x -> SMakeGoalPassive(x)) blacklist in
        let goalsteps = SET.map ms.goals (fun g -> SAddGoal(g)) in
        let _ = GoalTableLib.mkroot ms.state.slvr tbl (bansteps @ goalsteps) in
        let _ = m_print_debug "made a partial tree" in
        let _ = MAP.put ms.state.partials id tbl.search in
        ()
    in
    let tbl = GoalTableLib.mktbl ms.state.slvr ms.is_trivial in
    (*get the current state*)
    let search = MAP.get ms.state.partials id in
    let _ = (tbl.search <- search) in
    tbl

  (*find a partial solution*)
  let find_partial_solution (ms:musearch) (pvar) (nslns) : ((sstep snode) list) option =
    let slvr = ms.state.slvr in
    let ptbl = mk_partial_tbl ms pvar in
    let currsols : int = SearchLib.num_solutions ptbl.search None in
    (*original solution set*)
    let orig : (sstep snode) list= SearchLib.get_solutions ptbl.search None in
    let is_new q = List.length (LIST.filter (fun x -> q.id = x.id) orig) = 0 in
    let _ = m_print_debug "find a partial solution" in
    let depth = get_glbl_int "slvr-partial-depth" in
    let r : ((sstep snode) list) option = SolverEqn.solve slvr ptbl (nslns+currsols) depth in
    let _ = SearchLib.clear_cursor ptbl.search in
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

    (*Find and add a new partial *)
    let augment_with_partial_solution (ms:musearch) (pvar) (slns: sstep snode list option) :  'a option =
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
        match find_global_solution ms 1 with
        | Some(slns) ->
          ()
        | None ->
          let _ = SearchLib.deadend ms.search pnode in
          ()
      in
      match slns with
      | Some(cslns) ->
        let _ = m_print_debug "found some partial solutions. Will add partial solution node and global" in
        let _ = List.iter (fun x -> add_solution x) cslns in
        slns
      | None ->
        let _ = m_print_debug "could not find any more partial solutions." in
        slns

    let augment_with_new_partial_sln (ms:musearch) (pvar) (nslns) =
      let _ = m_print_debug "finding new partial solution" in
      let slns : (sstep snode list) option = find_partial_solution ms pvar nslns in
      let _ = m_print_debug "done with search" in
      let res : 'a option = augment_with_partial_solution ms pvar slns in
      res

    let augment_with_existing_partial_sln (ms:musearch) (pvar) =
      let _ = m_print_debug "finding existing partial solution" in
      let partial_search = MAP.get ms.state.partials pvar in
      let slns  = SearchLib.get_solutions partial_search None in
      let slns = if List.length slns = 0 then None else Some(slns) in
      let res : 'a option = augment_with_partial_solution ms pvar slns in
      res

    let n_existing_partial_slns (ms:musearch) (pvar) =
      0

    (*get the best valid node. If there is no valid node, return none *)
    let rec get_best_valid_node (ms:musearch)  : (mustep snode) option =
      let collate_score (o:sscore) (n:sscore) : sscore =
        SearchLib.mkscore n.state (o.delta +. n.delta)
      in
      SearchLib.select_best_node ms.search collate_score None


    (*choose a variable, if there are no variables left, don't do anything.*)
    let choose_var (ms:musearch) : unid option=
      if QUEUE.empty ms.order then
        None
      else
        let left = QUEUE.filter ms.order
          (fun x -> SET.has ms.state.solved x = false)
        in
        if LIST.empty left then
          None
        else
          Some (List.nth left 0)
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
        let cnode = SearchLib.cursor ms.search in
        match choose_var ms with
        (*no variables left, mark a sa solution*)
        | None ->
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
            let res  = augment_with_new_partial_sln ms id 1 in
            if res <> None then
              let _ = _msolve_next () in
              ()
            else
              let _ = SearchLib.deadend ms.search cnode in
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
      let slns = List.fold_right (fun (x:mustep snode) (r:sln list) ->
        let _ = SearchLib.move_cursor ms.search ms.state x in
        let slns :sln list = get_existing_global_solutions ms in
        slns @ r
      ) snodes []
      in
      match slns with
      | h::t -> Some(h::t)
      |[] ->None

  let mkmulti (slvr:slvr) =
    (*make a top level table with default goals*)
    let scratch = GoalTableLib.mktbl slvr (TrivialLib.is_trivial) in
    let _ = GoalTableLib.mkgoalroot slvr scratch  in
    (*create ordering*)
    let order = QUEUE.make () in
    let _ =SET.iter scratch.goals (fun g -> let v = Shim.goal2lhs g in
      return (QUEUE.enqueue order v) ()
    ) in
    (*initialize partial tree*)
    let mtree =  MultiSearchTree.mksearch () in
    let mtbl : mutbl = {
      partials = MAP.make ();
      globals = MAP.make ();
      local = SET.make_dflt ();
      solved = SET.make_dflt ();
      slvr = slvr;
    } in
    let _ = SearchLib.setroot mtree mtbl [] in
    let msearch : musearch = {
      nodes = scratch.nodes;
      goals = scratch.goals;
      order = order;
      search = mtree;
      state = mtbl;
      is_trivial = TrivialLib.is_trivial;
    }
    in
    msearch




end
