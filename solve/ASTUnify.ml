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
  let state2buf (type a) chan (indent:int) (tostr:a->string) (st:a rvstate) =
    let prefix = "" in
    let _ = Printf.fprintf chan "%sfill:" prefix in
    let _ = SET.iter st.fill (fun x -> Printf.fprintf chan "<%s> " (tostr x)) in
    let _ = Printf.fprintf chan "\n%srm:" prefix in
    let _ = SET.iter st.rm (fun x -> Printf.fprintf chan "<%s> " (tostr x)) in
    let _ = match st.focus with
      | Some(v) -> Printf.fprintf chan "\n%sfocus: <%s>\n" prefix (tostr v)
      | None-> Printf.fprintf chan "\n%sfocus: (none)\n" prefix
    in
    ()


  let info2buf (type a) chan (indent:int) (tostr:a->string) (st:a rinfo) =
      let prefix = "" in
      ()

  let mkmenu (type a) (sr:a runify) =
    let menu_desc = "t=search-tree,s=state,i=info" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str sr.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let chan = stdout in
        let _ = Printf.fprintf chan "# TEMPL\n" in
        let _ = state2buf chan 1 sr.tostr sr.tbl.st.templ in
        let _ = Printf.fprintf chan "# TARG\n" in
        let _ = state2buf chan 1 sr.tostr sr.tbl.st.targ in
        ()
      else if STRING.startswith inp "i" then
        let chan = stdout in
        let _ = Printf.fprintf chan "# TEMPL\n" in
        let _ = info2buf chan 1 sr.tostr sr.tbl.templ in
        let _ = Printf.fprintf chan "# TARG\n" in
        let _ = info2buf chan 1 sr.tostr sr.tbl.targ in
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
  let g_templ_i s = s.templ
  let g_targ_i s = s.targ
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
    let _ = (st.focus <- Some v) in
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
      let _ = (st.focus <- None) in
      ()
  in
  s

  let order_steps a b = 0

  let score_steps env steps : sscore =
    let delta = 0. in
    let state = RAND.rand_norm () in
    {delta=delta; state=state}

  let unifytype2str u = match u with
  | UTypTempl -> "templ"
  | UTypTarg -> "targ"

  let step2str tostr a = match a with
  | RAddAssign(lhs,rhs) -> "+asgn "^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RBanAssign(lhs,rhs) -> "-asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RConcAssign(lhs,rhs) -> "*asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RVarRemove(v,ty) -> "-var <"^(tostr v)^"> of  {"^(unifytype2str ty)^"}"
  | RVarFill(v,ty) -> "#var <"^(tostr v)^"> of  {"^(unifytype2str ty)^"}"
  | RVarFocus(v,ty) -> "@var <"^(tostr v)^"> of {"^(unifytype2str ty)^"}"


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
      templ= tmpl_info;
      targ= targ_info;
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
        tostr=tostr;
      }
    in
    let root, _ = SearchLib.setroot search tbl [] in
    (root,strct)

  type 'a rnode = ('a rstep) snode
  (*apply the existing state to python, that is transform the expressions*)

  let apply_state (type a) (s: a runify) : ((a, a ast) map)*((a, a ast) map) =
    let _ = print_debug "applied state." in
    let _ = SymCaml.clear (g_sym s.tbl) in
    (*let _ = SymCaml.set_debug (g_sym s.tbl) true in*)
    let targ_repls : (a,a ast) map = MAP.make () in
    let templ_repls : (a,a ast) map = MAP.make () in
    let _ = SET.iter (g_targ_st s.tbl).fill ( fun x ->
      let _ = MAP.put targ_repls x (MAP.get (g_targ_i s.tbl).info x).rhs in ()
    ) in
    let _ = SET.iter (g_templ_st s.tbl).fill ( fun x ->
      let _ = MAP.put templ_repls x (MAP.get (g_templ_i s.tbl).info x).rhs in ()
    ) in
    let _ = MAP.iter (s.tbl.st.assigns) (fun v rhs -> let _ = MAP.put templ_repls v rhs in () ) in
    let fill_expr scr repls v =
      let rhs = MAP.get scr v in
      let rhs = ASTLib.sub rhs repls in
      let _ = MAP.put scr v rhs in
      (v,rhs)
    in
    let var2symvar = g_conv s.tbl in
    let expr2symexpr x : symexpr = ASTLib.to_symcaml x (g_conv s.tbl) in
    let add_wild (set:(symvar*(symexpr list)) set) (v:a) =
      let bans =
        if MAP.has (g_bans s.tbl) v then
          let bans = SET.map (MAP.get (g_bans s.tbl) v) (fun x -> ASTLib.sub x templ_repls) in
          bans
        else []
      in
      let symbans : symexpr list = List.map (fun (x) -> expr2symexpr x) bans in
      let _ = SET.add set (var2symvar v, symbans) in
      ()
    in
    let decl_wild v bans = let _ = SymCaml.define_wildcard (g_sym s.tbl) v bans in () in
    let add_sym (set:symvar set) (v:a) =
      let var2symvar = g_conv s.tbl in
      let _ = SET.add set (var2symvar v) in ()
    in
    let decl_sym v = let _ = SymCaml.define_symbol (g_sym s.tbl) v in () in
    let add_vars set (fn) lhs rhs =
      let _ = fn set lhs in
      let _ = List.iter (fun q -> fn set q) (ASTLib.get_vars rhs) in
      ()
    in
    let scratch_targ = MAP.make () and scratch_templ = MAP.make () in
    let sym_vars = SET.make_dflt () and wc_vars = SET.make_dflt () in
    let _ = MAP.iter (g_targ_i s.tbl).info
      (fun v data ->
        let _ = add_vars sym_vars add_sym v data.rhs in
        let _ = MAP.put scratch_targ v (data.rhs) in ()
      ) in
    let _ = MAP.iter (g_templ_i s.tbl).info
      (fun v data ->
        let _ = add_vars wc_vars add_wild v data.rhs in
        let _ = MAP.put scratch_templ v (data.rhs) in ()
      ) in
    let _ = SET.iter sym_vars (fun x -> decl_sym x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild x bans) in
    (*next process removals*)
    let _ = SET.iter (g_targ_st s.tbl).rm (fun v -> let _ = MAP.rm scratch_targ v in ()) in
    let _ = SET.iter (g_templ_st s.tbl).rm (fun v -> let _ = MAP.rm scratch_templ v in ()) in
    (*next process assignments*)
    let _ = MAP.iter scratch_templ (fun lhs rhs -> let _ = fill_expr scratch_templ templ_repls lhs in ()) in
    let _ = MAP.iter scratch_targ (fun lhs rhs -> let _ = fill_expr scratch_targ templ_repls lhs in ()) in
    (scratch_templ,scratch_targ)

  (*whether the unification is a value unification*)
  let unify_value (type a) (s:a runify) (ltempl:a) (rtempl:a ast) (ltarg: a) (rtarg: a ast)
  : (((a,a ast) map) option) option =
    let vtempl = ASTLib.compute rtempl in
    let vtarg = ASTLib.compute rtarg in
    match (vtempl,vtarg) with
    | (Some(x),Some(y)) ->
      if x = y then
        let empty = MAP.make() in
        Some(Some(empty))
      else
        Some(None)
    | _ -> None

  (*unify one expression with one target*)
  let unify_one (type a) (s:a runify) (ltempl:a) (rtempl:a ast) (ltarg: a) (rtarg:a ast) : (a,a ast) map option =
    let vl = unify_value s ltempl rtempl ltarg rtarg in
    (*determine if unification by value is something*)
    if vl <> None then
      let assigns = match OPTION.force_conc vl with
      | Some(assigns) -> Some(assigns)
      | None -> None
      in assigns
    (**)
    else
      let sym2a : symvar -> a = g_iconv s.tbl in
      let a2sym : a -> symvar = g_conv s.tbl in
      let rtempl = ASTLib.sub_one rtempl ltempl (Term ltarg) in (*bind any circular dependencies*)
      let _ = print_debug ("unify: "^(ASTLib.ast2str rtempl s.tostr)^" with "^(ASTLib.ast2str rtarg s.tostr)) in
      let symtempl : symexpr = ASTLib.to_symcaml rtempl a2sym in
      let symtarg : symexpr = ASTLib.to_symcaml rtarg a2sym in
      let maybe_assigns = SymCaml.pattern (g_sym s.tbl) symtarg symtempl in
      match maybe_assigns with
      | Some(assigns) ->
        let _ = print_debug "<!> found assigns" in
        let mp = MAP.make () in
        let _ = MAP.put mp ltempl (Term ltarg) in
        let _ = List.iter (fun ((l,r):symvar*symexpr) ->
          let al : a = sym2a l in
          let ar : a ast = ASTLib.from_symcaml r sym2a in
          let _ = print_debug (" assign: "^(s.tostr al)^"="^(ASTLib.ast2str ar s.tostr)) in
          let _ = MAP.put mp al ar in
          ()
        ) assigns
        in
        Some(mp)
      | None ->
        let _ = print_debug "no assigns found" in
        None


  let assigns2steps (type a) assigns (fn:a->a ast->(a rstep) option) : (a rstep) list =
    let stps = MAP.fold assigns (fun l r rest -> match fn l r with
      | Some(q) -> q::rest
      | None -> rest ) []
    in
    stps

  (*given the current context, find a mapping and add the enforcement rules.*)
  let solve_one (type a) (s:a runify)  (etmpl:(a,a ast) map) (etarg:(a,a ast) map)  (vtempl:a)  (vtarg:a)  =
    let mkstep4assign (l:a) (r:a ast) : (a rstep) option =
      Some (RAddAssign(l,r))
    in
    let _ = print_debug ((s.tostr vtempl)^" <-> "^(s.tostr vtarg)) in
    let rtempl = MAP.get etmpl vtempl in
    let rtarg = MAP.get etarg vtarg in
    let maybe_assigns = unify_one s vtempl rtempl vtarg rtarg in
    let result = match maybe_assigns with
    | Some(assigns) ->
      let _ = SearchLib.start s.search in
      let _ = SearchLib.add_step s.search (RAddAssign(vtempl,Term(vtarg))) in
      let _ = SearchLib.add_step s.search (RVarRemove(vtempl, UTypTempl)) in
      let _ = SearchLib.add_step s.search (RVarRemove(vtarg,UTypTarg)) in
      let _ = SearchLib.add_steps s.search (assigns2steps assigns mkstep4assign) in
      (*determine if this is a valid solution*)
      let node = SearchLib.commit s.search s.tbl in
      let _ = SearchLib.move_cursor s.search s.tbl node in
      let _ = SearchLib.solution s.search node in
      Some(node,assigns)
    (*no solution*)
    | None -> None
  in
    result


  (*don't ban anything*)
  let select_bans (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) =
    ()

  let solve_node (type a) (s:a runify) =
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let vtempl =OPTION.force_conc ((g_templ_st s.tbl).focus) in
    let vtarg =OPTION.force_conc ((g_targ_st s.tbl).focus) in
    match solve_one s templs targs vtempl vtarg with
    | Some(node,assigns) ->
      (*add a bunch of branches*)
      (*let _ = select_bans s node assigns in*)
      ()
    | None ->
      (*marks a deadend if there was no solution*)
      let _ = SearchLib.deadend s.search curs in
      ()

  let rec get_best_valid_node (type a) (sr:a runify) (root:(a rnode) option)  : (a rnode) option =
    let collate_score old_score score : float =
      score.state
    in
    let nnode =  SearchLib.select_best_node sr.search collate_score root in
    nnode

  let rec mark_if_invalid (type a) (sr:a runify) (node:a rnode) =
    let if_dead =
      if (g_targ_st sr.tbl).focus = None || (g_templ_st sr.tbl).focus = None then
        true
      else
        false
    in
    if if_dead then
        let _ = SearchLib.deadend sr.search node in ()
    else
        ()

  (*select the next node to solve*)
  let solve (type a) (sr:a runify) (root:a rnode)=
    let rec _solve () =
      let sysmenu,usrmenu = mkmenu sr in
      if SearchLib.is_exhausted sr.search (Some root) then
        ()
      else
        (*get the next node*)
        let maybe_next_node = get_best_valid_node sr (Some root) in
        if SearchLib.has_solution sr.search (Some root) then
         let _ = print_debug "[search_tree] Found Solution" in
         ()
        else
          match maybe_next_node with
          | Some(next_node) ->
              (*move to node*)
              let _ = usrmenu () in
              let _ = SearchLib.move_cursor sr.search sr.tbl next_node in
              let _ = mark_if_invalid sr next_node in
              let _ = if SearchLib.is_deadend sr.search next_node  = false then
                let _ = solve_node sr in
                ()
              in
              (*recursively solve teh next goal*)
              _solve ()
          (*No more subgoals*)
          | None ->  ()
    in
    _solve ()




  let build_tree (type a) (s:a runify) (root: a rnode) (gl: a option): unit =
    let sysmenu,usrmenu = mkmenu s in
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
    let nodes : (a rnode) list =
      match gl with
      | Some(varb) -> [focus_goal varb (MAP.get (g_targ_i s.tbl).info varb)]
      | None -> MAP.map (g_targ_i s.tbl).info (fun v data -> focus_goal v data)
    in
    let _ = List.iter (fun goal -> focus_comps goal) nodes in
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
  let multipattern (type a) (tmpl: (a rarg) list) (targ: (a rarg) list) (targvar:a) (cnv:a->symvar) (icnv:symvar -> a)  (tostr:a->string) =
    (*make the search tree*)
    let root,smeta = mksearch tmpl targ cnv icnv tostr in
    (*build a tree for the particular set of goals*)
    (*let _ = build_tree smeta root (Some targvar) in*)
    let _ = build_tree smeta root (None) in
    (*solve a thing*)
    let _ = solve smeta root in
    let _ = print_debug "=== Done with Relation Search ===" in
    let slns = get_slns smeta in
    slns

end
