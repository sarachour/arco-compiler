open Util

open ASTUnifyData


open Interactive
open Globals
open AST

open HWData
open HWLib
open MathData
open MathLib

open Search
open SearchData

open SolverGoalTableFactory 
open SolverData
open SolverCompLib
open SolverUtil
open SlnLib 
open SolverSearch
open SolverEqn

open SolverMultiData
open GoalLib

open SolverEmitSolution

exception SolverMultiError of string

let error n m = raise (SolverMultiError (n^":"^m))



let _print_debug : string -> unit = print_debug 1 "multi"
let debug : string -> unit = print_debug 1 "multi"
let m_menu = menu 1
let m_print_inter = print_inter 1
module MultiSearchTree =
struct
  let currtbl = REF.mk None


  let upd_curr_tbl x = REF.upd currtbl (fun y -> x )

  let partid2str (id:part_id) = (id.mvr)^"#"^(string_of_int id.ident)
  let glblid2str (id:glbl_id) = (id.mvr_seq)^"#"^(string_of_int id.ident) 
  let step2str x = match x with
    | MSSolveVar(id) -> "-var "^(id)
    | MSPartialApp(id) -> "#partial"^(partid2str id)
    | MSGlobalApp(id) -> "#global "^(glblid2str id)

  let apply_step (env:mutbl) (x:mustep) : mutbl =
    match x with
    | MSPartialApp(id) ->
      let _ = SET.add env.local(id) in
      env
    | MSGlobalApp(id) -> 
      let _ = env.global <- Some(id) in 
      env 
    | MSSolveVar(id) ->
      let _ = SET.add env.solved id in
      env
    
  let unapply_step (env:mutbl) (x:mustep) : mutbl =
    match x with
    | MSPartialApp(id) ->
      let _ = SET.rm env.local (id) in
      env
    | MSGlobalApp(idkey) -> 
      let _ = env.global <- None in
      env
    | MSSolveVar(id) ->
      let _ = SET.rm env.solved id in
      env

  let order_step x y = 0


  let score_uniform  (s:mustep list) =
    let state = 0. in
    let delta = 0. in
    SearchLib.mkscore state delta

  let score_depth  (s:mustep list) =
    let state = 0. in
    let delta = 1. in
    SearchLib.mkscore state delta

  
  let score_solved_vars (s:mustep list) =
    let get_partial_app tbl id =
      let tree = MAP.get tbl.state.partials id.mvr in
      let node = SearchLib.id2node tree id.ident in
      let path = SearchLib.get_path tree node in
      path
    in
    let get_global_app tbl id =
      let tree = MAP.get tbl.state.globals id.mvr_seq in
      let node = SearchLib.id2node tree id.ident in
      let path = SearchLib.get_path tree node in
      path
    in
    let count_comps steps =
      LIST.count steps (fun step -> match step with
          | SModCompCtx(SCMakeConcComp(_)) -> true
          | _ -> false
        )
    in
    let score s = match s,REF.dr currtbl with
      | MSPartialApp(id),Some(tbl) ->
        begin
          let st : sstep list = get_partial_app tbl id in
          let ncomps = count_comps st in
          0. -. (float_of_int ncomps) /. 5. -. (RAND.rand_norm())
        end
      | MSGlobalApp(id),Some(tbl) ->
        let st : sstep list = get_global_app tbl id in
        let ncomps = count_comps st in
        0. -. (float_of_int ncomps) /. 5. -. (RAND.rand_norm())

      | MSSolveVar(_),_ -> 100.
      | _ -> 0.
    in 
    let state = List.fold_left (fun r st -> r +. (score st)) 0. s in
    let delta = 10. in
    SearchLib.mkscore (state) delta

  let score_depth_and_ncomps (s:mustep list) =
    let get_partial_app tbl id =
      let tree = MAP.get tbl.state.partials id.mvr in
      let node = SearchLib.id2node tree id.ident in
      let path = SearchLib.get_path tree node in
      path
    in
    let get_global_app tbl id =
      let tree = MAP.get tbl.state.globals id.mvr_seq in
      let node = SearchLib.id2node tree id.ident in
      let path = SearchLib.get_path tree node in
      path
    in
    let count_comps steps =
      LIST.count steps (fun step -> match step with
          | SModCompCtx(SCMakeConcComp(_)) -> true
          | _ -> false
        )
    in
    let cnt_comps s = match s,REF.dr currtbl with
      | MSPartialApp(id),Some(tbl) ->
        begin
          let st : sstep list = get_partial_app tbl id in
          let ncomps = count_comps st in
          0. -. (float_of_int ncomps) /. 3. -. (RAND.rand_norm())
        end
      | MSGlobalApp(id),Some(tbl) ->
        let st : sstep list = get_global_app tbl id in
        let ncomps = count_comps st in
        0. -. (float_of_int ncomps) /. 3. -. (RAND.rand_norm())

      | MSSolveVar(_),_ -> 0.
      | _,_ -> 0.
    in
    let state = List.fold_left (fun r st -> r +. (cnt_comps st)) 0. s in
    let delta = 10. in
    SearchLib.mkscore state delta

  let score_step () =
    let typ = get_glbl_string "multi-selector-branch" in
    match typ with
    | "depth" -> score_depth
    | "uniform" -> score_uniform
    | "depth-and-ncomps" -> score_depth_and_ncomps
    | "solved-and-ncomps" -> score_solved_vars
    | "_" ->   error "score_step" "unknown strategy for eqn-selector-branch"


  let mksearch () =
    let search : (mustep,mutbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_step (score_step()) step2str
    in
      search


end

(*
The multi-solution search tree tries patterns of solutions

*)
module MultiSearch =
struct
  let mkmenu (s:musearch)  =
    let menu_desc = "t=search-tree, o=order, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.search2str s.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "o" then
        let _ = Printf.printf "\n%s\n\n" (QUEUE.tostr s.order (fun x -> x)) in
        let _ = on_finished() in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = m_menu "multi-solver" (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle


  let set2key (x:part_id set) : string =
    let xsort = SET.sort x (fun (x:part_id) (y:part_id) ->
      if x.mvr = y.mvr then
        x.ident - y.ident
      else
        STRING.compare x.mvr y.mvr
    )
    in
    let str = List.fold_right (fun (x:part_id) r->
      x.mvr^"~"^(string_of_int x.ident)^r
    ) xsort "" in
    str

  (*choose a variable, if there are no variables left, don't do anything.*)
  let get_unsolved_var (ms:musearch) : string option=
    if QUEUE.empty ms.order then
      None
    else
      let left = QUEUE.filter ms.order
        (fun x -> SET.has ms.state.solved x = false)
      in
      if LIST.empty left then
        None
      else
        Some (List.nth left 0)


  let is_var_solved (ms:musearch) (v:string) : bool =
    SET.has ms.state.solved v


  let partial_id_to_tree ms (id:part_id ) =
    let tree = MAP.get ms.state.partials id.mvr in
    tree 

  let partial_id_to_steps ms (id:part_id ) =
    let tree = MAP.get ms.state.partials id.mvr in
    let node = SearchLib.id2node tree id.ident in
    let path_nodes = SearchLib.get_path_nodes tree node in
    match path_nodes with
    | root::path ->
      (*exclude root node from path*)
      let part_steps :sstep list = SearchLib.node_path_to_steps tree path in
      let root_steps = root.s in
      root.s,part_steps
    | [root] ->
      error "partial_id_to_steps" "only root node"
    | [] ->
      error "partial_id_to_steps" "node doesn't exist anymore"

  type lcl2glbl_mapper = {
    instmap: (part_id*hwcompinst,int) map;
    compmap: (hwcompname,int) map;
    mutable cnt: int;
  }

  let add_mapping mapper partid inst =
    let key = (partid,inst) in
    if MAP.has mapper.instmap key then
      error "add_mapping" "this has already been declared"
    else
      let id = mapper.cnt in 
      MAP.put mapper.instmap key id;
      mapper.cnt <- mapper.cnt + 1;
      begin
        if MAP.has mapper.compmap inst.name then
          let cnt = MAP.get mapper.compmap inst.name in 
          noop (MAP.put mapper.compmap inst.name (cnt+1))
        else
          noop (MAP.put mapper.compmap inst.name 1)
      end;
      ()

  let mk_mapping () =
    {instmap=MAP.make();compmap=MAP.make();cnt=0}

  let get_mapping mapper (partid:part_id) (inst:hwcompinst) =
    let key = (partid,inst) in
    if MAP.has mapper.instmap key then
      {name=inst.name;inst=MAP.get mapper.instmap key}
    else
      error "get_mapping" "this mapping doesn't exist"

  let build_partial_steps ms (ids:part_id set) =
    let mapper = mk_mapping() in
    let stepq = QUEUE.make () in
    let enq x = noop (QUEUE.enqueue stepq x) in
    let allocate (id:part_id) (step:sstep) = match step with
      | SModSln(SSlnAddComp(inst)) -> add_mapping mapper id inst
      | _ -> ()
    in
    SET.iter_i ids (fun (id:part_id) (idx:int)  ->
        let root_steps,part_steps  = partial_id_to_steps ms id in
        let steps = root_steps @ part_steps in 
        debug ("found # steps: "^(LIST.length2str steps));
        List.iter (fun stp -> noop (allocate id stp)) steps;
        List.iter (fun stp ->
            let stpi =
              SlvrSearchLib.inst2inst_step stp
                (fun inst -> get_mapping mapper id inst)
            in
            enq (stpi)
          ) steps;
        ()
    );
    let steps = QUEUE.to_list stepq in
    (*TODO: test if exceeded maximum number of components*)
    QUEUE.destroy stepq;
    debug ("# partial ids = "^(string_of_int (SET.size ids)));
    debug (SearchLib.steps2str 1 (partial_id_to_tree ms (SET.nth ids 0)) steps);
    steps
(*
    let _ = _print_debug ("Number of partials applied: "^(string_of_int (SET.size ids))) in
    let steps = SET.fold ids (fun (id,i) steps -> steps @ (build_partial_steps ms steps id i)) [] in
    steps
*)

  type glbl_ctx = {
    (*choices to resolve a step*)
    choice_buffer : (sstep list) queue;
    (*must select one of these choices*)
    buffer: ((sstep list) list)  queue;

  }
  let glblctx_mk () =
    {
      choice_buffer = QUEUE.make ();
      buffer = QUEUE.make ();
    }

  let glblctx_mk_chblock ctx =
    QUEUE.clear ctx.choice_buffer;
    ()


  let glblctx_add_ch ctx (x:sstep list) =
    QUEUE.enqueue ctx.choice_buffer x; ()

  let glblctx_commit_chblock ctx =
    QUEUE.enqueue ctx.buffer (QUEUE.to_list ctx.choice_buffer);
    QUEUE.clear ctx.choice_buffer; ()

  let glblctx_mk_nodes ctx : (sstep list) list =
    let step_lists : ((sstep list) list) list =
      QUEUE.to_list ctx.buffer
    in
    debug ("--> Number of options "^(LIST.length2str step_lists));
    let node_lists_3d : ((sstep list) list) list =
      LIST.permutations step_lists
    in
    debug ("--> Number of nodes "^(LIST.length2str node_lists_3d));
    QUEUE.destroy ctx.buffer;
    QUEUE.destroy ctx.choice_buffer;
    List.map (fun (lst:(sstep list) list) ->
        List.fold_left (fun rst q -> q @ rst) [] lst
      ) node_lists_3d

  let create_global_context (ms:musearch) (tbl:gltbl) : sstep list list =
    let ctx = glblctx_mk () in
    (*pull partial solution route to a goal*)
    let _conn_generate_to_route routelbl routewire generates expr =
      debug "   - connecting generates to routes.";
      if LIST.empty generates = false then
        begin
          glblctx_mk_chblock ctx;
          List.iter (fun gen_wire ->
              let goal = GoalLib.mk_conn_goal tbl gen_wire routewire expr in
              glblctx_add_ch ctx ([
                  SModSln(SSlnRmRoute(routelbl));
                  SModGoalCtx(SGAddGoal(goal))
                ]);
          ) generates;
          glblctx_commit_chblock ctx;
        end
      else
        ()
    in
    (*make an input block that connects to a wire*)
    let mk_input_block lbl (wire:wireid) expr =
      debug "   - making an input block.";
      let prop = HwLib.wire2prop tbl.env.hw wire in
      let blk : hwvid hwcomp = HwLib.getcomp tbl.env.hw (HWCmInput prop) in
      let ccblk : ucomp_conc= SolverCompLib.mk_conc_comp tbl (HWCmInput prop) in
      let ccblk_in : wireid =
        SolverCompLib.conccomp_port2wire ccblk (HwLib.ioblock_get_in blk).port
      in
      let ccblk_out : wireid =
        SolverCompLib.conccomp_port2wire ccblk (HwLib.ioblock_get_out blk).port
      in
      let ccblk_inst = SolverCompLib.conccomp2inst ccblk in
      (*connect inside*)
      let goal : goal = GoalLib.mk_conn_goal tbl ccblk_out wire expr in
      let wrap_varcfg lbl = {expr=mast2uast (SlnLib.ulabel2mexpr lbl)} in
      let steps = [
        (*SModSln(SSlnRmRoute(lbl));*)
        SModSln(SSlnAddComp(ccblk_inst));
        SModSln(SSlnAddRoute(SlnLib.xchg_wire lbl ccblk_in));
        SModSln(SSlnAddGen(SlnLib.xchg_wire lbl ccblk_out));
        SModCompCtx(SCMakeConcComp(ccblk));
        SModCompCtx(SCAddInCfg(ccblk_inst,ccblk_in.port,wrap_varcfg lbl));
        SModCompCtx(SCAddOutCfg(ccblk_inst,ccblk_out.port,wrap_varcfg lbl));
        SModGoalCtx(SGAddGoal(goal));
      ] in
      steps 
    in
    (*make an output block that connects to a wire*)
    let mk_output_block lbl (wire:wireid) expr =
      debug "   - making an output block.";
      let prop = HwLib.wire2prop tbl.env.hw wire in
      let blk : hwvid hwcomp = HwLib.getcomp tbl.env.hw (HWCmOutput prop) in
      let ccblk : ucomp_conc= SolverCompLib.mk_conc_comp tbl (HWCmOutput prop) in
      let ccblk_in : wireid =
        SolverCompLib.conccomp_port2wire ccblk (HwLib.ioblock_get_in blk).port
      in
      let ccblk_out : wireid =
        SolverCompLib.conccomp_port2wire ccblk (HwLib.ioblock_get_out blk).port
      in
      let ccblk_inst = SolverCompLib.conccomp2inst ccblk in
      (*connect inside*)
      let goal : goal = GoalLib.mk_conn_goal tbl wire ccblk_in expr in
      let wrap_varcfg lbl = {expr=mast2uast (SlnLib.ulabel2mexpr lbl)} in
      let steps = [
        SModSln(SSlnAddComp(ccblk_inst));
        SModSln(SSlnAddGen(SlnLib.xchg_wire lbl ccblk_in));
        SModSln(SSlnAddGen(SlnLib.xchg_wire lbl ccblk_out));
        SModCompCtx(SCMakeConcComp(ccblk));
        SModCompCtx(SCAddInCfg(ccblk_inst,ccblk_in.port,wrap_varcfg lbl));
        SModCompCtx(SCAddOutCfg(ccblk_inst,ccblk_out.port,wrap_varcfg lbl));
        SModGoalCtx(SGAddGoal(goal));
      ] in
      steps 
    in
    (*these are routes that require you plug in a generate*)
    debug ("==== ROUTES =====");
    SlnLib.iter_routes tbl.sln_ctx (fun (route:('a,'b) label) (generates:wireid list) ->
        debug ("> "^(SlnLib.ulabel2str route));
        let wire = SlnLib.label2wire route in
        match wire.comp.name with
        | HWCmOutput(_) ->
          error "mk_glbl_ctx" "unexpected route to HWCMOutput"
        | HWCmInput(_) ->
          debug "    - ignoring route to input block."
        | HWCmCopy(_) ->
          error "mk_glbl_ctx" "unexpected route to HWCopy"
        | HWCmComp(_) ->
          begin
          match route with
          | MInLabel(lbl)->
            let inpblock_steps = mk_input_block route lbl.wire (SlnLib.ulabel2mexpr route) in
            glblctx_mk_chblock ctx;
            glblctx_add_ch ctx inpblock_steps;
            glblctx_commit_chblock ctx
          | MOutLabel(lbl) ->
            _conn_generate_to_route route lbl.wire generates (SlnLib.ulabel2mexpr route) 
          | MLocalLabel(lbl)->
            _conn_generate_to_route route lbl.wire generates (SlnLib.ulabel2mexpr route) 
          | ValueLabel(lbl)->
            let inpblock_steps = mk_input_block route lbl.wire (SlnLib.ulabel2mexpr route) in
            glblctx_mk_chblock ctx;
            glblctx_add_ch ctx inpblock_steps;
            glblctx_commit_chblock ctx
          | MExprLabel(_) ->
            begin
              let mint,musr = SolverEqn.mkmenu tbl None in
              force (fun() -> musr());
              error "create_global_context"
                "route-config should not be possible incomplete configuration"
            end

        end
      );
    debug ("==== GENERATES =====");
    SlnLib.iter_generates tbl.sln_ctx (fun (generate:('a,'b) label) (route:wireid list) ->
        debug ("> "^(SlnLib.ulabel2str generate));
        let wire = SlnLib.label2wire generate in
        match wire.comp.name with
        | HWCmOutput(_) ->
          debug "    - ignoring generate to output block."
        | HWCmInput(_) ->
          debug "    - ignoring generate to input block."
        | HWCmCopy(_) ->
          error "mk_glbl_ctx" "copy unexpected for generatre"
        | HWCmComp(_) ->
          if SlnLib.connected_to_outblock tbl.sln_ctx wire
          then
            begin
              debug "    - ignoring connected output block";
              ()
            end
          else
            begin
              match generate with
              | MOutLabel(lbl) ->
                (*create a new label*)
                let outblock_steps = mk_output_block generate lbl.wire (SlnLib.ulabel2mexpr generate) in
                glblctx_mk_chblock ctx;
                glblctx_add_ch ctx outblock_steps;
                glblctx_commit_chblock ctx

              | MInLabel(_) ->
                error "create_global_context" "dont do anything special for input propagate"
              | MLocalLabel(_) ->
                ()
              | MExprLabel(_) -> ()
              | ValueLabel(_) ->
                error "create_global_context" "dont do anything special for value"
            end
      );
    let node_steps = glblctx_mk_nodes ctx in
    node_steps

  let build_global_steps ms  : sstep list*sstep list list=
    let dummy_tbl : gltbl = GoalTableFactory.mktbl ms.state.env in
    let part_steps : sstep list = build_partial_steps ms ms.state.local in
    SearchLib.setroot dummy_tbl.search dummy_tbl part_steps;
    let glbl_steps : sstep list list =
      create_global_context ms dummy_tbl
    in
     part_steps,glbl_steps


  let mk_global_tbl (ms:musearch) =
    let tbl : gltbl= GoalTableFactory.mktbl ms.state.env in
    let key = (set2key ms.state.local) in
    (*if this table doesn't exist make a new one*)
    if MAP.has ms.state.globals key = false then
      begin
      let part_steps,gbl_steps_coll = build_global_steps ms in
      GoalTableFactory.mkroot tbl part_steps;
      debug ("======= Partial (Root) Steps "^(LIST.length2str part_steps)^" =======");
      debug (SearchLib.steps2str 1 tbl.search part_steps);

      begin
        match SearchLib.root tbl.search with
        | Some(root) -> SearchLib.visited tbl.search root
        | None -> error "mk_goal_tbl" "there is no root, but we just created it"
      end;
      debug "============================";
      (*add all the gobal steps*)
      List.iter (fun glbl_steps ->
          debug "======= Glbl (Node) Steps =======";
          debug (SearchLib.steps2str 2 tbl.search glbl_steps);
          debug "============================";
          noop (SearchLib.mknode_child_from_steps tbl.search tbl glbl_steps)
        )
        gbl_steps_coll;
      MAP.put ms.state.globals key tbl.search;
      tbl
    end
     (*if this table already exists*)
    else
      let search = MAP.get ms.state.globals key in
      tbl.search <- search;
      tbl

  
   
  (*a solution is complete if all the routing connections are on inputs*)
  let is_complete_sln ms (tbl:gltbl) =
    let valid = REF.mk true in
    SlnLib.iter_routes tbl.sln_ctx (fun (route:ulabel) generates ->
        let wire : wireid= SlnLib.label2wire route in
        match wire.comp.name with
        | HWCmComp(cmp) ->
          begin
            match route with
              | MInLabel(_) -> REF.upd valid (fun x -> false)
              | ValueLabel(_) -> REF.upd valid (fun x -> false)
              | MOutLabel(lbl) ->
                if is_var_solved ms lbl.var
                then REF.upd valid (fun x -> false)
              | MLocalLabel(lbl) ->
                if is_var_solved ms lbl.var
                then REF.upd valid (fun x -> false)
              | MExprLabel(x) ->
                error "is_complete_solution" "not expecting an expression."
          end

        | HWCmInput(cmp) ->
          ()
        | _ ->
          warn "is_complete_sln" "not expected an output or a conn route"

    );
    REF.dr valid

  (*determine if the solution is complete or not and augment tree*)
  let complete_sln ms (tbl:gltbl) (sln: sstep snode) =
    let depth = get_glbl_int "slvr-global-depth" in
    let mint,musr = SolverEqn.mkmenu tbl None in
    SearchLib.move_cursor tbl.search tbl sln;
    if is_complete_sln ms tbl then
      Some(sln)
    else
      begin
        (*declare not a solution*)
        SearchLib.not_solution tbl.search sln;
        SearchLib.visited tbl.search sln;
        let branches : sstep list list = create_global_context ms tbl in 
        debug "======= New Path =======";
        List.iter (fun glbl_steps ->
          debug "======= Glbl (Node) Steps =======";
          debug (SearchLib.steps2str 2 tbl.search glbl_steps);
          debug "============================";
          SearchLib.move_cursor tbl.search tbl sln;
          SearchLib.mknode_child_from_steps tbl.search tbl glbl_steps;
          ()
        ) branches;
        None 
      end

  (*find a global solution, given the set of partials that have been applied*)
  let find_global_solution (ms:musearch) (nsols:int) : sstep snode list option =
    let mint,musr = mkmenu ms in
    let tbl = mk_global_tbl ms in
    let depth = get_glbl_int "slvr-global-depth" in
    (*find the global steps *)
    let rec _find_global_solution () : sstep snode list option = 
      (*the initial set of results*)
      let results : sstep snode list option =
        SolverEqn.solve tbl nsols depth in
      debug "==== Finished Global Sln Search ===";
      musr();
      match results with
      | Some(sln_list) ->
        begin
          let n_candidate = List.length sln_list in
          Printf.printf " > Found %d Candidate Solns\n" n_candidate;
          (*iterate over each result and see if the configuration is still partial*)
          let complete_sln_steps = OPTION.conc_list (List.map (fun sln ->
              complete_sln ms tbl sln
            ) sln_list)
          in
          let n_complete = List.length complete_sln_steps in
          Printf.printf "> %d/%d Candidate Solutions are Complete\n"
            (List.length complete_sln_steps)
            (List.length sln_list);
          musr();
          (*if there are some incomplete solutions*)
          if n_candidate > n_complete then
            _find_global_solution ()
          else
            begin
              match complete_sln_steps with
              | h::t ->
                Some(h::t)
              | [] ->
                None
            end
        end
      | None ->
        begin
          debug " > Found No Solutions";
          None
        end

    in
    _find_global_solution ()

  

  let has_partial_search (ms:musearch) (name:string) : bool =
    MAP.has ms.state.partials name 

  let get_partial_search (ms:musearch) (name:string) : psearch =
    if has_partial_search ms name then
      MAP.get ms.state.partials name
    else
      error "get_partial_search" "no partial search tree exists"

  let make_new_partial_table ms vname =
    let tbl = GoalTableFactory.mktbl ms.state.env in
    GoalTableFactory.mkgoalroot tbl (fun v -> v.name == vname);
    debug ("made a partial tree with "^(string_of_int (GoalLib.num_goals tbl))^" goals");
    MAP.put ms.state.partials vname tbl.search;
    ()

  let mk_partial_tbl (ms:musearch) (id:string) =
    (*make the current search state*)
    begin
      if has_partial_search ms id = false then
        make_new_partial_table ms id;
        ()
    end;
    let tbl = GoalTableFactory.mktbl ms.state.env in
    (*get the current state*)
    (tbl.search <- get_partial_search ms id);
    let maybe_root = SearchLib.root tbl.search in
    match maybe_root with
    | Some(root) ->
      SearchLib.move_cursor tbl.search tbl root;
      Some tbl
    | None ->
      None

  (*TODO*)
  let find_partial_solution (ms:musearch) (pvar:string) (nslns:int) : ((sstep snode) list) option =
    let mint,musr = mkmenu ms in
    (*TODO: why isn't there a root*)
    match mk_partial_tbl ms pvar with
        | Some(ptbl) ->
          begin
            let currsols : int = SearchLib.num_solutions ptbl.search None in
            (*original solution set*)
            let orig : (sstep snode) list= SearchLib.get_solutions ptbl.search None in
            let is_new (q:sstep snode) =
              List.length (LIST.filter (fun (x:sstep snode) -> q.id = x.id) orig) = 0
            in
            let depth = get_glbl_int "slvr-partial-depth" in
            debug "== Finding Partial Solution ==";
            debug (" > Current # Solutions: "^(string_of_int currsols));
            debug (" > # New Solutions To Find: "^(string_of_int nslns));
            musr ();
            let maybe_results : ((sstep snode) list) option =
              SolverEqn.solve ptbl (nslns+currsols) depth
            in
            begin
              debug "==== Finished Partial Sln Search ===";
              SearchLib.clear_cursor ptbl.search;
              musr();
              match maybe_results with
              | None ->
                begin
                  debug ">>> No Partial Results Found <<<";
                  None
                end
                
              | Some(results) ->
                begin
                  debug ">>> Partial Results Found <<<";
                  let new_results :(sstep snode) list =
                    List.filter (fun result -> is_new result) results
                  in
                  begin
                    match new_results with
                    | [] -> None
                    | lst -> Some(lst)
                  end
                end
            end
          end
        (* no goal table was constructed*)
        | None ->
          begin
            warn "find_partial_solution" "nowhere left to search.";
            None
          end
          


(*get the existing global solution*)
  let get_existing_global_solution (ms:musearch) (key:string) (id:int) : gltbl=
    (*initialize table*)
    let gtree : (sstep,gltbl) ssearch= MAP.get ms.state.globals key in
    let ptbl = GoalTableFactory.mktbl ms.state.env in
    ptbl.search <- gtree;
    (*apply root*)
    SearchLib.initenv ptbl.search ptbl;
    (*apply root.*)
    let mint,musr = SolverEqn.mkmenu ptbl None in
    debug ("=> Global Solution: "^key^" :: "^(string_of_int id));
    (*Interactive.force (fun () -> noop (musr()));*)
    let slnnode = SearchLib.id2node gtree id in
    SearchLib.move_cursor gtree ptbl slnnode;
    ptbl


  let get_global_solution_from_node ms x : gltbl option =
    SearchLib.move_cursor ms.search ms.state x;
    match ms.state.global with
    | Some(gid) ->
      Some(get_existing_global_solution ms gid.mvr_seq gid.ident)
    | None -> None

  let emit_solution (ms:musearch) (glbl_node:mustep snode) =
    let curs = SearchLib.cursor ms.search in
    SearchLib.move_cursor ms.search ms.state glbl_node;
    match ms.state.global with
    | Some(id) ->
      let ptbl = get_existing_global_solution ms id.mvr_seq id.ident in
      SolverEmitSolution.proc_sln ms.name ptbl ms.nslns; 
      SolverEmitSolution.proc_sln_mappings ms.name ptbl ms.nslns; 
      ms.nslns <- ms.nslns + 1;
      SearchLib.move_cursor ms.search ms.state curs;
      ()
    | None ->
      ()

  let get_global_solutions (ms:musearch) =
    let snodes = SearchLib.get_solutions ms.search None in
      debug ("Number of Solutions: "^(string_of_int (List.length  snodes)));
      let slns : gltbl option list = List.fold_left (
          fun (rest:gltbl option list) (x:mustep snode) ->
            (get_global_solution_from_node ms x)::rest
      ) [] snodes
      in
      OPTION.conc_list slns 

  let mark_if_new_solution (ms:musearch) (node:mustep snode) =
    let mint,musr = mkmenu ms in
    if get_unsolved_var ms = None then
      begin
        let csln = OPTION.force_conc (get_global_solution_from_node ms node) in
        let slns = get_global_solutions ms in
        let isnew = REF.mk true in
        List.iter (fun sln ->
            if SlnLib.slns_equiv csln.sln_ctx sln.sln_ctx
            then REF.upd isnew (fun x -> false)
          ) slns;
        if REF.dr isnew then
          begin
            debug (">>>NEW SOLUTION!<<<");
            SearchLib.move_cursor ms.search ms.state node;
            SearchLib.solution ms.search node;
            emit_solution ms node;
            ()
          end
        else
          begin
            debug (">>>NOT NEW! KILLING SOLUTION<<<");
            noop (SearchLib.visited ms.search node );
            ()
          end
      end
    else
      debug (">>>SOLUTION IS UNFINISHED <<<");
      ()

  (*Find and add a new partial solutions to different nodes *)
  let augment_with_partial_solution (ms:musearch) (pvar:string) (slns: sstep snode list option)
    :  'a option =
      let mint,musr = mkmenu ms in
      let curs = SearchLib.cursor ms.search in
      let nglbl = Globals.get_glbl_int "multi-num-global-solutions" in
      (*add a global solution from the generate sln. *)
      let add_glbl_sln (curs:mustep snode) (node:sstep snode)  = 
        let key = (set2key ms.state.local) and ident = node.id in
        let steps = [MSGlobalApp({mvr_seq=key;ident=ident})] in
        let glbl_node :mustep snode =
          SearchLib.mknode_child_from_steps ms.search ms.state steps 
        in
        mark_if_new_solution ms glbl_node
      in
      let add_lcl_sln (curs:mustep snode) (node:sstep snode) = 
        let partial = MAP.get ms.state.partials pvar in
        let steps : mustep list= List.fold_left (fun lst step -> match step with
            |SModGoalCtx(SGRemoveGoal(goal_data)) ->
              begin
                match goal_data.d with
                | GUnifiable(GUMathGoal(g)) -> (MSSolveVar(g.d.name))::lst
                | _ -> lst
              end
            | _ -> lst
          ) [MSPartialApp({mvr=pvar;ident=node.id})]
            (SearchLib.get_path partial node)
        in
        SearchLib.move_cursor ms.search ms.state curs;
        SearchLib.mknode_from_steps (ms.search) (ms.state) steps 
      in
      let add_solution (partial_node:mustep snode) =
        SearchLib.move_cursor ms.search ms.state partial_node;
        debug " > Added Local Solution";
        (*find a global solution*)
        debug " > Finding Global Solution";
        musr ();
        match find_global_solution ms nglbl with
        | Some(slns) ->
          begin
            debug ("  >> Found # Global Solutions: "^
                 (string_of_int (List.length slns))^"/"^(string_of_int nglbl));
            List.iter
              (fun sln -> add_glbl_sln partial_node sln)
              slns;
            SearchLib.try_visited ms.search partial_node;
            musr ();
            true
          end

        | None ->
          begin
            debug ("  >> Found NO Solutions.");
            if SearchLib.hasnode ms.search partial_node then
              begin
                debug "   xx let's kill this branch";
                noop (SearchLib.deadend ms.search partial_node ms.state);
              end;
            false
          end
          
      in
      match slns with
      | Some(cslns) ->
        debug "found some partial solutions. Will add partial solution node and global";
        let csln_nodes = List.map (fun (sln:sstep snode) ->
            debug ("== Adding Local Solution : "^(string_of_int sln.id)^" ==");
            add_lcl_sln curs sln
          ) cslns
        in
        let nslns_per_partial = Globals.get_glbl_int "multi-num-global-solutions-per-partial" in
        List.fold_left (fun nslns x ->
            (*if nslns >= ms.nslns then nslns else*)
            if add_solution x then
              nslns + 1
            else
              nslns
        ) 0 csln_nodes;
        (*only mark the node visited if it still exists. This node might not exist.*)
        if SearchLib.hasnode ms.search curs then
          SearchLib.visited ms.search curs;
        slns
      | None ->
        debug "could not find any more partial solutions.";
        SearchLib.visited ms.search curs;
        slns
      
    let augment_with_new_partial_sln (ms:musearch) (pvar) (nslns) =
      let _ = _print_debug "finding new partial solution" in
      let slns : (sstep snode list) option =
        find_partial_solution ms pvar nslns
      in
      let _ = _print_debug "done with search" in
      let res : 'a option = augment_with_partial_solution ms pvar slns in
      res

    let get_partial_slns ms pvar =
      let partial_search = MAP.get ms.state.partials pvar in
      let slns = SearchLib.get_solutions partial_search None in
      if List.length slns = 0 then None else Some(slns)

    let augment_with_existing_partial_sln (ms:musearch) (pvar) =
      if has_partial_search ms pvar = false then
        None
      else
        let partial_slns = get_partial_slns ms pvar in 
        let res : 'a option = augment_with_partial_solution ms pvar partial_slns in
        res

    let n_existing_partial_slns (ms:musearch) (pvar) =
      error "n_existing_partial" "unimplemented"

    (*get the best valid node. If there is no valid node, return none *)
    let rec get_best_valid_node (ms:musearch)  : (mustep snode) option =
      SearchLib.select_best_node ms.search None



    let msolve sl (ms:musearch) (nslns:int): gltbl list option =
      MultiSearchTree.upd_curr_tbl (Some ms);
      let mint,musr = mkmenu ms in
      let _msolve_new id =
          let nnewslns = get_glbl_int "multi-num-partial-solutions" in
          let res  = augment_with_new_partial_sln ms id nnewslns in
          ()
      in
      let rec _msolve () =
        let _msolve_next () =
          musr ();
          let maybe_next_node = get_best_valid_node ms in
          match maybe_next_node with
          | Some(curs) ->
            SearchLib.move_cursor ms.search ms.state curs;
            _msolve();
            ()
          | None ->
            debug "[search_tree] is exhausted";
            begin
              match SearchLib.root ms.search with
              | Some(root) ->
                begin
                  SearchLib.move_cursor ms.search ms.state root;
                  _msolve();
                  ()
                end
              | None ->
                ()
            end
        in
        let cnode = SearchLib.cursor ms.search in
        let cnumslns = SearchLib.num_solutions ms.search None in
        debug ("# Found "^(string_of_int cnumslns)^", Required: "^(string_of_int nslns));
        if cnumslns >= nslns then
           let _ = debug "[DONE] found enough solutions" in
           ()
        else
          match get_unsolved_var ms with
          (*no variables left, mark a sa solution*)
          | None ->
            debug ("no variables, but not a global solution. find another solution");
            (Interactive.force (fun () -> noop (musr())));
            ()
          | Some(id) ->
            debug ("solving target: "^(id));
            if SearchLib.is_exhausted ms.search None then
              begin
                debug ("search tree is exhausted. adding new.");
                _msolve_new id;
                _msolve_next ();
                ()
              end
            else
              debug ("search tree is not exhausted. adding existing:"^(id));
            (*try and augment with existing partials*)
            begin
              if augment_with_existing_partial_sln ms id = None then
                _msolve_new id
            end;
            noop (_msolve_next ())

      in
      _msolve ();
      debug "===== Getting Solutions =====";
      musr ();
      let slns = get_global_solutions ms in 
      match slns with
      | h::t -> Some(h::t)
      |[] ->None

  let order_vars (vars:string queue) (env:mid menv) : unit =
    let tmpq : mid mvar prioqueue = PRIOQUEUE.make (fun x ->
        match x.bhvr with
        | MBhvStateVar(eq) -> int_of_float (100./.(float_of_int (ASTLib.score eq.rhs)))
        | MBhvVar(eq) ->int_of_float (150.0 /. (float_of_int (ASTLib.score eq.rhs)))
        | _ -> 100000
      )
    in
    MathLib.iter_vars env (fun x ->
        if x.knd = MOutput || x.knd = MLocal then
          noop (PRIOQUEUE.add tmpq x) 
      );
    let lst = List.map (fun (x:mid mvar) -> x.name) (PRIOQUEUE.to_list tmpq) in
    QUEUE.enqueue_all vars lst;
    ()

  let mkmulti (env:uenv) (name:string) : musearch =
    (*make a top level table with default goals*)
    let scratch = GoalTableFactory.mktbl env in
    let _ = GoalTableFactory.mkgoalroot scratch  in
    (*create ordering*)
    let order = QUEUE.make () in
    order_vars order env.math;
    let mtree = MultiSearchTree.mksearch () in
    let mtbl : mutbl = {
      partials = MAP.make ();
      globals = MAP.make ();
      local = SET.make_dflt ();
      global = None;
      solved = SET.make_dflt ();
      env = env;
    } in
    SearchLib.setroot mtree mtbl [];
    let msearch : musearch = {
      avail_comps = scratch.avail_comps;
      goals = scratch.goals;
      order = order;
      search = mtree;
      state = mtbl;
      name=name;
      nslns=0;
    }
    in
    msearch




end
