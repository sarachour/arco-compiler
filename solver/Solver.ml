open Common

open HW
open HWCstr

open Math
open MathCstr

open AST
open Util
open Unit

open SymCamlData

open Interactive

open SolverData
open SolverUtil
open SolverSln
open SolverSearch
(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)

module SolveLib =
struct

  let mkslv h p i = {interactive=i; hw=h; prob=p; max_depth=10; cnt=0;}

  let mktbl s : gltbl =
    (* add all relations to the tableau of goals. *)
    let rm_pars x : unid ast option =
      match x with
      | Term(HwId(HNParam(c,n,v,p))) -> Some (Decimal (v))
      | Term(MathId(MNParam(n,v,u))) ->Some (Decimal(v))
      | _ -> None
    in
    let math2goal (x:mvar) =
      let m2u = UnivLib.mid2unid in
      let tf x = ASTLib.trans (ASTLib.map x m2u) rm_pars in
      match x.rel with
      | MRFunction(l,r) -> UFunction(m2u l, tf r)
      | MRState(l,r,x) ->
        let time = (MathLib.getvar s.prob (force_conc s.prob.time)).typ in
        UState(m2u l, tf r, m2u x, m2u time)
      | MRNone -> error "math2goal" "impossible."
    in
    let fltmath x = x.rel <> MRNone in
    let comp2node (c:hwcomp) =
      let nvars = List.filter (fun (x:hwvar) -> x.rel <> HRNone) (MAP.to_values (c.vars)) in
      let var2urel (x:hwvar) =
        let h2u = UnivLib.hwid2unid in
        let tf x = ASTLib.trans (ASTLib.map x h2u) rm_pars in
        match x.rel with
        | HRFunction(l,r) -> UFunction(h2u l, tf r)
        | HRState(l,r,i) ->
          let time = HNTime(HCMLocal(c.name),c.time) in
          UState(h2u l, tf r, h2u i, h2u time)
        | _ -> error "comp2node" "impossible"
      in
      let nrels = List.map var2urel nvars in
      let n = {rels=SET.from_list nrels; name=c.name} in
      n
    in
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let sln = SlnLib.mksln () in
    let rels : urel list = List.map math2goal (List.filter fltmath (MAP.to_values s.prob.vars)) in
    let nodes : unode list = List.map comp2node (MAP.to_values s.hw.comps) in
    let handle_node (x) =
       let nid = Shim.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_node x) nodes in
    let init_cursor,search= SearchLib.mkbuf (rels) in
    let tbl = {goals=SET.make (fun x y -> x = y); nodes=nodetbl; sln=sln; search=search} in
    let tbl = SearchLib.move_cursor s tbl init_cursor in
    tbl


  let goal2str g = UnivLib.urel2str g

  let conc_node nid nd rl (assigns:(unid,unid ast) map) iid =
    let sub_el x = match x with
      | Term(id) -> if MAP.has assigns id then Some (MAP.get assigns id) else None
      | _ -> None
    in
    let sub_ast x = ASTLib.trans x sub_el in
    let sub_rel x = match x with
    | UFunction(l,r) ->
      if MAP.has assigns l then error "conc_node" "cannot sub lhs" else
      UFunction(l,sub_ast r)
    | UState(l,r,ic,t) ->
      if MAP.has assigns l then error "conc_node" "cannot sub lhs" else
      if MAP.has assigns ic then error "conc_node" "cannot sub ic" else
      if MAP.has assigns t then error "conc_node" "cannot sub ic" else
      UState(l,sub_ast r, ic, t)
    in
    let nid_name = match nid with UNoComp(n) -> n | _ -> error "conc_node" "unexpected" in
    let new_nid = UNoConcComp(nid_name,iid) in
    let nrels : urel list= SET.filter nd.rels (fun x -> x <> rl) in
    if List.length nrels = 0 then None else
    let nrels : urel list = List.map (fun x -> sub_rel x) nrels in
    Some (nid,nrels)


  let apply_node (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : unit =
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then () else
    (*let comp = HwLib.getcomp s.hw node.name in*)
    let inst_id = SlnLib.usecomp gtbl.sln node_id in
    (*update search algorithm to include the usage*)
    let _ = SearchLib.start gtbl.search in
    let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
    let goal_cursor = SearchLib.cursor gtbl.search in
    let comp_cursor = SearchLib.commit gtbl.search in
    (*use node*)
    let _ = SearchLib.move_cursor s gtbl comp_cursor in
    let declunid = Shim.unid2sym node.name inst_id in
    (*
      this tries to find a set of solutions for the particular node. Each of these solutions is a branch.
    *)
    let unify_node_with_goal (gl:unid) (gr:unid ast) (nl:unid) (nr:unid ast) : ((unid,unid ast) map) list =
      let res = ASTLib.pattern nr gr UnivLib.unid2var (UnivLib.var2unid (s)) declunid 5 in
      match res with
      | Some(res) -> res
      | None ->  []
    in
    let unify_rels (v:urel) slns : (urel*(unid,unid ast) map) list =
      match g,v with
      | (UFunction(gl,gr), UFunction(nl,nr))->
        let nl = Shim.lclid2glblid s inst_id nl in
        let nr = Shim.lcl2glbl s inst_id nr in
        let res = unify_node_with_goal gl gr nl nr in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        let res = List.map (fun x -> (v,x)) res in
        slns @ res
      | (UState(gl,gr,gic,gt), UState(nl,nr,ic,nt))->
        let nl = Shim.lclid2glblid s inst_id nl in
        let ic = Shim.lclid2glblid s inst_id ic in
        let nt = Shim.lclid2glblid s inst_id nt in
        let nr = Shim.lcl2glbl s inst_id nr in
        let res = unify_node_with_goal gl gr nl nr in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        let _ = List.iter (fun mp -> let _ = MAP.put mp gic (Term ic) in () ) res in
        let _ = List.iter (fun mp -> let _ = MAP.put mp gic (Term ic) in () ) res in
        let res = List.map (fun x -> (v,x)) res in
        slns @ res
      | _ -> slns
    in
    let add_sln_to_search (gl:goal) ((rl,assigns):(urel*(unid,unid ast) map)) =
      let _ = SearchLib.start gtbl.search in
      let _ = SearchLib.add_step gtbl.search (SRemoveGoal gl) in
      let _ = MAP.iter assigns (fun k v -> SearchLib.add_step gtbl.search (SAddGoal (UFunction(k,v)))) in
      (*concretize other goals in this particular node.*)
      let _ = match conc_node node_id node rl assigns inst_id with
        | Some(cnid,crels) -> let _ = SearchLib.add_step gtbl.search (SAddNode (cnid,crels)) in ()
        | None -> ()
      in
      (*let _ = SearchLib.add_step gtbl.search (SAddNode (UNoConcComp "?", nnodes))  in*)
      let _ = SearchLib.commit gtbl.search in
      ()
    in
    let res = SET.fold node.rels unify_rels [] in
    let _ = List.iter (add_sln_to_search g) res in
    let _ = SearchLib.move_cursor s gtbl goal_cursor in
    if List.length res = 0
      then
        let _ = SearchLib.rm gtbl.search comp_cursor in
        let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in
        ()
      else
        let _ = SearchLib.visit gtbl.search comp_cursor in
        ()

  let mkmag (s:slvr) (port:unid) (qty:unid) =
    let mq = Shim.unt s qty in
    let mrng = Shim.mag s qty in
    let hwq = Shim.unt s port in
    let hwrng = Shim.mag s port in
    match hwq,hwrng,mrng with
    | (UExpr(Term(id)),Some(hr),Some(mr)) ->   (LMagnitude (hr, id, mr, mq))
    | (_,None,_) -> error "mkmag" ("quantity "^(UnivLib.unid2str port)^" must have range")
    | (_,_,None) -> error "mkmag" ("quantity "^(UnivLib.unid2str qty)^" must have range")
    | _ -> error "mkmag" "the hardware quantity has to be flat."

  let resolve_trivial s t goals =
    let is_trivial g =
      match g with
      | UFunction(id,Decimal(_)) -> true
      | UFunction(id,Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> true
      | UFunction(HwId(v),Term(MathId(_))) -> true
      | _ -> false
    in
    let get_trivial_step g : step list =
      match g with
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then
          [SSolAddConn (SlnLib.hwport2wire c1 v1,SlnLib.hwport2wire c2 v2)]
          else []
      | UFunction(HwId(HNPort(k,c,v,prop,u)),Decimal(q)) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindValue q in
          [SSolAddLabel(wire,prop,lbl)]
      | UFunction(HwId(HNPort(k,c,v,prop,u)),Integer(q)) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindValue (float_of_int q) in
          [SSolAddLabel(wire,prop,lbl)]
      | UFunction(HwId(HNPort(k,c,v,prop,u)), Term(MathId(q)) ) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindVar q in
          let mg = mkmag s (HwId(HNPort(k,c,v,prop,u))) (MathId q) in
          [SSolAddLabel(wire,prop,lbl);SSolAddLabel(wire,prop,mg)]
      | UFunction(MathId(MNVar(k,n,u)), Term(HwId(HNPort(k2,c2,v2,prop2,u2))) ) ->
          let wire = SlnLib.hwport2wire c2 v2 in
          let lbl = LBindVar (MNVar(k,n,u)) in
          let mg = mkmag s (HwId(HNPort(k2,c2,v2,prop2,u2))) (MathId (MNVar (k,n,u))) in
          [SSolAddLabel(wire,prop2,lbl);SSolAddLabel(wire,prop2,mg)]
      | UFunction(MathId(MNTime(um)), Term (HwId(HNTime(cmp,uh))) ) ->
          []
      | UFunction(HwId(HNTime(cmp,uh)), Term (MathId(MNTime(um))) ) ->
          []
      | _ -> []
    in
    let handle_goal g =
      if is_trivial g then
        let _ = SearchLib.add_step t.search (SRemoveGoal g) in
        let steps = get_trivial_step g  in
        let _ = List.iter (fun x -> let _ = SearchLib.add_step t.search x in ()) steps in
        ()
    in
    let goal_cursor = SearchLib.cursor t.search in
    if (SET.fold goals (fun x r -> if is_trivial x then r+1 else r) 0) > 0 then
      let _ = SearchLib.start t.search in
      let _ = SET.iter goals handle_goal in
      let trivial_cursor = SearchLib.commit t.search in
      let _ = SearchLib.visit t.search goal_cursor in
      let _ = SearchLib.move_cursor s t trivial_cursor in
      ()
    else
    ()


  let apply_nodes (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let comps = MAP.filter tbl.nodes (fun k v -> match k with UNoComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with UNoConcComp(_) -> true | _ -> false)  in
    let handle_node (id,x) =
      let _ = apply_node slvenv tbl g id x in
      ()
    in
    let _ = List.iter handle_node rels  in
    let _ = List.iter handle_node comps  in
    (*mark goal as explored.*)
    let goal_cursor = SearchLib.cursor tbl.search in
    let _ = SearchLib.visit tbl.search goal_cursor in
    ()

  let goals2str (g:goal set) =
    let goal2str g v =
      v^"\n"^(UnivLib.goal2str g)
    in
    SET.fold g goal2str ""

  let rec get_next_path s v =
    match SearchLib.random_path v.search with
    | Some(p) ->
      let depth =  List.length (TREE.get_path v.search.paths p) in
      if depth >= s.max_depth
        then
          let _ = SearchLib.visit v.search p in
          get_next_path s v
        else
          Some (p)
    | None -> None

  let mkmenu (s:slvr) (v:gltbl) (g:goal option) =
    let menu_desc = "t=search-tree, s=sol, g=goals, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.buf2str v.search) in
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
          let _ = SearchLib.move_cursor s v (SearchLib.id2node v.search nid) in
          ()
        | _ -> ()
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "g" then
        let _ = Printf.printf "==== Goals ===" in
        let _ = Printf.printf "%s\n" (goals2str v.goals) in
        let _ = Printf.printf "============\n\n" in
        ()
      else if STRING.startswith inp "c" then
        let _ = match g with
          | Some(g) -> let _ = Printf.printf ">>> target goal: %s\n\n" (UnivLib.goal2str g)  in ()
          | None -> Printf.printf "<no goal>"
        in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = menu s (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle

  let rec solve (_s:slvr ref) (v:gltbl) =
    let s = REF.dr _s in
    (*find a goal to focus on*)
    if SET.size v.goals = 0 then
      let _ = Printf.printf "SOLVER: Attained all goals. Finished\n" in
      let _ = exit 0 in
      ()
    else
      (*menu handling methods*)

      (*apply the current step in the search algorithm*)
      (*let _ = apply_steps s v (SearchLib.cursor v.search) in*)
      (*choose a goal in the table*)

      let solve_goal () =
        let goal_cursor = SearchLib.cursor v.search in
        let _ = resolve_trivial s v v.goals in
        if SET.size v.goals = 0 then
          let mint,musr = mkmenu s v None in
          let _ = Printf.printf "SOLVER: Attained all goals. Finished.\n" in
          let _ = mint "s" in
          let _ = exit 0 in
          error "solve_goal" "done"
        else
          let g = SET.rand v.goals in
          let mint,musr = mkmenu s v (Some g) in
          if SlnLib.conserve s v.sln = false then
            let _ = SearchLib.rm v.search goal_cursor in
            (mint,musr)
          else
            (*show goals and current solution*)
            let _ = mint "g" in
            let _ = mint "s" in
            let _ = mint "c" in
            let _ = apply_nodes s v g in
            let _ = musr () in
            (mint,musr)
      in
      let min,musr  = solve_goal () in
      match get_next_path s v with
        | Some(p) ->
          let _ = SearchLib.move_cursor s v p in
          let _ = solve _s v in
          ()
        | None ->
          let _ = Printf.printf "SOLVER: exhausted search.\n" in
          exit 0


end



let solve (hw:hwenv) (prob:menv) (interactive:bool) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv  hw prob interactive in
  let tbl = SolveLib.mktbl sl in
  let _ = pr sl "===== Beginning Interactive Solver ======" in
  let _ = SolveLib.solve (REF.mk sl) (tbl) in
  ()
