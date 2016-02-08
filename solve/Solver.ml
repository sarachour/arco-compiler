open Common
open Globals

open HW
open HWData
open HWCstr

open Math
open MathCstr

open AST
open ASTUnifyData
open ASTUnify

open Util
open Unit

open SymCamlData

open Interactive

open SearchData
open Search

open SolverData
open SolverUtil
open SolverSln
open SolverSearch
open SolverRslv
open SolverGoalTable

open SpiceLib

(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))




module SolveLib =
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
    let rec user_menu_handle () = menu "goal-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle


  let mkslv h p = {hw=h; prob=p; cnt=0;}




  let mkconn s t sw dw pr =
    if sw = dw then [] else
    [SSolAddConn(sw,dw)]
    (*
    match ifover_mkcopier s t sw pr with
    | Some(steps,nsw) ->
      SSolAddConn(nsw,dw)::steps
    | None ->
      [SSolAddConn(sw,dw)]
    *)

  (*
    determine if a label is mapping
  *)

  let hwkind2wire (slvr:slvr) (sln:sln) (id:unodeid) (inst:int) (knd:hwvkind) =
    let identname = UnivLib.unodeid2name id in
    let ivar = HwLib.get_port_by_kind slvr.hw knd identname in
    let wire : wireid = (id,inst,ivar.name) in
    let prop,_ = MAP.singleton (HwLib.getprops slvr.hw identname ivar.name) in
    let wid = SlnLib.wire2uid slvr.hw wire prop in
    wid, wire, prop

  let mkinp  (slvr:slvr) (sln:sln) wire prop (lbl:label) =
    let ident = UNoInput(prop) in
    if (SlnLib.usecomp_valid slvr sln ident) = false then
      error "mkinp" "cannot make input port."
    else
      (*let comp = HwLib.getcomp s.hw node.name in*)
      let inst = SlnLib.usecomp sln ident in
      let usenode = SSolUseNode(ident,inst) in
      let wid = SlnLib.wire2uid slvr.hw wire prop in
      let iid,iwire,iprop = hwkind2wire slvr sln ident inst HNInput in
      let oid,owire,oprop = hwkind2wire slvr sln ident inst HNOutput in
      let connport = SAddGoal(TrivialGoal(UFunction(oid,Term(wid)))) in
      let bindlbl = SSolAddLabel(iwire, iprop, lbl) in
      let bindlbl2 = SSolAddLabel(owire, oprop, lbl) in
      [usenode; connport;bindlbl;bindlbl2]

  let mkout (slvr:slvr) (sln:sln) wire prop (lbl:label) =
    let ident = UNoOutput(prop) in
    if (SlnLib.usecomp_valid slvr sln ident) = false then
      error "mkinp" "cannot make input port."
    else
      (*let comp = HwLib.getcomp s.hw node.name in*)
      let inst = SlnLib.usecomp sln ident in
      let usenode = SSolUseNode(ident,inst) in
      let wid = SlnLib.wire2uid slvr.hw wire prop in
      let iid,iwire,iprop = hwkind2wire slvr sln ident inst HNInput in
      let oid,owire,oprop = hwkind2wire slvr sln ident inst HNOutput in
      let connport = SAddGoal(TrivialGoal(UFunction(iid,Term(wid)))) in
      let bindlbl = SSolAddLabel(owire, oprop, lbl) in
      let bindlbl2 = SSolAddLabel(iwire, iprop, lbl) in
      [usenode;connport;bindlbl;bindlbl2]

  let rslv_label (slvr:slvr) (sln:sln) (wire:wireid) (prop:propid) (name:mid) (knd:hwvkind) : sstep list =
    (*find all pending input connections with same label*)
    let conn_inputs nwire nprop (nm:mid) =
      let conv w p l =
        let snk : unid = SlnLib.wire2uid slvr.hw wire prop in
        let src : unid = SlnLib.wire2uid slvr.hw nwire nprop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        let rm_lbl = SSolRemoveLabel(w,p,l) in
        [add_goal; rm_lbl]
      in
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(_,v) -> v = nm | _ -> false)
      in
      let steps : sstep list = List.fold_right (fun (w,p,l) r -> r @ (conv w p l)) lbls [] in
      steps
    in
    (*find all existing inputs with same label*)
    let find_input nwire nprop nm =
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(_,v) -> v = nm && p = nprop | _ -> false)
      in
      match lbls with
      | [] ->
        let stps = mkinp slvr sln nwire nprop (LBindVar(HNInput,name)) in
        stps
      | [(w,p,l)] ->
        let snk : unid = SlnLib.wire2uid slvr.hw w p in
        let src : unid = SlnLib.wire2uid slvr.hw nwire nprop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        let rm_lbl = SSolRemoveLabel(w,p,l) in
        [add_goal; rm_lbl]
      | _ ->
        error "rslv_label.find_input" "too many labels."
    in
    let conn_if_exists wire prop name =
      (*Find any output labels*)
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindVar(k,v) -> v = name && p = prop && k = HNOutput | _ -> false)
      in
      match lbls with
      | [(ow,op,ol)] ->
        let snk : unid = SlnLib.wire2uid slvr.hw ow op in
        let src : unid = SlnLib.wire2uid slvr.hw wire prop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(src,Term(snk)))) in
        [add_goal]
      | [] ->
        let stp = SSolAddLabel(wire,prop,LBindVar(HNInput, name)) in
        [stp]
    in
    (*all the wires that needed to be assigned labels*)
    match (knd, (MathLib.getkind slvr.prob (MathLib.mid2name name)) ) with
    (*output value, resolve labels that are buffering on this by making connections back.
    if this variable is marked as an output by the menv, connect to an output port*)
    | (HNOutput, Some MOutput) ->
      let conn_outs = conn_inputs wire prop name in
      let outport = mkout slvr sln wire prop (LBindVar (HNOutput,name)) in
      conn_outs @ outport
      (*create an output port and map all inputs*)
    | (HNOutput, Some MLocal) ->
      let conn_outs = conn_inputs wire prop name in conn_outs
    (*input value, add to buffer if variable is also local. Otherwise, map to a port.*)
    | (HNInput, Some MInput) ->
      let conn_ins = find_input wire prop name in conn_ins
      (*determine if the input is already mapped.*)
    | (HNInput, Some MLocal) ->
      let stps = conn_if_exists wire prop name in stps
      (*add label to this wire, do not create input*)
    | (HNInput, Some MOutput) ->
      let stps = conn_if_exists wire prop name in stps
    | (HNInput, None) ->
      let conn_ins = find_input wire prop name in
      conn_ins
      (* add label to this wire, don't create an input *)
    | (_,None) -> error "rslv_label" ("bound label is not a variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MLocal) -> error "rslv_label" ("bound label is a local variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MOutput) -> error "rslv_label" ("bound label is a output variable: "^
          "wire <-> "^(MathLib.mid2name name))

    | (_,Some MInput) -> error "rslv_label" ("bound label is an input variable: "^
          "wire <-> "^(MathLib.mid2name name))


  let rslv_value (slvr:slvr) (sln:sln) (wire:wireid) (prop:propid) (valu:number) knd =
    let find_input (nwire:wireid) (nprop:propid) (nval:number) =
      let print_labels lbls : unit =
        let _ = List.iter (fun (w,p,l) ->
          print_debug ("binding: "^(SlnLib.wire2str w)^" "^p^" "^(SlnLib.label2str l))
        ) lbls in ()
      in
      let is_input_comp c = match c with
      | UNoInput(_) -> true
      | _ -> false
      in
      let is_output_port c port =
        let cn = UnivLib.unodeid2name c in
        match HwLib.getkind slvr.hw cn port with
        | HNInput -> false
        | HNOutput -> true
      in
      let lbls : (wireid*propid*label) list = SlnLib.get_labels sln
        (fun w p x -> match x with LBindValue(v) ->
          let c,_,port = w in
          p = nprop && is_input_comp c &&
          is_output_port c port &&
          MATH.cmp_numbers v valu 0.000000000001
          | _ -> false)
      in
      let nlbl = LBindValue(nval) in
      match lbls with
      | [] ->
        let stps = mkinp slvr sln nwire nprop (nlbl) in
        let rm_lbl = SSolRemoveLabel(nwire,nprop,nlbl) in
        rm_lbl::stps
      | (w,p,l)::[] ->
        let src : unid = SlnLib.wire2uid slvr.hw w p in
        let snk : unid = SlnLib.wire2uid slvr.hw nwire nprop in
        let add_goal = SAddGoal(TrivialGoal(UFunction(snk,Term(src)))) in
        let rm_lbl = SSolRemoveLabel(nwire,nprop,nlbl) in
        [add_goal; rm_lbl]
      | h::t ->
        let _ = print_debug ("# Failed : "^(string_of_number valu)) in
        let _ = print_labels in
        let _ = print_labels lbls in
        error "rslv_value" "too many bindings."
    in
    match knd with
    (*impossible to map an output to a value*)
    | HNOutput ->
      let assign = (SlnLib.wire2str wire)^":"^prop^" = "^(string_of_number valu) in
      error "rslv_value" ("impossible assignment: "^assign)
    (*impossible to map an input to a value*)
    | HNInput ->
      let stps = find_input wire prop (valu) in
      stps

  let is_trivial g =
      match g with
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Decimal(_)) -> true
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Integer(_)) -> true
      | UFunction(MathId(_),Decimal(_)) -> true
      | UFunction(MathId(_),Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> true
      | UFunction(HwId(v),Term(MathId(_))) -> true
      | _ -> false

  let if_nontrivial_possible g =
      match g with
      | UFunction(MathId(MNTime(_)),Term(HwId(HNTime(_)))) -> false
      | UFunction(HwId(HNTime(_)),Term(MathId(MNTime(_)))) -> false
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Decimal(_)) -> true
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> false
      | UFunction(HwId(v),Term(MathId(_))) -> false
      | _ -> false

  let resolve_trivial_step (s:slvr) (t:gltbl) g : sstep list =
    match GoalTableLib.unwrap_goal g with
      (*check for duplicates*)
    | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
        if prop1 = prop2 then
          let src = SlnLib.hwport2wire c1 v1 in
          let snk = SlnLib.hwport2wire c2 v2 in
          let conn = mkconn s t src snk prop1 in
          conn
        else error "get_trivial_step" "is nontrivial."
    | UFunction(HwId(HNPort(k,c,v,prop,u)),Decimal(q)) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_value s t.sln wire prop (Decimal q) k in
        stps

    | UFunction(HwId(HNPort(k,c,v,prop,u)),Integer(q)) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_value s t.sln wire prop (Integer q) k in
        stps

    | UFunction(HwId(HNPort(k,c,v,prop,u)), Term(MathId(q)) ) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_label (s) t.sln wire prop q k in
        stps

    | UFunction(MathId(q), Term(HwId(HNPort(k,c,v,prop,u))) ) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_label (s) (t.sln) wire prop q k in
        stps

    | UFunction(MathId(MNTime(um)), Term (HwId(HNTime(cmp,uh))) ) ->
        let tc = () in
        []

    | UFunction(HwId(HNTime(cmp,uh)), Term (MathId(MNTime(um))) ) ->
        let tc = () in
        []

    | _ -> []


  let canon_hw_assign lhs rhs : (unid*(unid ast)) option =
    match rhs with
    | Term(rhs_term) ->
      begin
        match lhs,rhs_term with
        | (HwId(HNPort(k1,c1,v1,p1,u1)),HwId(HNPort(k2,c2,v2,p2,u2))) ->
          (*hw ports must have an input = output pattern*)
          if k1 = HNOutput && k2 = HNInput then
            Some (HwId(HNPort(k2,c2,v2,p2,u2)),Term(HwId(HNPort(k1,c1,v1,p1,u1))))
          else if k1 = HNInput && k2 = HNOutput then
              Some(lhs,rhs)
          else if k1 = HNOutput && k2 = HNOutput && lhs <> rhs_term then
            None
          else if k1 = HNInput && k2 = HNInput  && lhs <> rhs_term then
            None
          else
            Some (lhs,rhs)
        | _ ->
            Some (lhs,rhs)
      end
    | _ -> Some(lhs,rhs)

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
    let add_unification (u:unid fusion) =
      let _ = print_debug "TODO: Implement add unification" in
      ()
    in
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then None else
    (*let comp = HwLib.getcomp s.hw node.name in*)
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
    let slns : (unid fusion) set =
      ASTUnifier.multipattern templ targ
      (UnivLib.unid2var)
      (UnivLib.var2unid (s))
      (UnivLib.unid2var)
    in
    let nslns = SET.size slns in
    if nslns = 0 then
      let _ = SearchLib.rm gtbl.search comp_cursor in
      let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in
      None
    else
      let _ = SearchLib.visited gtbl.search comp_cursor in
      let _ = SET.iter slns (fun x -> add_unification x)  in
      Some(nslns)



  let apply_components (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let comps = MAP.filter tbl.nodes (fun k v -> match k with UNoComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with UNoConcComp(_) -> true | _ -> false)  in
    let handle_component (id,x) status =
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
    let is_valid = if depth >= get_glbl_int "search_max_depth" then
      let _ = print_debug "[test-node-validity] hit max depth" in
      let _ = SearchLib.deadend v.search c in
      false
    else
      if SlnLib.usecomp_cons s v.sln  then
      if SlnLib.mkconn_cons s v.sln then
        (*determine if there are any goals left*)
        if (GoalTableLib.num_actionable_goals v) = 0 then
          (*found all goals*)
          let _ = print_debug "[test-node-validity] found a valid solution" in
          let _ = SearchLib.solution v.search c in
          true
        else
          true
      else
        let _ = print_debug "[test-node-validity] impossible set of connections" in
        let _ = SearchLib.deadend v.search c in
        false
      else
        let _ = print_debug "[test-node-validity] impossible set of component uses" in
        let _ = SearchLib.deadend v.search c in
        false
    in
    let _ = SearchLib.move_cursor v.search (s,v) old_cursor in
    is_valid


  (*get the best valid node. If there is no valid node, return none *)
  let rec get_best_valid_node (s:slvr) (v:gltbl) (root:(sstep snode) option)  : (sstep snode) option =
    let collate_score old_score score : float =
      score.state
    in
    match SearchLib.select_best_node v.search collate_score root with
    | Some(newnode) ->
        if test_node_validity s v newnode then
          Some(newnode)
        else
          get_best_valid_node s v root
    | None -> None

  let score_goal_uniform g = 0.
  let score_goal_random g = RAND.rand_norm()

  let score_goal_trivial_preferred g = match g with
    | TrivialGoal(v) -> 1. +. RAND.rand_norm ()
    | NonTrivialGoal(v) -> RAND.rand_norm()

  let score_goal_nontrivial_preferred g = match g with
    | TrivialGoal(v) -> RAND.rand_norm ()
    | NonTrivialGoal(v) -> 1. +. RAND.rand_norm()

  let best_goal_function () =
    let typ = get_glbl_string "goal_search_selector_type" in
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

  let solve_subtree (s:slvr) (v:gltbl) (root:(sstep snode)) =
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
        let mktrv = resolve_trivial_step s v g in
        let triv = mknode ((SRemoveGoal g)::mktrv) curr in
        if if_nontrivial_possible grel then
          let upgradetriv = [SRemoveGoal(TrivialGoal(grel)); SAddGoal(NonTrivialGoal(grel))] in
          let nontriv = mknode upgradetriv curr in
          let _ = SearchLib.move_cursor v.search (s,v) curr in
          ()
        else
          ()
    in
    let rec rec_solve_subtree (root:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      if SearchLib.is_exhausted v.search (Some root) then
        ()
      else
        (*get the next node*)
        let maybe_next_node = get_best_valid_node s v (Some root) in
        if SearchLib.has_solution v.search (Some root) then
         let _ = print_debug "[search_tree] Found Solution" in
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
      if List.length ( GoalTableLib.get_actionable_goals v ) = 0 then
        let _ = SearchLib.solution v.search root in
        let _ = rec_solve_subtree root in
        ()
      else
        let next_goal = get_best_valid_goal v in
        let _ = solve_goal next_goal in
        let _ = rec_solve_subtree root in
        ()



  let rec solve_sim_eqn (_s:slvr ref) (v:gltbl) (target:mid) : (sstep snode) option =
    let goal_has_mvar (gs:goal) (target:mid) : bool = match GoalTableLib.unwrap_goal gs with
      | UState(MathId(q),_,_,_) -> q = target
      | UFunction(MathId(q),_) -> q = target
      | _ -> true
    in
    let s = REF.dr _s in
    (*ban directly solving goals that are not the mvar one*)
    let root = SearchLib.cursor v.search in
    let goals = GoalTableLib.get_actionable_goals v in
    let passify_goals : sstep list = List.fold_right (fun (x:goal) (r:sstep list) ->
      if goal_has_mvar x target = false then
        [SMakeGoalPassive x] @ r
      else
        r
    ) goals [] in
    let passify_goals = SearchLib.wrap_node passify_goals in
    let _ = SearchLib.apply_node v.search (s,v) passify_goals in
    let _ = solve_subtree s v root in
    let _ = SearchLib.unapply_node v.search (s,v) passify_goals in
    if SearchLib.has_solution v.search (Some root) then
      let slns = SearchLib.get_solutions v.search (Some root) in
      let sln : (sstep snode) = (List.nth slns 0) in
      Some(sln)
    else
      None

    let make_dependency_dag (prob:menv) = ()

    let dag_to_ordering_and_ics (prob) = ()

    let solve_multiple s v  =
      (*make a dependency dag, along with dummy ports for circular things*)
      let multsearch : (mvar,gltbl) map = MAP.make () in
      let dag = make_dependency_dag s.prob in
      let ord_ics = dag_to_ordering_and_ics in
      ()

    (*
    Continue working on this.
    *)
    let solve_topology _s v =
      let s = REF.dr _s in
      let init_goals = LIST.shuffle (SET.to_list v.goals) in
      let _ = Printf.printf "====Solving===\n" in
      (*makes a new table, where the node immediately following the goalnode is a sequence of steps.*)
      let mknewtbl (steps: sstep list)  (gls:goal list) : gltbl =
        (*new buffer*)
        let tbl : gltbl = GoalTableLib.newtbl s v gls is_trivial in
        let _ = SearchLib.start tbl.search in
        (*new initial node*)
        let _ = List.iter (fun x -> SearchLib.add_step tbl.search x) steps in
        let p = SearchLib.commit tbl.search (s,tbl) in
        let _ = SearchLib.move_cursor tbl.search (s,tbl) p in
        tbl
      in
      (*get the steps from a particular node*)
      let get_steps v n =
        (*given a node and the table, get the delta between the solution node and the current node*)
        let path = SearchLib.get_path v.search n in
        path
      in
      let get_mid g = match g with
      | UState(MathId(m),_,_,_) -> m
      | UFunction(MathId(m),_) -> m
      | _ -> error "get_mid" "expected goal with mid on the other end."
      in
      let rec try_solve (ctx:sstep list) goals =
        let rec attempt (new_tbl:gltbl) (g:goal) (rest:goal list) : sstep list option =
          let _ = Printf.printf "Attempt To Solve: %s\n" (UnivLib.goal2str g) in
          let ur = GoalTableLib.unwrap_goal g in
          (*solve a nontrivial relation*)
          let gid = get_mid ur in
          let result = solve_sim_eqn _s new_tbl gid in
          let _ = Printf.printf "Returned To: %s : %s\n" (UnivLib.goal2str g)
            (if result = None then "no solution" else "has solution") in
          match result with
          | Some(node) ->
            let _ = Printf.printf "[%d] Successfully Solved: %s. solve children\n" (node.id) (UnivLib.goal2str g) in
            let steps = get_steps new_tbl node in
            if List.length rest = 0 then
              Some(steps)
            else
              let next_result = try_solve (steps) rest in
              begin
              match next_result with
              | Some(steps) ->
                let _ = Printf.printf "Successfully Solved children of: %s\n" (UnivLib.goal2str g) in
                Some(steps)
              | None ->
                let _ = Printf.printf "Failed to Solve children of: %s\n" (UnivLib.goal2str g) in
                (*mark the current solution a dead end and try again*)
                let _ = SearchLib.deadend new_tbl.search node in
                let res = attempt new_tbl g rest in
                res
              end
          | None ->
            let _ = Printf.printf "No solutions found: %s\n" (UnivLib.goal2str g) in
            None
        in
        match goals with
        | g::t ->
          let new_tbl = mknewtbl ctx init_goals in
          let result = attempt new_tbl g t in
          result
        | [] -> None
    in
      let result = try_solve ([]) init_goals in
      let _ = Printf.printf "Completed search.\n" in
      match result with
      | Some(steps) ->
        let ntbl :gltbl = mknewtbl steps init_goals in
        let _ = Printf.printf "Result has %d elements \n" (List.length steps) in
        let mint,musr= mkmenu s ntbl None in
        let _ = mint "s" in
        Some(s,ntbl)
      | None ->
      let _ = Printf.printf "No Result\n" in
        None



    let solve (_s) (v) =
      let res = solve_topology _s v in
      res

end


let canonicalize_sln (hw:hwenv) (s:sln) =
  let newlabels = MAP.make () in
  let mklbl wire propmap =
    MAP.put newlabels wire propmap
  in
  let proc_wire wire propmap =
    let c,i,p = wire in
    let cname : string = UnivLib.unodeid2name c in
    match c with
    | UNoInput(prop) -> if HwLib.getkind hw cname p = HNInput then ()
      else let _ = mklbl wire propmap in ()
    | UNoOutput(prop) -> if HwLib.getkind hw cname p = HNOutput then ()
      else let _ = mklbl wire propmap in ()
    | _ -> let _ = mklbl wire propmap in ()
  in
  (*only keep assignments on one end of the input or output port*)
  let _ = MAP.iter s.labels (fun wire props -> proc_wire wire props) in
  let _ = MAP.set s.labels newlabels in
  ()


let solve (hw:hwenv) (prob:menv) (out:string) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv hw prob in
  let tbl = GoalTableLib.mktbl sl (SolveLib.is_trivial) in
  let _ = print_inter "===== Beginning Interactive Solver ======\n" in
  let spdoc = SolveLib.solve (REF.mk sl) (tbl) in
  match spdoc with
    | Some(s,tbl) ->
      (*canonicalize the solution*)
      let _ = canonicalize_sln hw tbl.sln in
      let _ = Printf.printf "===== Concretizing to Spice File ======\n" in
      let _ = try
        let sp = SpiceLib.to_spice s tbl.sln in
        IO.save out (SpiceLib.to_str sp)
      with
        | SpiceLibException(m) -> Printf.printf "ERROR: SPICE Generation Failed. %s" m
      in
      let _ = Printf.printf "===== Concretizing to summary file =====\n" in
      let _ = IO.save (out^".summary") (SlnLib.tostr tbl.sln) in
      let _ = SlnLib.repr2file (out^".caml") tbl.sln in
      let _ = Printf.printf "===== Solution Found ======\n" in
      ()
    | None ->
      let _ = flush_all () in
      error "solve" " no solution Found."
  ()
