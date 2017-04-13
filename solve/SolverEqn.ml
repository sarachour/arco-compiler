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

open MapMain

open SolverSearch 
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
    let menu_desc =
      "\n   {t,s,@,g,c,n,m,x,q}"
    in
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

  
      else if STRING.startswith inp "p" then
        let path = SearchLib.path2str 1 v.search (SearchLib.cursor v.search) in
        let _ = Printf.printf "\n%s\n\n" ( path ) in
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
          noop (MapMain.infer v)
        end
      else if STRING.startswith inp "x" then
        begin
          Printf.printf ("---- Summarizing Heuristics------\n");
          noop (MapMain.infer_feasible v);
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



  let test_node_map_full_cons tbl node =
    let mint,musr= mkmenu tbl None in
    if MapMain.infer_feasible tbl then
      begin
        debug ("<<< SAT => VALID >>");
        musr();
        true
      end
    else
      begin
        debug "<< UNSAT => INVALID >>";
        musr();
        false
      end

  let test_node_map_cons tbl node =
    let mint,musr= mkmenu tbl None in
    let use_heuristic = Globals.get_glbl_bool "eqn-use-map-heuristic" in
    musr();
    if use_heuristic = false then
      true
    else
      match MapMain.infer_feasible tbl with
      | true ->
        begin
          debug ("[test-node-validity][PASS] mapping is plausible: ");
          true
        end
      | false ->
        begin
          debug "[test-node-validity][FAIL] mapping is invalid by construction.";
          false
        end

  let mark_if_solution (v:gltbl) (curr:(sstep snode)) = 
    let mint,_ = mkmenu v None in
    debug "[mark-if-solution] testing if solution.";
    if GoalLib.num_active_goals v = 0 then
      if HwConnRslvrLib.consistent v && test_node_map_cons v curr && test_node_map_full_cons v curr then
        begin
          debug "[mark-if-solution] found concrete hardware. marking as solution.";
          noop (SearchLib.solution v.search curr);
          debug "[mark-if-solution] -> marked as solution.";
          ()
        end
      else
        begin
          debug "[mark-if-solution] cannot concretize hardware, or mapping is bad.";
          noop (SearchLib.deadend v.search curr v)
        end
    else
      debug "[mark-if-solution] there are still goals left.";
      ()
  

  let backup_and_move_cursor (tbl:gltbl) (node:sstep snode) =
    let old_cursor = SearchLib.cursor tbl.search in
    let old_depth =  List.length (TREE.get_path tbl.search.tree node) in
    SearchLib.move_cursor tbl.search tbl node;
    (old_cursor,old_depth)



  (*test whether the node is valid, if it is valid, return true. Otherwise, return false
    validity in this case means is the node explorable
  *)
  let test_node_validity (tbl:gltbl) (node:sstep snode) (depth:int) : bool=
    begin
      let mint,musr = mkmenu tbl (None) in
      if SearchLib.hasnode tbl.search node = false then
        begin
          SearchLib.deadend tbl.search node tbl;
          false
        end
      else
      let old_cursor, old_depth = backup_and_move_cursor tbl node in 
      debug ("-> [valid?] testing node "^(string_of_int node.id));
      let is_valid : bool =
        if old_depth >= depth then
          begin
            (*determine if there are any goals left. You must move off of node you're deadending*)
            debug "[test-node-validity] hit max depth:";
            SearchLib.deadend tbl.search node tbl;
            false
          end
        else if (GoalLib.num_active_goals tbl) = 0 then
        begin
          (*found all goals*)
          debug "[test-node-validity] found a valid solution";
          mark_if_solution tbl node;
          false 
        end
      else
        true
      in
      if is_valid = false then
        false
      else if test_node_map_cons tbl node && test_node_map_full_cons tbl node then
        true
      else
        begin
          SearchLib.deadend tbl.search node tbl;
          false
        end

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
  (* handle an assignment to an input port*)
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
  let rslvd_goal_to_ssteps_inexp (tbl:gltbl) (comp:ucomp_conc) (hwvar:hwvid hwportvar) (goal:goal_hw_expr) = 
    (*the output port that generates the expression after goal resolution *)
    let outwire :wireid = SlnLib.mkwire hwvar.comp comp.inst hwvar.port in
    (*the goals to remove*)
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWInExprGoal(goal))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    [
      SModSln(SSlnAddConn({src=outwire;dst=goal.wire}));
      (*SModSln(SSlnRmRoute(MExprLabel({wire=hgoal.wire;expr=hgoal.expr})));*)
      SModSln(SSlnAddGen(MExprLabel({wire=outwire;expr=goal.expr})))
    ] @ rm_goal_steps


  let rslvd_goal_to_ssteps_outblock (tbl:gltbl) (incomp:ucomp_conc)
      (invar:hwvid hwportvar) (outvar:hwvid hwportvar) (goal:goal_ioblock) =
    (*the output port from the goal that needs to be connected to the output block*)
    (*wires belonging to the newly created component *)
    (*the input port from the new block that generates the expression*)
    let inwire : wireid = SlnLib.mkwire invar.comp incomp.inst invar.port in 
    (*the output port from the new block that generates the expression*)
    let outwire : wireid = SlnLib.mkwire invar.comp incomp.inst outvar.port in 
    (*the goals from the new block that generate the expression*)
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnOutBlock(goal))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    [
      SModSln(SSlnAddConn({src=goal.wire;dst=inwire}));
      SModSln(SSlnAddGen(MExprLabel({wire=outwire;expr=goal.expr})))
    ] @ rm_goal_steps

  let rslvd_goal_to_ssteps_conn (tbl:gltbl) (incomp:ucomp_conc)
      (invar:hwvid hwportvar) (outvar:hwvid hwportvar) (conn:goal_conn) =
    (*the output port from the goal that needs to be connected to the output block*)
    (*wires belonging to the newly created component *)
    (*the input port from the new block that generates the expression*)
    let inwire : wireid = SlnLib.mkwire invar.comp incomp.inst invar.port in 
    (*the output port from the new block that generates the expression*)
    let outwire : wireid = SlnLib.mkwire invar.comp incomp.inst outvar.port in 
    (*the goals from the new block that generate the expression*)
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnPorts(conn))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    let goal = GoalLib.mk_conn_goal tbl conn.src inwire conn.expr in 
    [
      SModGoalCtx(SGAddGoal(goal));
      SModSln(SSlnAddConn({src=outwire;dst=conn.dst}));
      SModSln(SSlnAddGen(MExprLabel({wire=outwire;expr=conn.expr})))
    ] @ rm_goal_steps
  (*
     this unification algorithm tries to pass through a value to a component without creating
     more instances of that value.

     We need to pass-through unify

  *)

