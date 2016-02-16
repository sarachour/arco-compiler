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

let auni_print_debug = print_debug 2
let auni_menu = menu 2

module ASTUnifier =
struct
  let state2buf (type a) chan (indent:int) (tostr:a->string) (st:a rvstate) =
    let prefix = STRING.repeat " " indent in
    let _ = Printf.fprintf chan "%sfill:" prefix in
    let _ = SET.iter st.fill (fun x -> Printf.fprintf chan "<%s> " (tostr x)) in
    let _ = Printf.fprintf chan "\n%srm:" prefix in
    let _ = SET.iter st.rm (fun x -> Printf.fprintf chan "<%s> " (tostr x)) in
    let _ = Printf.fprintf chan "\n%sfocus: <%s>\n" prefix (STACK.tostr st.focus (tostr))  in
    ()


  let info2buf (type a) chan (indent:int) (tostr:a->string) (st:a rinfo) =
      let prefix = "" in
      ()

  let mkmenu (type a) (sr:a runify) =
    let menu_desc = "t=search-tree,x=state,i=info" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str sr.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "x" then
        let chan = stdout in
        let _ = Printf.fprintf chan "# TEMPL\n" in
        let _ = state2buf chan 1 sr.tbl.tostr sr.tbl.st.templ in
        let _ = Printf.fprintf chan "# TARG\n" in
        let _ = state2buf chan 1 sr.tbl.tostr sr.tbl.st.targ in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "i" then
        let chan = stdout in
        let _ = Printf.fprintf chan "# TEMPL\n" in
        let _ = info2buf chan 1 sr.tbl.tostr sr.tbl.templ in
        let _ = Printf.fprintf chan "# TARG\n" in
        let _ = info2buf chan 1 sr.tbl.tostr sr.tbl.targ in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = auni_menu "ast-unify" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle



  let g_bans s = s.st.bans
  let g_assigns s = s.st.assigns

  let g_state s ty =
    if UTypTempl = ty then (s.st.templ) else (s.st.targ)

  let g_info s ty =
    if UTypTempl = ty then (s.templ) else (s.targ)

  let g_cstr x = x.st.constraints
  let g_fresh s = s.env.freshvar
  let g_sym s = s.env.s
  let g_conv s = s.env.cnv
  let g_iconv s = s.env.icnv
  let g_search s = s.search

  let ret (type a) (type b) (x:a) (r:b) = let _ = x in r




  let unifytype2str u = match u with
  | UTypTempl -> "templ"
  | UTypTarg -> "targ"

  let step2str tostr a = match a with
  | RAddAssign(lhs,rhs) -> "+asgn "^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RBanAssign(lhs,rhs) -> "-asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RForceAssign(templ,targ) -> "force "^(tostr templ)^" == "^(tostr targ)
  | RResolveAssign(templ,targ) -> "rslv "^(tostr templ)^" == "^(tostr targ)
  | RVarRemove(v,ty) -> "-var <"^(tostr v)^"> of  {"^(unifytype2str ty)^"}"
  | RVarFill(v,ty) -> "#var <"^(tostr v)^"> of  {"^(unifytype2str ty)^"}"
  | RVarFocus(v,ty) -> "@var <"^(tostr v)^"> of {"^(unifytype2str ty)^"}"
  | RVarAdd(v,rhs,ty) -> "+var "^(tostr v)^"="^(ASTLib.ast2str rhs tostr)^"> of {"^(unifytype2str ty)^"}"

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
  | RAddAssign(lhs,rhs) -> ret (MAP.put s.st.assigns lhs rhs) ()
  | RBanAssign(lhs,rhs) -> ret (add_ban s lhs rhs) ()
  | RForceAssign(templ,targ) -> ret (MAP.put s.st.constraints templ targ) ()
  | RResolveAssign(templ,targ) ->
    if MAP.get s.st.constraints templ = targ then
      ret (MAP.rm s.st.constraints templ) ()
    else
      error "apply_step" "impossible to resolve non-existant expression"
  | RVarRemove(v,ty) -> let st = g_state s ty in
    ret (SET.add st.rm v) ()
  | RVarFill(v,ty) -> let st = g_state s ty in
    ret (SET.add st.fill v) ()
  | RVarAdd(v,rhs,ty) -> let st = g_state s ty in
    ret (MAP.put st.add v rhs) ()
  | RVarFocus(v,ty) -> let st = g_state s ty in
    ret (STACK.push st.focus v) ()
  in
  s

  let unapply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
    | RAddAssign(lhs,rhs) -> ret (MAP.rm s.st.assigns lhs) ()
    | RBanAssign(lhs,rhs) -> ret (rm_ban s lhs rhs) ()
    | RForceAssign(templ,targ) ->
      if MAP.get s.st.constraints templ = targ then
        ret (MAP.rm s.st.constraints templ) ()
      else
        error "apply_step" "impossible to resolve non-existant expression"
    | RResolveAssign(templ,targ) ->  ret (MAP.put s.st.constraints templ targ) ()
    | RVarRemove(v,ty) -> let st = g_state s ty in
      ret (SET.rm st.rm v) ()
    | RVarFill(v,ty) -> let st = g_state s ty in
      ret (SET.rm st.fill v) ()
    | RVarAdd(v,rhs,ty) -> let st = g_state s ty in
      ret (MAP.rm st.add v) ()
    | RVarFocus(v,ty) -> let st = g_state s ty in
      let top = STACK.peek st.focus in
      if top = v then
        ret (STACK.pop st.focus) ()
      else
        error "unapply_step" ("inconsistent focus for stack <"^(unifytype2str ty)^"> = "^(s.tostr v)^" <> "^(s.tostr top))
  in
  s

  (*add variables first*)
  let order_steps a b = match (a,b) with
  | (RVarRemove(_),_) -> -1
  | (_,RVarRemove(_)) -> 1
  | (RVarAdd(_),_) -> 1
  | (_,RVarAdd(_)) -> -1
  | _ -> 0


  let score_steps env steps : sscore =
    let delta = 0. in
    let state = 0. in
    {delta=delta; state=state}



  let mksearch (type a) (templs_e: (a rarg) list) (targs_e: (a rarg) list)
    (cnv:a->symvar) (icnv:symvar -> a) (freshvar:int->unifytype->a) (tostr:a->string) : ((a rstep) snode)*(a runify) =
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
      {fill=SET.make_dflt(); rm=SET.make_dflt(); add=MAP.make(); focus=STACK.make()}
    in
    let mkinfo () : a rinfo =
      {deps=ASTLib.mk_dep_graph [] tostr; info=MAP.make ()}
    in
    (*create environment*)
    let state = {
      assigns = MAP.make ();
      bans = MAP.make ();
      constraints = MAP.make ();
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
      freshvar = freshvar;
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
      tostr=tostr;
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

  type 'a rnode = ('a rstep) snode
  (*apply the existing state to python, that is transform the expressions*)

  let apply_state (type a) (s: a runify) : ((a, a ast) map)*((a, a ast) map) =
    let _ = auni_print_debug "ENV == STATE ===" in
    let _ = SymCaml.clear (g_sym s.tbl) in
    (*let _ = SymCaml.set_debug (g_sym s.tbl) true in*)
    (*create replacement tables*)
    let targ_repls : (a,a ast) map = MAP.make () in
    let templ_repls : (a,a ast) map = MAP.make () in
    let fill_t ty = SET.iter (g_state s.tbl ty).fill ( fun x ->
      let _ = auni_print_debug ("ENV fill  "^(s.tbl.tostr x)^" : "^(unifytype2str ty)) in
      if MAP.has (g_info s.tbl ty).info x  = false then
        ret (auni_print_debug ("ENV ignore fill, already satisifed")) ()
      else
        ret (MAP.put targ_repls x (MAP.get (g_info s.tbl ty).info x).rhs) ()
    )
    in
    let _ = fill_t UTypTempl in
    let _ = fill_t UTypTarg in
    let _ = MAP.iter (s.tbl.st.assigns) (fun v rhs -> let _ = MAP.put templ_repls v rhs in () ) in
    (*add fill logic *)
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
          let bans = SET.map (MAP.get (g_bans s.tbl) v) (fun x ->
            let nx = ASTLib.sub x templ_repls in
            let _ = auni_print_debug ("ENV ban: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str nx s.tbl.tostr)^"") in
            nx
          ) in
          bans
        else []
      in
      let symbans : symexpr list = List.map (fun (x) -> expr2symexpr x) bans in
      let _ = if SET.has set (var2symvar v,symbans) = false then
        ret (SET.add set (var2symvar v, symbans)) () in
      ()
    in
    let decl_wild v bans = let _ = SymCaml.define_wildcard (g_sym s.tbl) v bans in () in
    let add_sym (set:symvar set) (v:a) =
      let var2symvar = g_conv s.tbl in
      let _ = if SET.has set (var2symvar v) = false then ret (SET.add set (var2symvar v)) () in ()
    in
    let decl_sym v = let _ = SymCaml.define_symbol (g_sym s.tbl) v in () in
    (*actual conversion routine*)
    let scratch_targ = MAP.make () and scratch_templ = MAP.make () in
    let sym_vars = SET.make_dflt () and wc_vars = SET.make_dflt () in
    let add_vars lhs (rhs:a ast) (iswc:bool)=
      let addvar q = if iswc
        then add_wild wc_vars q
        else add_sym sym_vars q
      in
      let _ = addvar lhs in
      let _ = List.iter (fun q -> addvar q) (ASTLib.get_vars rhs) in
      ()
    in
    let add_expr scratch v rhs (iswc:bool) (addvars:bool)=
      let _ = if addvars then add_vars v rhs iswc else () in
      let _ = MAP.put scratch v (rhs) in
      let _ = auni_print_debug ("ENV add: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str rhs s.tbl.tostr)^"") in
      ()
    in
    let rm_expr scratch v =
      let _ = MAP.rm scratch_targ v in
      let _ = auni_print_debug ("ENV remove "^(s.tbl.tostr v)) in
      ()
    in
    (*add original variables*)
    let _ = MAP.iter (g_info s.tbl UTypTarg).info (fun v data ->add_expr scratch_targ v data.rhs false true) in
    let _ = MAP.iter (g_info s.tbl UTypTempl).info (fun v data ->add_expr scratch_templ v data.rhs true true) in
    (*add additional variables*)
    let _ = MAP.iter (g_state s.tbl UTypTarg).add (fun v rhs ->add_expr scratch_targ v rhs false true) in
    let _ = MAP.iter (g_state s.tbl UTypTempl).add (fun v rhs ->add_expr scratch_templ v rhs true true) in
    (*declare variables*)
    let _ = SET.iter sym_vars (fun x -> decl_sym x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild x bans) in
    (*next process assignments*)
    let _ = MAP.iter scratch_templ (fun lhs rhs -> let _ = fill_expr scratch_templ templ_repls lhs in ()) in
    let _ = MAP.iter scratch_targ (fun lhs rhs -> let _ = fill_expr scratch_targ templ_repls lhs in ()) in
    (*next process removals*)
    let _ = SET.iter (g_state s.tbl UTypTarg).rm (fun v ->rm_expr scratch_targ v) in
    let _ = SET.iter (g_state s.tbl UTypTempl).rm (fun v -> rm_expr scratch_targ v) in
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
    | (Some(x),None) -> Some(None)
    (*TODO: Simplificaiton. Technically you can sub constants.*)
    | (None,Some(x)) -> Some(None)
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
      let _ = auni_print_debug ("#unify\n  templ: "^(ASTLib.ast2str rtempl s.tbl.tostr)^"\n  targ"^(ASTLib.ast2str rtarg s.tbl.tostr)^"\n") in
      let symtempl : symexpr = ASTLib.to_symcaml rtempl a2sym in
      let symtarg : symexpr = ASTLib.to_symcaml rtarg a2sym in
      let maybe_assigns = SymCaml.pattern (g_sym s.tbl) symtarg symtempl in
      match maybe_assigns with
      | Some(assigns) ->
        let _ = auni_print_debug "<!> found assigns" in
        let mp = MAP.make () in
        let _ = MAP.put mp ltempl (Term ltarg) in
        let _ = List.iter (fun ((l,r):symvar*symexpr) ->
          let al : a = sym2a l in
          let ar : a ast = ASTLib.from_symcaml r sym2a in
          let _ = auni_print_debug (" assign: "^(s.tbl.tostr al)^"="^(ASTLib.ast2str ar s.tbl.tostr)) in
          let _ = MAP.put mp al ar in
          ()
        ) assigns
        in
        Some(mp)
      | None ->
        let _ = auni_print_debug "no assigns found" in
        None


  let assigns2steps (type a) assigns (fn:a->a ast->(a rstep) option) : (a rstep) list =
    let stps = MAP.fold assigns (fun l r rest -> match fn l r with
      | Some(q) -> q::rest
      | None -> rest ) []
    in
    stps


  (*proposing restrictions*)
  let propose_bans_uniform (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list  =
    let proposal =  MAP.fold assigns (fun k v r -> [RBanAssign(k,v)]::r) [] in
    proposal

  let propose_bans (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list =
    propose_bans_uniform s n assigns

  (*don't ban anything*)
  let add_restrictions (type a) (s:a runify) (n:a rnode) (vtempl:a) (vtarg:a) (assigns:(a,a ast) map) : unit =
    let bans = propose_bans s n assigns in
    let curs = SearchLib.cursor s.search in
    let add_bans (bans:a rstep list) =
      let _ = SearchLib.move_cursor s.search s.tbl curs in
      let _ = SearchLib.start s.search in
      let _ = SearchLib.add_steps s.search bans in
      let _ = SearchLib.commit s.search s.tbl in
      ()
    in
    let _ = List.iter (fun x -> add_bans x) bans in
    ()

  let choose_fills (type a) (s:a runify) (templ: a list) (targ:a list) : ((a*unifytype) list) list =
    if (RAND.rand_norm() > 0.5 || LIST.empty targ) && LIST.empty templ = false then
      [[(LIST.rand templ,UTypTempl)]]
    else
      [[(LIST.rand targ,UTypTarg)]]

  let get_orig_rhs_and_kind (type a) s (utyp:unifytype) (vr:a) =
    if MAP.has (g_info s.tbl utyp).info vr then
      let ifo = MAP.get (g_info s.tbl utyp).info vr in
      let _ = auni_print_debug ("+ local: "^(s.tbl.tostr vr)) in
      Some(ifo.kind,ifo.rhs)
    (*a temporary variable*)
    else if MAP.has (g_state s.tbl utyp).add vr then
      let rhs = MAP.get (g_state s.tbl utyp).add vr in
      let _ = auni_print_debug ("+ fillvar: "^(s.tbl.tostr vr)) in
      Some(RKFunction,rhs)
    (*an uncaptured variable*)
    else
      let _ = auni_print_debug ("+ uncaptured: "^(s.tbl.tostr vr)) in
      None

  let get_any_orig_rhs_and_kind (type a) (s) (v:a) =
    match (get_orig_rhs_and_kind s UTypTarg v, get_orig_rhs_and_kind s UTypTempl v) with
    | (Some(q),None) -> Some(q)
    | (None,Some(q)) -> Some(q)
    | (None,None) -> None
    | _ -> error "get_any_orig_rhs_and_kind" "cannot have a variable defined as template and target."

  let add_fill_nodes (type a) (s:a runify) node templs targs vtempl vtarg =
    (*only fill in functions*)
    let is_enforced x =
      let matches = MAP.filter (g_cstr s.tbl) (fun k v -> k = x || v = x) in
      List.length matches > 0
    in
    (*these functions must NOT be enforced*)
    let is_fillable x =
      if is_enforced x then false else
      match get_any_orig_rhs_and_kind s x with
      | Some(rtype,rhs) -> rtype = RKFunction
      | None -> false
    in
    let templvars = ASTLib.get_vars (MAP.get templs vtempl) in
    let targvars = ASTLib.get_vars (MAP.get targs vtarg) in
    let templvars :a list = List.filter (fun x -> is_fillable x) templvars in
    let targvars : a list = List.filter (fun x -> is_fillable x) targvars in
    if LIST.empty targvars && LIST.empty templvars then
      false
    else
      let fills = choose_fills s templvars targvars in
      let add_fills fills =
        let _ = SearchLib.move_cursor s.search s.tbl node in
        let _ = SearchLib.start s.search in
        let _ = SearchLib.add_steps s.search (List.map (fun (x,t) -> RVarFill(x,t)) fills) in
        let _ = SearchLib.commit s.search s.tbl in
        ()
      in
      let _ = List.iter (fun (fill) -> add_fills fill) fills in
      true

  let add_assignment_node (type a) (s:a runify) node templs targs vtempl vtarg assigns =
    let addassign asgnlhs asgnrhs : bool =
      (*we assign a value to a variable in the component*)
      let _ = SearchLib.add_step s.search (RAddAssign(asgnlhs,asgnrhs)) in
      (*if the left hand side of this assignment is the template variable, skip*)
      if asgnlhs = vtempl then true else
      (*if the assignment concerns another output component*)
      let tplifo = get_orig_rhs_and_kind s UTypTempl asgnlhs in
      match tplifo with
      (*variable, is itself an output*)
      | Some(tplkind,tplrhs) ->
        let _ = auni_print_debug ("captured templ var: "^(s.tbl.tostr asgnlhs)) in
        begin
        (*determine kind of right hand side of assignment*)
        match asgnrhs with
          (**)
          | Term(targvar) ->
            let _ = auni_print_debug ("var-var assign: "^(s.tbl.tostr asgnlhs)^"="^(s.tbl.tostr targvar)) in
            let targifo = get_orig_rhs_and_kind s UTypTarg targvar in
            begin
            match targifo with
            | Some(targkind,targrhs) ->
              let _ = auni_print_debug ("captured targ var: "^(s.tbl.tostr targvar)) in
              if targkind != tplkind then false (*the kinds don't match*)
              else (*kinds match, add this *)
                let _ = SearchLib.add_step s.search (RForceAssign(asgnlhs,targvar)) in
                true
              (*assigned to an uncaptured variable - it's okay.*)
            | None ->
              let _ = auni_print_debug ("uncaptured targ var: "^(s.tbl.tostr targvar)) in
              if RKFunction != tplkind then false (*the kinds don't match*)
              else true
            end
          | _ ->
            let _ = auni_print_debug ("var-expr assign: "^(s.tbl.tostr asgnlhs)^" = "^(ASTLib.ast2str asgnrhs s.tbl.tostr)) in
            let tvar = s.tbl.env.freshvar (RAND.rand_int 100) UTypTarg in
            let _ = SearchLib.add_step s.search (RForceAssign(asgnlhs,tvar)) in
            let _ = SearchLib.add_step s.search (RVarAdd(tvar,asgnrhs,UTypTarg)) in
            true
        end
      | None ->
        let _ = auni_print_debug ("uncaptured templ var: "^(s.tbl.tostr asgnlhs)) in
        true
    in
    (*add a cursor for solving the goal*)
    let _ = SearchLib.move_cursor s.search s.tbl node in
    let _ = SearchLib.start s.search in
    (* if this assignment is a constraint, mark the assignments as resolved*)
    let _ = if MAP.has (g_cstr s.tbl) vtempl && MAP.get (g_cstr s.tbl) vtempl = vtarg then
      let _ = SearchLib.add_step s.search (RResolveAssign(vtempl,vtarg)) in
      () else ()
    in
    (*if we go through with it*)
    let _ = SearchLib.add_step s.search (RVarRemove(vtempl,UTypTempl)) in
    let _ = SearchLib.add_step s.search (RVarRemove(vtarg,UTypTarg)) in
    (*add the assignments and any additional constraints*)
    let issucc = MAP.fold assigns (fun lhs rhs succ -> succ && (addassign lhs rhs)) true in
    let anode = SearchLib.commit s.search s.tbl in
    let _ = SearchLib.move_cursor s.search s.tbl anode in
    (*if any of the assignments are impossible*)
    let _ = if issucc = false then
        let _ = SearchLib.deadend s.search anode in ()
        else ()
    in
    (*if this node is a solution then, mark it as one*)
    let _ = if MAP.empty (g_cstr s.tbl) then
        ret (SearchLib.solution s.search anode) ()
      else
        (*otherwise focus on the next target*)
        let nvtempl,nvtarg = MAP.rand (g_cstr s.tbl) in
        let fnode = SearchLib.start s.search in
        let fnode = SearchLib.add_step s.search (RVarFocus(nvtempl,UTypTempl)) in
        let fnode = SearchLib.add_step s.search (RVarFocus(nvtarg,UTypTarg)) in
        let _ = SearchLib.commit s.search s.tbl in
        ()
    in
    ()




  let solve_node (type a) (s:a runify) =
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let vtempl = STACK.peek ((g_state s.tbl UTypTempl).focus) in
    let vtarg = STACK.peek ((g_state s.tbl UTypTarg).focus) in
    let _ = auni_print_debug (" "^(s.tbl.tostr vtempl)^" <-> "^(s.tbl.tostr vtarg)) in
    let rtempl = MAP.get templs vtempl in
    let rtarg = MAP.get targs vtarg in
    match unify_one s vtempl rtempl vtarg rtarg with
    | Some(assigns) ->
      (*add a bunch of branches of what ifs*)
      let _ = add_restrictions s curs vtempl vtarg assigns in
      let _ = add_assignment_node s curs templs targs vtempl vtarg assigns in
      ()
    | None ->
      (*marks a deadend if there was no solution*)
      if add_fill_nodes s curs templs targs vtempl vtarg then
        let _ = auni_print_debug "filled in some nodes." in
        ()
      else
        let _ = auni_print_debug "no more nodes to fill in." in
        let _ = SearchLib.deadend s.search curs in
        ()

  let rec get_best_valid_node (type a) (sr:a runify) (root:(a rnode) option)  : (a rnode) option =
    let collate_score old_score score : float =
      score.state +. score.delta +. old_score
    in
    let nnode =  SearchLib.select_best_node sr.search collate_score root in
    nnode


  (*select the next node to solve*)
  let solve (type a) (sr:a runify) (root:a rnode) (n:int) =
    let rec _solve () =
      let sysmenu,usrmenu = mkmenu sr in
      if SearchLib.is_exhausted sr.search (Some root) then
        let _ = auni_print_debug "exhausted search" in
        ()
      else
        (*get the next node*)
        let maybe_next_node = get_best_valid_node sr (Some root) in
        let nslns = SearchLib.num_solutions sr.search (Some root) in
        let _ = auni_print_debug ("# solutions: "^(string_of_int nslns)) in
        if nslns > n then
         let _ = auni_print_debug "[search_tree] Found Solutions" in
         ()
        else
          match maybe_next_node with
          | Some(next_node) ->
              (*move to node*)
              let _ = auni_print_debug "=== Moving to Node ==" in
              let _ = usrmenu () in
              let _ = SearchLib.move_cursor sr.search sr.tbl next_node in
              let _ = if SearchLib.is_deadend sr.search next_node  = false then
                let _ = solve_node sr in
                let _ = auni_print_debug "== Solution Node ==" in
                let _ = usrmenu () in
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
      let focv : a = STACK.peek (g_state s.tbl UTypTarg).focus in
      let focvdata : a rdata = MAP.get (g_info s.tbl UTypTarg).info focv in
      if cmpdata.kind = focvdata.kind then
        let _ = SearchLib.start s.search in
        let _ = SearchLib.add_step s.search (RVarFocus(cmpvar,UTypTempl)) in
        let node = SearchLib.commit s.search s.tbl in
        ()
    in
    let focus_comps gnode =
      MAP.iter (g_info s.tbl UTypTempl).info (fun v data -> focus_comp gnode v data)
    in
    (*focus on each of the templs, and rels - where they're compatible*)
    let nodes : (a rnode) list =
      match gl with
      | Some(varb) -> [focus_goal varb (MAP.get (g_info s.tbl UTypTarg).info varb)]
      | None -> MAP.map (g_info s.tbl UTypTarg).info (fun v data -> focus_goal v data)
    in
    let _ = List.iter (fun goal -> focus_comps goal) nodes in
    ()

  let get_slns (type a) (s:a runify) : a fusion set =
    let env2fuses (s:a runify) : (a fuse) list =
      let asgns = (g_assigns s.tbl) in
      let rm_targ = ((g_state s.tbl UTypTarg).rm) in
      let rm_templ = ((g_state s.tbl UTypTempl).rm) in
      let add_targ = ((g_state s.tbl UTypTarg)).add in
      let add_templ = ((g_state s.tbl UTypTempl)).add in
      let arr = [] in
      let arr = MAP.fold asgns (fun lhs rhs q -> USAssign(lhs,rhs)::q)  arr in
      let arr = SET.fold rm_targ (fun x q -> USRm(x,UTypTarg)::q) arr in
      let arr = SET.fold rm_templ (fun x q -> USRm(x,UTypTempl)::q) arr in
      let arr = MAP.fold add_targ (fun lhs rhs q -> USAdd(lhs,rhs,UTypTarg)::q)  arr in
      let arr = MAP.fold add_templ (fun lhs rhs q -> USAdd(lhs,rhs,UTypTempl)::q)  arr in
      arr
      (*add all assignments in fusion.*)
    in
    let step2fuse (s: a rstep) : (a fuse) list = match s with
    | RAddAssign(lhs,rhs) -> []
    | RForceAssign(v1,v2) -> []
    | _ -> []
    in
    let steps2fuses (s:(a rstep) list) : (a fuse) list =
      let fuses = List.fold_right (fun x r -> (step2fuse x) @ r) s [] in
      fuses
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

  let print_fuse (type a) (tostr:a->string) (f:a fuse) = match f with
    | USAdd(lhs,rhs,typ) -> "add rel "^(tostr lhs)^" = "^(ASTLib.ast2str rhs tostr)^" of <"^(unifytype2str typ)^">"
    | USRm(vr,typ) -> "rm rel "^(tostr vr)^" of <"^(unifytype2str typ)^">"
    | USAssign(lhs,rhs) -> "assign "^(tostr lhs)^" = "^(ASTLib.ast2str rhs tostr)

  let print_fusion (type a) (indent:int) (tostr:a->string) (f:a fusion) : string=
    let prefix = STRING.repeat " " indent  in
    let fusion_str = List.fold_right (fun x r -> r^(prefix)^(print_fuse tostr x)^"\n" ) f "" in
    fusion_str

  let print_fusions (type a) (indent:int) (tostr:a->string) (f:a fusion set) =
    let prefix = STRING.repeat " " indent in
    let title = "# SOLUTION" in
    let strrep = SET.fold f (fun x r -> r^prefix^title^"\n"^(print_fusion (indent+2) tostr x)) "" in
    strrep

  (*given colored set of equations, match them*)
  let multipattern (type a)
    (tmpl: (a rarg) list) (targ: (a rarg) list) (targvar:a) (n:int)
    (cnv:a->symvar) (icnv:symvar -> a)
    (freshvar:int->unifytype->a)
    (tostr:a->string)
     =
    (*make the search tree*)
    let root,smeta = mksearch tmpl targ cnv icnv freshvar tostr in
    (*build a tree for the particular set of goals*)
    let _ = build_tree smeta root (Some targvar) in
    (*let _ = build_tree smeta root (None) in*)
    (*solve a thing*)
    let _ = solve smeta root n in
    let _ = auni_print_debug "=== Done with Relation Search ===" in
    let slns = get_slns smeta in
    let rep = print_fusions 1 smeta.tbl.tostr slns in
    let _ = auni_print_debug "=== SOLUTIONS ===" in
    let _ = auni_print_debug rep in
    let _ = auni_print_debug "=================" in
    slns

end
