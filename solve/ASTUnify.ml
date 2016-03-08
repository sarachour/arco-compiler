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

let spy_print_debug = print_debug 4 "sympy"
let _print_debug = print_debug 3 "uni"
let auni_menu = menu 3

module ASTUnifier =
struct


  let info2buf (type a) chan (indent:int) (tostr:a->string) (st:a rinfo) =
      let prefix = "" in
      ()

  let mkmenu (type a) (sr:a runify) =
    let menu_desc = "t=search-tree,i=info" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str sr.search) in
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

  let g_info s k = if k = UTypTarg then
    s.targ
  else
    s.templ

  let g_sym s = s.env.s
  let g_conv s = s.env.cnv
  let g_iconv s = s.env.icnv
  let g_search s = s.search
  let g_subset s = s.tbl.st.subset

  let ret (type a) (type b) (x:a) (r:b) = let _ = x in r




  let unifytype2str u = match u with
  | UTypTempl -> "templ"
  | UTypTarg -> "targ"

  let step2str (type a) (tostr:a -> string) (a:a rstep) = match a with
  | RSetAssigns(lst) ->
    let res : string =
      LIST.fold lst (fun ((lhs,rhs):(a*a ast)) (rest:string) -> rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  ") ""
    in
    "+asgn "^res
  | RBanAssign(lhs,rhs) -> "-asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RTemplSubgraph(sub) -> "subset "^(SET.tostr sub tostr "; ")

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
  | RSetAssigns(lhs) ->
    let _ = MAP.clear s.st.assigns in
    let _ = List.iter (fun (k,v) -> return (MAP.put s.st.assigns k v) ()) lhs in
    ()
  | RBanAssign(lhs,rhs) -> ret (add_ban s lhs rhs) ()
  | RTemplSubgraph(sub) -> ret (SET.setv s.st.subset sub) ()
  in
  s

  let unapply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
    | RSetAssigns(lst) -> ret (MAP.clear s.st.assigns) ()
    | RBanAssign(lhs,rhs) -> ret (rm_ban s lhs rhs) ()
    | RTemplSubgraph(sub) -> ret (SET.clear s.st.subset) ()
  in
  s

  (*add variables first*)
  let order_steps a b = 0

  let score_uniform env steps : sscore =
    let delta = 0. in
    let state = 0. in
    SearchLib.mkscore delta state

  let score_random env steps : sscore =
    let delta = RAND.rand_norm () in
    let state = RAND.rand_norm () in
    SearchLib.mkscore delta state

  let get_score ()  =
    match get_glbl_string "uast-selector-branch" with
    | "uniform" -> score_uniform
    | "random" -> score_random

  (*
  break any cycles
  *)
  let rec gen_nodep (type a) (s:a runify) (ginfo:(a,a rdata) map) : (((a, a rdata) map)*((a,a set) map)*((a set) list))  =
    let sym2a : symvar -> a = g_iconv s.tbl in
    let a2sym : a -> symvar = g_conv s.tbl in
    (*create the set of replacements *)
    let breaks : (a, a set) map = MAP.make () in
    (*create the equation table*)
    let tabl : (a, a ast) map = MAP.make () in
    let _ = MAP.iter ginfo (fun k d -> return (MAP.put tabl k d.rhs) ()) in
    (*create the allocation routines*)
    let nallocs : int ref = REF.mk 1 in
    let freshvar () =
      let v = s.tbl.env.freshvar (REF.dr nallocs) UTypTempl in
      let _ = REF.upd nallocs (fun x -> x + 1) in
      v
    in
    (*breaking teh cycles*)
    let rec _break_cycles () =
      let _ = _print_debug "==== Breaking Cycles =====" in
      let cycle2str lst : string = List.fold_right (fun x r -> r^"->"^(a2sym x)) lst "" in
      let graph : (a,unit) graph = ASTLib.mk_dep_graph (MAP.to_list tabl) a2sym in
      let cycs : (a list) set = GRAPH.cycles graph in
      if SET.empty cycs then
        let _ = _print_debug ("[DEP] ----> No Cycles Left!") in
        tabl
      else
        let _ = _print_debug("[DEP] Cycles :\n") in
        let _ = SET.iter cycs (fun x -> _print_debug ("::> "^(cycle2str x))) in
        let cyc = SET.rand cycs in
        let use_var : a = LIST.from_end cyc 1 in
        let def_var : a = LIST.from_end cyc 0 in
        let use_var_dup :a = freshvar () in
        let _ = _print_debug ("@ repl "^(a2sym use_var)^" with "^(a2sym use_var_dup)^" in "^(a2sym def_var)) in
        (*replace the uses of the use var*)
        let _ = if MAP.has breaks use_var = false then
          return (MAP.put breaks use_var (SET.make ())) ()
        in
        let uses : a set = MAP.get breaks use_var in
        let rhs = MAP.get tabl def_var in
        let replmap = MAP.make () in
        let _ = MAP.put replmap use_var (Term(use_var_dup)) in
        let nrhs = ASTLib.sub rhs replmap in
        let _ = MAP.put tabl def_var nrhs in
        let _ = SET.add uses use_var_dup in
        _break_cycles ()
    in
    let _ = _break_cycles () in
    let nodep_info = MAP.make () in
    let mkdata lhs rhs = {
      kind = (MAP.get ginfo lhs).kind;
      rhs = rhs;
    } in
    let _ = MAP.iter tabl (fun k v -> return (MAP.put nodep_info k (mkdata k v)) () ) in
    (*make the graph*)
    let graph : (a,unit) graph = ASTLib.mk_dep_graph (MAP.to_list tabl) a2sym in
    let outputs =  MAP.keys tabl in
    let _ = _print_debug ("Dependency Graph:\n"^(GRAPH.tostr graph)^"\n------") in
    (*construct disjoint, cycle sets*)
    let subt : (a set) list = GRAPH.subtrees graph (Some outputs) in
    (*printing data*)
    let subt2str lst = SET.fold lst (fun  x r -> r^" "^(a2sym x)) "" in
    let _ = _print_debug("\n[DEP] Subtrees :\n") in
    let _ = List.iter (fun x -> _print_debug ("  "^(subt2str x))) subt in
    (*return the info with no dependencies, the breaks made, and the subtree*)
    (nodep_info,breaks,subt)

  let mksearch (type a) (templs_e: (a rarg) list) (targs_e: (a rarg) list)
    (cnv:a->symvar) (icnv:symvar -> a) (freshvar:int->unifytype->a) (tostr:a->string) : ((a rstep) snode)*(a runify) =
    (*make the data for each variable*)
    let mkdata ifo relinfo =
      let lhs,rhs,knd = relinfo in
      let data = {
        rhs = rhs;
        kind = knd;
      } in
      let _ = MAP.put ifo.info lhs data in
      ()
    in
    let mkinfo () : a rinfo =
      {
        info=MAP.make ();
        nodep = MAP.make ();
        repls = MAP.make ();
        subtrees = [];
      }
    in
    (*create environment*)
    let state = {
      assigns = MAP.make ();
      bans = MAP.make ();
      subset = SET.make ();
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
      SearchLib.mksearch apply_step unapply_step order_steps (get_score()) (step2str tostr)
    in
    let strct: a runify = {
        search=search;
        tbl=tbl;
      }
    in
    let mknodep (s:a runify) (x:a rinfo) =
      let ndep_tbl, ndep_repl, ndep_subt = gen_nodep s x.info in
      let _ = x.nodep <- ndep_tbl in
      let _ = x.repls <- ndep_repl in
      let _ = x.subtrees <- ndep_subt in
      ()
    in
    let mkdummy (s:a runify) (x:a rinfo) =
      let meqs = MAP.make () in
      let _ = MAP.iter x.info (fun k d -> return (MAP.put meqs k d.rhs) ()) in
      let graph : (a,unit) graph = ASTLib.mk_dep_graph (MAP.to_list meqs) tostr in
      let ndep_subt = GRAPH.subtrees graph (Some (MAP.keys meqs)) in
      let _ = x.subtrees <- ndep_subt in
      let _ = x.nodep <- x.info in
      ()
    in
    let _ = mknodep strct strct.tbl.templ in
    let _ = mkdummy strct strct.tbl.targ in
    let root, _ = SearchLib.setroot search tbl [] in
    (root,strct)

  type 'a rnode = ('a rstep) snode
  (*apply the existing state to python, that is transform the expressions*)




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

  let propose_bans_fraction (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list  =
    let frac = get_glbl_float "uast-restrict-fraction-ban-prop" in
    let fracsets = get_glbl_float "uast-restrict-fraction-set-prop" in
    let n = int_of_float ((float_of_int (MAP.size assigns))*.fracsets) in
    let choose_ban k v r =
      if RAND.rand_norm () < frac then
        RBanAssign(k,v)::r
      else
        r
    in
    let rec make_bans i r =
      let bans : a rstep list = MAP.fold assigns (fun k v r -> choose_ban k v r) [] in
      let r = if List.length bans > 0 then bans::r else r in
      if i < n then
        make_bans (i+1) r
      else
        r
    in
    make_bans 0 []

  let propose_bans_common (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list  =
    [[]]
  let propose_bans_all_rhs (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list  =
    let lhses : a list = MAP.to_keys assigns in
    let cplx_rhs x = match x with Term(_) -> false | Integer(_) -> false | Decimal(_) -> false | _ -> true in
    let choose_ban lhs rhs r =
      if cplx_rhs rhs then
        let bans : a rstep list = List.map (fun clhs -> RBanAssign(clhs,rhs)) lhses in
        bans::r
      else
        [RBanAssign(lhs,rhs)]::r
    in
    let bans : (a rstep list) list = MAP.fold assigns (fun k v r -> choose_ban k v r) [] in
    bans

  let propose_bans (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : (a rstep list) list =
    match get_glbl_string "uast-selector-restrict" with
    | "single" ->
      propose_bans_uniform s n assigns
    | "fraction" ->
      propose_bans_fraction s n assigns
    | "all-rhs" ->
      propose_bans_all_rhs s n assigns
    | "common" ->
      propose_bans_common s n assigns

  (*don't ban anything*)
  let add_restrictions (type a) (s:a runify) (n:a rnode) (assigns:(a,a ast) map) : unit =
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





  (*calculate how many bound switches you have*)
  let decl_wild s v bans =
    let _ = SymCaml.define_wildcard (g_sym s.tbl) v bans in ()

  let decl_sym s v = let _ =
    SymCaml.define_symbol (g_sym s.tbl) v in ()

  let decl_func s x =
    let _ = SymCaml.define_function (g_sym s.tbl) x in ()


  let apply_state (type a) (s: a runify) : ((a, a ast) map)*((a, a ast) map) =
    let _ = spy_print_debug "ENV == STATE ===" in
    let _ = SymCaml.clear (g_sym s.tbl) in
    (*let _ = SymCaml.set_debug (g_sym s.tbl) true in*)
    (*create replacement tables*)
    let var2symvar = g_conv s.tbl in
    let expr2symexpr x : symexpr = ASTLib.to_symcaml x (g_conv s.tbl) in
    let add_wild (set:(symvar*(symexpr list)) set) (v:a) =
      let bans =
        if MAP.has (g_bans s.tbl) v then
          let bans = SET.map (MAP.get (g_bans s.tbl) v) (fun x ->
            let _ = spy_print_debug ("ENV ban: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str x s.tbl.tostr)^"") in
            x
          ) in
          bans
        else []
      in
      let symbans : symexpr list = List.map (fun (x) -> expr2symexpr x) bans in
      let _ = if SET.has set (var2symvar v,symbans) = false then
        ret (SET.add set (var2symvar v, symbans)) () in
      ()
    in
    let add_sym (set:symvar set) (v:a) =
      let var2symvar = g_conv s.tbl in
      let _ = if SET.has set (var2symvar v) = false then ret (SET.add set (var2symvar v)) () in ()
    in
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
    (*add exprs*)
    let add_expr scratch v rhs (iswc:bool) (addvars:bool)=
      let _ = if addvars then add_vars v rhs iswc else () in
      let _ = MAP.put scratch v (rhs) in
      let _ = spy_print_debug ("ENV add: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str rhs s.tbl.tostr)^"") in
      ()
    in
    (*define default values*)
    (*add original variables*)
    let _ = MAP.iter (g_info s.tbl UTypTarg).info (fun v data ->add_expr scratch_targ v data.rhs false true) in
    let _ = MAP.iter (g_info s.tbl UTypTempl).nodep (fun v data ->add_expr scratch_templ v data.rhs true true) in
    (*declare variables*)
    let _ = SET.iter sym_vars (fun x -> decl_sym s x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild s x bans) in
    (scratch_templ,scratch_targ)

  let is_deriv (type a) (s:a runify) (v:a) =
    if MAP.has s.tbl.templ.info v then
      (MAP.get s.tbl.templ.info v).kind = RKDeriv
    else
      (MAP.get s.tbl.targ.info v).kind = RKDeriv

  let compute_vars s templs =
    let outvars = SET.make_dflt () in
    let invars = SET.make_dflt () in
    let localvars = SET.make_dflt () in
    let _ = MAP.iter templs (fun lhs rhs ->
      let out = lhs and ins = List.filter (fun q -> q <> lhs) (ASTLib.get_vars rhs) in
      let _ = SET.add outvars out in
      let _ = SET.add_all invars ins in
      ()
    )
    in
    let _ = SET.iter outvars (fun x -> if SET.has invars x then
          let _ = SET.add localvars x in
          let _ = SET.rm invars x in
          ()
        else ()
    )
    in
    (outvars,invars,localvars)

  let restvar () =
    "REST"

  let is_rest v =
    "REST" = v

  let funvar () =
    "F"

  let dfunvar () =
    "DF"

  let lhsfunvar () =
    "LHS"

  let assigns2state (type a) (s:a runify) (assigns:(string*symexpr) list) =
    let repls = s.tbl.templ.repls in
    let sym2a : symvar -> a = g_iconv s.tbl in
    let a2sym : a -> symvar = g_conv s.tbl in
    let extract_lhses ast =
      let _extract (node:a ast) vlst: a list =
        match node with
        | OpN(Func(_), Term(lhs)::t) -> (lhs::vlst)
        | _ -> vlst
      in
      ASTLib.fold ast _extract []
    in
    let get_canon (x:string) =
      (*get the variables that contain the temporary variable *)
      match MAP.filter repls (fun k tvars -> (SET.count tvars (fun q -> (a2sym q) = x )) > 0) with
      | [(act,_)] -> act
      | [] -> sym2a x
    in
    let _ = _print_debug "<!> found assigns" in
    let sassigns = MAP.make () in
    let rest = SET.make_dflt () in
    let _ = List.iter (fun ((l,r):symvar*symexpr) ->
      if is_rest l then
        let ar : a ast = ASTLib.from_symcaml r sym2a in
        let _ = _print_debug ("rest-expr: "^(ASTLib.ast2str ar a2sym)) in
        let ignored = extract_lhses ar in
        let _ = List.iter (fun x -> return (SET.add rest x) ()) ignored in
        ()
      else
        let al : a = get_canon l in
        let ar : a ast = ASTLib.from_symcaml r sym2a in
        let _ = MAP.put sassigns al ar in
        ()
    ) assigns
    in
    let _ = SET.iter rest (fun x -> _print_debug ("targ-rest:"^(a2sym x))) in
    let _ = MAP.iter sassigns (fun k v -> _print_debug ("assign: "^(a2sym k)^" = "^(ASTLib.ast2str v a2sym))) in
    let _ = _print_debug "--------------------\n" in
    (sassigns,rest)




  (*unify the two components*)
  let unify (type a) (s:a runify) (templs:(a, a ast) map) (targs:(a,a ast) map) (targvar:a) : (a set*(a,a ast) map) option =
      let sym2a : symvar -> a = g_iconv s.tbl in
      let a2sym : a -> symvar = g_conv s.tbl in
      let tolhsexpr lh : symexpr =
        OpN(Function(lhsfunvar()), [Symbol(lh)] )
      in
      let gen_subexpr (lhs:a) (rhs:a ast): symexpr=
        let lhsexpr :symexpr = tolhsexpr (a2sym lhs) in
        let rhsexpr :symexpr = ASTLib.to_symcaml rhs a2sym in
        let fxn : symexpr= if is_deriv s lhs then
            OpN(Function(dfunvar()),[lhsexpr;rhsexpr])
          else
            OpN(Function(funvar()),[lhsexpr;rhsexpr])
        in
        fxn
      in
      (*declare intermediate functions*)
      let _ = decl_func s (funvar()) in
      let  _ = decl_func s (dfunvar()) in
      let _ = decl_func s (lhsfunvar()) in
      (*ban the target expression from the rest variable*)
      let banexpr : symexpr = gen_subexpr targvar (MAP.get targs targvar) in
      let _ = _print_debug (">rest: disable overflow: "^(SymCaml.expr2str banexpr)) in
      let _ = decl_wild s (restvar()) [banexpr] in
      (*determine input and output vars*)
      let outs,ins,locals = compute_vars s templs in
      (*create assignment*)
      let gen_asgn (v:a) : symexpr =
          let rhs = MAP.get templs v in
          gen_subexpr v rhs
      in
      let gen_overall_expr (m:(a, a ast) map) is_templ : symexpr=
        (*get args an enables *)
        let rels = MAP.fold m (fun (k:a) (v:a ast) (rexpr) ->
          (*if it is a template *)
          if SET.has (g_subset s) k || is_templ = false then
            let expr = gen_subexpr k v in
            expr::rexpr
          else
            rexpr
        ) []
        in
        if is_templ then
          OpN(Add,Symbol(restvar())::rels)
        else
          let asgns = SET.map locals (fun v -> gen_asgn v) in
          OpN(Add,rels @ asgns)
      in
      let _ = _print_debug ("ALLOWED VARS: "^(SET.tostr (g_subset s) a2sym "; ")) in
      let templ_expr = gen_overall_expr templs true in
      let targ_expr = gen_overall_expr targs false in
      let _ = _print_debug ("#unify <"^(a2sym targvar)^">\n  templ:\n"^(SymCaml.expr2str templ_expr)^"\n\n  targ:\n"^(SymCaml.expr2str targ_expr)^"\n") in
      let maybe_assigns = SymCaml.pattern (g_sym s.tbl) targ_expr templ_expr in
      match maybe_assigns with
      | Some(assigns) ->
        let mp,rest = assigns2state s assigns in
        Some(rest,mp)
      | None ->
        let _ = _print_debug "no assigns found" in
        None

  let add_assignment_node (type a) (s:a runify) curs assigns =
    let _ = SearchLib.move_cursor s.search s.tbl curs in
    let _ = SearchLib.start s.search in
    let _ = SearchLib.add_step s.search (RSetAssigns (MAP.to_list assigns)) in
    let _ = SearchLib.commit s.search s.tbl in
    ()

  let solve_node (type a) (s:a runify) (tvar:a) =
    let v2str = s.tbl.tostr in
    let e2str x = ASTLib.ast2str x v2str in
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let proc_one () =
      match unify s templs targs tvar with
      | Some(rest, assigns) ->
        let _ = add_restrictions s curs assigns in
        let _ = add_assignment_node s curs assigns in
        ()
      | None ->
        let _ = SearchLib.deadend s.search curs in
        ()
    in
    FUN.iter_n proc_one 1

  let rec get_best_valid_node (type a) (sr:a runify) (root:(a rnode) option)  : (a rnode) option =
    let collate_score (o:sscore) (score:sscore) : sscore =
      SearchLib.mkscore score.state  (score.delta +. o.delta)
    in
    let nnode =  SearchLib.select_best_node sr.search collate_score root in
    nnode

  (*select the next node to solve*)
  let solve (type a) (sr:a runify) (root:a rnode) (targvar:a) (n:int) =
    let rec _solve () =
      let sysmenu,usrmenu = mkmenu sr in
      let _mnext () =
        let maybe_next_node = get_best_valid_node sr (Some root) in
        match maybe_next_node with
        | Some(next_node) ->
            (*if we're going really deep*)
            let _ = SearchLib.move_cursor sr.search sr.tbl next_node in
            let _ = _solve () in
            ()
        | None -> ()
      in
      let curs = SearchLib.cursor sr.search in
      let depth : int =  SearchLib.depth sr.search curs in
      if depth >= get_glbl_int "uast-depth" then
        let _ =  SearchLib.deadend sr.search curs in
        let _ = _mnext () in
        ()
      else
        (*get the next node*)
        let nslns = SearchLib.num_solutions sr.search (Some root) in
        let _ = _print_debug ("# solutions: "^(string_of_int nslns)) in
        if nslns >= n then
         let _ = _print_debug "[search_tree] Found Solutions" in
         ()
        else
          let _ = solve_node sr targvar in
          let _ = _print_debug "== Solution Node ==" in
          let _ = usrmenu () in
          let _ = _mnext () in
          ()
    in
    _solve ()


  let build_tree (type a) (s:a runify) (root: a rnode) (gl: a option): unit =
    let curs = root in
    let _ = List.iter (fun subst ->
      let _ = SearchLib.start s.search in
      let steps = SearchLib.add_step s.search (RTemplSubgraph subst) in
      let n = SearchLib.commit s.search s.tbl in
      ()
    ) s.tbl.templ.subtrees
    in
    ()

  let get_slns (type a) (s:a runify) : a fusion set =
    let env2fuses (s:a runify) : (a fuse) list =
      let asgns = (g_assigns s.tbl) in
      let arr = [] in
      let arr = MAP.fold asgns (fun lhs rhs q -> USAssign(lhs,rhs)::q)  arr in
      arr
      (*add all assignments in fusion.*)
    in
    let step2fuse (s: a rstep) : (a fuse) list = match s with
    | RSetAssigns(_) -> []
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
    let _ = solve smeta root targvar n in
    let _ = _print_debug "=== Done with Relation Search ===" in
    let slns = get_slns smeta in
    let rep = print_fusions 1 smeta.tbl.tostr slns in
    let _ = _print_debug "=== SOLUTIONS ===" in
    let _ = _print_debug rep in
    let _ = _print_debug "=================" in
    slns

end
