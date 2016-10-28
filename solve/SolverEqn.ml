open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open Search
open SearchData

open SolverGoalTableFactory
open SolverData
open SolverUtil
open SolverRslv
open SolverMapper
open GoalLib 

open SlnLib


open GoalLib
open SolverCompLib

open HWConnRslvr


exception SolverEqnError of string

let error n m = raise (SolverEqnError (n^":"^m))

let _print_debug = print_debug 2 "eqn"
let debug = print_debug 2 "eqn"
let _menu = menu 2
let _print_inter = print_inter 2
module SolverEqn =
struct


  let mkmenu (v:gltbl) (currgoal:goal option) =
    let menu_desc = "t=search-tree, s=sol, @=curr, g=goals, c=conc-comps\n"^
                    "n=node-steps m=mapping any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str v.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let _ = Printf.printf "\n%s\n\n" (SlnLib.sln2str v.sln_ctx ident mid2str) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "c" then
        let _ = Printf.printf "\n%s\n\n" (SolverCompLib.ccomps2str v ) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "goto" then
        let _ = match STRING.split inp " " with
        | [_;id] ->
          let nid = int_of_string id in
          let _ = SearchLib.move_cursor v.search v (SearchLib.id2node v.search nid) in
          ()
        | _ -> ()
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "m" then
        begin
          Printf.printf ("---- Inferring ------\n");
          SolverMapper.infer v
        end
      else if STRING.startswith inp "g" then
        let _ = Printf.printf "==== Goals ===\n" in
        let _ = Printf.printf "%s\n" (GoalLib.goals2str v) in
        let _ = Printf.printf "============\n" in
        let _ = match currgoal with
          | Some(currgoal) -> Printf.printf ">> Current Goal: %s\n" (GoalLib.goal2str currgoal)
          | _ -> Printf.printf ">> CurrentGoal: (none)\n"
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "n" then
        begin
            let path = SearchLib.get_path v.search (SearchLib.cursor v.search) in
            Printf.printf "steps:\n%s\n" (SearchLib.steps2str 1 v.search path);
            ()
        end
      else if STRING.startswith inp "@" then
        begin
          begin
            match currgoal with
            | Some(g) ->
              Printf.printf ">>> target goal: %s\n\n\n" (GoalLib.goal2str g) 
            | None -> Printf.printf "<no goal>\n\n\n"
          end;
          ()
        end
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = _menu "goal-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle



 (*TODO Fix*)
  let feasible_component_goal_combo (tbl:gltbl) (g:goal) (compname:hwcompname) =
    error "feasible_component_goal_combo" "unimplemented"
    (*
    let node_name = UnivLib.unodeid2name node_id in
    let test_conn (src:hwvid) (snk:hwvar) =
      let wsrc : wireid = UnivLib.hwid2wire src in
      let wsnk : wireid = UnivLib.hwvar2wire node_name snk in
      let result = HwConnRslvr.valid_conn s wsrc wsnk in
      result
    in
    match g with
    | NonTrivialGoal(UFunction(HwId(id),lhs)) ->
      let outputs = HwLib.get_port_by_kind s.hw  HNOutput node_name in
      let success = List.fold_right (fun snk r -> test_conn id snk || r) outputs false in
      if success then
        true
      else
        let _ = _print_debug ("[OPTIMIZE ] no connections: "^node_name^" to "^(UnivLib.hwid2var id)) in
        false
    | NonTr
ivialTales from the Crypt: Tight GripGoal(UFunction(MathId(id),lhs)) -> true
    | NonTrivialGoal(UState(MathId(id),_,_,_)) -> true
    | _ -> error "feasible_component_goal_combo" "unexpected"
*)


  let apply_component (gtbl:gltbl) (g:goal) (comp:hwcompname) (iid:int option) : int option = 
    error "apply_component" "unimplemented"
  (*
    if get_glbl_bool "test-component-reachability" && feasible_component_goal_combo s g node_id = false then
      None
    else
    let rel2info (rel:urel) : unid rarg =
      match rel with
      | UState(lhs,rhs,ICVar(v),t) -> (lhs,rhs,RKDeriv(ICVar(v)))
      | UState(lhs,rhs,ICVal(v),t) -> (lhs,rhs,RKDeriv(ICVal(v)))
      | UFunction(lhs,rhs) -> (lhs,rhs,RKFunction)
    in
    let goal2info (g:goal) =
      let rel = GoalTableLib.unwrap_goal g in
      rel2info rel
    in
    let mkfxn inst lhs rhs mp =
        let lhs = Shim.lclid2glblid inst lhs in
        let rhs = Shim.lcl2glbl inst rhs in
        mp lhs rhs
    in
    let add_fuse (f:unid fuse) inst : unit =
      let steps : sstep list = match f with
        | USAddRel(lhs,rhs) ->
          let rel = mkfxn inst lhs rhs (fun l r -> UFunction(l,r)) in
          let _ = _print_debug ("<@> Add Partially Concretized Relation: "^(UnivLib.urel2str rel)) in
          [SAddNodeRel(node_id,inst,rel)]

        | USRmGoal(vr,rhs) ->
          let _ = _print_debug ("<@> Remove Goal: "^(UnivLib.unid2str vr)^(UnivLib.uast2str rhs)) in
          let goal = GoalTableLib.get_goal_from_rel gtbl vr rhs in
          begin
          match goal with
            | Some(goal) -> [SRemoveGoal(goal)]
            | None -> 
               let _ = _print_debug "<@> warning... goal listed in fuse not found" in 
               []
          end
        | USAssign(HwId(lhs),Term(HwId(rhs))) ->
            let rel : urel = match HwLib.var2kind lhs, HwLib.var2kind rhs with 
            | (HNOutput, HNInput)  -> 
               mkfxn inst (HwId rhs) (Term(HwId lhs)) (fun l r -> UFunction(l,r))             
            | (HNInput, HNOutput) -> 
               mkfxn inst (HwId lhs) (Term(HwId rhs)) (fun l r -> UFunction(l,r))
            | (HNInput, HNInput) ->           
                error "unify_rels" ("cannot connect INPUT ports: "^(HwLib.hwvid2str lhs)^" <-> "^(HwLib.hwvid2str rhs))
            | _ -> 
                error "unify_rels" ("cannot connect OUTPUT ports: "^(HwLib.hwvid2str lhs)^" <-> "^(HwLib.hwvid2str rhs))
            in
            let goal = GoalTableLib.wrap_goal gtbl rel in 
            [SAddGoal(goal)] 
                

        | USAssign(lhs,rhs) ->
          let rel = mkfxn inst lhs rhs (fun l r -> UFunction(l,r)) in
          let _ = _print_debug ("<@> Add Assignment: "^(UnivLib.urel2str rel)) in
          let goal = GoalTableLib.wrap_goal gtbl rel in
          [SAddGoal(goal)]
      in
      let _ = SearchLib.add_steps gtbl.search steps in
      ()
    in
    let add_unification (root:sstep snode) (u:unid fusion) inst =
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) root in
      let _ = SearchLib.start gtbl.search in
      let _ = List.iter (fun f -> add_fuse f inst) u in
      let r = SearchLib.commit gtbl.search (s,gtbl) in
      ()
    in
    (*only hardware ids belonging to the template count*)
    let freshvar (n:int) (k:unifytype) = match k with
      | UTypTempl -> HwId(HNPort(HNInput,HCMLocal("tvar"^(string_of_int n)),"null","none","nil"))
      | UTypTarg -> MathId(MNVar(MInput,"tvar"^(string_of_int n),UNone))
    in
    (*determine if this is a filler nodes*)
    let comp_info : (unode*int*(sstep snode)*(unit->unit)) option=
      (*specific instance*)
      if iid <> None then
        (*get the concrete nodes*)
        let inst_id = OPTION.force_conc iid in
        let node = MAP.get gtbl.used_nodes (node_id,inst_id) in
        let _ = SearchLib.start gtbl.search in
        (*remove all the relations in the used node, any remaining relations will be added back in*)
        let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
        let curs = SearchLib.commit gtbl.search (s,gtbl) in
        let cleanup () = () in
        Some(node,inst_id,curs,cleanup)
    (*non-specific instance*)  
    else
        (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
        if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then
          None
        else
          let inst_id = SlnLib.usecomp gtbl.sln node_id in
          let node = MAP.get gtbl.nodes node_id in
          (*the cursor associated with the goal*)
          let goal_cursor = SearchLib.cursor gtbl.search in
          (*update search algorithm to include the usage*)
          let _ = SearchLib.start gtbl.search in
          let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
          (*the cursor associated with the component*)
          let curs : sstep snode = SearchLib.commit gtbl.search (s,gtbl) in
          let cleanup () =
            let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in 
            ()
          in
          Some(node,inst_id,curs,cleanup)
    in
    let testwc v = match v with 
    | MathId(_) -> false
    | _ -> true
    in
    match comp_info with
    | Some(node,iid, comp_cursor,cleanup) ->
      (*use node*)
      let goal_cursor = SearchLib.cursor gtbl.search in
      let _ = SearchLib.move_cursor gtbl.search (s,gtbl) comp_cursor in
      let templ : (unid rarg) list = SET.map node.rels (fun x -> rel2info x)  in
      let targ : (unid rarg) list = SET.map gtbl.goals (fun x -> goal2info x) in
      if List.length templ = 0 || List.length targ = 0 then
        None
      else
        let vgl,_,_ = goal2info g in
        let nunify = Globals.get_glbl_int "eqn-unifications" in
        let slns : (unid fusion) set =
          (*Hint: Unification routine here*)
          ASTXUnify.ASTUnifier.multipattern templ targ vgl nunify
          (testwc)
          (UnivLib.unid2var)
          (UnivLib.var2unid (s))
          freshvar
          (UnivLib.unid2var)
        in
        let _ = SearchLib.move_cursor gtbl.search (s,gtbl) goal_cursor in
        let nslns = SET.size slns in
        if nslns = 0 then
          let _ = _print_debug ("no solutions for comp...") in 
          let _ = SearchLib.rm gtbl.search comp_cursor in
          let _ = cleanup () in
          None
        else
          let _ = SearchLib.visited gtbl.search comp_cursor in
          let _ = SET.iter slns (fun x -> add_unification comp_cursor x iid)  in
          Some(nslns)
    | None -> None
*)


  let apply_components (tbl:gltbl) (g:goal) : unit =
    error "apply_components" "unimplemented"
                                                                 
