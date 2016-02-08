open SymCamlData
open SymCaml

open Util
open Globals
open Interactive

open SearchData
open Search

open AST
open ASTUnifyData

open SolverData
open SolverSln
open SolverGoalTable
open SolverUtil


exception ASTUnifierException of (string)
let error n msg = raise (ASTUnifierException(n^": "^msg))


module ASTUnifier =
struct
  let mkmenu (type a) (sr:a runify) =
    let menu_desc = "t=search-tree" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str sr.search) in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = menu "ast-unify" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle



  let g_bans s = s.st.bans
  let g_assigns s = s.st.assigns
  let g_templ_st s = s.st.templ
  let g_targ_st s = s.st.targ
  let g_templ_i s = s.templs
  let g_targ_i s = s.targs
  let g_state s ty =
    if UTypTempl = ty then (g_templ_st s) else (g_targ_st s)

  let g_info s ty =
    if UTypTempl = ty then (g_templ_i s) else (g_targ_i s)

  let g_sym s = s.env.s
  let g_conv s = s.env.cnv
  let g_iconv s = s.env.icnv
  let g_search s = s.search

  let ret x r = let _ = x in r

  let add_ban (type a) (s:a rtbl) (lhs:a) (rhs:a ast) =
    let bans = (g_bans s) in
    let _ = if MAP.has bans lhs = false then
      let _ = MAP.put bans lhs (SET.make_dflt ()) in () else ()
    in
    let bans = MAP.get bans lhs in
    let _ = SET.add bans rhs in
    ()

  let rm_ban (type a) (s:a rtbl) (lhs:a) (rhs:a ast) =
    let bans = (g_bans s) in
    if MAP.has bans lhs = false then
      error "unapply_step" "cannot remove a non-existent ban"
    else
      let bans = MAP.get bans lhs in
      let _ = SET.rm bans rhs in
      ()

  let apply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
  | RAddAssign(lhs,rhs) -> ()
  | RBanAssign(lhs,rhs) -> ret (add_ban s lhs rhs) ()
  | RConcAssign(lhs,rhs) -> ret (MAP.rm (g_assigns s) lhs) ()
  | RVarRemove(v,ty) -> let st = g_state s ty in
    ret (SET.add st.rm v) ()
  | RVarFill(v,ty) -> let st = g_state s ty in
    ret (SET.add st.fill v) ()
  | RVarFocus(v,ty) -> let st = g_state s ty in
    let _ = (st.focus <= Some v) in
    ()
  in
  s

  let unapply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
    | RAddAssign(lhs,rhs) -> ()
    | RBanAssign(lhs,rhs) -> ret (rm_ban s lhs rhs) ()
    | RConcAssign(lhs,rhs) -> ret (MAP.rm (g_assigns s) lhs) ()
    | RVarRemove(v,ty) -> let st = g_state s ty in
      ret (SET.rm st.rm v) ()
    | RVarFill(v,ty) -> let st = g_state s ty in
      ret (SET.rm st.fill v) ()
    | RVarFocus(v,ty) -> let st = g_state s ty in
      let _ = (st.focus <= None) in
      ()
  in
  s

  let order_steps a b = 0

  let score_steps env steps : sscore =
    let delta = 0. in
    let state = 0. in
    {delta=delta; state=state}

  let unifytype2str u = match u with
  | UTypTempl -> "templ"
  | UTypTarg -> "targ"

  let step2str tostr a = match a with
  | RAddAssign(lhs,rhs) -> "+asgn "^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RBanAssign(lhs,rhs) -> "-asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RConcAssign(lhs,rhs) -> "*asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RVarRemove(v,ty) -> "-var <"^(tostr v)^"> of kind "^(unifytype2str ty)
  | RVarFill(v,ty) -> "#var <"^(tostr v)^"> of kind "^(unifytype2str ty)
  | RVarFocus(v,ty) -> "@var <"^(tostr v)^"> of kind "^(unifytype2str ty)


  let mksearch (type a) (templs_e: (a rarg) list) (targs_e: (a rarg) list)  (cnv:a->symvar) (icnv:symvar -> a) (tostr:a->string) : ((a rstep) snode)*(a runify) =
    (*make the data for each variable*)
    let mkdata ifo relinfo =
      let lhs,rhs,knd = relinfo in
      let  _ = ASTLib.add_deps ifo.deps lhs rhs in
      let data = {
        rhs = rhs;
        kind = knd;
      } in
      let _ = MAP.put ifo.info lhs data in
      ()
    in
    let mkstate () : a rvstate =
      {fill=SET.make_dflt(); rm=SET.make_dflt(); focus=None}
    in
    let mkinfo () : a rinfo =
      {deps=ASTLib.mk_dep_graph [] tostr; info=MAP.make ()}
    in
    (*create environment*)
    let state = {
      assigns = MAP.make ();
      bans = MAP.make ();
      (*fill in target and templ*)
      targ =mkstate ();
      templ = mkstate ();
    } in
    (*make the environment*)
    let s = SymCaml.init() in
    let _ = SymCaml.clear s in
    let env = {
      s=s;
      cnv= cnv;
      icnv= icnv;
    } in
    (*make the dependency tree*)
    let tmpl_info =  mkinfo() in
    let targ_info = mkinfo() in
    let _ = List.iter  (fun x -> mkdata tmpl_info x) templs_e in
    let _ = List.iter  (fun x -> mkdata targ_info x) targs_e in
    (*make the search tree*)
    let tree = GRAPH.make (fun x y -> x = y) in
    let tbl = {
      templs= tmpl_info;
      targs= targ_info;
      st = state;
      env = env;
    } in
    (*make search object*)
    let search : (a rstep, a rtbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_steps score_steps (step2str tostr)
    in
    let strct: a runify = {
        search=search;
        tbl=tbl;
      }
    in
    let root, _ = SearchLib.setroot search tbl [] in
    (root,strct)

  (*apply the existing state to python, that is transform the expressions*)
  (*)
  let apply_state (type a) (s: a runify) : ((a, a ast) map)*((a, a ast) map) =
    let scratch_targ = MAP.make () in
    let scratch_templ = MAP.make () in
    (*process the expression to be properly concretized*)
    let proc_expr (rels: (a,a rdata) map) (st:a rvstate) (v:a) (x:a ast) : a*(a ast) =
      (*make the replacement thing *)
      let repls = MAP.copy (g_assigns s) in
      (*fill in any relations *)
      let _ = MAP.iter rels (fun v dat ->
        if SET.has st.fill v then
          let _ = MAP.put repls v dat.rhs in ()
        else ()
      ) in
      (*substitute any already defined expressions*)
      let _ = MAP.rm repls v in
      let x = ASTLib.sub x repls in
      (v,x)
    in

    let expr2symexpr x : symexpr = ASTLib.to_symcaml x (g_conv s) in
    let var2symvar x : symvar = s.env.cnv x in
    let decl_wild v =
      let bans = if MAP.has (g_bans s) v then
        let bans : (a ast) set = MAP.get (g_bans s) v in
        let bans : (a ast) list =
          SET.map bans (fun x ->
            let lhs,rhs = proc_expr (g_templ_i s).info (g_templ_st s) v x in
            rhs
          )
        in
          bans
        else []
      in
      let symbans : symexpr list = List.map (fun x -> expr2symexpr x) bans in
      let _ = SymCaml.define_wildcard (g_sym s) (var2symvar v) symbans in
      ()
    in
    let decl_sym v =
      let _ = SymCaml.define_symbol (g_sym s) (var2symvar v) in
      ()
    in
    (scratch_targ,scratch_templ)

  (*whether the unification is a value unification*)
  let unify_value (type a) (s:runify) (ltempl:a) (rtempl:a a st) (ltarg: a) (rtarg: a ast)
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
  let unify_one (type a) (s:runify) (ltempl:a) (rtempl:a ast) (ltarg: a) (rtarg:a ast) =
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
  let add_constraints (type a) (s:runify) (exprs:(a,a ast) map) (assigns:(a,a ast) map)=
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
  let solve_one (type a) (s:runify)  (exprs:(a,ast) map) (vtempl:a) (rtempl:a ast) (vtarg:a) (rtarg:a ast) =
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

  let solve_node (type a) (s:runify) (templvar:a) =
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
  let rec solve (type a) (sr:runify) (n:node)=
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




  *)
  type 'a rnode = ('a rstep) snode
  let build_tree (type a) (s:a runify) (root: a rnode) : unit =
    let sysmenu,usrmenu = mkmenu s in
    let _ = usrmenu () in
    let focus_goal x data =
      let _ = SearchLib.start s.search in
      let _ = SearchLib.add_step s.search (RVarFocus(x,UTypTarg)) in
      let node = SearchLib.commit s.search s.tbl in
      node
    in
    let focus_comp (gnode:a rnode) (cmpvar:a) (cmpdata:a rdata) =
      let _ = SearchLib.move_cursor s.search s.tbl gnode in
      let focv : a = OPTION.force_conc (g_targ_st s.tbl).focus in
      let focvdata : a rdata = MAP.get (g_targ_i s.tbl).info focv in
      if cmpdata.kind = focvdata.kind then
        let _ = SearchLib.start s.search in
        let _ = SearchLib.add_step s.search (RVarFocus(cmpvar,UTypTempl)) in
        let node = SearchLib.commit s.search s.tbl in
        ()
    in
    let focus_comps gnode =
      MAP.iter (g_templ_i s.tbl).info (fun v data -> focus_comp gnode v data)
    in
    (*focus on each of the templs, and rels - where they're compatible*)
    let nodes : (a rnode) list = MAP.map (g_targ_i s.tbl).info (fun v data -> focus_goal v data) in
    let _ = usrmenu() in
    let _ = List.iter (fun goal -> focus_comps goal) nodes in
    let _ = usrmenu() in
    ()

  let get_slns (type a) (s:a runify) : a fusion set =
    let env2fuses (s:a runify) : (a fuse) list = []
    in
    let step2fuse (s: a rstep) : (a fuse) list = []
    in
    let steps2fuses (s:(a rstep) list) : (a fuse) list = []
    in
    let node2fusion (node: (a rstep) snode) : a fusion =
        let _ = SearchLib.move_cursor s.search s.tbl node in
        let fsn = SET.make_dflt () in
        let _ = SET.add_all fsn (env2fuses s) in
        let _ = SET.add_all fsn (steps2fuses node.s) in
        let fsns : a fusion = SET.to_list fsn in
        fsns

    in
    let slns  = SearchLib.get_solutions s.search None in
    let allslns = List.map (fun n -> node2fusion n) slns in
    SET.from_list allslns

  (*given colored set of equations, match them*)
  let multipattern (type a) (tmpl: (a rarg) list) (targ: (a rarg) list)  (cnv:a->symvar) (icnv:symvar -> a)  (tostr:a->string) =
    (*make the search tree*)
    let root,smeta = mksearch tmpl targ cnv icnv tostr in
    let _ = build_tree smeta root in
    let slns = get_slns smeta in
    slns

end
