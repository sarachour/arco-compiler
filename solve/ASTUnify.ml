open ASTUnifyData

module ASTUnifier =
struct

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
    let scratch = MAP.make () in
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

  let apattern (type a) (s:rsearch) (l1:a) (r1:a ast) (e2: a) (r2: a ast) =
    ()




  (*given colored set of equations, match them*)
  let multipattern (type a) (e1: (relinfo) list) (e2: (relinfo) list)  (cnv:a->symvar) (icnv:symvar -> a) (decl:a->bool->(a->symvar)->symdecl)  (tostr:a->string) =
    (*make the search tree*)
    let _ = mksearch e1 e2 cnv icnv decl tostr in
    ()

end