(*
    let goal_cursor = SearchLib.cursor tbl.search in
    let handle_component (id:unodeid) (inst: int option) (status:bool) : bool =
      let _ = SearchLib.move_cursor tbl.search (slvenv,tbl) goal_cursor in
      let results = apply_component slvenv tbl g id inst in
      match results with
      | Some(q) -> true
      | None -> status
    in
    let has_results = false in
    (*apply partially filled nodes*)
    let has_results = MAP.fold tbl.used_nodes (fun (id,i) x status -> handle_component id (Some i) status) has_results  in
    (**apply component if there is a possible connection *)
    let has_results = MAP.fold tbl.nodes (fun id x status -> match id with
      | UNoComp(_) ->
        handle_component id None status
      | _ -> status
    ) has_results in
    (* failed to find any solutions.. *)
    if has_results = false then
      begin SearchLib.deadend tbl.search goal_cursor (slvenv,tbl); () end
    else ()
*)

  let mark_if_solution (v:gltbl) (curr:(sstep snode)) = 
    debug "[mark-if-solution] testing if solution.";
    if GoalLib.num_active_goals v = 0 then
      if HwConnRslvrLib.consistent v then
        begin
          debug "[mark-if-solution] found concrete hardware. marking as solution.";
          noop (SearchLib.solution v.search curr)
        end
      else
        begin
          debug "[mark-if-solution] cannot concretize hardware.";
          noop (SearchLib.deadend v.search curr v)
        end
    else
      debug "[mark-if-solution] there are still goals left.";
      ()
