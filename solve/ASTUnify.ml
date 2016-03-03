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
  let g_dof s = s.st.ndeg

  let g_info s k = if k = UTypTarg then
    s.targ
  else
    s.templ

  let g_sym s = s.env.s
  let g_conv s = s.env.cnv
  let g_iconv s = s.env.icnv
  let g_search s = s.search

  let ret (type a) (type b) (x:a) (r:b) = let _ = x in r




  let unifytype2str u = match u with
  | UTypTempl -> "templ"
  | UTypTarg -> "targ"

  let step2str (type a) tostr (a:a rstep) = match a with
  | RSetAssigns(lst) ->
    let res : string =
      LIST.fold lst (fun ((lhs,rhs):(a*a ast)) (rest:string) -> rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  ") ""
    in
    "+asgn "^res
  | RBanAssign(lhs,rhs) -> "-asgn"^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)
  | RAddDOF -> "+df"

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
  | RAddDOF -> ret (s.st.ndeg <- s.st.ndeg + 1) ()
  in
  s

  let unapply_step (type a) (s:a rtbl) (st:a rstep) =
  let _ = match st with
    | RSetAssigns(lst) -> ret (MAP.clear s.st.assigns) ()
    | RBanAssign(lhs,rhs) -> ret (rm_ban s lhs rhs) ()
    | RAddDOF -> ret (s.st.ndeg <- s.st.ndeg - 1) ()
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
      { info=MAP.make ()}
    in
    (*create environment*)
    let state = {
      assigns = MAP.make ();
      bans = MAP.make ();
      ndeg = 0;
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
      let r = bans::r in
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


  let var2enable (type a) (s:a runify) (v:a) =
    "EN_"^(g_conv s.tbl v)

  let restvar () =
    "REST"

  let is_rest v =
    "REST" = v

  let is_enable v =
    STRING.startswith v "EN_"

  let enable2var s (v:string) =
    let q = STRING.removeprefix v "EN_" in
    g_iconv s.tbl q

  let funvar () =
    "F"

  let dfunvar () =
    "DF"

  let dofvar () =
    "DOF"

  let dofbanvar () =
    "DOFBAN"

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
    let decl_wild v bans =
      let _ = SymCaml.define_wildcard (g_sym s.tbl) v bans in ()
    in
    let decl_sym v = let _ =
      SymCaml.define_symbol (g_sym s.tbl) v in ()
    in
    let decl_func x =
      let _ = SymCaml.define_function (g_sym s.tbl) x in ()
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
      let _ = if iswc then
        let sw_name = var2enable s v in
        let _ = decl_wild sw_name [] in
        ()
      in
      let _ = spy_print_debug ("ENV add: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str rhs s.tbl.tostr)^"") in
      ()
    in
    (*define default values*)
    let _ = decl_func (funvar()) in
    let _ = decl_func (dfunvar()) in
    let _ = decl_func (dofvar()) in
    let _ = decl_sym (dofbanvar()) in
    let _ = decl_wild (restvar()) [Symbol(dofbanvar())] in
    (*add original variables*)
    let _ = MAP.iter (g_info s.tbl UTypTarg).info (fun v data ->add_expr scratch_targ v data.rhs false true) in
    let _ = MAP.iter (g_info s.tbl UTypTempl).info (fun v data ->add_expr scratch_templ v data.rhs true true) in
    (*declare variables*)
    let _ = SET.iter sym_vars (fun x -> decl_sym x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild x bans) in
    (scratch_templ,scratch_targ)

  let is_deriv (type a) (s:a runify) (v:a) =
    if MAP.has s.tbl.templ.info v then
      (MAP.get s.tbl.templ.info v).kind = RKDeriv
    else
      (MAP.get s.tbl.targ.info v).kind = RKDeriv

  (*unify the two components*)
  let unify (type a) (s:a runify) (templs) (targs) : (a set*a set*a set*(a,a ast) map) option =
      (*calculate how many bound switches you have*)
      let switches = MAP.fold templs (fun lhs rhs lst  -> (var2enable s lhs)::lst) [] in
      let nbound = (List.length switches) - (g_dof s.tbl) in
      if nbound <= 0 then
        None
      else
        let sym2a : symvar -> a = g_iconv s.tbl in
        let a2sym : a -> symvar = g_conv s.tbl in
        let gen_subexpr (lhs:a) (rhs:a ast) is_templ: symexpr=
          let en : string = var2enable s lhs in
          let fxn : a ast= if is_deriv s lhs then
              OpN(Func(dfunvar()),[Term(lhs);rhs])
            else
              OpN(Func(funvar()),[Term(lhs);rhs])
          in
          let fxn = ASTLib.to_symcaml fxn a2sym in
          if is_templ then
            OpN(Mult,[Symbol(en);fxn])
          else
            fxn
        in
        let gen_overall_expr (m:(a, a ast) map) is_templ : symexpr=
          (*get args an enables *)
          let args = MAP.fold m (fun k v (rexpr) ->
            let expr = gen_subexpr k v is_templ in
            expr::rexpr
          ) []
          in
          if is_templ then
            let sswitches : symexpr list = List.map (fun x -> Symbol(x)) switches in
            let dofexpr : symexpr = OpN(Function(dofvar()),[Symbol(dofbanvar());OpN(Add,sswitches)]) in
            OpN(Add,Symbol(restvar())::dofexpr::args)
          else
            let dofexpr : symexpr = OpN(Function(dofvar()),[Symbol(dofbanvar());Integer(nbound)]) in
            OpN(Add,dofexpr::args)
        in
        let templ_expr = gen_overall_expr templs true in
        let targ_expr = gen_overall_expr targs false in
        let _ = _print_debug ("#unify\n  templ: "^(SymCaml.expr2str templ_expr)^"\n  targ: "^(SymCaml.expr2str targ_expr)^"\n") in
        let maybe_assigns = SymCaml.pattern (g_sym s.tbl) targ_expr templ_expr in
        match maybe_assigns with
        | Some(assigns) ->
          let extract_lhses ast =
            let _extract (node:a ast) vlst: a list =
              match node with
              | OpN(Func(_), Term(lhs)::t) -> (lhs::vlst)
              | _ -> vlst
            in
            ASTLib.fold ast _extract []
          in
          let _ = _print_debug "<!> found assigns" in
          let mp = MAP.make () in
          let rest = SET.make_dflt () in
          let disabled = SET.make_dflt () in
          let enabled = SET.make_dflt () in
          let _ = List.iter (fun ((l,r):symvar*symexpr) ->
            if is_rest l then
              let ar : a ast = ASTLib.from_symcaml r sym2a in
              let _ = _print_debug ("REST: "^(ASTLib.ast2str ar a2sym)) in
              let ignored = extract_lhses ar in
              let _ = List.iter (fun x -> return (SET.add rest x) ()) ignored in
              ()
            else if is_enable l then
              let vr = enable2var s l in
              let _ = match r with
              | Integer(1) -> SET.add enabled vr
              | Integer(0) -> SET.add disabled vr
              | _ -> error "is_enable" "unexpected"
              in
              ()
            else
              let al : a = sym2a l in
              let ar : a ast = ASTLib.from_symcaml r sym2a in
              let _ = _print_debug (" assign: "^(s.tbl.tostr al)^"="^(ASTLib.ast2str ar s.tbl.tostr)) in
              let _ = MAP.put mp al ar in
              ()
          ) assigns
          in
          Some(disabled,enabled,rest,mp)
        | None ->
          let _ = _print_debug "no assigns found" in
          None

  let solve_node (type a) (s:a runify) =
    let v2str = s.tbl.tostr in
    let e2str x = ASTLib.ast2str x v2str in
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let proc_one () =
      match unify s templs targs with
      | Some(disable, enable, rest, assigns) ->
        let _ = SET.iter disable (fun x -> _print_debug ("templ-disable:"^(v2str x))) in
        let _ = SET.iter enable (fun x -> _print_debug ("templ-enable:"^(v2str x))) in
        let _ = SET.iter rest (fun x -> _print_debug ("targ-rest:"^(v2str x))) in
        let _ = MAP.iter assigns (fun k v -> _print_debug ("assign: "^(v2str k)^" = "^(e2str v))) in
        let _ = _print_debug "--------------------\n" in
        (*add a bunch of branches of what ifs*)
        (*let _ = add_restrictions s curs vtempl vtarg assigns in
        let _ = add_assignment_node s curs templs targs vtempl vtarg assigns in
        *)
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
  let solve (type a) (sr:a runify) (root:a rnode) (n:int) =
    let rec _solve () =
      let sysmenu,usrmenu = mkmenu sr in
      let _ = usrmenu () in
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
          let _ = usrmenu () in
          let _ = solve_node sr in
          let _ = _print_debug "== Solution Node ==" in
          let _ = usrmenu () in
          let _ = _mnext () in
          ()
    in
    _solve ()


  let build_tree (type a) (s:a runify) (root: a rnode) (gl: a option): unit =
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
    let _ = solve smeta root n in
    let _ = _print_debug "=== Done with Relation Search ===" in
    let slns = get_slns smeta in
    let rep = print_fusions 1 smeta.tbl.tostr slns in
    let _ = _print_debug "=== SOLUTIONS ===" in
    let _ = _print_debug rep in
    let _ = _print_debug "=================" in
    slns

end
