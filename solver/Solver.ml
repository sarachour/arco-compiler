open Common

open HW
open HWData
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

open SpiceLib

(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
exception SolverError of string

let error n m = raise (SolverError (n^":"^m))



module SolveLib =
struct
  let goals2str (g:goal set) =
    let goal2str g v =
      v^"\n"^(UnivLib.goal2str g)
    in
    SET.fold g goal2str ""


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


  let goal2str g = UnivLib.urel2str g

  let mkslv h p i = {interactive=i; hw=h; prob=p; max_depth=100; cnt=0;}

  let mktbl s : gltbl =
    (* add all relations to the tableau of goals. *)
    let rm_pars x : unid ast option =
      match x with
      | Term(HwId(HNParam(c,n,v,p))) -> Some (ast_of_number (v))
      | Term(MathId(MNParam(n,v,u))) ->Some (ast_of_number (v))
      | _ -> None
    in

    let simpl v : unid ast =
      let declunid = Shim.unid2sym "N/A" (-1) in
      let _ = Printf.printf "simplify: %s -> " (UnivLib.uast2str v) in
      let vq = ASTLib.simpl v UnivLib.unid2var (UnivLib.var2unid s) declunid in
      let _ = Printf.printf "%s\n" (UnivLib.uast2str vq) in
      vq
    in
    let math2goal (x:mvar) =
      let m2u = UnivLib.mid2unid in
      let tf x =
        let t = ASTLib.trans (ASTLib.map x m2u) rm_pars in
        let tsimpl = simpl t in
        tsimpl
      in
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
       let nid = UnivLib.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_node x) nodes in
    let init_cursor,search= SearchLib.mkbuf (rels) in
    let tbl = {goals=SET.make (fun x y -> x = y); nodes=nodetbl; sln=sln; search=search} in
    let tbl = SearchLib.move_cursor s tbl init_cursor in
    tbl



  let mkio s t kind cmp port prop : (step list)*wireid=
    let dest = SlnLib.hwport2wire cmp port in
    match kind with
    | HNInput ->
      let inpid = (UNoInput prop) in
      let inpinst = SlnLib.usecomp t.sln inpid in
      let _ = SlnLib.usecomp_unmark t.sln inpid inpinst in
      let use_input = SSolUseNode(inpid,inpinst) in
      let port = HwLib.get_port_by_kind s.hw HNOutput (UnivLib.unodeid2name inpid) in
      let port_dangle = HwLib.get_port_by_kind s.hw HNInput (UnivLib.unodeid2name inpid) in
      let pwire = (inpid,inpinst,port.name) in
      let mkconn = SSolAddConn(pwire,dest) in
      ([use_input; mkconn],(inpid,inpinst,port_dangle.name))
    | HNOutput ->
      let outid = (UNoOutput prop) in
      let outinst = SlnLib.usecomp t.sln outid in
      let _ = SlnLib.usecomp_unmark t.sln outid outinst in
      let use_output = SSolUseNode(outid,outinst) in
      let port = HwLib.get_port_by_kind s.hw HNInput (UnivLib.unodeid2name outid) in
      let port_dangle = HwLib.get_port_by_kind s.hw HNOutput (UnivLib.unodeid2name outid) in
      let pwire = (outid,outinst,port.name) in
      let mkconn = SSolAddConn(dest,pwire) in
      ([use_output;mkconn],(outid,outinst,port_dangle.name))

  let mkcopy s t (k1,c1,p1,pr1) (k2,c2,p2,pr2) =
    []

  let is_trivial g =
    match g with
    | UFunction(id,Decimal(_)) -> true
    | UFunction(id,Integer(_)) -> true
    | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
        if prop1 = prop2 then true else false
    | UFunction(MathId(v),Term(HwId(_))) -> true
    | UFunction(HwId(v),Term(MathId(_))) -> true
    | _ -> false

  let get_trivial_step s t g : step list =
    match g with
    | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
        if prop1 = prop2 then
          let src = SlnLib.hwport2wire c1 v1 in
          let snk = SlnLib.hwport2wire c2 v2 in
          [SSolAddConn (src,snk)]
        else []
    | UFunction(HwId(HNPort(k,c,v,prop,u)),Decimal(q)) ->
        let inps,port = mkio s t (k) c v prop in
        let lbl = LBindValue(q) in
        [SSolAddLabel(port,prop,lbl)] @ inps

    | UFunction(HwId(HNPort(k,c,v,prop,u)),Integer(q)) ->
        let inps,port = mkio s t (k) c v prop in
        let lbl = LBindValue(float_of_int q) in
        [SSolAddLabel(port,prop,lbl)] @ inps

    | UFunction(HwId(HNPort(k,c,v,prop,u)), Term(MathId(q)) ) ->
        let inps,port = mkio s t (k) c v prop in
        let lbl = LBindVar(k,q) in
        (*let mg = mkmag s (HwId(HNPort(k,c,v,prop,u))) (MathId q) in*)
        (*SSolAddLabel(wire,prop,mg)*)
        [SSolAddLabel(port,prop,lbl)] @ inps


    | UFunction(MathId(q), Term(HwId(HNPort(k,c,v,prop,u))) ) ->
        let inps,port = mkio s t (k) c v prop in
        let lbl = LBindVar(k,q) in
        (*let mg = mkmag s (HwId(HNPort(k2,c2,v2,prop2,u2))) (MathId (MNVar (k,n,u))) in*)
        [SSolAddLabel(port,prop,lbl)] @ inps
    | UFunction(MathId(MNTime(um)), Term (HwId(HNTime(cmp,uh))) ) ->
        let tc = () in
        []
    | UFunction(HwId(HNTime(cmp,uh)), Term (MathId(MNTime(um))) ) ->
        let tc = () in
        []
    | _ -> []

  let resolve_trivial s t goals =
    let handle_goal g =
      if is_trivial g then
        let _ = SearchLib.add_step t.search (SRemoveGoal g) in
        let steps = get_trivial_step s t g  in
        let _ = List.iter (fun x -> let _ = SearchLib.add_step t.search x in ()) steps in
        ()
    in
    let goal_cursor = SearchLib.cursor t.search in
    if (SET.fold goals (fun x r -> if is_trivial x then r+1 else r) 0) > 0 then
      let _ = SearchLib.start t.search in
      let _ = SET.iter goals handle_goal in
      let trivial_cursor = SearchLib.commit t.search in
      (*let _ = SearchLib.deadend t.search goal_cursor in*)
      let _ = SearchLib.move_cursor s t trivial_cursor in
      trivial_cursor
    else
    goal_cursor

    (*
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
  *)
  let unify_exprs (s:slvr) (name:string) (inst_id:int) (gl:unid) (gr:unid ast) (nl:unid) (nr:unid ast) : ((unid,unid ast) map) list option =
    (*declare event*)
    let declwcunid = Shim.unid2wcsym name inst_id in
    let n_tries = 10 in
    let res = ASTLib.pattern nr gr UnivLib.unid2var (UnivLib.var2unid (s)) declwcunid n_tries in
    res

  let unify_rels (s:slvr) (name:string) (inst_id:int) (g:urel) (v:urel) : (unid,unid ast) map list option=
    match (Shim.rel_lcl2glbl inst_id g),(Shim.rel_lcl2glbl inst_id v) with
    | (UFunction(gl,gr), UFunction(nl,nr))->
      let res = unify_exprs s name inst_id gl gr nl nr in
      let ret = match res with
          | Some(res) ->
            let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
            Some(res)
          | None -> None
      in
        ret

    | (UState(gl,gr,gic,gt), UState(nl,nr,nic,nt))->
      let res = unify_exprs s name inst_id gl gr nl nr in
      let ret = match res with
        | Some(res) ->
            let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
            let _ = List.iter (fun mp -> let _ = MAP.put mp nic (Term gic) in () ) res in
            let _ = List.iter (fun mp -> let _ = MAP.put mp nt (Term gt) in () ) res in
            Some(res)
        | None -> None
      in
        ret
    | _ ->
      None


  let resolve_assigns  s (name:string) (iid:int) (rel:urel) (g:goal) (all_rels:urel set) (all_goals:goal set) (assigns: (unid,unid ast) map) : (step list) option=
    (*get an id, given a goal*)
    let get_id urel =
      match urel with
      | UFunction(l,_) -> l
      | UState(l,_,_,_) -> l
    in
    let get_rel id lst = List.fold_right (fun q r -> if (get_id q) = id then Some(q) else r) lst None in
    (*substitute expression with concretized goals*)
    let sub_rel (rel:urel) assigns : urel =
      let mksubs (repls: (unid*unid ast) list) =
        let nassigns = MAP.map assigns (
            fun k v ->
              let ll = List.filter (fun (q,v) -> q = k) repls
              in
              if (List.length ll) > 0
              then let k2,v2 = List.nth ll 0 in v2
              else v
            )
        in
        nassigns
      in
      let repl_var (n)  : unid =
        if MAP.has assigns n then
          let res =
            match MAP.get assigns n with
            | Term(v) -> v
            | _ -> n
          in
            res
        else n
      in
      match rel with
      | UFunction(nl,nr) ->
        let snl = repl_var nl in
        (*let asgn = mksubs [(nl,Term(snl))] in*)
        let asgn = assigns in
        let snr = ASTLib.sub nr asgn in
        UFunction(nl,snr)

      | UState(nl,nr,nic,nt) ->
        let snl = repl_var nl in
        let snic = repl_var nic in
        let snt = repl_var nt in
        (*let asgn = (mksubs
          [
          (nl,Term(snl));
          (nic,Term(snic));
          (nt,Term(snt))
          ])
        in*)
        let asgn = assigns in
        let snr = ASTLib.sub nr asgn in
        UState(nl,snr,snic,snt)

    in
    let resolve_goal curr_goal others =
      match curr_goal with
      | UFunction(HwId(q),Term(MathId(z))) ->
        let res = match get_rel (MathId z) others with
        | Some(new_goal) -> new_goal
        | None -> curr_goal
        in
        res
      | _ -> curr_goal
    in
    (*
    ========
    MAIN ROUTINE
    ========
    *)
    let other_goals = SET.filter all_goals (fun x -> x <> g)  in
    let other_rels = List.map
      (fun q -> Shim.rel_lcl2glbl iid q) (SET.filter all_rels (fun x -> x <> rel))
    in
    (*determine if the assignment is ever on the left hand side of a relation*)
    (*take a mapping*)
    let rec solve_assign id expr assigns other_rels other_goals : (step list) option =
      let goal = UFunction(id,expr) in
      match get_rel id other_rels with
      | Some(orel) ->
        (* this is the concretized version of the relation
          if this fails  *)
        let orelsub = sub_rel orel assigns in
        let ngoal = resolve_goal goal other_goals in
        (*force unification between the expression and goal *)
        let un = unify_rels s name iid ngoal orelsub in

        (*id this works, we have resolved the goal of interest successfully by applying another node.*)
        let psteps = [SRemoveGoal(ngoal)] in
        let res = match un with
          | Some(sols) ->
            let other_rels = List.filter (fun x -> x <> orel) other_rels in
            let other_goals = List.filter (fun x -> x <> ngoal) other_goals in
            let try_sln sln =
              (*create a new map containg the new bindings and old bindings*)
              let cassigns = MAP.copy assigns in
              let _ = MAP.iter sln (fun k v -> let _ = MAP.put cassigns k v in ())  in
              (*ensure each assignment is acceptable*)
              let result = MAP.fold sln (fun id expr lst ->
                let res = solve_assign id expr cassigns other_rels other_goals in
                match res,lst with
                | (Some(goals),Some(rest)) -> Some(goals@rest)
                | (None,_) -> None
                | (_,None) -> None
              ) (Some psteps)
              in
              result
            in
            (*find one valid solution*)
            let result = List.fold_right ( fun sln curr ->
                let psln = try_sln sln in
                match psln with
                | Some(s) ->  psln
                | None -> curr
              ) sols None
            in
            result
          (*no solution: this entire solution doesn't apply*)
          | None -> None
        in
          res
      | None ->
        (*not bound locally.*)
        Some([SAddGoal(UFunction(id,expr))])
    in
    let proc k v rest =
      let res = solve_assign k v assigns other_rels other_goals in
      match res,rest with
      | (None,_) -> None
      | (Some(lst),Some(rest)) -> Some(lst @ rest)
      | _ -> None
    in
    (*
    All the add goals are new assignments. THerefore, let's weed out all the rels
    that exist in the goal list.
    *)
    let leftovers gls  =
      let asg = MAP.make () in
      let _ = List.iter (fun x ->
        match x with
          | SAddGoal(UFunction(id,expr)) -> let _ = MAP.put asg id expr in ()
          | _ -> ()
      ) gls
      in
      let rrels = List.filter (fun x -> (MAP.has asg (get_id x)) = false ) other_rels in
      let srrels = List.map (fun x ->  sub_rel x asg) rrels in
      if List.length srrels > 0 then
        [SAddNode(UnivLib.name2unodeid name,srrels)]
      else
        []
    in
    let final = MAP.fold assigns (fun k v r -> proc k v r ) (Some [])  in
    let res = match final with
    | Some(q) ->
      let l = leftovers q in
      let q = l @ q in
      let _ = Printf.printf "HAS SOLUTION\n" in
      let _ = List.iter (fun x -> Printf.printf "%s\n" (SearchLib.step2str x)) q in
      let _ = Printf.printf "\n" in
      (*this means that all mappings that are outputs have been resolved. We should compute the rest*)
      Some(q)
    | None ->  None
    in
    res




  let apply_node (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : int option =
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then None else
    (*let comp = HwLib.getcomp s.hw node.name in*)
    let inst_id = SlnLib.usecomp gtbl.sln node_id in
    (*update search algorithm to include the usage*)
    let _ = SearchLib.start gtbl.search in
    let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
    let goal_cursor = SearchLib.cursor gtbl.search in
    let comp_cursor : steps = SearchLib.commit gtbl.search in
    (*use node*)
    let _ = SearchLib.move_cursor s gtbl comp_cursor in
    (*
      this tries to find a set of solutions for the particular node. Each of these solutions is a branch.
    *)
    let add_sln (rls:urel set) (gl:goal) (r:urel) (assigns: (unid,unid ast) map)  =
      let _ = SearchLib.start gtbl.search in
      (*say you have attained the goal*)
      let ngoals = resolve_assigns s (node.name) inst_id r gl rls gtbl.goals assigns in
      match ngoals with
      | Some(sts) ->
        let _ = SearchLib.add_step gtbl.search (SRemoveGoal gl) in
        let _ = List.iter (fun x -> SearchLib.add_step gtbl.search x) sts in
        let cmp_cursor = SearchLib.commit gtbl.search in
        let _ = SearchLib.move_cursor s gtbl cmp_cursor in
        let _ = resolve_trivial s gtbl gtbl.goals in
        let _ = SearchLib.move_cursor s gtbl goal_cursor in
        true

      | None ->
        false
    in
    let apply_rel rel amt =
      let res : (unid,unid ast) map list option = unify_rels s node.name inst_id g rel in
      match res with
      | Some(assigns) ->
        let cnt = List.fold_right (fun asn cnt -> if add_sln node.rels g rel asn then cnt + 1 else cnt) assigns 0 in
        cnt+amt
      | None -> 0
    in
    let cnt = SET.fold node.rels apply_rel 0 in
    let _ = SearchLib.move_cursor s gtbl goal_cursor in
    if cnt = 0
      then
        let _ = SearchLib.rm gtbl.search comp_cursor in
        let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in
        None
      else
        let _ = SearchLib.deadend gtbl.search comp_cursor in
        Some(cnt)
        (*)
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
  *)

  (*apply all possible components*)
  let apply_nodes (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let comps = MAP.filter tbl.nodes (fun k v -> match k with UNoComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with UNoConcComp(_) -> true | _ -> false)  in
    let handle_node (id,x) status =
      let yielded_results = apply_node slvenv tbl g id x in
      match yielded_results with
      | Some(q) -> Some(q)
      | None -> status
    in
    let res = List.fold_right handle_node rels None  in
    let res = List.fold_right handle_node comps res  in
    (*mark goal as explored.*)
    let goal_cursor = SearchLib.cursor tbl.search in
    (*let _ = SearchLib.deadend tbl.search goal_cursor in*)
    (* failed to find any solutions.. *)
    if res = None then
      let _ =  SearchLib.deadend tbl.search goal_cursor in
      ()
    else ()


  let path_is_useless v n =
    let build_gl (x:step) (adds,reds) = match x with
      | SAddGoal(g) -> let gl = Shim.rel_glbl2lcl g in
        if is_trivial g = false then (gl::adds, reds) else (adds,reds)
      | SRemoveGoal(g) -> let gl = Shim.rel_glbl2lcl g in
        if is_trivial g = false then (adds, gl::reds) else (adds,reds)
      | _ -> (adds,reds)
    in
    let judge adds reds =
      let cycle_set = List.filter (fun q -> LIST.count adds q > 1) reds  in
      let red_set = List.filter (fun q -> LIST.count adds q > 1 ) reds  in
      let print set =
        let str = List.fold_right (fun x r -> r^(goal2str x)^"\n") set "" in
        Printf.printf "%s\n" str
      in
      match cycle_set,red_set with
      | [],[] -> false
      | _,[] ->
        let _ = print cycle_set in
        let _ = Printf.printf "cycle detected\n" in
        true
      | [],_ ->
        let _ = print red_set in
        let _ = Printf.printf "redundent pattern detected\n" in
        true
      | _,_ ->
        let _ = print cycle_set in
        let _ = Printf.printf "cycle detected\n" in
        let _ = print red_set in
        let _ = Printf.printf "redundent pattern detected\n" in
        true
    in
    let icgl = ([],[]) in
    let adds,reds  = SearchLib.fold_path v.search n build_gl icgl in
    judge adds reds

  let select_best_path (v:gltbl) (cnode:steps option) : steps option =
    let ngoals (s:steps) =
      SearchLib.fold_path v.search s (fun x r ->
        match x with
        | SAddGoal(_) -> r+.1.
        | SRemoveGoal(_) -> r-.1.
        | _ -> r+.0.1
        ) 0.
    in
    let score_path (s:steps) : float =
      let score = ngoals s in
      match cnode with
      | Some(n) ->
        if s = n && RAND.rand_norm() < 0.99 then
          100000.
        else score
      | None -> score
    in
    let paths = SearchLib.get_paths v.search in
    let _ = Printf.printf "# Paths Left: %d\n" (List.length paths) in
    match paths with
    | [] -> None
    | h::t ->
      let _,best = LIST.max (fun x -> score_path x) paths in
      Some(best)





  let rec get_next_path s v c =
    match select_best_path v c with
    | Some(p) ->
      let depth =  List.length (TREE.get_path v.search.paths p) in
      if depth >= s.max_depth
        then
          let _ = Printf.printf "hit max depth for path\n" in
          let _ = SearchLib.deadend v.search p in
          match c with
          |Some(q) ->
            if p = q then get_next_path s v None
            else get_next_path s v (Some q)
          | None ->
            get_next_path s v None
        else
          Some (p)
    | None ->
      let _ = Printf.printf "no valid paths left\n" in
      None


  let rec solve (_s:slvr ref) (v:gltbl) : spicedoc option=
    let s = REF.dr _s in
    (*find a goal to focus on*)
      (*menu handling methods*)

      (*apply the current step in the search algorithm*)
      (*choose a goal in the table*)
      let move_to_next c =
        match get_next_path s v c with
          | Some(p) ->
            let _ = SearchLib.move_cursor s v p in
            true
          | None ->
            false
      in
      let failed () =
        (*mark this path as visited*)
        let goal_cursor = SearchLib.cursor v.search in
        let _ = SearchLib.deadend v.search goal_cursor in
        let succ = move_to_next None in
        if succ = false
          then
            None
          else
            let res = solve _s v in
            let _ = SearchLib.rm v.search goal_cursor in
            res
      in
      let no_goals_left () =
        (*this solution is valid*)
        let _ = Printf.printf "SOLVER: Concretizing.\n" in
        if SlnLib.mkconn_cons s v.sln &&  SlnLib.usecomp_cons s v.sln then
          let mint,musr = mkmenu s v None in
          let _ = Printf.printf "SOLVER: Found valid solution.\n" in
          let _ = mint "s" in
          let v  = SpiceLib.to_spice s v.sln in
          Some v
        else
          failed ()
      in
      let solve_goal () =
        let goal_cursor = SearchLib.cursor v.search in
        (*is the connectivity consistent*)
        if SET.size v.goals = 0 then
          let res = no_goals_left() in
          res
        else
          (*check for repeated patterns*)
          if path_is_useless v goal_cursor then
            let mint,musr= mkmenu s v None in
            let _ = mint "g" in

            let _ = SearchLib.deadend v.search goal_cursor in
            let succ = move_to_next (None) in
            if succ = false then None else
              let res = solve _s v in
              res
          else
            let g = SET.rand v.goals in
            let mint,musr = mkmenu s v (Some g) in
            (*show goals and current solution*)
            let _ = mint "g" in
            (*let _ = mint "s" in*)
            let _ = mint "c" in
            let _ = apply_nodes s v g in
            let _ = musr () in
            let succ = move_to_next (Some goal_cursor) in
            (*if could not move to next, exit*)
            if succ = false then None else
              let res = solve _s v in
              res
      in
      let r = solve_goal () in
      r

end



let solve (hw:hwenv) (prob:menv) (out:string) (interactive:bool) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv  hw prob interactive in
  let tbl = SolveLib.mktbl sl in
  let _ = pr sl "===== Beginning Interactive Solver ======" in
  let spdoc = SolveLib.solve (REF.mk sl) (tbl) in
  match spdoc with
    | Some(sp) ->
    let _ = Printf.printf "===== Concretizing to Spice File ======\n" in
      let _ = IO.save out (SpiceLib.to_str sp) in
      let _ = Printf.printf "===== Solution Found ======\n" in
      ()
    | None ->
      error "solve" " no solution Found."
  ()
