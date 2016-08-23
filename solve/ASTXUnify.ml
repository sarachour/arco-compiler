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
                LIST.fold a.unused (fun ((lhs,rhs):(a*a ast)) (rest:string) -> 
                        rest^(tostr lhs)^":="^(ASTLib.ast2str rhs tostr)^"  "
                ) ""
        in
        let slved : string = 
                LIST.fold a.solved (fun (x,y) rest -> rest^" "^(tostr x)^"="^(ASTLib.ast2str y tostr)) " "
        in
        assgn^unused^slved
  
  let mkstate (type a) asgns solved unused = 
        {assigns=asgns; solved=solved; unused=unused}

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
                      
  let score_bans env steps : sscore = 
    let delta = LIST.fold steps (fun x r -> match x with
                              | RBanAssign(_) -> 1+r
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
(*
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
 *)

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
      | RKDeriv(Term(v)) -> addvar v 
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
  
  (*determine if a variable is a derivative of not*)
  type 'a rel_type = 
    | RTDerivValue of ('a ast)*float
    | RTDerivVar of ('a ast)*'a
    | RTFunct of 'a ast
    | RTNoRel 

  let get_var_kind (type a) (s:a runify) (v:a) : (a rel_type) =
    let _get_var_kind k r = match k with 
    |RKDeriv(Decimal(ic)) -> RTDerivValue(r,ic)
    |RKDeriv(Term(prt)) -> RTDerivVar(r,prt)
    |RKDeriv(_) -> error "get_var_kind" "must be a constant value"
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

  (*Extract the state of the solution from the assigns*)
  (*
  let assigns2state (type a) (s:a runify) (templs:(a,a ast) map) (templvar:a) (targs:(a,a ast) map) (targvar:a) (assigns:(string*symexpr) list) =
    (*return the unsolved state variables, as well as the unused hw vars *)
    let sym2a : symvar -> a = g_iconv s.tbl in
    let assign_map = MAP.make () in
    let unused_templs = MAP.keys templs in 
    LIST.iter assigns (fun (v,expr) ->
      let sym : a = sym2a v in
      let expr : a ast = ASTLib.map sym2a expr in
      if MAP.has sym templs then
            
    );
    (*mapped a single target variable*)
    (assign_map,SET.singleton targvar,unused_templs)
  *)


  type 'a initial_assign = 
    | INVarAssign of 'a*'a
    | INExprAssign of 'a*('a ast)
    | INTNoAssign



  (*unify the two components*)
  let unify_term (type a) (s:a runify) (assigns:((a,a ast) map) list) (templ_expr: a ast) (targ_expr:a ast) (asgns:a initial_assign list):((a,a ast) map) option =
      (*convenience functions*)
      let v2str = s.tbl.tostr in
      let e2str x = ASTLib.ast2str x v2str in
      let sym2a : symvar -> a = g_iconv s.tbl in
      let a2sym : a -> symvar = g_conv s.tbl in
      (**
       *
       **)
      (*make the initial set of assigns*)
      let nassigns = MAP.make () in
      let add_one_initial_assign asgn = 
        match asgn with 
        | INVarAssign(templvar,targvar) -> MAP.put nassigns templvar (Term targvar)
        | INExprAssign(templvar,targexpr) -> MAP.put nassigns templvar (targ_expr)
      in
      List.map add_one_initial_assign asgns;
      (*convert to an expression with all the assignments applied*)
      let aexp2symexp (e:a ast) : symexpr = ASTLib.to_symcaml (ASTLib.subs e (nassigns::assigns)) a2sym in 
      (*get the constrained templ and targ expressions*)
      let templ_expr : symexpr = aexp2symexp (templ_expr) in 
      let targ_expr : symexpr = aexp2symexp (targ_expr) in 
      (*generate the experssion for unification*)
      let _ = _print_debug ("#unify <?>\n  templ:\n"^(SymCaml.expr2str templ_expr)^"\n\n  targ:\n"^(SymCaml.expr2str targ_expr)^"\n") in
      (*attempt unification*)
      let maybe_assigns = try 
              SymCaml.pattern (g_sym s.tbl) targ_expr templ_expr 
              with PyCamlWrapperException(_) -> None 
      in
        (*convert the assignments to canonical assignments*)
        match maybe_assigns with 
        |Some(lst) ->
            LIST.iter (fun ((l,r):string*symexpr) -> 
                        ret (MAP.put nassigns (sym2a l) (ASTLib.from_symcaml r sym2a)) ()) lst;
            _print_debug (MAP.str nassigns v2str e2str);
            Some(nassigns)
        |None -> 
            _print_debug "<no solution>";
            None 
  
 
  (*an entanglement*)
  type 'a entanglement = {
      templ_var : 'a;
      targ_expr : 'a ast;
      targ_var : 'a;
      templ_expr: 'a ast;
      assignments: 'a initial_assign list;
  }
  (*resolved entanglement*)
  type 'a resolution = {
      templ_var : 'a;
      targ_expr : 'a ast;
      templ_expr: 'a ast; 
  }
 
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
    {templ_var = e.templ_var; templ_expr = e.templ_expr; targ_expr = e.targ_expr}
  
  (*Convert the set of assignments to a set of goals. They should be all input assignment 
  goals or output goals. You can either add a fact over an output port or a goal over an
  input port.*)
  let goals_of_assignments (type a) s (templs:(a,a ast) map) (targs:(a,a ast) map) (assigns:(a,a ast) map list) = 
    ()

  (*find if there are any entanglements, and if there are, resolve them*)  
  (*an entanglement is an assignment whose left hand side (and sometimes right hand side)
   is already defined*)
  let find_entanglements (type a) s (templs:(a,a ast) map) (targs:(a,a ast) map) (assigns:(a,a ast) map list) 
                         (new_assigns:(a,a ast) map) (resolved:a resolution list) =
    let assign_list : a initial_assign list= LIST.fold assigns 
                        (fun assign lst -> MAP.fold assign (fun lhs rhs l-> INExprAssign(lhs,rhs)::l) lst) 
                        []
    in 
    (* check if a new assignment triggers a new entanglement *)
    let is_already_resolved lhs rhs = 
      let matches = 
        List.filter (fun rslvd -> lhs = rslvd.templ_var && rslvd.targ_expr = rhs) resolved
      in
      List.length matches > 0
    in
    let get_maybe_entangled asgn_lhs asgn_rhs : bool*(a entanglement option) = 
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
            | RTDerivVar(templ_rhs,templ_ic),RTDerivValue(targ_rhs,targ_ic) -> 
               (*the template and target are both defined, and the assignment
               is an x = y assignment. This is a conflict*)
               (*this invocation creates an entanglement between v and the lhs and initial assignemnts *)
               true,Some(mk_entanglement templ_lhs targ_var_lhs templ_rhs targ_rhs 
                   (INExprAssign(templ_ic,Decimal(targ_ic))::INVarAssign(asgn_lhs,targ_var_lhs)::assign_list))
            | RTFunct(templ_rhs), RTFunct(targ_rhs) -> 
               (*the template var is an input port, and the target var is an input*)
               true,Some(mk_entanglement templ_lhs targ_var_lhs asgn_rhs targ_rhs 
                   (INVarAssign(asgn_lhs,targ_var_lhs)::assign_list))
            (*input var, input port. Simple assignment with no entanglements.*)
            | RTNoRel, RTNoRel -> 
               true,None
            (*the template var is an input port, and the target var is an 
            output. no conflict. Can either rebuild expression or link variable*)
            | RTNoRel, RTFunct(targ_rhs) -> 
               true,None
            (*the template var is an input port, and the target var is a derivative. 
            no conflict. The variable must be linked from the definition*)
            | RTNoRel, RTDerivValue(targ_rhs,targ_ic) -> 
               true,None
            (*the template variable is an output port, and the target var 
            is an input. unresolvable.*)
            | _,RTNoRel -> 
               false,None 
            (*misassigning derivatives to functions*)
            | _ -> 
               false,None
            end
            (*if the assigned variable is an output variable, unifying the variable is sufficient*)
         | asgn_rhs -> 
            begin 
            match templ_kind with 
            (*If there is a straight line function that defines the template variable dynamics, unifiable*)
            | RTFunct(templ_rhs) ->
               true,Some(mk_entanglement asgn_lhs templ_lhs templ_rhs asgn_rhs
                 (INExprAssign(templ_lhs,asgn_rhs)::assign_list))
            (*cannot unify function variable with state variable*)
            | RTDerivVar(_,_) ->
               false,None
            (*expression assign to an input port*)
            | RTNoRel ->
               true,None
            end 
    in
    let resolvable,entangles = MAP.fold new_assigns (fun lhs rhs (rslv,tngl) ->  
           let resolvable, entanglement = get_maybe_entangled lhs rhs in
           let new_rslv = resolvable && rslv in
           match entanglement with 
           | Some(entg) -> if is_already_resolved entg.templ_var entg.templ_expr 
                           then new_rslv,tngl
                           else new_rslv,entg::tngl
           | None -> new_rslv,tngl
    ) (true,[]) in  
    (resolvable,entangles) 

  (*resolve unification*)
  let unify_terms (type a) (s:a runify) (templs:(a,a ast) map) (targs:(a,a ast) map) (templvar:a) (targvar:a) =
    let rec _unify_terms (entanglements:(a entanglement) list) (assigns:((a,a ast) map) list) (resolved:((a resolution) list)) : ((a,a ast) map) option=
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
              let is_valid,new_entangle = find_entanglements s templs targs assigns new_assigns new_resolved in
              (*if there is an unresolvable entanglement, return no solution*)
              if is_valid = false then None else
              (*otherwise, recurseively resolve any entanglements*)
              _unify_terms (t @ new_entangle)
                             (new_assigns::assigns)
                             new_resolved
               
            | None -> None
            end   
            (*no more entanglements left*)
            | [] ->
             Some (MAP.merge assigns)
            
    in
      let templexpr = MAP.get templs templvar in 
      let targexpr = MAP.get targs targvar in
      _unify_terms [(mk_entanglement templvar targvar templexpr targexpr [INVarAssign(templvar,targvar)])] [] []

  let add_assignment_node (type a) (s:a runify) curs (assigns:(a,a ast) map) (templs:(a,a ast)map) targs =
    let solved : (a*(a ast)) set= SET.make_dflt () in 
    let unused : (a*(a ast)) set= SET.make_dflt () in 
    MAP.iter templs (fun v e -> return (SET.add unused (v,e)) ());
    SearchLib.move_cursor s.search s.tbl curs;
    SearchLib.start s.search;
    MAP.iter assigns (fun (v:a) e ->
      if MAP.has targs v then
        let ve = MAP.get targs v in 
        return (SET.add solved (v,ve)) ()
     else if MAP.has templs v then
        let ve = MAP.get templs v in
        return (SET.rm unused (v,ve)) () 
    );
    let _ = SearchLib.add_step s.search (RSetState(mkstate assigns (SET.to_list solved) (SET.to_list unused))) in
    let node = SearchLib.commit s.search s.tbl in
    let _ = SearchLib.solution s.search node in
    ()

  (*add restrictions of different fractions*)
  let add_restrictions (type a) (s:a runify) curs (assigns:(a,a ast) map) = 
    let assign_list : (a*(a ast)) list = MAP.to_list assigns in
    let root = SearchLib.cursor s.search in 
    let add_assign (frac:float) = 
      let n = int_of_float (MATH.round_up (frac*.(float_of_int (List.length assign_list)))) in 
      let subset = LIST.random_subset assign_list n in 
      SearchLib.move_cursor s.search s.tbl root;
      SearchLib.start s.search;
      List.map (fun (lhs,rhs) -> SearchLib.add_step s.search (RBanAssign(lhs,rhs))) subset;
      SearchLib.commit s.search s.tbl;
    in
    add_assign 0.75;
    add_assign 0.50;
    add_assign 0.25;
    add_assign 0.;
    ()

  let solve_node (type a) (s:a runify) (targvar:a) (templvar:a) =
    let v2str = s.tbl.tostr in
    let e2str x = ASTLib.ast2str x v2str in
    let curs = SearchLib.cursor s.search in
    let templs,targs = apply_state s in
    let proc_one () =
      match unify_terms s templs targs templvar targvar with
      | Some(assigns) ->
        (*if LIST.empty solved then () else*)
        let _ = add_restrictions s curs assigns in
        let _ = add_assignment_node s curs assigns templs targs in
        ()
      | None ->
        let _ = SearchLib.deadend s.search curs in
        ()
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
          let templvar = SET.singleton sr.tbl.st.subset in 
          solve_node sr targvar templvar;
          _print_debug "== Solution Node ==";
         usrmenu ();
         if _mnext () then
          _solve () 
         else 
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
      let state = OPTION.force_conc s.tbl.st.state in
      let arr = [] in
      let arr = MAP.fold state.assigns (fun lhs rhs q -> USAssign(lhs,rhs)::q)  arr in
      let arr = LIST.fold state.solved (fun (lhs,rhs) q -> USRmGoal(lhs,rhs)::q) arr in 
      let arr = LIST.fold state.unused (fun (lhs,rhs) q -> USAddRel(lhs,rhs)::q) arr in 
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
