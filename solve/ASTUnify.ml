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

(*
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

  let state2str (type a) (tostr:a ->string) (a:a asgn_state) = 
        let assgn : string =
                MAP.fold a.assigns (fun lhs rhs (rest:string) -> 
                        rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  "
                ) ""
        in
        let unused: string =
                MAP.fold a.unused (fun (lhs:a) (rhs,_) (rest:string) -> 
                        rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  "
                ) ""
        in
        let slved : string = 
          MAP.fold a.solved (fun lhs (rhs,kind) rest ->
              rest^" "^(tostr lhs)^"="^(ASTLib.ast2str rhs tostr)) " "
        in
        assgn^unused^slved
  
  let mkstate (type a) asgns solved unused = 
        {assigns=asgns; resolved=[]; solved=solved; unused=unused}

  let step2str (type a) (tostr:a -> string) (a:a rstep) = match a with
  | RSetState(state) ->
        "+asgn "^(state2str tostr state)
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
  | RSetState(state) ->
        let _ = (s.st.state <- Some(state)) in 
        ()
  | RBanAssign(lhs,rhs) -> ret (add_ban s lhs rhs) ()
  | RTemplSubgraph(sub) -> ret (SET.setv s.st.subset sub) ()
  in
  s

  let unapply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
    | RSetState(state) -> 
        let _ = (s.st.state <- None) in 
        ()
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
  break any cycles in a set of equations
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
    let unbreak_cycles (tabl:(a,a ast) map) subt : ((a,a ast) map)*((a set) list) = 
        let subs = MAP.make () in 
        let ntabl = MAP.make () in
        let nsubt = [] in
        let repl (x:a) : a = if MAP.has subs x then MAP.get subs x else x in 
        (* create a substitution map *)
        let _ = MAP.iter breaks (fun orig repls -> SET.iter repls (fun repl -> return (MAP.put subs repl orig) () )) in
        let esubs : (a,a ast) map = MAP.map_vals subs (fun repl orig -> Term(orig)) in  
        let _ =  MAP.iter tabl (fun lhs rhs -> return (MAP.put ntabl (repl lhs) (ASTLib.sub rhs esubs)) () ) in 
        let nsubt :(a set) list = List.map (fun st -> SET.from_list (SET.map st (fun el -> repl el))) subt in
        ntabl, nsubt 
    in
    (*break all the cycles by performing replacements*)
    let _ = _break_cycles () in
    (*
     * make the dependency graph
     *)
    let graph : (a,unit) graph = ASTLib.mk_dep_graph (MAP.to_list tabl) a2sym in
    let outputs =  MAP.keys tabl in
    let _ = _print_debug ("Dependency Graph:\n"^(GRAPH.tostr graph)^"\n------") in
    (*construct disjoint, cycle sets*)
    let subt : (a set) list = GRAPH.subtrees graph (Some outputs) in
    (*
     undo the substitution, now that the relations are flat
    *)
    let tabl,subt = unbreak_cycles tabl subt in
    (*create a no dependency table *) 
    let nodep_info = MAP.make () in
    let mkdata lhs rhs = {
      kind = (MAP.get ginfo lhs).kind;
      rhs = rhs;
    } in
    let _ = MAP.iter tabl (fun lhs rhs -> return (MAP.put nodep_info lhs (mkdata lhs rhs)) () ) in
    (*
     *  printing data
    *)
    let subt2str lst = SET.fold lst (fun  x r -> r^" "^(a2sym x)) "" in
    let _ = _print_debug("\n[DEP] Subtrees :\n") in
    let _ = List.iter (fun x -> _print_debug ("  "^(subt2str x))) subt in
    (*return the info with no dependencies, the breaks made, and the subtree*)
    (nodep_info,breaks,subt)

  (*make search tree*)
  let mksearch (type a) (targ_var: a) (templs_e: (a rarg) list) (targs_e: (a rarg) list)
    (is_wc: a->bool) (cnv:a->symvar) (icnv:symvar -> a) (freshvar:int->unifytype->a) (tostr:a->string) : ((a rstep) snode)*(a runify) =
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
    let prune_unrelated_vars (map:(a,a rdata) map) (v:a) = 
      let mathexprs:(a*a ast) list = MAP.map map (fun k v -> (k,v.rhs)) in 
      let graph : (a,unit) graph = ASTLib.mk_dep_graph mathexprs cnv in
      let max_hops = get_glbl_int "uast-prune-unrelated-hops" in 
      let _ = MAP.iter map (fun k info -> 
        if v = k || GRAPH.reachable graph v k max_hops || GRAPH.reachable graph k v max_hops then () 
        else 
         ret (MAP.rm map k) () 
      ) in
     () 
    in
    (*create environment*)
    let state = {
            state = None; 
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
      is_wc = is_wc;
    } in
    (*make the dependency tree*)
    let tmpl_info =  mkinfo() in
    let targ_info = mkinfo() in
    let _ = List.iter  (fun x -> mkdata tmpl_info x) templs_e in
    let _ = List.iter  (fun x -> mkdata targ_info x) targs_e in
    let _ = if get_glbl_bool "uast-prune-unrelated" then
      prune_unrelated_vars targ_info.info targ_var 
    in
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
      if RAND.rand_norm () <= frac then
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
  
  (*apply the state to syncaml*)
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
    let add_vars lhs (rhs:a ast) kind (iswc:bool)=
      let addvar q = if iswc && (s.tbl.env).is_wc q
        then add_wild wc_vars q
        else add_sym sym_vars q
      in
      let _ = addvar lhs in
      let _ = List.iter (fun q -> addvar q) (ASTLib.get_vars rhs) in
      let _ = match kind with 
      | RKDeriv(ICVar(v)) -> addvar v 
      | _ -> ()
      in 
      ()
    in
    (*add exprs*)
    let add_expr scratch v rhs (kind:a rkind) (iswc:bool) (addvars:bool)= 
      let _ = if addvars then add_vars v rhs kind iswc else () in
      let _ = MAP.put scratch v (rhs) in
      let _ = spy_print_debug ("ENV add: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str rhs s.tbl.tostr)^"") in
      ()
    in
    (*define default values*)
    (*add original variables*)
    let _ = MAP.iter (g_info s.tbl UTypTarg).info (fun v data ->add_expr scratch_targ v data.rhs data.kind  false true) in
    let _ = MAP.iter (g_info s.tbl UTypTempl).nodep (fun v data ->add_expr scratch_templ v data.rhs data.kind true true) in
    (*declare variables*)
    let _ = SET.iter sym_vars (fun x -> decl_sym s x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild s x bans) in
    (scratch_templ,scratch_targ)

  let is_deriv (type a) (s:a runify) (v:a) =
    let get_deriv k = match k with 
    |RKDeriv(ic) -> Some(ic)
    | _ -> None
    in
    if MAP.has s.tbl.templ.info v then
      get_deriv (MAP.get s.tbl.templ.info v).kind 
    else
      get_deriv (MAP.get s.tbl.targ.info v).kind 

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
    "REST_TEMPL"

  let restvar2 () = 
    "REST_TARG"

  let is_rest v : bool =
    "REST_TEMPL" = v

  let is_rest2 v : bool =
    "REST_TARG" = v

  let funvar () =
    "F"

  let dfunvar () =
    "DF"

  let lhsfunvar () =
    "LHS"

  (*Extract the state of the solution from the assigns*)
  let assigns2state (type a) (s:a runify) (templs:(a,a ast) map) (targs:(a,a ast) map) (assigns:(string*symexpr) list) : (a,a ast) map*((a*(a ast*a rkind)) list)*((a*(a ast*a rkind)) list) =
    let sym2a (x:symvar) : a = (g_iconv s.tbl) x in
    let a2sym : a -> symvar = g_conv s.tbl in
    let clean_rest_var (exp:symexpr) : symexpr = 
       let repls : (symexpr*symexpr) list= [
               (Symbol(restvar2()),Integer(0)); 
               (Symbol(restvar()),Integer(0))
       ] in
       let nexp = SymCaml.subs (g_sym s.tbl) exp repls in 
       nexp     
    in
    let extract_exprs ast =
      let _extract (node:a ast) vlst: (a*(a ast)) list =
        match node with
        | OpN(Func("F"), [OpN(Func("LHS"),[Term(lhs)]);rhs]) -> 
          ((lhs,(rhs))::vlst)
        | OpN(Func("DF"), [OpN(Func("LHS"),[Term(lhs)]);rhs;ic]) -> 
            ((lhs,(rhs))::vlst)
        | _ -> vlst
      in
      ASTLib.fold ast _extract []
    in
    let _ = _print_debug "<!> found assigns" in
    let assign_map :(a, a ast) map= MAP.make () in
    let rest = SET.make_dflt () in
    let solved_targ_map = MAP.copy targs in 
    let unused_templ_vars = SET.from_list (MAP.keys templs) in 
    let _ = List.iter (fun ((l,r):symvar*symexpr) ->
        if is_rest l then
                (*determine the rest variables*)
                let ar : a ast = ASTLib.from_symcaml (clean_rest_var r) sym2a in
                let _ = _print_debug ("templ-rest-expr: "^(ASTLib.ast2str ar a2sym)) in
                let ignored = extract_exprs ar in
                (*let _ = List.iter (fun x -> return (SET.add rest x) ()) ignored in*)
                let _ = List.iter (fun (x,rhs) -> return (MAP.rm solved_targ_map x) ()) ignored in
                ()
        else if is_rest2 l then
                let ar : a ast = ASTLib.from_symcaml (clean_rest_var r) sym2a in 
                let _ = _print_debug ("targ-rest-expr: "^(ASTLib.ast2str ar a2sym)) in 
                ()
        else
                let alhs : a = sym2a l in
                let _ = SET.rm unused_templ_vars alhs in 
                let arhs : a ast = ASTLib.from_symcaml r sym2a in
                let _ = MAP.put assign_map alhs arhs in
                ()
    ) assigns
    in
    let unused_templs : (a*(a ast*a rkind)) list = SET.map unused_templ_vars (fun vr -> 
        let rhs : a ast = MAP.get templs vr in
        let nrhs : a ast = ASTLib.sub rhs assign_map in
        (vr, (nrhs,RKFunction))   
    ) in
    let solved_targs : (a*(a ast*a rkind)) list=
      List.map (fun (lhs,rhs) -> (lhs,(rhs,RKFunction))) (MAP.to_list solved_targ_map) in
    let _ = List.iter (fun (x,(y,_)) -> _print_debug ("solved:"^(a2sym x)^(ASTLib.ast2str y a2sym))) solved_targs in
    let _ = List.iter (fun (lhs,rhs) -> _print_debug ("unused-templ:"^(a2sym lhs))) unused_templs in
    let _ = MAP.iter assign_map (fun k v -> _print_debug ("assign: "^(a2sym k)^" = "^(ASTLib.ast2str v a2sym))) in
    let _ = _print_debug "--------------------\n" in
    (*return the unsolved state variables, as well as the unused hw vars *)
    (assign_map,solved_targs,unused_templs)




  (*unify the two components*)
  let unify (type a) (s:a runify) (templs:(a, a ast) map) (targs:(a,a ast) map) (targvar:a) :
    (((a,a ast) map)*((a*(a ast*a rkind)) list)*((a*(a ast*a rkind)) list)) option =
      let sym2a : symvar -> a = g_iconv s.tbl in
      let a2sym : a -> symvar = g_conv s.tbl in
      let tolhsexpr lh : symexpr =
        OpN(Function(lhsfunvar()), [Symbol(lh)] )
      in
      let gen_subexpr (lhs:a) (rhs:a ast): symexpr =
        let lhsexpr :symexpr = tolhsexpr (a2sym lhs) in
        (*all the rels but this one*)
        let rhsexpr :symexpr = ASTLib.to_symcaml rhs a2sym in
        (*TODO: create one with substitutions, one without*)
        let fxn : symexpr= match  is_deriv s lhs with
        | Some(ICVar(init_cond)) ->
            let icexpr = ASTLib.to_symcaml (Term init_cond) a2sym in 
            OpN(Function(dfunvar()),[lhsexpr;rhsexpr;icexpr])
        | None -> OpN(Function(funvar()),[lhsexpr;rhsexpr])
        in
        fxn
      in
      (*declare intermediate functions*)
      let _ = decl_func s (funvar()) in
      let  _ = decl_func s (dfunvar()) in
      let _ = decl_func s (lhsfunvar()) in
      (*ban the target expression from the rest variable*)
      let bantargexpr : symexpr list= [tolhsexpr (a2sym targvar)] in
      let banmvexpr : symexpr list = MAP.fold targs (fun lhs rhs lst -> (tolhsexpr (a2sym lhs))::lst) [] in   
      let _ = _print_debug (">rest: in templ ban-expr: "^(LIST.tostr SymCaml.expr2str " "bantargexpr)) in
      let _ = _print_debug (">rest: in targ ban-expr: "^(LIST.tostr SymCaml.expr2str " "banmvexpr)) in
      let _ = decl_wild s (restvar2()) banmvexpr in 
      let _ = decl_wild s (restvar()) bantargexpr in
      (*determine input and output vars*)
      let outs,ins,locals = compute_vars s templs in
      (*create assignment*)
      let gen_asgn (v:a) : symexpr =
          let rhs = MAP.get templs v in
          gen_subexpr v rhs
      in
      (*generate the experssion for unification*)
      let gen_overall_expr (rels:(a, a ast) map) is_templ : symexpr=
        (*get args an enables *)
        let rels = MAP.fold rels (fun (lhs:a) (rhs:a ast) (rexpr) ->
          (*if it is a target expression generation, or part of the subset *)
            if SET.has (g_subset s) lhs || is_templ = false then
                let expr = gen_subexpr lhs rhs in
                   expr::rexpr
          (*if not, skip this element*)
          else
                rexpr
        ) []
        in
        if is_templ then
          OpN(Add,Symbol(restvar())::rels)
        else
          (*the assigns are the hardware relations*)
          let asgns = SET.map locals (fun v -> gen_asgn v) in
          (*OpN(Add,Symbol(restvar2())::rels)*)
          OpN(Add,rels)
      in
      let _ = _print_debug ("ALLOWED VARS: "^(SET.tostr (g_subset s) a2sym "; ")) in
      let templ_expr = gen_overall_expr templs true in
      let targ_expr = gen_overall_expr targs false in
      let _ = _print_debug ("#unify <"^(a2sym targvar)^">\n  templ:\n"^(SymCaml.expr2str templ_expr)^"\n\n  targ:\n"^(SymCaml.expr2str targ_expr)^"\n") in
      
      let maybe_assigns = try 
              SymCaml.pattern (g_sym s.tbl) targ_expr templ_expr 
              with PyCamlWrapperException(_) -> None 
      in
      match maybe_assigns with
      | Some(assigns) ->
        let assigns,solved,remaining = assigns2state s templs targs  assigns in
        Some(assigns,solved,remaining)
      | None ->
        let _ = _print_debug "no assigns found" in
        None

  let add_assignment_node (type a) (s:a runify) curs (assigns:(a,a ast) map)
      (solved: (a*(a ast*a rkind)) list) (unused:(a*(a ast*a rkind)) list) =
    let _ = SearchLib.move_cursor s.search s.tbl curs in
    let _ = SearchLib.start s.search in
    let _ = SearchLib.add_step s.search (RSetState(mkstate assigns (MAP.from_list solved) (MAP.from_list unused))) in
    let node = SearchLib.commit s.search s.tbl in
    let _ = SearchLib.solution s.search node in
    ()

  let solve_node (type a) (s:a runify) (tvar:a) =
    let v2str = s.tbl.tostr in
    let e2str x = ASTLib.ast2str x v2str in
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let proc_one () =
      match unify s templs targs tvar with
      | Some(assigns,solved,unused) ->
        if LIST.empty solved then () else
        let _ = add_restrictions s curs assigns in
        let _ = add_assignment_node s curs assigns solved unused in
        ()
      | None ->
        SearchLib.deadend s.search curs s.tbl;
        ()
    in
    FUN.iter_n proc_one 1

  let rec get_best_valid_node (type a) (sr:a runify) (root:(a rnode) option)  : (a rnode) option =
    let nnode =  SearchLib.select_best_node sr.search root in
    nnode

  (*select the next node to solve*)
  let solve (type a) (sr:a runify) (root:a rnode) (targvar:a) (n:int) =
    let sysmenu,usrmenu = mkmenu sr in
    let rec _solve () =
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
        let _ =  SearchLib.deadend sr.search curs sr.tbl in
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
    let _ = _solve () in
    (*let _ = sysmenu "t" in*)
    ()


  let build_tree (type a) (s:a runify) (root: a rnode): unit =
    let curs = root in
    let _ = List.iter (fun subst ->
      let _ = SearchLib.start s.search in
      let steps = SearchLib.add_step s.search (RTemplSubgraph subst) in
      let n = SearchLib.commit s.search s.tbl in
      ()
    ) s.tbl.templ.subtrees
    in
    ()

  (*also fill in unused*)
  let get_slns (type a) (s:a runify) : a fusion set =
    let env2fuses (s:a runify) : (a fuse) list =
      let state = OPTION.force_conc s.tbl.st.state in
      let arr = [] in
      let arr = MAP.fold state.assigns (fun lhs rhs q -> USAssign(lhs,rhs)::q)  arr in
      let arr = MAP.fold state.solved (fun lhs (rhs,_) q -> USRmGoal(lhs,rhs)::q) arr in 
      let arr = MAP.fold state.unused (fun lhs (rhs,_) q -> USAddRel(lhs,rhs)::q) arr in 
      arr
      (*add all assignments in fusion.*)
    in
    let node2fusion (node: (a rstep) snode) : a fusion =
        let _ = _print_debug ("node: "^(string_of_int node.id)) in         
        let _ = SearchLib.move_cursor s.search s.tbl node in
        let fsn = SET.make_dflt () in
        let _ = SET.add_all fsn (env2fuses s) in
        let fsns : a fusion = SET.to_list fsn in
        fsns

    in
    let slns  = SearchLib.get_solutions s.search None in
    let allslns = List.map (fun n -> node2fusion n) slns in
    SET.from_list allslns

  let print_fuse (type a) (tostr:a->string) (f:a fuse) = match f with
    | USAddRel(lhs,rhs) -> "add rel "^(tostr lhs)^" = "^(ASTLib.ast2str rhs tostr)    
    | USRmGoal(vr,rhs) -> "rm goal "^(tostr vr) ^" = "^(ASTLib.ast2str rhs tostr)       
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
    (iswc:a->bool) (cnv:a->symvar) (icnv:symvar -> a)
    (freshvar:int->unifytype->a)
    (tostr:a->string)
     =
    (*make the search tree*)
    let root,smeta = mksearch targvar tmpl targ iswc cnv icnv freshvar tostr in
    (*build a tree for the particular set of goals*)
    let _ = build_tree smeta root  in
    (*let _ = build_tree smeta root (None) in*)
    (*solve a thing*)
    let ncmp = n*(List.length tmpl) in 
    let _ = solve smeta root targvar ncmp in
    let _ = _print_debug "=== Done with Relation Search ===" in
    let slns = get_slns smeta in
    let rep = print_fusions 1 smeta.tbl.tostr slns in
    let _ = _print_debug "=== SOLUTIONS ===" in
    let _ = _print_debug rep in
    let _ = _print_debug "=================" in
    slns

end
*)