(*
    let _ = _print_debug "[mark-if-solution] testing if solution." in
    let _ = SearchLib.move_cursor v.search (s,v) curr in
    let is_conn_cons = SlnLib.mkconn_cons s v.sln in
    let is_usecomp_cons = SlnLib.usecomp_cons s v.sln in
    if is_conn_cons && is_usecomp_cons then 
      SearchLib.solution v.search curr
    else
      begin SearchLib.deadend v.search curr (s,v); () end
*)     

  

  let backup_and_move_cursor (tbl:gltbl) (node:sstep snode) =
    let old_cursor = SearchLib.cursor tbl.search in
    let old_depth =  List.length (TREE.get_path tbl.search.tree node) in
    SearchLib.move_cursor tbl.search tbl node;
    (old_cursor,old_depth)


  (*test whether the node is valid, if it is valid, return true. Otherwise, return false*)
  let test_node_validity (tbl:gltbl) (node:sstep snode) (depth:int) : bool=
    begin
      let old_cursor, old_depth = backup_and_move_cursor tbl node in 
      _print_debug ("-> [valid?] testing node "^(string_of_int node.id));
      let is_valid : bool =
        if old_depth >= depth then
          begin
            (*determine if there are any goals left*)
            _print_debug "[test-node-validity] hit max depth:";
            SearchLib.deadend tbl.search node tbl;
            false
          end
        else if (GoalLib.num_active_goals tbl) = 0 then
        begin
          (*found all goals*)
          _print_debug "[test-node-validity] found a valid solution";
          mark_if_solution tbl node;
          true
        end
      else
        true
    in
    SearchLib.move_cursor tbl.search tbl old_cursor;
    is_valid
  end


  (*get the best valid node. If there is no valid node, return none *)
  let rec get_best_valid_node (tbl:gltbl) (root:(sstep snode) option) (depth:int)  : (sstep snode) option =
    match SearchLib.select_best_node tbl.search root with
    | Some(newnode) ->
        if test_node_validity tbl newnode depth then
          Some(newnode)
        else
          get_best_valid_node tbl root depth
    | None -> None

  (*
    Scoring the goal: higher = better
  *)
  let score_goal_uniform g = 0.