(*if we successfully pass-through the expression*)
let passthru_rsteps_to_ssteps (tbl:gltbl) (comp:ucomp_conc) (rsteps:rstep list) (ssteps:sstep list) (proxy:mid ast)=
    let compid = {name=comp.d.name;inst=comp.inst} in 
    let sstepq = QUEUE.make () in
    let enq x = noop (QUEUE.enqueue sstepq x) in
    let tempid  = MathId(ASTUnifier.tempmid()) in
    let valid = REF.mk true in
    (*steps that do not contain the passthru var*)
    let passthru_rsteps,normal_rsteps= LIST.partition rsteps (fun step -> match step with
        | RAddInAssign(v,cfg) -> ASTLib.has_var cfg.expr tempid 
        | RAddOutAssign(v,cfg)-> ASTLib.has_var cfg.expr tempid 
        | RAddParAssign(v,cfg)-> false 
        | RDisableAssign(v,cfg) -> false 
      ) in
    let normal_ssteps = rsteps_to_ssteps tbl comp normal_rsteps ssteps in
    let uproxy = mast2uast proxy in
    let usable_passthrough e = match e with
      | Term(v) -> v = tempid
      | _ -> false
    in
    let add_passthru_step (rstep:rstep) : unit =
          match rstep with
          (*input assignments become goals*)
          | RAddInAssign(v,cfg) ->
            if usable_passthrough cfg.expr then
              begin
                warn "add_passthru_step.RAddInAssign"
                  ("this assignment is perfect!: "^v^"="^(uast2str cfg.expr));
                enq (SModCompCtx(SCAddInCfg(compid,v,{expr=uproxy})))
              end
            else
              begin
              warn "add_passthru_step.RAddInAssign"
                ("this assignment is too complicated: "^v^"="^(uast2str cfg.expr));
              REF.upd valid (fun x -> false)
              end
          (*out assignments are already satisfied*)
          | RAddOutAssign(v,cfg) ->
            if usable_passthrough cfg.expr then
              begin
                warn "add_passthru_step.RAddInAssign"
                    ("this assignment is perfect!: "^v^"="^(uast2str cfg.expr));
                enq (SModCompCtx(SCAddOutCfg(compid,v,{expr=uproxy})))
              end
            else
              begin
                warn "add_passthru_step.RAddInAssign"
                  ("this assignment is too complicated: "^v^"="^(uast2str cfg.expr));
                REF.upd valid (fun x -> false)
              end

          | RAddParAssign(v,cfg) ->
            error "add_passthru_step" "there's no way you assigned a tempvar to a param"
          | _ ->
            error "add_passthrough_step" "there's no way you have a disable assign in the passthru rsteps"
    in
    debug ("==== "^(HwLib.hwcompname2str comp.d.name)^"====\n");
    List.iter add_passthru_step passthru_rsteps;
    let passthru_ssteps = QUEUE.to_list sstepq in
    QUEUE.destroy sstepq;
    if REF.dr valid then
      Some (normal_ssteps @ passthru_ssteps)
    else
      None
    

  let passthru_unify tbl (comp:hwvid hwcomp) (cfg:hwcompcfg)
      (inputs:hwvid list) (hwvar:hwvid hwportvar) (extend:mid ast)
      (unify:rstep list->rstep list list) : (string*rstep list) list =
    let expr = {expr=mast2uast extend} in
    let resultq = QUEUE.make () in
    let enq i lst = List.iter (fun x -> noop (QUEUE.enqueue resultq (i,x))) lst in
    let mkrstep (sel:string) rest (x:hwvid) = match x with
      | HNPort(_,_,port,_) ->
        if port != sel then
          RDisableAssign(port,expr.expr)::rest
        else
          rest
      | _ -> error "pass_through_unify" "a parameter is not a viable input port"
    in
    (*add port connections*)
    let mkrsteps (sel:hwvid) = match sel with
      | HNPort(_,_,port,_) -> port,(List.fold_left (fun rest x -> mkrstep port rest x) [] inputs)
      | HNParam(_) -> error "pass_through_unify" "a parameter is not a viable input port"
    in
    List.iter (fun inp ->
        let port,rsteps = mkrsteps inp in
        let results = unify rsteps in
        enq port results
      )
      inputs;
    let results = QUEUE.to_list resultq in
    QUEUE.destroy resultq;
    results

  (*HACK a super grody hack where we add zero to make it so the term pattern matching
  doesn't work*)
  let hackit x = match x with
    | Term(_) -> OpN(Add,[x;Integer(0)])
    | _ -> x

  let mkpassthruuexpr () =
    Term(MathId(ASTUnifier.tempmid()))

  let mkpassthrumid () =
    ASTUnifier.tempmid()

  (* Component unification algorithm*)
  let __unify_goal_with_comp (tbl:gltbl) (comp:hwvid hwcomp) (cfg:hwcompcfg) (inst:int option)
      (hwvar:hwvid hwportvar) (g:unifiable_goal)
      (initialize:unit->ucomp_conc*sstep list) =

    let commit_results results fxn =
      let comp,init = initialize () in
      (*commmit each node, honoring any after-the-fact node murdering*)
      let committed = List.map (fun (rsteps) ->
          match fxn comp rsteps init with
          | Some(ssteps) ->
            debug ("    -> converted to "^(LIST.length2str ssteps)^" ssteps");
            SearchLib.mknode_child_from_steps tbl.search tbl (ssteps);
            Some(ssteps)
          | None ->
            debug ("    -> failed to convert unify steps");
            None
        ) results
      in
      let actual_commits = OPTION.conc_list committed in 
      List.length actual_commits 
    in
    match g with
      | GUMathGoal(mgoal) ->
        begin
          let results =
            ASTUnifier.unify_comp_with_mvar tbl.env.hw tbl.env.math
              comp cfg inst hwvar.port mgoal.d.name
          in
          commit_results results (fun ccomp (rsteps) inits ->
              Some (rsteps_to_ssteps tbl ccomp rsteps inits)
            )
        end

      | GUHWInExprGoal(hgoal) ->
        let results =
          ASTUnifier.unify_comp_with_hwvar tbl.env.hw tbl.env.math
            comp cfg inst hwvar.port (hackit (mast2uast hgoal.expr)) []
        in
        commit_results results (fun ccomp rsteps inits ->
            Some(((rslvd_goal_to_ssteps_inexp tbl ccomp hwvar hgoal) @
                  (rsteps_to_ssteps tbl ccomp rsteps inits)))
          )

      | GUHWConnInBlock(hgoal) ->
        let inputs =
          SolverCompLib.get_extendable_inputs_for_inblock_goal tbl.env.hw ConcCompLib.newcfg
            hwvar hgoal.wire hgoal.prop
        in
        let results = passthru_unify tbl comp cfg inputs hwvar (Term(mkpassthrumid())) (fun inits ->
            ASTUnifier.unify_comp_with_hwvar
              tbl.env.hw tbl.env.math comp cfg inst
              hwvar.port (mkpassthruuexpr()) inits
          )
        in
        commit_results results (fun ccomp (input,rsteps) inits ->
            error "hwconninblock" "unimplemented"
          )

      | GUHWConnOutBlock(hgoal) ->
        let inputs =
          SolverCompLib.get_extendable_inputs_for_outblock_goal tbl.env.hw ConcCompLib.newcfg
            hwvar hgoal.wire hgoal.prop
        in
        let results = passthru_unify tbl comp cfg inputs hwvar (Term(mkpassthrumid())) (fun inits ->
            ASTUnifier.unify_comp_with_hwvar tbl.env.hw tbl.env.math
              comp cfg inst hwvar.port
              (mkpassthruuexpr()) inits 
          )
        in
        commit_results results (fun ccomp ((input,rsteps):string*rstep list) inits ->
            let invar = HwLib.comp_getvar ccomp.d input in 
            let outvar = hwvar in
            match passthru_rsteps_to_ssteps tbl ccomp rsteps inits hgoal.expr with
            | Some(ssteps) ->
              Some((rslvd_goal_to_ssteps_outblock tbl ccomp invar outvar hgoal) @ ssteps)
            | None -> None
          )

      | GUHWConnPorts(conns) ->
        let prop = HwLib.getprop tbl.env.hw conns.src.comp.name conns.src.port in
        let inputs : hwvid list =
          SolverCompLib.get_extendable_inputs_for_conn_goal tbl.env.hw ConcCompLib.newcfg
            hwvar conns.src prop
        in
        let results = passthru_unify tbl comp cfg inputs hwvar (Term(mkpassthrumid())) (fun inits ->
            ASTUnifier.unify_comp_with_hwvar
              tbl.env.hw tbl.env.math comp cfg inst
              hwvar.port (mkpassthruuexpr()) inits
          )
        in
        commit_results results (fun ccomp ((input,rsteps):string*rstep list) inits ->
            let invar = HwLib.comp_getvar ccomp.d input in 
            let outvar = hwvar in
            match passthru_rsteps_to_ssteps tbl ccomp rsteps inits conns.expr with
            | Some(ssteps) ->
              Some((rslvd_goal_to_ssteps_conn tbl ccomp invar outvar conns) @
                   ssteps)
            | None -> None
        )

  let unify_goal_with_new_comp (tbl:gltbl) (ucomp:ucomp) (hwvar:hwvid hwportvar) (g:unifiable_goal) =
    let initialize (type a) () : ucomp_conc*sstep list=
      let comp : ucomp_conc = SolverCompLib.mk_conc_comp tbl ucomp.d.name in
      let inits = [
        SModCompCtx(SCMakeConcComp(comp));
        SModSln(SSlnAddComp({name=comp.d.name;inst=comp.inst}))
      ]
      in
      comp,inits
    in
    __unify_goal_with_comp tbl ucomp.d (ConcCompLib.mkhwcompcfg ()) None hwvar g initialize

  
  let unify_goal_with_conc_comp (tbl:gltbl) (ucomp:ucomp_conc) (hwvar:hwvid hwportvar) (g:unifiable_goal) =
    let initialize (type a) () : ucomp_conc*sstep list=
      ucomp,[]
    in
    __unify_goal_with_comp tbl ucomp.d ucomp.cfg (Some ucomp.inst) hwvar g initialize

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
      debug (">>> NUMBER OF COMPATIBLE COMPONENTS  "^
             (string_of_int (PRIOQUEUE.size prio_comps))^" <<<");
      PRIOQUEUE.iter prio_comps (fun (prio:int) (cmpkind,hwvar) ->
          begin
            match cmpkind with
            | HWCompNew(cmpname) ->
              let hwcomp = SolverCompLib.get_avail_comp tbl cmpname in 
              begin
                debug ("new: ["^(string_of_int prio)^"] <"^(HwLib.hwcompname2str hwcomp.d.name)^
                       "> "^(HwLib.hwportvar2str hwvar hwid2str^"\n"));
                let nslns = unify_goal_with_new_comp tbl hwcomp hwvar g in
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
      let nsols = REF.dr nsols in
      (*if there are any solutions*)
      if nsols > 0 then
        begin
          debug ("[FOUND-SOLS] ===> Found <"^(string_of_int nsols)^"> solutions");
          SlvrSearchLib.decrease_goal_weight tbl.search (GUnifiable g) (0.1);
          ()
        end
      else
        begin
          debug ("//NO-SOLS// ===> Found no solutions");
          SlvrSearchLib.increase_goal_weight tbl.search (GUnifiable g) 1.;
          SearchLib.deadend tbl.search (SearchLib.cursor tbl.search) tbl;
          ()
        end


  let trivial_connection_to_steps (tbl:gltbl) (conn:goal_conn) : sstep list =
    debug "connection is trivial.";
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnPorts(conn))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    let steps = [
      SModSln(SSlnAddConn({src=conn.src;dst=conn.dst}))
    ] @ rm_goal_steps in
    steps

  let get_trivial_connections (tbl) : goal_data list =
    let active_goals = GoalLib.get_active_goals tbl in
    let trivial_connect_goals = GoalLib.filter_goals tbl (fun d ->
        match d with
        | GUnifiable(GUHWConnPorts(conn)) ->
          HwLib.is_connectable
            tbl.env.hw conn.src.comp.name conn.src.port
            conn.dst.comp.name conn.dst.port
        | _ -> false
      ) in
    trivial_connect_goals

  let solve_trivial_connections (tbl) =
    let conns = get_trivial_connections tbl in
    let stepq = QUEUE.make () in
    let enq lst  =
      List.iter (fun x -> noop (QUEUE.enqueue stepq x)) lst
    in
    List.iter (fun conn -> match conn with
        | GUnifiable(GUHWConnPorts(conn)) ->
          begin
            SlvrSearchLib.decrease_goal_weight tbl.search (GUnifiable(GUHWConnPorts(conn))) 1.;
            enq (trivial_connection_to_steps tbl conn)
          end
        | _ -> ()
      ) conns;
    let steps = QUEUE.to_list stepq in
    QUEUE.destroy stepq;
    let curs = SearchLib.cursor tbl.search in
    if List.length conns > 0 then
      begin
        SearchLib.visited tbl.search curs;
        SearchLib.mknode_child_from_steps tbl.search tbl steps;
        ()
      end
    else
      ()

  let has_trivial_connections (tbl) =
    List.length (get_trivial_connections tbl) > 0

  let solve_goal (tbl:gltbl) (g:goal) =
    let root = SearchLib.cursor tbl.search in
    let mint,musr = mkmenu tbl (Some g) in
    mint "g";
    musr ();
    if has_trivial_connections tbl then
      begin
        debug (">> NEVERMIND! I found some trivial connections.");
        noop (solve_trivial_connections tbl)
      end
    else if g.active = false
    then error "solve_goal" "cannot solve inactive goal"
    else
      match g.d with
      |GUnifiable(g) -> solve_unifiable_goal tbl g
      | _ -> error "solve_goal" "unimplemented"

  let solve_subtree (tbl:gltbl) (root:(sstep snode)) (nslns:int) (depth:int) : unit =
    let mint,musr = mkmenu tbl (None) in
    let rec rec_solve_subtree (targ_node:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      let currslns = SearchLib.num_solutions tbl.search (Some root) in 
      if currslns >= nslns then
        begin
         debug "[search_tree] Found enough solutions";
         musr ();
         ()
        end
      else
        begin
        debug ("found "^(string_of_int currslns)^" / "^(string_of_int nslns));
        if SearchLib.is_exhausted tbl.search (Some root) then
          begin
            debug "no more nodes left to check.";
            musr ();
            ()
          end
        else
          begin
            SearchLib.move_cursor tbl.search tbl targ_node;
            if List.length ( GoalLib.get_active_goals tbl ) = 0 then
              begin
                mark_if_solution tbl targ_node;
                musr()
              end
            else
              let targ_goal = get_best_valid_goal tbl in 
              musr();
              solve_goal tbl targ_goal;
              begin
                match get_best_valid_node tbl None depth with
                | Some(next_node) ->
                  let currslns = SearchLib.num_solutions tbl.search (Some root) in 
                  begin
                    if currslns >= nslns then
                      begin
                        debug "[search_tree] Found enough solutions";
                        musr ();
                        ()
                      end
                    else
                      rec_solve_subtree next_node
                  end

                | None ->
                  debug ("[TERMINATE] found "^
                         (string_of_int currslns)^" / "^(string_of_int nslns));
                  debug "[TERMINATE] could not find another node";
                  musr();
                  ()
              end
          end

        end
    in
    debug "[search-tree] starting";
    mint "g";
    (*move to a frontier*)
    let maybe_root = SearchLib.root tbl.search in
    begin
      match maybe_root with
      | Some(root) -> 
        begin
          let paths : sstep snode list= SearchLib.get_paths tbl.search None in 
          musr ();
          match paths with
          | starting_node::t -> rec_solve_subtree starting_node
          | [] -> ()
        end
      | None -> error "solve_tree" "root is empty/unset"
    end

  let solve (v:gltbl) (nslns:int) (depth:int) : ((sstep snode) list) option =
    let mint,musr = mkmenu v (None) in
    try
      begin
        SlvrSearchLib.clear_weights ();
        debug ("find # solutions: "^(string_of_int nslns));
        match SearchLib.root v.search with
        | Some(root) ->
          begin
            solve_subtree v root nslns depth;
            let slns = SearchLib.get_solutions v.search (Some root) in
            let currslns = SearchLib.num_solutions v.search (Some root) in 
            match slns with
            | [] -> None
            | lst -> Some(lst)
          end
        | None -> error "solve" "the tree has no root."
      end
    with
    | SolverCompLibError(e) ->
      begin
        warn "[SOLVE][EXCEPTION]" e;
        force (fun () -> musr());
        force (fun () -> musr());
        raise (SolverCompLibError e)
      end


end
