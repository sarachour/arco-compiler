
open Util
open SymCaml
open Globals
open Interactive

open Search

open ASTUnifyData

open SolverData
open SolverSln
open SolverGoalTable
open SolverUtil

module ASTUnifier =
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
    let rec user_menu_handle () = menu (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle

  let step2str (type a) (st: a rstep) = match st with
  | _ -> "unimplemented"

  let apply_step (type a) (s:a rsearch) (st:a rstep) = match st with
  | RAddAssign(lhs,rhs) -> MAP.put s.tbl.st.assigns lhs rhs
  | RBanAssign(lhs,rhs) -> MAP.put s.tbl.st.bans lhs rhs
  | RRemoveTemplRel(v) -> SET.add s.tbl.st.templ.rm v
  | RRemoveTargetRel(v) -> SET.add s.tbl.st.targ.rm v
  | RFillInTargetVar(v) ->  SET.add s.tbl.st.targ.fill v
  | RFillInTemplVar(v) -> SET.add s.tbl.st.templ.fill v

  let unapply_step (type a) (s:a rsearch) (st:a rstep) = match st with
  | RAddAssign(lhs,rhs) -> MAP.rm s.tbl.st.assigns lhs
  | RBanAssign(lhs,rhs) -> if MAP.has s.tbl.st.bans lhs then
    SET.rm (MAP.get s.tbl.st.bans lhs) rhs
    else
      error "unapply_step" "cannot remove a non-existent ban"
  | RRemoveTemplRel(v) -> SET.rm s.tbl.st.templ.rm v
  | RRemoveTargetRel(v) -> SET.rm s.tbl.st.targ.rm v
  | RFillInTargetVar(v) ->  SET.rm s.tbl.st.targ.fill v
  | RFillInTemplVar(v) -> SET.rm s.tbl.st.templ.fill v

  let order_steps a b = 0

  let step2str a = ""

  let mksearch (type a) (templs_e: (relinfo) list) (targ_e: (relinfo) list)  (cnv:a->symvar) (icnv:symvar -> a) (decl:a->bool->(a->symvar)->symdecl)  (tostr:a->string) =
    (*make the data for each variable*)
    let mkdata dps dct v relinfo =
      let rhs,lhs,typ,knd = relinfo in
      let  _ = add_deps dps lhs rhs in
      let data = {
        rhs = rhs;
        kind = knd;
        typ = typ;
      } in
      MAP.put dct lhs data
    in
    (*create environment*)
    let state = {
      assigns = MAP.make ();
      bans = MAP.make ();
      (*fill in target and templ*)
      targ_fill = SET.make_dflt ();
      templ_fill = SET.make_dflt ();
      targ_rm = SET.make_dflt ();
      templ_rm = SET.make_dflt ();
    } in
    (*make the environment*)
    let env = SymCaml.init() in
    let _ = SymCaml.clear env in
    let env = {
      s= env;
      cnv= cnv
      icnv= icnv;
    } in
    (*make the dependency tree*)
    let tmpldeps = mk_dep_graph [] tostr in
    let targdeps = mk_dep_graph [] tostr in
    let tmpls = MAP.make () in
    let targs = MAP.make () in
    let _ = List.iter (fun x -> mkdata templdeps tmpls x) templs_e in
    let _ = List.iter (fun x -> mkdata targdeps targs x) targs_e in
    (*make the search tree*)
    let tree = GRAPH.make () in
    let tbl = {
      templs= templs;
      targs= targs;
      templ_deps= templdeps;
      targ_deps = targdeps;
      (*template to rel assignments*)
      st = state;
    } in
    (*make search object*)
    let search = SearchLib.mksearch apply_step unapply_step order_step step2str in
    (**)
    search

  (*apply the existing state to python, that is transform the expressions*)
  let apply_state (type a) (s: a rsearch) : (a, a ast) map=
    let scratch_targ = MAP.make () in
    let scratch_templ = MAP.make () in
    (*process the expression to be properly concretized*)
    let proc_expr (rels: (a,a rdata) map) (st:rvstate) (v:a) (x:a ast) : a*(a ast) =
      (*make the replacement thing *)
      let repls = MAP.copy s.assigns in
      (*fill in any relations *)
      let _ = MAP.iter rels (fun v dat ->
        if SET.has st.fill v then
          let _ = MAP.put repls v dat.rhs in ()
        else ()
      ) in
      (*substitute any already defined expressions*)
      let _ = MAP.rm repls v in
      let x = sub x repls in
      (v,x)
    in

    let cexpr x : symexpr = to_symcaml x s.env.conv in
    let cvar x : symvar = s.env.cnv x in
    let decl_wild v =
      let bans = if MAP.has s.tbl.st.bans v then
        SET.map (MAP.get s.tbl.st.bans v) (fun x -> cexpr (proc_expr s.tbl.templs s.tbl.st.templ x))
        else []
      in
      let _ = SymCaml.define_wildcard env (cvar v) bans in
      ()
    in
    let decl_sym v =
      let _ = SymCaml.define_symbol env (cvar v) in
      ()
    in
    scratch
  (*)
    let match_trivial e1 e2 =
      match (compute e1,compute e2) with
      | (Some(x),Some(y)) ->
        if x = y then
          (*make a single solution of empty assignments*)
          let empty = MAP.make () in
          Some(Some([empty]))
        else Some(None)
      | (_,Some(x)) -> Some(None)
      | _ -> None
    in
  *)
  (*whether the unification is a value unification*)
  let unify_value (type a) (s:rsearch) (ltempl:a) (rtempl:a a st) (ltarg: a) (rtarg: a ast)
  : (((a,ast) map) option) option =
    let vtempl = AST.compute rtempl in
    let vtarg = AST.compute rtarg in
    match compute(vtempl,vtarg) with
    | (Some(x),Some(y)) ->
      if x = y then
        let empty = MAP.make() in
        Some(Some([empty]))
      else
        Some(None)
    | _ -> None

  (*unify one expression with one target*)
  let unify_one (type a) (s:rsearch) (ltempl:a) (rtempl:a ast) (ltarg: a) (rtarg:a ast) =
    let vl = unify_value s ltempl rtempl ltarg rtarg in
    (*determine if unification by value is something*)
    if vl <> None then
      let assigns = match OPTION.force_conc vl with
      | Some(assigns) -> Some(assigns)
      | None -> None
      in assigns
    (**)
    else
      let symtempl : symexpr = AST.to_symcaml rtempl in
      let symtarg : symexpr = AST.to_symcaml rtarg in
      let maybe_assigns = SymCaml.pattern s.env rtempl rtarg in
      match maybe_assigns with
      | Some(assigns) ->
        let steps = MAP.fold assigns (fun l r rest ->
          let al = AST.from_symcaml l in
          let ar = AST.from_symcaml r in
          RAddAssign(al,ar)::rest
        ) [RAddAssign(templ,Term(targ))]
        in
        Some(steps)
      | None ->
        None


  (*given the state, determine if it is consistent. If it's consistent, return the set of
  steps required *)
  let add_constraints (type a) (s:rsearch) (exprs:(a,a ast) map) (assigns:(a,a ast) map)=
    (*ensure the solutions are consistent*)
    let proc_assign (hlhs:a) (arhs:a ast) =
      if MAP.has exprs hlhs then
        (*enforce any hardware ids that are part of it*)
        [REnforceAssign(hlhs,arhs)]
      else
        []
    in
    let fold_assign (hlhs:a) (arhs:a ast) (mrest:(rstep list)) :((rstep list)) =
      let msteps = proc_assign hlhs arhs in
      msteps @ mrest
    in
    let steps = MAP.fold assigns fold_assign [] in
    match steps with
    | [] -> None
    | h::t -> Some(h::t)


  (*given the current context, find a mapping and add the enforcement rules.*)
  let solve_one (type a) (s:rsearch)  (exprs:(a,ast) map) (vtempl:a) (rtempl:a ast) (vtarg:a) (rtarg:a ast) =
    let maybe_assigns = unify_one s vtarg rtempl vtempl rtarg in
    let result = match maybe_assigns with
    | Some(assigns) ->
      let assign_lhs = RAddAssign(vtempl,Term(vtarg)) in
      let rm_templ = RRemoveTemplRel(vtempl) in
      let rm_targ = RRemoveTargRel(vtarg) in
      let steps = rm_templ::rm_targ::assign_lhs::assigns in
      let _ = SearchLib.start s.search in
      let _ = SearchLib.add_steps s.search steps in
      (*determine if this is a valid solution*)
      let constraints =  add_constraints s exprs assigns in
      let node = match constraints with
        | Some(constraints) ->
          (*create the node*)
          let _ = SearchLib.add_steps s.search constraints in
          let node = SearchLib.commit s.search s in
          let _ = SearchLib.move_cursor s.search s node in
          node
        | None ->
          let node = SearchLib.commit s.search s in
          let _ = SearchLib.move_cursor s.search s node in
          let _ = SearchLib.solution s.search node in
          node
      in
        Some(node,assigns)
    (*no solution*)
    | None -> None
  in
    result

  let select_targ s targs =
    let k,v = MAP.random targs in
    k

  let select_templ s templs =
    let k,v = MAP.random templs in
    k


  let select_vars (type a) (s:search) (templs:(a,ast) map) (targs:(a,ast) map) =
    (*if there are constraints we're enforcing, handle them first*)
    if MAP.empty s.st.enforce = false then
      let hlhs,trhs = MAP.random s.st.enforce in
      let hrhs = MAP.get exprs hlhs in
      (hlhs,hrhs,hlhs,rhs)
    (*if there are no constraints we're enforcing select the target and template goal*)
    else
      let vtarg = select_targ s targs in
      let vtempl = select_templ templs in
      let rtempl : a ast = MAP.get exprs vtempl in
      let rtarg : a ast = MAP.get exprs vtarg in
      (vtempl,rtempl,vtarg,rtarg)

  (*don't ban anything*)
  let select_bans (type a) (s:search) (n:rstep node) (assigns:(a,ast) map) =
    ()

  let solve_node (type a) (s:rsearch) (templvar:a) =
    let templs,targs = apply_state s in
    let vtempl,vtarg = select_vars s templs targs templvar in
    let curs = SearchLib.cursor s.search in
    match solve_one s exprs vtempl vtarg with
    | Some(node,assigns) ->
      (*add a bunch of branches*)
      let _ = select_restictions s node assigns in
      ()
    | None ->
      (*marks a deadend if there was no solution*)
      let _ = SearchLib.deadend s.search curs in
      ()


  let rec get_best_valid_node (s:slvr) (v:gltbl) (root:(sstep snode) option)  : (sstep snode) option =
    let collate_score old_score score : float =
      score.state
    in
    let nnode =  SearchLib.select_best_node v.search collate_score root in
    nnode


  (*select the next node to solve*)
  let rec solve (type a) (sr:rsearch) (n:node)=
    if SearchLib.is_exhausted sr.search (Some root) then
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
            let _ = SearchLib.move_cursor v.search sr next_node in
            let next_goal = get_best_valid_goal v in
            (*solves the goal*)
            let _ = solve_node sr next_goal in
            (*recursively solve teh next goal*)
            solve sr root
        (*No more subgoals*)
        | None ->  ()





  (*given colored set of equations, match them*)
  let multipattern (type a) (tmpl: (relinfo) list) (targ: (relinfo) list)  (cnv:a->symvar) (icnv:symvar -> a) (decl:a->bool->(a->symvar)->symdecl)  (tostr:a->string) =
    (*make the search tree*)
    let _ = mksearch tmpl targ cnv icnv decl tostr in
    ()

end