(*
  let score_goal_random g = RAND.rand_norm()

  let score_goal_trivial_preferred g = match g with
    | TrivialGoal(v) -> 1. +. RAND.rand_norm ()
    | NonTrivialGoal(v) -> RAND.rand_norm()

  let score_goal_nontrivial_preferred g = match g with
    | TrivialGoal(v) -> RAND.rand_norm ()
    | NonTrivialGoal(v) -> 1. +. RAND.rand_norm()
*)


  let best_goal_function () =
    let typ = get_glbl_string "eqn-selector-goal" in
    match typ with
    | "trivial" -> ( fun x -> 0. -. GoalLib.goal_difficulty x)
    | _ ->
      error "best_goal_function" ("goal selector named <"^typ^"> doesn't exist")

  let get_best_valid_goal (v:gltbl) : goal =
    let cursor = SearchLib.cursor v.search in
    let goals = GoalLib.get_active_goals v in
    let score_goal = best_goal_function() in
    if List.length goals > 0  then
      let _,targ_goal = LIST.max (fun (x:goal) -> 0. -. (score_goal x.d)) goals in
      targ_goal
    else
      error "get_best_valid_goal" ("non-visited node has no goals: "^(string_of_int cursor.id))

  let no_more_nodes (v:gltbl) (head:(sstep snode) option) =
    (List.length (SearchLib.get_paths v.search head))


  let mknode tbl steps (parent:(sstep snode)) =
        SearchLib.move_cursor tbl.search tbl parent;
        SearchLib.start tbl.search;
        SearchLib.add_steps tbl.search steps;
        let no = SearchLib.commit tbl.search tbl in
        no



  (*=========== RSTEP to SSTEP Conversion ==================*)
  (*specifically for inputs*)
  let rassign_inp_to_goal (stepq:sstep queue) (tbl:gltbl) (comp:ucomp_conc) (v:string) (cfg:hwvarcfg) : unit =
    let enq s = noop (QUEUE.enqueue stepq s) in
    let wire = SlnLib.mkwire comp.d.name comp.inst v in
    match uast2mast cfg.expr with
    | Term(MNVar(knd,name)) ->
      begin
        match knd with
        (*assign a math input to a hardware input*)
        | MInput ->
            if HwLib.is_inblock_reachable tbl.env.hw wire = false
            then
              let goal = GoalLib.mk_inblock_goal tbl wire (uast2mast cfg.expr) in
              enq (SModGoalCtx(SGAddGoal(goal)))
            else
              enq (SModSln(SSlnAddRoute(MInLabel({var=name;wire=wire}))))

        | MLocal ->
          enq (SModSln(SSlnAddRoute(MLocalLabel({var=name;wire=wire}))))

        | MOutput ->
          enq (SModSln(SSlnAddRoute(MOutLabel({var=name;wire=wire}))))
          
      end
    

    | Integer(i) ->
      enq (SModSln(SSlnAddRoute(ValueLabel({value=Integer i;wire=wire}))))

    | Decimal(d)->
      enq (SModSln(SSlnAddRoute(ValueLabel({value=Decimal d;wire=wire}))))

    | Term(MNParam(_)) -> error "rstep_to_goal" "not expecting param"

    (*assignment over inputs to output*)
    | expr ->
      (*note: this should create different solutions*)
      if MathLib.is_input_expr expr  = false
      then
        let goal = GoalLib.mk_hexpr_goal tbl wire expr in
        enq (SModGoalCtx(SGAddGoal(goal)))
      else
        enq (SModSln(SSlnAddRoute(MExprLabel({expr=expr;wire=wire}))))



  (*resolve output port assignments*)
  let rassign_out_to_goal (stepq:sstep queue )(tbl:gltbl) (comp:ucomp_conc) (v:string) (cfg:hwvarcfg) :
    unit =
    let enq s = noop (QUEUE.enqueue stepq s) in
    let wire = SlnLib.mkwire comp.d.name comp.inst v in
    match uast2mast cfg.expr with
    | Term(MNVar(knd,name)) ->
      begin
        match knd with
        (*an output port should not generate an input *)
        |MInput ->
          enq (SModSln(SSlnAddGen(MInLabel({var=name;wire=wire}))))
        
        (*this is a generator for an output. remove the math goal*)
        |MOutput ->
          let goal_to_remove : goal= GoalLib.get_math_goal tbl name in
          enq (SModGoalCtx(SGRemoveGoal(goal_to_remove)));
          enq (SModSln(SSlnAddGen(MOutLabel({var=name;wire=wire}))));
          if HwLib.is_outblock_reachable tbl.env.hw wire = false then
            begin
              let goal = GoalLib.mk_outblock_goal tbl wire (uast2mast cfg.expr) in
              enq (SModGoalCtx(SGAddGoal(goal)))
            end

        (*this is a generator for an local. remove the math goal*)
        |MLocal ->
          let goal_to_remove : goal= GoalLib.get_math_goal tbl name in
          enq (SModGoalCtx(SGRemoveGoal(goal_to_remove)));
          enq (SModSln(SSlnAddGen(MLocalLabel({var=name;wire=wire}))))
      end
    (*if we found a connection*)
    | Term((MNParam(_))) -> error "rstep_to_goal" "not expecting param"
    | expr ->
      enq (SModSln(SSlnAddGen(MExprLabel({expr=expr;wire=wire}))))

  let rsteps_to_ssteps (tbl:gltbl) (comp:ucomp_conc) (rsteps:rstep list) (ssteps:sstep list)=
    let compid = {name=comp.d.name;inst=comp.inst} in 
    let sstepq = QUEUE.make () in
    let enq x = noop (QUEUE.enqueue sstepq x) in
    let add_step (rstep:rstep) : unit =
          match rstep with
          (*input assignments become goals*)
          | RAddInAssign(v,cfg) ->
            enq (SModCompCtx(SCAddInCfg(compid,v,cfg)));
            rassign_inp_to_goal sstepq tbl comp v cfg 
          (*out assignments are already satisfied*)
          | RAddOutAssign(v,cfg) ->
            enq (SModCompCtx(SCAddOutCfg(compid,v,cfg)));
            rassign_out_to_goal sstepq tbl comp v cfg
          | RAddParAssign(v,cfg) ->
            enq (SModCompCtx(SCAddParCfg(compid,v,cfg)))
          | _ -> ()
    in
    List.iter add_step rsteps;
    let steps = QUEUE.to_list sstepq in
    QUEUE.destroy sstepq;
    ssteps @ steps
    

  (*todo, we should automatically *)
  (*
     TODO: Return a set of global steps.
     On MkHWConn ->
           (1) remove route to input port 
           (2) add connection to solution
           (3) copy input port assignment to output port
           (4) remove relevent match statements (use uast2mast cast in to-node)
  *)
  let rslvd_hwingoal_to_ssteps (tbl:gltbl) (comp:ucomp_conc) (hwvar:hwvid hwportvar) (hgoal:goal_hw_expr) = 
    let incomp : ucomp_conc = ConcCompLib.get_conc_comp tbl hgoal.wire.comp in
    let invar : hwvid hwportvar = HwLib.comp_getvar incomp.d hgoal.wire.port in
    let outwire :wireid = SlnLib.mkwire hwvar.comp comp.inst hwvar.port in
    let inid : hwvid = HwLib.var2id invar (Some incomp.inst) in
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWInExprGoal(hgoal))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    [
      SModSln(SSlnAddConn({src=outwire;dst=hgoal.wire}));
      (*SModSln(SSlnRmRoute(MExprLabel({wire=hgoal.wire;expr=hgoal.expr})));*)
      SModSln(SSlnAddGen(MExprLabel({wire=outwire;expr=hgoal.expr})))
    ] @ rm_goal_steps

  let unify_goal_with_comp (tbl:gltbl) (ucomp:ucomp) (hwvar:hwvid hwportvar) (g:unifiable_goal) =
    let results : rstep list list= match g with
      | GUMathGoal(mgoal) ->
        ASTUnifier.unify_comp_with_mvar tbl.env.hw tbl.env.math ucomp hwvar.port mgoal.d.name

      | GUHWInExprGoal(hgoal) ->
        ASTUnifier.unify_comp_with_hwvar tbl.env.hw tbl.env.math ucomp hwvar.port
            (SolverCompLib.wireid2hwid tbl hgoal.wire) (mast2uast hgoal.expr)
      | GUHWConnInBlock(_) -> error "unify_goal_with_comp" "conn-in unimplemented"
      | GUHWConnOutBlock(_) -> error "unify_goal_with_comp" "conn-out unimplemented"
      | GUHWConnPorts(_) -> error "unify_goal_with_comp" "conn-ports unimplemented"
    in
    match results with
    | h::t ->
      begin
        (*create a concrete comp*)
        let comp : ucomp_conc = SolverCompLib.mk_conc_comp tbl ucomp.d.name in
        let inits = [SModCompCtx(SCMakeConcComp(comp))] in
        List.iter (fun rsteps ->
            debug (" -> found unify solution with "^(LIST.length2str rsteps)^" steps");
            begin
              let steps : sstep list =
                match g with
                | GUMathGoal(mgoal) -> rsteps_to_ssteps tbl comp rsteps inits
                | GUHWInExprGoal(hgoal) ->
                  ((rslvd_hwingoal_to_ssteps tbl comp hwvar hgoal) @
                  (rsteps_to_ssteps tbl comp rsteps inits))
                | _ -> error "unify_goal_with_comp" "rstep->sstep conversion unimplemented"
              in
              SearchLib.mknode_child_from_steps tbl.search tbl (steps);
              ()
            end
          ) results;
        debug ("[unify!] Found "^(LIST.length2str results)^" results");
        List.length results
      end
    | [] -> 0

  let unify_goal_with_conc_comp (tbl:gltbl) (ucomp:ucomp_conc) (hwvar:hwvid hwportvar) (g:unifiable_goal) =
    let results : rstep list list = match g with
      | GUMathGoal(mgoal) ->
        ASTUnifier.unify_conc_comp_with_mvar tbl.env.hw tbl.env.math ucomp hwvar.port mgoal.d.name
      | GUHWInExprGoal(hgoal) ->
        ASTUnifier.unify_conc_comp_with_hwvar tbl.env.hw tbl.env.math ucomp hwvar.port
          (SolverCompLib.wireid2hwid tbl hgoal.wire) (mast2uast hgoal.expr)
      | GUHWConnInBlock(_) -> error "unify_goal_with_conc_comp" "conn-in unimplemented"
      | GUHWConnOutBlock(_) -> error "unify_goal_with_conc_comp" "conn-out unimplemented"
      | GUHWConnPorts(_) -> error "unify_goal_with_conc_comp" "conn-ports unimplemented"
      | _ -> error "unify_goal_with_conc_comp" "unimplemented"
    in
    match results with
    | h::t ->
      begin
        List.iter (fun rsteps ->
            debug (" -> found unify solution with "^(LIST.length2str rsteps)^" steps");
            begin
             let steps = match g with
              | GUMathGoal(_) -> rsteps_to_ssteps tbl ucomp rsteps []
              | GUHWInExprGoal(hgoal) ->
                  ((rslvd_hwingoal_to_ssteps tbl ucomp hwvar hgoal) @
                  (rsteps_to_ssteps tbl ucomp rsteps []))

              | _ -> error "unify_goal_with_conc_comp" "rstep->sstep conversion unimplemented"
             in
             SearchLib.mknode_child_from_steps tbl.search tbl (steps);
            ()
            end
        ) results;
        debug ("[unify!] Found "^(LIST.length2str results)^" results");
        List.length results
      end
    | [] -> 0

  type slvr_cmp_kind = HWCompNew of hwcompname | HWCompExisting of hwcompinst
  let solve_unifiable_goal (tbl:gltbl) (g:unifiable_goal) =
      (* make a priority queue that grades the component outputs for the goal*)
      let prio_comps = PRIOQUEUE.make (fun (k,p) -> match k with
          | HWCompNew(xname) ->
            let hwcomp = SolverCompLib.get_avail_comp tbl xname in 
            SolverCompLib.grade_hwvar_with_goal hwcomp.d p g
          | HWCompExisting(xinst) ->
            let hwcomp = SolverCompLib.get_conc_comp tbl xinst in 
            SolverCompLib.grade_hwvar_with_goal hwcomp.d p g
        )
    in
      (* add all the compatible available comps *)
      SolverCompLib.iter_avail_comps tbl (fun cmpname cmp ->
        if SolverCompLib.has_available_insts tbl cmpname  then
          match SolverCompLib.compatible_comp_with_goal tbl cmp g with
            | [] -> ()
            | vars -> List.iter (fun v ->
                noop (PRIOQUEUE.add prio_comps (HWCompNew cmpname,v))) vars
      );
      (* add all the compatible used comps*)
      SolverCompLib.iter_used_comps tbl (fun cmpid cmp ->
          match SolverCompLib.compatible_used_comp_with_goal tbl cmp g with
          | [] -> ()
          | vars -> List.iter (fun v ->
              noop (PRIOQUEUE.add prio_comps (HWCompExisting cmpid,v))) vars
        );
      (* iterate over prioritzed list of comps*)
      let nsols : int ref = REF.mk 0 in 
      PRIOQUEUE.iter prio_comps (fun (prio:int) (cmpkind,hwvar) ->
          begin
            match cmpkind with
            | HWCompNew(cmpname) ->
              let hwcomp = SolverCompLib.get_avail_comp tbl cmpname in 
              begin
                debug ("new: ["^(string_of_int prio)^"] <"^(HwLib.hwcompname2str hwcomp.d.name)^
                       "> "^(HwLib.hwportvar2str hwvar hwid2str^"\n"));
                let nslns = unify_goal_with_comp tbl hwcomp hwvar g in
                REF.upd nsols (fun x -> x + nslns);
                ()
              end
            | HWCompExisting(compinst) ->
              let hwcomp : ucomp_conc = SolverCompLib.get_conc_comp tbl compinst in 
              begin
              debug "  [existing comp]";
                     debug ("new: ["^(string_of_int prio)^"] <"^(HwLib.hwcompname2str hwcomp.d.name)^
                "> "^(HwLib.hwportvar2str hwvar hwid2str^"\n"));
              let nslns = unify_goal_with_conc_comp tbl hwcomp hwvar g in
              REF.upd nsols (fun x -> x + nslns);
              ()
              end
          end;
          ()

        );
      PRIOQUEUE.delete prio_comps;
      (*if there are any solutions*)
      if REF.dr nsols > 0 then
        begin
          debug ("[FOUND-SOLS] ===> Found some solutions");
          ()
        end
      else
        begin
          debug ("//NO-SOLS// ===> Found no solutions");
          SearchLib.deadend tbl.search (SearchLib.cursor tbl.search) tbl;
          ()
        end


  let solve_goal (tbl:gltbl) (g:goal) =
    let root = SearchLib.cursor tbl.search in
    let mint,musr = mkmenu tbl (Some g) in
    mint "g";
    musr ();
    if g.active = false then error "solve_goal" "cannot solve inactive goal"; 
    match g.d with
    |GUnifiable(g) -> solve_unifiable_goal tbl g 
    | _ -> error "solve_goal" "unimplemented"
  (*solve a goal*)
   (*
   let solve_goal (g:goal) =
      let curr = SearchLib.cursor v.search in
      let mint,musr = mkmenu s v (Some g) in
      let _ = mint "g" in
      let _ = musr () in
      let mknode steps (cursor:(sstep snode)) =
        let _ = SearchLib.move_cursor v.search (s,v) cursor in
        let _ = SearchLib.start v.search in
        let _ = SearchLib.add_steps v.search steps in
        let no = SearchLib.commit v.search (s,v) in
        no
      in
      match g with
      (*if we're solvinga nontrivial goal. Apply components and then redo*)
      | NonTrivialGoal(_) ->
        (*found a nontrivial goal -> applying components*)
        let _ = apply_components s v g in
        let _ = _print_debug "[search_tree] successfully applied components." in
        let _ = musr () in
        ()
      (* if we're looking at a trivial goal, try to solve everything under the goal*)
      | TrivialGoal(grel) ->
        let mktrv = TrivialLib.resolve_trivial_step s v g in
        let triv = mknode ((SRemoveGoal g)::mktrv) curr in
        (*test the validity of the trival node*)
        let _ = SearchLib.move_cursor v.search (s,v) triv in
        let _ = SearchLib.visited v.search curr in 
        (**)
        let is_usecomp_cons = SlnLib.usecomp_cons s v.sln in
        let is_conn_cons = if get_glbl_bool "eqn-smt-defer" then
          SlnLib.mkconn_cons_shallow s v.sln 
        else
          SlnLib.mkconn_cons s v.sln
        in  
        if is_usecomp_cons && is_conn_cons then
          let _ = _print_debug "[search_tree] no goals left. Testing if trivial solution is successful: " in
          let _ = if List.length ( GoalTableLib.get_actionable_goals v ) = 0 then
            return (mark_if_solution s v triv) () else ()
          in
          let _ = _print_debug "[search_tree] trivial solution is successful: " in
          let _ = musr () in
          ()
        else
          (*this trivial resolution does not work*)
          let _ = SearchLib.deadend v.search triv (s,v) in
          let _ = _print_debug "[search_tree] FAILURE trivial solution not resolved." in
          (*downgrade goal*)
          let _ = if downgrade_enable then 
                let _ = _print_debug "[search_tree] Relaxed resolution mode enabled. Downgrading solution." in
                let gnt = NonTrivialGoal (UnivLib.unwrap_goal g) in
                let downgrade_triv = mknode ([SRemoveGoal g; SAddGoal gnt]) curr in
                ()
          in
          let _ = musr () in
          ()

    in
*)
  let solve_subtree (tbl:gltbl) (root:(sstep snode)) (nslns:int) (depth:int) : unit =
    let downgrade_enable = get_glbl_bool "downgrade-trivial" in
    let mint,musr = mkmenu tbl (None) in
    let rec rec_solve_subtree (root:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      let currslns = SearchLib.num_solutions tbl.search (Some root) in 
      begin
      if currslns >= nslns then
        begin
         debug "[search_tree] Found enough solutions";
         musr ();
         ()
        end
      else
        begin
        debug ("[search_tree] found "^(string_of_int currslns)^" / "^(string_of_int nslns));
        if SearchLib.is_exhausted tbl.search (Some root) then
          begin
            debug "[search_tree] is exhausted";
            musr ();
            ()
          end
        else
          (*get the next node*)
          let maybe_next_node = get_best_valid_node tbl (Some root) depth in
          match maybe_next_node with
          | Some(next_node) ->
            begin
              (*move to node*)
              SearchLib.move_cursor tbl.search tbl next_node;
              let next_goal = get_best_valid_goal tbl in
              musr();
              (*solves the goal*)
              solve_goal tbl next_goal;
              rec_solve_subtree root
            end
            (*No more subgoals*)
          | None ->
            debug "[search_tree] could not find another node";
            ()
        end
      end
    in
    debug "[search-tree] starting";
    mint "g";
    musr ();
    let maybe_root = SearchLib.root tbl.search in
    begin
      match maybe_root with
      | Some(root) -> 
        begin
        SearchLib.move_cursor tbl.search tbl root;
        debug "[search-tree] positioned cursor";
        if List.length ( GoalLib.get_active_goals tbl ) = 0 then
          begin
            mark_if_solution tbl root;
            debug "[search-tree] there are no active goals. beginning search anyway";
            rec_solve_subtree root;
            ()
          end
        else
          begin
            debug "[search-tree] get best valid goal";
            let next_goal = get_best_valid_goal tbl in
            debug "[search-tree] solve the best valid goal";
            solve_goal tbl next_goal;
            debug "[search-tree] begin search";
            rec_solve_subtree root;
            ()
          end
        end
      | None -> error "solve_tree" "root is empty/unset"
    end

  let solve (v:gltbl) (nslns:int) (depth:int) : ((sstep snode) list) option =
    debug ("find # solutions: "^(string_of_int nslns));
    match SearchLib.root v.search with
    | Some(root) ->
      begin
        solve_subtree v root nslns depth;
        let slns = SearchLib.get_solutions v.search (Some root) in
        match slns with
        | [] -> None
        | lst -> Some(lst)
      end
    | None -> error "solve" "the tree has no root."

end
