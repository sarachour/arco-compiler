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

(* Mapping *)
open SMapMain

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
          noop (SMapMain.infer v)
        end
      else if STRING.startswith inp "x" then
        begin
          Printf.printf ("---- Summarizing Heuristics------\n");
          noop (SMapMain.infer_feasible v);
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



  
  let test_node_map_cons tbl (node:sstep snode) =
    let mint,musr= mkmenu tbl None in
    let jaunt_enabled = Globals.get_glbl_bool "enable-jaunt" in
    if jaunt_enabled  = false ||
       (jaunt_enabled = true && SMapMain.infer_feasible tbl) then
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

  
  let mark_if_solution (v:gltbl) (curr:(sstep snode)) = 
    let mint,_ = mkmenu v None in
    debug "[mark-if-solution] testing if solution.";
    if GoalLib.num_active_goals v = 0 then
      begin
        mint "s";
        if HwConnRslvrLib.consistent v && test_node_map_cons v curr then
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
      (*TODO: only check nodes in end. If search becomes sufficiently fast, change*)
      else if test_node_map_cons tbl node then
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
  let rstep_assign_input_port_to_ssteps(stepq:sstep queue) (tbl:gltbl) (comp:ucomp_conc)
      (v:string) (cfg:hwvarcfg) (force_passthrough:bool) : unit =
    let enq s = noop (QUEUE.enqueue stepq s) in
    let wire = SlnLib.mkwire comp.d.name comp.inst v in
    match uast2mast cfg.expr with

    | Term(MNVar(MInput,name)) ->
      begin
        enq (SModSln(SSlnAddRoute(MInLabel({var=name;wire=wire}))));
        let goal = GoalLib.mk_inblock_goal tbl wire (uast2mast cfg.expr) in
        enq (SModGoalCtx(SGAddGoal(goal)))
      end

    | Term(MNVar(MLocal,name)) ->
      (*either extend the option*)
      begin
        enq (SModSln(SSlnAddRoute(MLocalLabel({var=name;wire=wire}))));
        if force_passthrough then
          let goal = GoalLib.mk_hexpr_goal tbl wire (uast2mast cfg.expr) in
          enq (SModGoalCtx(SGAddGoal(goal)))
        else
          enq (SModSln(SSlnAddConsumer(MLocalLabel({var=name;wire=wire}))));
      end

    | Term(MNVar(MOutput,name)) ->
      begin
        enq (SModSln(SSlnAddRoute(MOutLabel({var=name;wire=wire}))));
        if force_passthrough then
          let goal = GoalLib.mk_hexpr_goal tbl wire (uast2mast cfg.expr) in
          enq (SModGoalCtx(SGAddGoal(goal)))
        else
          enq (SModSln(SSlnAddConsumer(MOutLabel({var=name;wire=wire}))));
      end


    | Integer(i) ->
      begin
        let goal = GoalLib.mk_inblock_goal tbl wire (uast2mast cfg.expr) in
        enq (SModGoalCtx(SGAddGoal(goal)));
        enq (SModSln(SSlnAddRoute(ValueLabel({value=Integer i;wire=wire}))))
      end

    | Decimal(d)->
      begin
        let goal = GoalLib.mk_inblock_goal tbl wire (uast2mast cfg.expr) in
        enq (SModGoalCtx(SGAddGoal(goal)));
        enq (SModSln(SSlnAddRoute(ValueLabel({value=Decimal d;wire=wire}))))
      end

    | Term(MNParam(_)) ->
      error "rstep_to_goal" "not expecting param"

    | Term(_) ->
      error "rstep_to_goal" "variable should be covered."

    (*assignment over inputs to output*)
    | expr ->
      (*note: this should create different solutions*)
      begin
        let goal = GoalLib.mk_hexpr_goal tbl wire expr in
        enq (SModGoalCtx(SGAddGoal(goal)));
        enq (SModSln(SSlnAddRoute(MExprLabel({expr=expr;wire=wire}))))
      end



  (*resolve output port assignments*)
  let rstep_assign_output_port_to_gen (stepq:sstep queue )(tbl:gltbl) (comp:ucomp_conc) (v:string) (cfg:hwvarcfg) :
    unit =
    let enq s = noop (QUEUE.enqueue stepq s) in
    let wire = SlnLib.mkwire comp.d.name comp.inst v in
    match uast2mast cfg.expr with
    | Term(MNVar(MInput,name)) ->
      enq (SModSln(SSlnAddGen(MInLabel({var=name;wire=wire}))))
        
    | Term(MNVar(MOutput,name)) ->
        (*this is a generator for an output. remove the math goal*)
      enq (SModSln(SSlnAddGen(MOutLabel({var=name;wire=wire}))))
            

    | Term(MNVar(MLocal,name)) ->
      enq (SModSln(SSlnAddGen(MLocalLabel({var=name;wire=wire}))))
      
    (*if we found a connection*)
    | Term((MNParam(_))) ->
      error "rstep_to_goal" "not expecting param"

    | Integer(i) ->
      enq (SModSln(SSlnAddGen(ValueLabel({value=Integer i;wire=wire}))))

    | Decimal(d)->
      enq (SModSln(SSlnAddGen(ValueLabel({value=Decimal d;wire=wire}))))

    | expr ->
      enq (SModSln(SSlnAddGen(MExprLabel({expr=expr;wire=wire}))))



  let rsteps_to_ssteps (tbl:gltbl) (comp:ucomp_conc) (rsteps:rstep list) (ssteps:sstep list)
    (force_passthrough: bool)=
    let compid = {name=comp.d.name;inst=comp.inst} in 
    let sstepq = QUEUE.make () in
    let enq x = noop (QUEUE.enqueue sstepq x) in
    let add_step (rstep:rstep) : unit =
          match rstep with
          (*input assignments become goals*)
          | RAddInAssign(v,cfg) ->
            enq (SModCompCtx(SCAddInCfg(compid,v,cfg)));
            rstep_assign_input_port_to_ssteps sstepq tbl comp v cfg force_passthrough

          (*out assignments are already satisfied*)
          | RAddOutAssign(v,cfg) ->
            enq (SModCompCtx(SCAddOutCfg(compid,v,cfg)));
            rstep_assign_output_port_to_gen sstepq tbl comp v cfg

          | RAddParAssign(v,cfg) ->
            enq (SModCompCtx(SCAddParCfg(compid,v,cfg)))

          | RConnectOutput(src,destwire,cfg) ->
            let srcwire : wireid = {comp={name=comp.d.name; inst=comp.inst}; port=src} in
            let conn_goal = GoalLib.mk_conn_goal tbl
                srcwire destwire (uast2mast cfg.expr)
            in
            begin
              enq (SModGoalCtx(SGAddGoal(conn_goal)));
              rstep_assign_output_port_to_gen sstepq tbl comp src cfg
            end

          | RConnectInput(src,srcwire,cfg) ->
            let destwire : wireid = {comp={name=comp.d.name; inst=comp.inst}; port=src} in
            let conn_goal = GoalLib.mk_conn_goal tbl
                srcwire destwire (uast2mast cfg.expr)
            in
            begin
              enq (SModGoalCtx(SGAddGoal(conn_goal)));
              rstep_assign_output_port_to_gen sstepq tbl comp src cfg
            end

          | RSolveMathVar(src,MNVar(MOutput,name)) ->
            begin
              let srcwire : wireid = {comp={name=comp.d.name; inst=comp.inst}; port=src} in
              enq (SModSln(SSlnAddProducer(MOutLabel({var=name;wire=srcwire}))));
              let goal_to_remove_opt : goal option = GoalLib.try_get_math_goal tbl name in
              begin
                match goal_to_remove_opt with
                | Some(goal_to_remove) ->
                  enq (SModGoalCtx(SGRemoveGoal(goal_to_remove)));
                | None -> ()
              end;
              let conn_outblock_goal = GoalLib.mk_outblock_goal tbl srcwire
                  (Term (MNVar(MOutput,name)))
              in
              enq (SModGoalCtx(SGAddGoal(conn_outblock_goal)))
            end

          | RSolveMathVar(src,MNVar(MLocal,name)) ->
            begin
              let srcwire : wireid = {comp={name=comp.d.name; inst=comp.inst}; port=src} in
              enq (SModSln(SSlnAddProducer(MLocalLabel({var=name;wire=srcwire}))));
              let goal_to_remove_opt : goal option = GoalLib.try_get_math_goal tbl name in
              begin
                match goal_to_remove_opt with
                | Some(goal_to_remove) ->
                  enq (SModGoalCtx(SGRemoveGoal(goal_to_remove)));
                | None -> ()
              end
            end

    in
    List.iter add_step rsteps;
    let steps = QUEUE.to_list sstepq in
    QUEUE.destroy sstepq;
    ssteps @ steps
    


  (* Component unification algorithm*)
  let __unify_goal_with_comp : gltbl -> hwvid hwcomp -> hwcompcfg -> int option ->
    hwvid hwportvar -> unifiable_goal -> (unit->ucomp_conc*sstep list) =
    fun tbl comp cfg inst hwvar unifiable_goal initialize ->
      let nslns = REF.mk 0 in
      let is_used_comp = inst <> None in 
      let commit_results : rstep list list -> sstep list ->
        (ucomp_conc -> rstep list -> sstep list -> sstep list ) -> unit =
        fun results extra_steps func -> 
          let conccomp,initial_steps = initialize () in
          let common_steps :sstep list = extra_steps @ initial_steps in
          (*commmit each node, honoring any after-the-fact node murdering*)
          List.iter (fun (rsteps:rstep list) ->
              let ssteps = func conccomp rsteps common_steps in
              debug ("    -> converted to "^(LIST.length2str ssteps)^" ssteps");
              SearchLib.mknode_child_from_steps tbl.search tbl (ssteps);
              REF.upd nslns (fun x -> x + 1);
              ()
            ) results
      in 
      let matched_goals : (int*goal) list=
        GoalLib.find_goals tbl (GUnifiable(unifiable_goal)) in
      let rm_goal_steps :sstep list=
        List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
      in
      let mint,musr = mkmenu tbl (None) in
      begin
        match unifiable_goal with
        | GUMathGoal(mgoal) ->
            let results :rstep list list =
              ASTUnifier.unify_comp_with_mvar tbl.env.hw tbl.env.math
                comp cfg inst hwvar.port mgoal.d.name
            in
              BOOLEAN.both (fun force_passthrough ->
                commit_results results rm_goal_steps (fun ccomp (rsteps) inits ->
                      rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough
                  )
              )

        | GUHWInExprGoal(hgoal) ->
          let port_out_portvar = hwvar in
          let port_out_var : hwvid = HwLib.portvar2hwid port_out_portvar inst in
          let conn_end_wire = hgoal.wire in
          let conn_end_var = SolverCompLib.wireid2hwid tbl conn_end_wire in
          let results : rstep list list =
            ASTUnifier.unify_comp_with_hwvar tbl.env.hw tbl.env.math
              comp cfg inst
              port_out_portvar.port
              conn_end_var
              (*(hackit (mast2uast hgoal.expr)) []*)
              ((mast2uast hgoal.expr)) []
          in
          (*removing the goal step, and removing the route command*)
          let common_steps = rm_goal_steps in
          begin
            BOOLEAN.both(fun force_passthrough ->
                commit_results results rm_goal_steps (fun ccomp rsteps inits ->
                    (rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough)
                  )
              )
          end


        | GUHWConnInBlock(hgoal) ->
          (*which inputs are extendable*)
          (*INBLOCK -> port_in -> COMP -> port_out ->  conn_end*)
          let conn_end_wire = hgoal.wire in
          let conn_end_var = SolverCompLib.wireid2hwid tbl conn_end_wire in
          let port_out_portvar = hwvar in
          let port_out_var : hwvid = HwLib.portvar2hwid port_out_portvar inst in
          let port_in_vars : hwvid list=
            SolverCompLib.get_extendable_inputs_for_inblock_goal tbl.env.hw ConcCompLib.newcfg
              hwvar hgoal.wire hgoal.prop
          in
          if is_used_comp then () else
          begin
            (*for each feasible port the expression can be forced through to connect to an input,
              ensure that the expression is passed through*)
            List.iter (fun (port_in_var:hwvid) ->
                let port_in_portname = HwLib.hwid2portname port_in_var in
                (*the inpurt must equal the expr*)
                let results : rstep list list =
                  ASTUnifier.unify_comp_with_hwvar_passthrough tbl.env.hw tbl.env.math
                    comp cfg inst
                    port_out_portvar.port port_in_portname 
                    conn_end_var
                    (mast2uast hgoal.expr) []
                in
                BOOLEAN.both (fun force_passthrough ->
                    commit_results results rm_goal_steps (fun ccomp rsteps inits ->
                        (rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough)
                      )
                  )
              ) port_in_vars; 
          end



        | GUHWConnOutBlock(hgoal) ->
          (*which inputs are extendable*)
          (* conn_start-> port_in -> COMP -> port_out -> OUTBLOCK *)
          let conn_start_wire : wireid = hgoal.wire in
          let conn_start_var : hwvid = SolverCompLib.wireid2hwid tbl conn_start_wire in
          let port_out_portvar = hwvar in 
          let port_out_var : hwvid = HwLib.portvar2hwid port_out_portvar inst in
          let port_in_vars : hwvid list =
            SolverCompLib.get_extendable_inputs_for_outblock_goal tbl.env.hw ConcCompLib.newcfg
              port_out_portvar conn_start_wire hgoal.prop
          in
          let conn_start_label = SlnLib.wire2producer tbl.sln_ctx conn_start_wire in
          if is_used_comp then () else
          begin
            LIST.iter (fun (port_in_var:hwvid) ->
                let port_in_portname = HwLib.hwid2portname port_in_var in
                (*the inpurt must equal the expr*)
                let results : rstep list list =
                  ASTUnifier.unify_comp_with_hwvar_passthrough tbl.env.hw tbl.env.math
                    comp cfg inst
                    port_out_portvar.port port_in_portname 
                    conn_start_var
                    (mast2uast hgoal.expr) []
                in
                BOOLEAN.both (fun force_passthrough ->
                    commit_results results rm_goal_steps (fun ccomp rsteps inits ->
                        let port_out_wire = mkwire ccomp.d.name ccomp.inst port_out_portvar.port in
                        match conn_start_label with
                        | Some(label) ->
                          let new_label =
                            SlnLib.xchg_wire label port_out_wire
                          in
                          SModSln(SSlnAddProducer(new_label))::
                          (rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough)

                        | None ->
                          rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough
                      )
                  )
              ) port_in_vars;
          end




        | GUHWConnPorts(conns) ->
          (*conn_start -> conn end *)
          (*conn_start -> port_in -> COMP -> port_out -> conn_end *)
          (*given: port_out -> conn_end*)
          let conn_start_wire : wireid = conns.src and conn_end_wire : wireid = conns.dst in
          let conn_start_var : hwvid = SolverCompLib.wireid2hwid tbl conn_start_wire in
          let conn_uexpr : unid ast= mast2uast conns.expr in
          (*output port name, port variable and hwvid *)
          let port_out_portvar : hwvid hwportvar= hwvar in
          let port_out_var : hwvid = HwLib.portvar2hwid port_out_portvar inst in
          let port_out_name = port_out_portvar.port in
          let prop = HwLib.getprop tbl.env.hw conns.src.comp.name conns.src.port in
          (*determine which of the components inputs are found in the expression that
            defines port_out*)
          (*find port_in s.t. conn_start -> .. -> port_in -> COMP -> port_out *)
          let port_input_vars : hwvid list =
            SolverCompLib.get_extendable_inputs_for_conn_goal tbl.env.hw
              ConcCompLib.newcfg port_out_portvar conn_start_wire prop
          in
          begin
            (*force (fun () -> musr());*)
            (*for each possible input that can be extended that belongs to component comp*)
            LIST.iter (fun (port_in_var:hwvid) ->
                let port_in_name : string = HwLib.hwid2portname port_in_var in
                (*the inpurt must equal the expr. hwvar.port is the component output
                inport is the component input*)
                let results : rstep list list =
                  ASTUnifier.unify_comp_with_hwvar_passthrough tbl.env.hw tbl.env.math
                    comp cfg inst
                    port_out_name port_in_name
                    conn_start_var
                    conn_uexpr []
                in
                (*remove the label from the receiving port.*)
                BOOLEAN.both (fun force_passthrough ->
                    commit_results results rm_goal_steps (fun ccomp rsteps inits ->
                        let port_out_wire : wireid = HwLib.hwid2wireid port_out_var ccomp.inst in
                        let port_in_wire : wireid = HwLib.hwid2wireid port_in_var ccomp.inst in
                        (*try and connect the source wire to the input of the component*)
                        let dst_conn_goal = GoalLib.mk_conn_goal tbl
                            port_out_wire conn_end_wire conns.expr
                        in
                        (*add a goal for connecting conn_start_wire -> port_in_wire *)
                        let src_conn_goal = GoalLib.mk_conn_goal tbl 
                            conn_start_wire port_in_wire conns.expr
                        in
                        SModGoalCtx(SGAddGoal(src_conn_goal))::
                        SModGoalCtx(SGAddGoal(dst_conn_goal))::
                          (rsteps_to_ssteps tbl ccomp rsteps inits force_passthrough)
                      )
                  )
              ) port_input_vars;
            (*force (fun () -> musr());*)
          end
      end;
      REF.dr nslns

        

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
          SearchLib.visited tbl.search (SearchLib.cursor tbl.search);
          SlvrSearchLib.decrease_goal_weight tbl.search (GUnifiable g) (0.001);
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
    let mint,musr = mkmenu tbl (None) in
    let get_label_of_input_wire (wire:wireid) : ulabel =
      let labels: ulabel list = SlnLib.wire2labels tbl.sln_ctx wire in
      match labels with
      | [h] -> h
      | [] -> 
        begin
          Printf.printf "=== Error (%s) ===\n" (HwLib.wireid2str wire);
          force (fun () -> musr());
          raise (SolverEqnError "get_label_of_input_wire: no labels .")
        end

      | _ ->
        begin
          let label_str : string = LIST.tostr 
              (fun (lbl:ulabel) -> SlnLib.ulabel2str lbl) "\n" labels in
          Printf.printf ("== Labels for <%s> ==\n%s\n")
            (HwLib.wireid2str wire) label_str;
          raise (SolverEqnError "get_label_of_input_wire: cannot have multiple labels.")
        end

    in
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnPorts(conn))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    let steps = [
      SModSln(SSlnAddConn({src=conn.src;dst=conn.dst}));
    ] @ rm_goal_steps in
    Printf.printf "%s\n" (LIST.tostr SlvrSearchLib.step2str "\n" steps);
    steps


  let trivial_inblock_to_steps (tbl:gltbl) (ioblock:goal_ioblock) : sstep list =
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnInBlock(ioblock)))
    in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    let label = SlnLib.wire2ulabel ioblock.wire ioblock.expr in
    (*connect to an input block.*)
    let steps = [
      SModSln(SSlnAddConsumer(label))
    ] @ rm_goal_steps
    in
    steps


  let trivial_outblock_to_steps (tbl:gltbl) (ioblock:goal_ioblock) : sstep list =
    let matched_goals : (int*goal) list=
      GoalLib.find_goals tbl (GUnifiable(GUHWConnOutBlock(ioblock))) in
    let rm_goal_steps :sstep list=
      List.map (fun (i,x) -> SModGoalCtx(SGRemoveGoal(x))) matched_goals
    in
    let steps = [] @ rm_goal_steps in
    steps

  let get_trivial_connections (tbl) : goal_data list =
    let active_goals = GoalLib.get_active_goals tbl in
    let trivial_connect_goals = GoalLib.filter_goals tbl (fun d ->
        match d with
        | GUnifiable(GUHWConnPorts(conn)) ->
          HwLib.is_connectable
            tbl.env.hw conn.src.comp.name conn.src.port
            conn.dst.comp.name conn.dst.port
        | GUnifiable(GUHWConnInBlock(conn)) ->
          HwLib.is_inblock_reachable
            tbl.env.hw conn.wire
        | GUnifiable(GUHWConnOutBlock(conn)) ->
          HwLib.is_outblock_reachable
            tbl.env.hw conn.wire

        | _ -> false
      ) in
    trivial_connect_goals



  let solve_trivial_connections (tbl) =
    let mint,musr = mkmenu tbl (None) in
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
        | GUnifiable(GUHWConnInBlock(conn)) ->
          begin
            SlvrSearchLib.decrease_goal_weight tbl.search (GUnifiable(GUHWConnInBlock(conn))) 1.;
            enq (trivial_inblock_to_steps tbl conn)
          end

        | GUnifiable(GUHWConnOutBlock(conn)) ->
          begin
            SlvrSearchLib.decrease_goal_weight tbl.search (GUnifiable(GUHWConnOutBlock(conn))) 1.;
            enq (trivial_outblock_to_steps tbl conn)
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
      |GUnifiable(g) ->
        begin
          solve_unifiable_goal tbl g
        end

      | _ -> error "solve_goal" "unimplemented"



  let solve_subtree (tbl:gltbl) (root:(sstep snode)) (nslns:int) (depth:int) : unit =
    let mint,musr = mkmenu tbl (None) in
    let rec rec_solve_subtree (targ_node:(sstep snode)) =
      (*we've exhausted the subtree - there are no more paths to explore*)
      let currslns = SearchLib.num_solutions tbl.search (Some root) in 
      if currslns >= nslns then
        begin
         Printf.printf "[search_tree] Found %d/%d solutions" currslns nslns;
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
                        Printf.printf "[search_tree] Found %d/%d solutions" currslns nslns;
                        musr ();
                        ()
                      end
                    else
                      rec_solve_subtree next_node
                  end

                | None ->
                  begin
                    let currslns = SearchLib.num_solutions tbl.search (Some root) in
                    debug ("[TERMINATE] found "^
                           (string_of_int currslns)^" / "^(string_of_int nslns));
                    debug "[TERMINATE] could not find another node";
                    musr();
                    ()
                  end

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
        raise (SolverCompLibError e)
      end


end
