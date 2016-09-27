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
let debug : string -> unit =_print_debug  
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


  let kind2str (type a) (tostr:a->string) (k:a rkind) = match k with
    |RKFunction -> "fxn"
    |RKDeriv(q) -> "state("^(UnivLib.icond2str q tostr)^")"

  let state2str (type a) (tostr:a ->string) (a:a asgn_state) = 
        let assgn : string =
                MAP.fold a.assigns (fun lhs rhs (rest:string) -> 
                        rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  "
                ) ""
        in
        let unused: string =
          MAP.fold a.unused (fun lhs (rhs,knd) (rest:string) -> 
                     rest^(kind2str tostr knd )^" "^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^" "
                ) ""
        in
        let slved : string = 
          MAP.fold a.solved (fun (lhs:a) ((rhs,knd):(a ast)*(a rkind)) rest ->
              rest^(kind2str tostr knd )^" "^(tostr lhs)^"="^(ASTLib.ast2str rhs tostr)^" "
            ) ""
        in
        assgn^unused^slved
  
  let mkstate (type a) asgns solved resolved unused = 
        {assigns=asgns; solved=solved; resolved=resolved; unused=unused}

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


 let rm_ban (type a) (s:a rtbl) (lhs :a) (rhs:a ast) =
    let bans = (g_bans s) in
    if MAP.has bans lhs = false then
      error "unapply_step" "cannot remove a non-existent ban"
    else
      let bans = MAP.get bans lhs in
      SET.rm bans rhs;
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
                      
  let score_bans env steps : sscore = 
    let delta = LIST.fold steps (fun x r -> match x with
                              | RBanAssign(lhs,rhs) -> 1+(ASTLib.size rhs)+r
                              | _ -> r
                    ) 0
    in
    let state = 0. in
    SearchLib.mkscore (float_of_int delta) state

  let get_score ()  =
    match get_glbl_string "uast-selector-branch" with
    | "uniform" -> score_uniform
    | "random" -> score_random
    | "bans" -> score_bans

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
    let mkverb (s:a runify) (x:a rinfo) =
      let mvars : (a set) set= SET.make () in
      let _ = MAP.iter x.info (fun k d -> return (SET.add mvars (SET.from_list [k])) ()) in
      let _ = x.subtrees <- SET.to_list mvars in
      let _ = x.nodep <- x.info in
      ()
    in
    mkverb strct strct.tbl.templ;
    mkverb strct strct.tbl.targ;
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
 
  (*apply the state to syncaml*)
  let apply_state (type a) (s: a runify) : ((a, a ast*a rkind) map)*((a, a ast*a rkind) map) =
    let var2symvar = g_conv s.tbl in
    let expr2symexpr x : symexpr = ASTLib.to_symcaml x (g_conv s.tbl) in
    (*calculate how many bound switches you have*)
    let decl_wild (v:symvar) (bans:symexpr list) =
        let ban_str = LIST.fold bans (fun x str -> str^","^(SymExpr.expr2str x)) v in 
        let _ = spy_print_debug ("[env][decl] wild "^(v)^" != "^ban_str) in
        let _ = SymCaml.define_wildcard (g_sym s.tbl) v bans in ()
    in
    let decl_sym (v:symvar) = let _ =
        let _ = spy_print_debug ("[env][decl] sym "^(v)) in
        SymCaml.define_symbol (g_sym s.tbl) v in ()
    in
    let _ = spy_print_debug "[env] == state ===" in
    let _ = SymCaml.clear (g_sym s.tbl) in
    (*let _ = SymCaml.set_debug (g_sym s.tbl) true in*)
    (*create replacement tables*)
    let add_wild (set:(symvar*(symexpr list)) set) (v:a) =
      let bans =
        if MAP.has (g_bans s.tbl) v then
          let bans = SET.map (MAP.get (g_bans s.tbl) v) (fun x -> x) in
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
      let _ = MAP.put scratch v (rhs,kind) in
      let _ = spy_print_debug ("ENV add: "^(s.tbl.tostr v)^" = "^(ASTLib.ast2str rhs s.tbl.tostr)^"") in
      ()
    in
    (*define default values*)
    (*add original variables*)
    let _ = MAP.iter (g_info s.tbl UTypTarg).info (fun v data ->add_expr scratch_targ v data.rhs data.kind  false true) in
    let _ = MAP.iter (g_info s.tbl UTypTempl).nodep (fun v data ->add_expr scratch_templ v data.rhs data.kind true true) in
    (*declare variables*)
    let _ = SET.iter sym_vars (fun x -> decl_sym  x) in
    let _ = SET.iter wc_vars (fun (x,bans) -> decl_wild  x bans) in
    (scratch_templ,scratch_targ)
  
  (*determine if a variable is a derivative of not*)
  type 'a rel_type = 
    | RTDeriv of ('a ast)*('a init_cond)
    | RTFunct of 'a ast
    | RTNoRel 
  
  let rel_type_to_str (type a) (rel: a rel_type) = match rel with 
    | RTDeriv(_,ICVal(_)) -> "deriv_value"
    | RTDeriv(_,ICVar(_)) -> "deriv_var"
    | RTFunct(_) -> "fxn"
    | RTNoRel(_) -> "rel" 

  let get_var_kind (type a) (s:a runify) (v:a) : (a rel_type) =
    let _get_var_kind k r = match k with 
    |RKDeriv(ic) -> RTDeriv(r,ic)
    | _ -> RTFunct(r)
    in
    if MAP.has s.tbl.templ.info v then
      let var_info = MAP.get s.tbl.templ.info v in
      _get_var_kind var_info.kind var_info.rhs
    else if MAP.has s.tbl.targ.info v then
      let var_info = MAP.get s.tbl.targ.info v in 
      _get_var_kind var_info.kind var_info.rhs
    else
      RTNoRel 

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




  (*unify the two components*)
  let unify_term (type a) (s:a runify) (assigns:((a,a ast) map) list) (templ_expr: a ast) (targ_expr:a ast) (asgns:a initial_assign list):((a,a ast) map) option =
      let decl_fxn x =
        let _ = SymCaml.define_function (g_sym s.tbl) x in ()
      in
      (*convenience functions*)
      let v2str = s.tbl.tostr in
      let e2str x = ASTLib.ast2str x v2str in
      let sym2a : symvar -> a = g_iconv s.tbl in
      let a2sym : a -> symvar = g_conv s.tbl in
      let aexp2symexp (e:a ast) : symexpr = ASTLib.to_symcaml (ASTLib.subs e (assigns)) a2sym in 
      let avar2symexp (v:a) : symexpr = aexp2symexp (Term v) in
      (**
       *
       **)
      (*make the initial set of assigns*)
      let assertions_templ :symexpr set= SET.make_dflt() in
      let assertions_targ :symexpr set= SET.make_dflt() in
      let add_one_initial_assign asgn : unit =
        let fxnid :symvar= "IA"^(string_of_int (SET.size assertions_templ)) in
        decl_fxn fxnid;
        match asgn with 
        | INVarAssign(templvar,targvar) ->
          begin
            SET.add assertions_templ (OpN(Function(fxnid),[avar2symexp templvar]));
            SET.add assertions_targ (OpN(Function(fxnid),[avar2symexp targvar]));
            ()
          end
        | INExprAssign(templvar,targexpr) ->
          begin
          SET.add assertions_templ (OpN(Function(fxnid),[avar2symexp templvar]));
          SET.add assertions_targ (OpN(Function(fxnid),[aexp2symexp targexpr]));
          ()
          end
      in
      List.iter (fun asgn -> add_one_initial_assign asgn) asgns;
      let fxnid = "MTCH" in
      decl_fxn fxnid;
      SET.add assertions_templ (OpN(Function(fxnid),[aexp2symexp templ_expr]));
      SET.add assertions_targ (OpN(Function(fxnid),[aexp2symexp targ_expr]));
      (*convert to an expression with all the assignments applied*)
      (*get the constrained templ and targ expressions*)
      let templ_expr : symexpr = OpN(Add,SET.to_list assertions_templ) in 
      let targ_expr : symexpr = OpN(Add,SET.to_list assertions_targ) in 
      (*generate the experssion for unification*)
      (*SymCaml.set_debug (g_sym s.tbl) true;*) 
      _print_debug ("#unify <?>\n  templ:\n"^
               (SymCaml.expr2str templ_expr)^"\n\n  targ:\n"^(SymCaml.expr2str targ_expr)^"\n");
      (*attempt unification*)
      let maybe_assigns = try 
              SymCaml.pattern (g_sym s.tbl) targ_expr templ_expr 
              with PyCamlWrapperException(_) -> 
                let _ = warn "[unify_term][exception] python exception" in
                None 
      in
      let nassigns = MAP.make() in
        (*convert the assignments to canonical assignments*)
        match maybe_assigns with 
        |Some(lst) ->
            LIST.iter (fun ((l,r):string*symexpr) -> 
                        ret (MAP.put nassigns (sym2a l) (ASTLib.from_symcaml r sym2a)) ()) lst;
            _print_debug ("---assigns---\n"^(MAP.str nassigns v2str e2str));
            Some(nassigns)
        |None -> 
            _print_debug "[unify_term][pattern]: <no solution>";
            None 
  
 
 
  let mk_entanglement templ_var targ_var templ_expr targ_expr assignments =
    {
      templ_var = templ_var;
      templ_expr = templ_expr;
      targ_var=targ_var;
      targ_expr=targ_expr;
      assignments=assignments
    }
  
  let mk_tvar_entanglement templs templ_var targ_var_maybe asgn_rhs assignments = 
    let templ_expr = MAP.get templs templ_var in 
    mk_entanglement templ_var targ_var_maybe templ_expr asgn_rhs assignments

  let resolution_of_entanglement (type a) (e:a entanglement) : a resolution =
    {templ_var = e.templ_var; templ_expr = e.templ_expr; targ_var = e.targ_var; targ_expr = e.targ_expr}
  
  let resolves_entanglement (type a) s (rslv:a resolution) (entang:a entanglement) =
    let v2str : a -> string= s.tbl.tostr in
    let e2str x :string = ASTLib.ast2str x v2str in
    debug ("resolution "^(v2str rslv.templ_var)^"="^(e2str rslv.templ_expr)^" with "^
          (v2str rslv.targ_var)^"="^(e2str rslv.targ_expr));
    rslv.templ_var = entang.templ_var && rslv.targ_var = entang.targ_var &&
    rslv.templ_expr = entang.templ_expr && rslv.targ_expr = entang.targ_expr 

  (*Convert the set of assignments to a set of goals. They should be all input assignment 
  goals or output goals. You can either add a fact over an output port or a goal over an
  input port.*)
  let goals_of_assignments (type a) s (templs:(a,a ast) map) (targs:(a,a ast) map) (assigns:(a,a ast) map list) = 
    ()

  (*resolve unification*)
  type 'a unification_status =
    | USTUnified of ('a,'a ast) map*'a resolution list
    | USTUnresolvable of ('a,'a ast) map
    | USTUnUnifiable

  (*find if there are any entanglements, and if there are, resolve them*)  
  (*an entanglement is an assignment whose left hand side (and sometimes right hand side)
   is already defined*)
  let find_entanglements (type a) s (templs:(a,a ast*a rkind) map) (targs:(a,a ast*a rkind) map) (assigns:(a,a ast) map list) 
      (new_assigns:(a,a ast) map) (resolved:a resolution list) :
    ((a*a ast) list)*(a entanglement list)=
    let assign_list : a initial_assign list= LIST.fold assigns 
                        (fun assign lst -> MAP.fold assign (fun lhs rhs l-> INExprAssign(lhs,rhs)::l) lst) 
                        []
    in 
    let v2str : a -> string= s.tbl.tostr in
    let e2str x :string = ASTLib.ast2str x v2str in
    let report_entangle av ae tv te : string = 
        (v2str av)^"="^(e2str ae)^" & "^(v2str tv)^"="^(e2str te)
    in
    (* check if a new assignment triggers a new entanglement *)
    let is_already_resolved entang = 
      let matches = 
        List.filter (fun rslvd -> resolves_entanglement s rslvd entang) resolved
      in
      debug ("> [RSLV?] Resolution Check"^
               "\n  "^(report_entangle entang.templ_var entang.templ_expr entang.targ_var entang.targ_expr)^
               "\n  "^
               (string_of_int (List.length matches))^"/"^
               (string_of_int (List.length resolved))^" existing resolutions");
      if List.length matches > 0 then
        begin
        debug ("[RSLV] Resolved! Ignoring conflict...\n");
        true
        end
      else
        false
    in
    let get_maybe_entangled asgn_lhs asgn_rhs : ((a*a ast) option)*(a entanglement option) = 
      (*if the dynamics of the template variable is defined*)
      let templ_kind = get_var_kind s asgn_lhs in
      let templ_lhs : a= asgn_lhs in 
      (*if the template expression has dynamics, and is not a dangling input*) 
      match asgn_rhs with
         (*if it's a variable-variable assignment*)
         | Term(targ_var_lhs) -> 
            let targ_kind = get_var_kind s targ_var_lhs in
            begin
            match templ_kind, targ_kind with
            (*the template and the target are both derivatives, 
            and the assignment is an x=y assignment*)
            | RTDeriv(templ_rhs,ICVar(templ_ic)),RTDeriv(targ_rhs,ICVal(targ_ic)) -> 
              (*the template and target are both defined, and the assignment
               is an x = y assignment. This is a conflict*)
               (*this invocation creates an entanglement between v and the lhs and initial assignemnts *)
              begin
                 let targ_ic_node : a ast = match targ_ic with
                   | Integer(i) -> Integer(i)
                   | Decimal(d) -> Decimal(d)
                 in
                 debug ("> [CONFLICT] variable-variable conflict between derivatives"^
                        "\n  "^(report_entangle templ_lhs templ_rhs targ_var_lhs targ_rhs)^"");
                 (*return a new entanglement  as well as new assignments*)
               None,Some(mk_entanglement templ_lhs targ_var_lhs templ_rhs targ_rhs 
                   (INExprAssign(templ_ic,targ_ic_node)::INVarAssign(asgn_lhs,targ_var_lhs)::assign_list))
               end
            | RTFunct(templ_rhs), RTFunct(targ_rhs) -> 
               (*the template var is an input port, and the target var is an input*)
               begin
               debug ("[CONFLICT] variable-variable conflict between functions"^
                        "\n  "^(report_entangle templ_lhs templ_rhs targ_var_lhs targ_rhs)^"");
               None,Some(mk_entanglement templ_lhs targ_var_lhs templ_rhs targ_rhs 
                   (INVarAssign(asgn_lhs,targ_var_lhs)::assign_list))
               end
            (*input var, input port. Simple assignment with no entanglements.*)
            | RTNoRel, RTNoRel -> 
               begin
               debug ("[OK] no conflict between input-input"^
                        "\n  "^(v2str templ_lhs)^" & "^(v2str targ_var_lhs)^") --");
               None,None
               end
            (*the template var is an input port, and the target var is an 
            output. no conflict. Can either rebuild expression or link variable*)
            | RTNoRel, RTFunct(targ_rhs) -> 
               begin
               debug ("[OK] no conflict between input port and output targ var"^
                      "\n  "^(v2str templ_lhs)^" & "^(v2str targ_var_lhs)^"="^(e2str targ_rhs)^"");
               None,None
               end
            (*the template var is an input port, and the target var is a derivative. 
            no conflict. The variable must be linked from the definition*)
            | RTNoRel, RTDeriv(targ_rhs,ICVal(targ_ic)) -> 
               begin
               debug ("[OK] no conflict between input port and output targ var(deriv)"^
                      "\n  "^(v2str templ_lhs)^" & "^(v2str targ_var_lhs)^"="^(e2str targ_rhs)^"");
               None,None
               end
            (*the template variable is an output port, and the target var 
            is an input. unresolvable.*)
            | RTFunct(_),RTNoRel -> 
               begin
               debug ("[UNFIXABLE] unfixable conflict between output port fxn and input targ var"^
                        "\n  "^(v2str templ_lhs)^" with "^(v2str targ_var_lhs));
               Some(asgn_lhs,asgn_rhs),None 
               end
            | RTDeriv(_,ICVar(_)),RTNoRel -> 
               begin
               debug ("[UNFIXABLE] unfixable conflict between output port deriv and input targ var"^
                        "\n  "^(v2str templ_lhs)^" with "^(v2str targ_var_lhs));
               Some(asgn_lhs,asgn_rhs),None 
               end

            (*misassigning derivatives to functions*)
            | RTFunct(_),RTDeriv(_,ICVal(_)) -> 
               begin
               debug ("[UNFIXABLE] unfixable conflict between port variable function and derivative"^
                        "\n  "^(v2str templ_lhs)^" with "^(v2str targ_var_lhs));
               Some(asgn_lhs,asgn_rhs),None
               end
            (*misassigning derivatives to functions*)
            | RTDeriv(_,ICVar(_)),RTFunct(_) -> 
               begin
               debug ("[UNFIXABLE] unfixable conflict between port variable derivative and function"^
                        "\n  "^(v2str templ_lhs)^" with "^(v2str targ_var_lhs));
               Some(asgn_lhs,asgn_rhs),None
               end
            | RTDeriv(_,ICVar(ica)),RTDeriv(_,ICVar(icb)) ->
               error "find_entanglements" ("[UNHANDLED] cannot have two variable initial conds "^
                                             "var "^(v2str templ_lhs)^" has ic "^(v2str ica)^" and "^
                                             "var "^(v2str targ_var_lhs)^" has ic "^(v2str icb))

            | a,b ->
               error "find_entanglements" ("[UNHANDLED] "^
                                             "var "^(v2str templ_lhs)^" has type "^(rel_type_to_str a)^" and "^
                                             "var "^(v2str targ_var_lhs)^" has type "^(rel_type_to_str b))
            end
            (*if the assigned variable is an output variable, unifying the variable is sufficient*)
         | asgn_rhs -> 
            begin 
            match templ_kind with 
            (*If there is a straight line function that defines the template variable dynamics, unifiable*)
            | RTFunct(templ_rhs) ->
               begin
               debug ("[CONFLICT] conflict between port expression and target variable"^
                      "\n  "^(report_entangle asgn_lhs asgn_rhs templ_lhs templ_rhs)^"");
               None,Some(mk_entanglement asgn_lhs templ_lhs templ_rhs asgn_rhs
                 (INExprAssign(templ_lhs,asgn_rhs)::assign_list))
               end
            (*cannot unify function variable with state variable*)
            | RTDeriv(_,ICVar(_)) ->
               begin
               debug ("[UNFIXABLE] unfixable conflict between function expression and port state variable"^
                      "\n  "^(v2str templ_lhs));
               Some(asgn_lhs,asgn_rhs),None
               end
            (*expression assign to an input port*)
            | RTNoRel ->
               begin
               debug ("[OK] no conflict between input port and expression"^
                        "\n  "^(v2str templ_lhs));
               None,None
               end
            end 
    in
    let unfixable,entangled = MAP.fold new_assigns (fun lhs rhs (unfix,tngl) ->  
           match get_maybe_entangled lhs rhs with
           | None,Some(new_entg) -> if is_already_resolved new_entg = true
             then unfix,tngl
             else unfix,new_entg::tngl
           | Some(new_unfix),Some(new_entg) -> if is_already_resolved new_entg = true
             then new_unfix::unfix,tngl
             else new_unfix::unfix,new_entg::tngl
           | Some(new_unfix),None -> new_unfix::unfix,tngl
           | None,None -> unfix, tngl
      ) ([],[]) in
    LIST.iter (fun (entang:a entanglement)  ->
        MAP.rm new_assigns entang.templ_var; ()) entangled;
    (unfixable,entangled) 

  let unify_terms (type a) (s:a runify) (templs:(a,a ast*a rkind) map) (targs:(a,a ast*a rkind) map) (templvar:a) (targvar:a) =
    let ban_list :(a*a ast) list = MAP.fold s.tbl.st.bans (fun (lhs:a) (rhs_set:a ast set) (lst:(a*a ast) list) ->
        SET.fold rhs_set (fun rhs _lst -> (lhs,rhs)::_lst) lst
      ) []
    in
    let rec _unify_terms (entanglements:(a entanglement) list) (assigns:((a,a ast) map) list) (resolved:((a resolution) list)) : a unification_status=
          (*find an entanglement*)
          match entanglements with
          | entang::t -> 
            (*attempt to resolve entanglement*)
            let maybe_new_assigns : (a,a ast) map option = 
              unify_term s assigns entang.templ_expr entang.targ_expr entang.assignments 
            in 
            begin 
            (*if this entanglement is is unifiable*)
            match maybe_new_assigns with
            |Some(new_assigns) ->
              (*resolve the entanglement*)
              let new_resolved = (resolution_of_entanglement entang)::resolved in 
              (*try and find any new entanglements*)
              let (unfixable,new_entangles) : ((a*a ast) list)*(a entanglement list)=
                find_entanglements s templs targs assigns new_assigns new_resolved
              in
              (*if we have no unfixable relations, recursively solve. If we are unfixable and haven't
              resolved anything, declare ununifiable. Otherwise declare unresolvable and add violations*)
              begin
              match List.length unfixable, List.length resolved with
              | 0,_ ->
                begin
                  debug "----------- Recursive Solve --------------";
                  _unify_terms (t @ new_entangles)
                              (new_assigns::assigns)
                              new_resolved
                end
              | _,0 ->
                begin
                  debug "----------- Terminal: Unfixable (nothing resolved) ------------";
                  USTUnUnifiable
                end
              | _,_ ->
                  if LIST.is_subset (ban_list) (unfixable) then
                    begin
                      debug "----------- Terminal: Unresolvable (already banned) -------";
                      USTUnUnifiable
                   end 
                  else
                    begin
                       debug "----------- Terminal: Unresolvable (learn from resolution history) ------------";
                       USTUnresolvable(MAP.from_list unfixable)
                    end
              end                
            | None ->
              begin
                debug "----------- Terminal: Unfixable (ununifiable) ------------";
                USTUnUnifiable
              end
            end   
            (*no more entanglements left*)
            | [] ->
             USTUnified(MAP.merge assigns,resolved)
            
    in
      let templexpr,_ = MAP.get templs templvar in 
      let targexpr,_ = MAP.get targs targvar in
      _unify_terms [(mk_entanglement templvar targvar templexpr targexpr [INVarAssign(templvar,targvar)])] [] []

  let add_assignment_node (type a) (s:a runify) curs
      (assigns:(a,a ast) map) (templs:(a,a ast*a rkind)map) (targs:(a,a ast*a rkind) map) (resolved:a resolution list) =
    let is_assignment_node_equivalent (steps:a rstep list) : bool =
      List.fold_left  (fun  (is_equiv:bool) (x:a rstep) -> match x with
          |RSetState(state) -> (MAP.same_membership state.assigns assigns) 
          | _ -> is_equiv
        ) false steps 
    in
    let solution_nodes : a rstep snode list = SearchLib.get_solutions s.search None in
    let matched_solution_nodes = List.filter (fun (n:a rstep snode) -> is_assignment_node_equivalent n.s) solution_nodes in
    let solved : (a,(a ast*a rkind)) map= MAP.make () in
    let unused : (a,(a ast*a rkind)) map= MAP.make () in 
    MAP.iter templs (fun v (e,k) -> return (MAP.put unused v (e,k)) ());
    SearchLib.move_cursor s.search s.tbl curs;
    SearchLib.start s.search;
    List.iter (fun (rslv:a resolution) ->
        (*remove math goals that are resolved by a resolution*)
        if MAP.has targs rslv.targ_var then
          noop (MAP.put solved rslv.targ_var (MAP.get targs rslv.targ_var));
        (*mark expressions as used*)
        if MAP.has templs rslv.templ_var then
          noop (SET.rm unused rslv.templ_var);
        ()
    ) resolved;
    SearchLib.add_step s.search (RSetState(mkstate assigns solved resolved unused));
    let node = SearchLib.commit s.search s.tbl in
    if List.length matched_solution_nodes > 0 then
      begin
        debug "this solution already exists in the tree. Terminating.";
        SearchLib.deadend s.search node s.tbl;
        ()
      end
    else
      SearchLib.solution s.search node;
      ()

  (*add restrictions of different fractions*)
  let add_restrictions (type a) (s:a runify) curs (assigns:(a,a ast) map) (branch_factor:float) : int = 
    let n_restrictions_added : int ref = REF.mk 0 in
    let frac_int x f = int_of_float (MATH.round_up (f*.(float_of_int x))) in
    let n_assigns :int = MAP.size assigns in
    let assign_list : (a*(a ast)) list = MAP.to_list assigns in
    let root = SearchLib.cursor s.search in
    (*add an assignment node *)
    let except lst (el,er) : (a*a ast) list= List.filter (fun (l,r) -> l != el && r != er) lst in
    let node_is_subset (subset:(a*a ast) list) (steps:a rstep list) =
        let node_restrict = LIST.fold steps
        (fun (step:a rstep) (lst:(a*a ast) list) -> match step with
        | RBanAssign(lhs,rhs) -> (lhs,rhs)::lst
        | _ -> lst) [] in
        if LIST.same_membership node_restrict subset then true else false
    in
    let rec make_subset nelems ntries =
      if ntries == 0 then None else
      let subset = LIST.random_weighted_subset (fun (lhs,rhs) -> ASTLib.size rhs) assign_list nelems in
      if List.length (SearchLib.filter_nodes s.search (fun n -> node_is_subset subset n = true)) > 0 then
        make_subset nelems (ntries-1)
      else Some subset
    in
    let add_assign (frac:float) =
      let n = frac_int n_assigns  frac in 
      noop (debug ("[restrict] adding "^(string_of_int n)^"/"^(string_of_int n_assigns)^" restrictions")); 
      match make_subset n 10 with
        |None ->
          noop (debug ("[restrict]   -> failure."));                           
          ()
        |Some(subset) ->
          noop (debug ("[restrict]   -> success!"));                           
          SearchLib.move_cursor s.search s.tbl root;
          SearchLib.start s.search;
          List.iter (fun (lhs,rhs) ->
              begin SearchLib.add_step s.search (RBanAssign(lhs,rhs)); () end
          ) subset;
          SearchLib.commit s.search s.tbl;
          REF.upd n_restrictions_added (fun q -> q+1);
          ()
    in
    let nbranches_1 = frac_int (MAP.size assigns) (branch_factor*.0.50) in
    let nbranches_25 = frac_int (MAP.size assigns) (branch_factor*.0.15) in 
    let nbranches_50 = frac_int (MAP.size assigns) (branch_factor*.0.35) in 
    debug ("[restricting] adding the following branches: 1%="^(string_of_int nbranches_1)^", "
           ^"25%="^(string_of_int nbranches_25)^" 50%="^(string_of_int nbranches_50)^".");
    MATH.countdown nbranches_1 (fun x -> add_assign 0.01);
    MATH.countdown nbranches_25 (fun x -> add_assign 0.25);
    MATH.countdown nbranches_50 (fun x -> add_assign 0.5);
    REF.dr n_restrictions_added

  let solve_node (type a) (s:a runify) (targvar:a) (templvar:a) =
    let v2str = s.tbl.tostr in
    let e2str x = ASTLib.ast2str x v2str in
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let branching_factor = Globals.get_glbl_float "uast-branch" in
    let proc_one () =
      match unify_terms s templs targs templvar targvar with
      | USTUnified(assigns,resolved) ->
        (*if LIST.empty solved then () else*)
        begin
        let nrestrictions = add_restrictions s curs assigns branching_factor in
        add_assignment_node s curs assigns templs targs resolved;
        debug ("[SUCCESS] successfully unified component and relation "^
        " and added "^(string_of_int nrestrictions)^" restrictions");
          _print_debug "--> Found Solution Node <--";
        ()
        end
      | USTUnresolvable(assigns) ->
        (*add restrictions. If there are no restrictions*)
        let nrestrict = add_restrictions s curs assigns branching_factor in
        begin
            assert(nrestrict > 0);
            debug ("=== [SOLVE-NODE][UNRESOLVABLE] failed to unify component and relation. "^
                   "Added "^(string_of_int nrestrict)^" restrictions");
            ()
        end
      | USTUnUnifiable ->
        begin
        SearchLib.deadend s.search curs s.tbl;
        debug "== [SOLVE_NODE][UNUNIFIABLE] failed to unify component and relation";
        ()
        end
    in
    FUN.iter_n proc_one 1

  let rec get_best_valid_node (type a) (sr:a runify) (root:(a rnode) option)  : (a rnode) option =
    let nnode =  SearchLib.select_best_node sr.search root in
    nnode

  (*select the next node to solve*)
  let solve (type a) (sr:a runify) (root:a rnode) (targvar:a) (n:int) =
    let sysmenu,usrmenu = mkmenu sr in
    let _mnext () =
        let maybe_next_node = get_best_valid_node sr (Some root) in
        match maybe_next_node with
        | Some(next_node) ->
            (*if we're going really deep*)
            let _ = SearchLib.move_cursor sr.search sr.tbl next_node in
            true 
        | None ->false 
    in
    let rec _solve () =
      let curs = SearchLib.cursor sr.search in
      let depth : int =  SearchLib.depth sr.search curs in
      if depth >= get_glbl_int "uast-depth" then
        begin
        SearchLib.deadend sr.search curs sr.tbl; 
        if _mnext () then
          begin
            _solve();
            ()
          end
        else
          ()
        end  
      else
        (*get the next node*)
        let nslns = SearchLib.num_solutions sr.search (Some root) in
        let _ = _print_debug ("# solutions: "^(string_of_int nslns)) in
        if nslns >= n then
         let _ = _print_debug "!--> Found Enough Solutions, Exiting <--!" in
         ()
        else
          let templvar = SET.singleton sr.tbl.st.subset in 
          solve_node sr targvar templvar;
          usrmenu ();
          if _mnext () then
            begin
            debug "--> Continuing Search <--";
            _solve () 
            end
          else
           debug "--> Finishing AST Search <--";
           ()
    in
    let _ = _mnext () in
    let _ = _solve () in
    (*let _ = sysmenu "t" in*)
    ()
  

  let build_tree (type a) (s:a runify) (root: a rnode): unit =
    let v2str = s.tbl.tostr in
    let curs = root in
    let _ = List.iter (fun subst ->
      SearchLib.start s.search;
      _print_debug ("subset : "^(SET.tostr subst v2str ""));
      SearchLib.add_step s.search (RTemplSubgraph subst);
      SearchLib.commit s.search s.tbl;
      ()
    ) s.tbl.templ.subtrees
    in
    ()

  (*also fill in unused*)
  let get_slns (type a) (s:a runify) : a fusion set =
    let env2fuses (s:a runify) : (a fuse) list =
      let state : a asgn_state= OPTION.force_conc s.tbl.st.state in
      let arr : a fuse list = [] in
      let cassigns = MAP.copy state.assigns in
      let arr = LIST.fold state.resolved (fun (rslv:a resolution) (q:a fuse list) ->
                                           MAP.rm cassigns rslv.templ_var;
                                           USAddRel(rslv.templ_var,rslv.targ_expr)::
                                           USAddRel(rslv.templ_var,Term(rslv.targ_var))::q
      ) arr in  
      let arr = MAP.fold cassigns (fun lhs rhs q -> USAssign(lhs,rhs)::q)  arr in
      let arr = MAP.fold state.solved (fun lhs (rhs,kind) q -> USRmGoal(lhs,rhs)::q) arr in 
      let arr = MAP.fold state.unused (fun lhs (rhs,kind) q -> USAddRel(lhs,rhs)::q) arr in 
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
    let root,stree = mksearch targvar tmpl targ iswc cnv icnv freshvar tostr in
    (*build a tree for the particular set of goals*)
    build_tree stree root;
    (*let _ = build_tree smeta root (None) in*)
    (*solve a thing*)
    let ncmp = n*(List.length tmpl) in 
    solve stree root targvar ncmp;
    _print_debug "=== Done with Relation Search ===";
    let _,usrmenu = mkmenu stree in
    usrmenu ();
    let slns = get_slns stree in
    let rep = print_fusions 1 stree.tbl.tostr slns in
    _print_debug "=== SOLUTIONS ===";
    _print_debug rep;
    _print_debug "=================";
    slns

end