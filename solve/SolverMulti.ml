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

exception SolverMultiError of string

let error n m = raise (SolverMultiError (n^":"^m))



let _print_debug : string -> unit = print_debug 1 "multi"
let debug : string -> unit = print_debug 1 "multi"
let m_menu = menu 1
let m_print_inter = print_inter 1
module MultiSearchTree =
struct
  let partid2str (id:part_id) = (id.mvr)^"#"^(string_of_int id.ident) 
  let glblid2str (id:glbl_id) = (id.mvr_seq)^"#"^(string_of_int id.ident) 
  let step2str x = match x with
    | MSSolveVar(id) -> "-var "^(id)
    | MSPartialApp(id) -> "#partial"^(partid2str id)
    | MSGlobalApp(id) -> "#global "^(glblid2str id)

  let apply_step (env:mutbl) (x:mustep) : mutbl =
    let _ = _print_debug ("apply "^step2str x) in
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
    let _ = _print_debug ("unapply "^step2str x) in
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

  let score_step env x =
    SearchLib.mkscore 0. 0.

  let mksearch () =
    let search : (mustep,mutbl) ssearch =
      SearchLib.mksearch apply_step unapply_step order_step score_step step2str
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


(*
  let get_labels tbl valfilt varfilt : (wireid*string*label) list =
    let results = MAP.fold tbl.sln.labels (fun wire pmap rest ->
        let rr = MAP.fold pmap (fun p xset rest ->
            let flt : label list = SET.filter xset (fun x ->
              match x with
              | LBindVar(knd,name) -> varfilt knd name
              | LBindValue(knd,v) -> valfilt knd v
            ) in
            let res : (wireid*string*label) list = List.map (fun x -> (wire,p,x)) flt in
            res @ rest
          ) []
        in
        rr @ rest
      ) []
      in
      results

  (*
     create global circuit from the partial solution buffer
  *)
  let get_global_context (ms:musearch) tbl : sstep list = 
    let menv : mid menv = ms.state.slvr.prob in
    let hwenv : hwvid hwenv=  ms.state.slvr.hw  in
    (*process a local variable*)
    let proc_local_var name =
      (*all output port labels with the mathid name*)
      let olabels : (wireid*string*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNOutput) in
      (*all input labels with the mathid name*)
      let ilabels : (wireid*string*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNInput) in
      match olabels with
      | [(owire,oprop,olabel)] ->
        let _ = _print_debug ("local variable "^name^" is tagged on an output wire. Let's connect it to all inputs.") in
        let output_wire_hwid = UnivLib.wire2uid hwenv owire oprop in
        let output_math_id = UnivLib.label2uid olabel in
        (*lets create goals for the tableau to map*)
        let connect_ports : sstep list =
          List.map (fun (iwire,iprop,ilbl) ->
              let input_wire_hwid = UnivLib.wire2uid hwenv iwire iprop in
              let vr = UnivLib.mkuvar_of_stub input_wire_hwid (UBHPortConn output_wire_hwid) in
              let goal = UnivLib.wrap_goal tbl vr in
              (*this is the connection goal*)
              SAddGoal(goal)
        ) ilabels in
        let remove_existing_goal = match GoalTableLib.get_goal_from_var tbl output_math_id with
         | Some(v) -> [SRemoveGoal(v)]
         | _ -> []
        in
        remove_existing_goal @ connect_ports
      | [] ->
        let _ = _print_debug ("local variable "^(name)^" is not bound yet, so we're not going to loop back.") in
        []
      | h::t -> error "proc_local" ("cannot have more than one output variable: "^name)

    in
    (*process a strict output*)
    let proc_out_var (name:string) =
      let olabels : (wireid*string*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNOutput) in
      match olabels with
      | [(wwire,wprop,wlabel)] ->
        let _ = _print_debug "found the output label" in
        let cmpname,ihwid,ohwid = HwLib.getout hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let lbl_var = UnivLib.mkuvar_of_stub whwid (UBHPortConn ihwid) in 
        let steps= [
          (*node utilization*)
          SSolUseNode(cmpid,inst_id);
          (*wire connection*)
          SAddGoal(UnivLib.wrap_goal tbl (lbl_var));
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ]
        in
        steps
    | [] ->
      let _ = _print_debug ("local/output variable "^name^" has no bindings.") in
      []
    | h::t ->
      error "proc_out_var" ("multiple bindings: "^name)
    in
    (*process a strict input*)
    let proc_in_var (name:string) =
      let ilabels : (wireid*string*label) list = get_labels tbl (fun k v -> false) (fun k v -> MathLib.mid2name v = name && k = HNInput) in
      let res : sstep list = LIST.fold ilabels (fun (wwire,wprop,wlabel) rest ->
        let _ = _print_debug ("input variable "^name^" has an input label") in
        let cmpname,ihwid,ohwid = HwLib.getin hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let lbl_var = UnivLib.mkuvar_of_stub whwid (UBHPortConn ohwid) in 
        let steps= [
          SSolUseNode(cmpid,inst_id);
          (*connection*)
          SAddGoal(UnivLib.wrap_goal tbl lbl_var);
          (*label of var*)
          SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ]
        in
        steps @ rest
      ) []
      in
        res
    in
    (*iterate over values*)
    let proc_in_val () =
      let valassign2ast wlabel : number = match wlabel with
      | LBindValue(_,Integer(i)) -> Integer(i)
      | LBindValue(_,Decimal(i)) -> Decimal(i)
      | _ -> error "valaasign2ast" "expected value assign"
      in
      let ilabels : (wireid*string*label) list = get_labels tbl (fun k v -> k = HNInput) (fun k v -> false) in
      let res : sstep list = LIST.fold ilabels (fun (wwire,wprop,wlabel) rest ->
        let _ = _print_debug "found the input label" in
        let cmpname,ihwid,ohwid = HwLib.getin hwenv wprop in
        let cmpid = UnivLib.name2unodeid cmpname in
        let inst_id : int = SlnLib.usecomp tbl.sln cmpid  in
        let _ = SlnLib.usecomp_unmark tbl.sln cmpid in
        let ihwid = UnivLib.lclid2glblid inst_id (HwId ihwid) in
        let ohwid = UnivLib.lclid2glblid inst_id (HwId ohwid) in
        let whwid = HwId (UnivLib.wire2hwid hwenv wwire wprop) in
        let vv = valassign2ast wlabel in
        let ovar_bind = UnivLib.mkuvar_of_stub ohwid (UBHPortVal vv) in 
        let valbind =
          if get_glbl_bool "multi-force-value-to-port" = true then
            let wvar = UnivLib.mkuvar_of_stub whwid (UBHPortConn ohwid) in 
            [SAddGoal(TrivialGoal (wvar))]
          else
            let wvar_bind = UnivLib.mkuvar_of_stub whwid (UBHPortVal vv) in 
            [SAddGoal(NonTrivialGoal (wvar_bind))]
        in
        let steps= valbind @ [
          SSolUseNode(cmpid,inst_id);
          SAddNodeRel(cmpid,inst_id,ovar_bind);
          (*label of var*)
          (*SSolAddLabel(UnivLib.unid2wire ohwid,UnivLib.unid2prop ohwid,wlabel);*)
          SSolAddLabel(UnivLib.unid2wire ihwid,UnivLib.unid2prop ihwid,wlabel);
        ] in
        steps @ rest
      ) []
      in
        res
    in
    (*iterate over variables*)
    let var_steps : sstep list = MAP.fold menv.vars (fun name mid (rest:sstep list) ->
      if MathLib.isvar menv name then
        match MathLib.getkind menv name with
        (*input variable*)
        | MInput ->
          let insteps : sstep list = proc_in_var name in
          insteps @ rest
        (*output variable*)
        | MOutput ->
          let lclsteps = proc_local_var name in
          let outsteps = proc_out_var name in
          lclsteps @ outsteps @ rest
        (*local variable*)
        | MLocal ->
          let lclsteps = proc_local_var name in
          lclsteps @ rest
      else
        rest
    ) []
    in
    let val_steps = proc_in_val () in
    val_steps @ var_steps


    (*TODO Fix
      normalize partial steps so there are no id conflicts *)
  let build_partial_steps ms (ctx:sstep list) (tree_id:unid) (node_id:int) : sstep list =
      let idalloc : (unodeid,int set) map = MAP.make () in
      let idmapper : (unodeid*int,int) map = MAP.make () in
      let populate_id_allocator s = match s with
        | SSolUseNode(id,i) ->
            (*if we have allocated the following id, map it*)
            if MAP.has idalloc id = false then
              let _ = MAP.put idalloc id (SET.make_dflt ()) in
              let _ = SET.add (MAP.get idalloc id) i in 
              ()
            else
              let _ = SET.add (MAP.get idalloc id) i in
              ()
        | _ -> ()
      in
      let populate_id_mapper s = 
        let rec find_fresh allocs id =
                if SET.has allocs id then find_fresh allocs (id+1) else id
        in
        let add_mapping id inst = 
                if MAP.has idalloc id && SET.has (MAP.get idalloc id) inst then
                        let ninst = find_fresh (MAP.get idalloc id) 0 in
                        if MAP.has idmapper (id,inst) then
                                error "normalize_partial.populate_allocator" "cannot use the same node multiple times"
                        else
                                let _ = MAP.put idmapper (id,inst) ninst in
                                ()
                else      
                        let _ = MAP.put idmapper (id,inst) inst in 
                        ()
        
        in        
        match s with
        | SSolUseNode(id,i) -> add_mapping id i
        | _ -> ()
      in
      let trans_wire (w:wireid) =
        let cid,i,lc = w in
        let ni = MAP.get idmapper (cid,i) in
        (cid,ni,lc)
      in
      let trans_unid (u:unid) : unid = match u with
        | HwId(HNPort(knd,HCMGlobal(c,i),p,pr)) ->
          let id = UnivLib.name2unodeid c in
          let ni = MAP.get idmapper (id,i) in
          HwId(HNPort(knd,HCMGlobal(c,ni),p,pr))
        | _ -> u
      in
      let trans_uvar (u:uvar) : uvar =
        UnivLib.upd_uvar u trans_unid
      in
      let trans_goal (g:goal) =
        (UnivLib.wrap_goal_fun ms.is_trivial (trans_uvar (UnivLib.unwrap_goal g)))
      in
      let trans_lcl s = match s with
        | SSolUseNode(id,i) ->
          let ni = MAP.get idmapper (id,i) in SSolUseNode (id,ni)
        | SSolAddConn(w1,w2) -> SSolAddConn(trans_wire w1, trans_wire w2)
        | SSolAddLabel(w,lbl,k) -> SSolAddLabel(trans_wire w,lbl,k)
        | SSolRemoveLabel(w,lbl,k) -> SSolRemoveLabel(trans_wire w,lbl,k)
        | SRemoveGoal(g) -> SRemoveGoal (trans_goal g)
        | SAddGoal(g) -> SAddGoal (trans_goal g)
        | SMakeGoalActive(g) -> SMakeGoalActive(g)
        | SMakeGoalPassive(g) -> SMakeGoalPassive(g)
        | SAddNodeRel(n,i,rs) ->
          let ni = MAP.get idmapper (n,i) in
          SAddNodeRel(n,ni,trans_uvar rs)
      in
      (*get the partial set*)
      let psearch = MAP.get ms.state.partials tree_id in
      let partial_node = SearchLib.id2node psearch node_id in
      let partial_steps = LIST.rev (SearchLib.get_path psearch partial_node) in
      (*populate the data structures for mapping*)
      let _ = List.iter (fun x -> populate_id_allocator x) ctx in
      let _ = List.iter (fun x -> populate_id_mapper x) partial_steps in
      let new_partial_steps = List.map (fun x -> trans_lcl x) partial_steps in
      let _ = _print_debug "=== Mappings ===" in
      let _ = MAP.iter idmapper (fun (uid,i) (fi) ->
        let  _ = _print_debug (" "^(UnivLib.unodeid2name uid)^" "^(string_of_int i)^" -> "^(string_of_int fi)^"\n") in
        ()
      ) in
      let _ = _print_debug "=== Normalized Partial Solution ===" in
      let _ = List.iter (fun x ->
        let _ = _print_debug ("  "^(SlvrSearchLib.step2str x)) in
        ()
      ) new_partial_steps in
      let _ = _print_debug "================" in
      new_partial_steps 
*)


  let partial_id_to_tree ms (id:part_id ) =
    let tree = MAP.get ms.state.partials id.mvr in
    tree 

  let partial_id_to_steps ms (id:part_id ) =
    let tree = MAP.get ms.state.partials id.mvr in
    let node = SearchLib.id2node tree id.ident in
    let steps :sstep list = SearchLib.get_path tree node in
    steps

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
    SET.iter ids (fun (id:part_id) ->
        let steps : sstep list = partial_id_to_steps ms id in
        debug ("found # steps: "^(LIST.length2str steps));
        List.iter (fun stp -> allocate id stp) steps;
        List.iter (fun stp ->
            enq (SlvrSearchLib.inst2inst_step stp (fun inst -> get_mapping mapper id inst))
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
    let node_lists_3d : ((sstep list) list) list =
      LIST.permutations step_lists
    in
    QUEUE.destroy ctx.buffer;
    QUEUE.destroy ctx.choice_buffer;
    List.map (fun (lst:(sstep list) list) ->
        List.fold_left (fun rst q -> q @ rst) [] lst
      ) node_lists_3d

  let create_global_context (ms:musearch) (tbl:gltbl) : sstep list list =
    let ctx = glblctx_mk () in
    (*pull partial solution route to a goal*)
    let _conn_generate_to_route routelbl routewire generates expr =
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
        SModSln(SSlnRmRoute(lbl));
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
            error "create_global_context" "route-config should not be possible icomplete configuration"
        end
      );
    debug ("==== GENERATES =====");
    SlnLib.iter_generates tbl.sln_ctx (fun (generate:('a,'b) label) (route:wireid list) ->
        debug ("> "^(SlnLib.ulabel2str generate));
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
            error "create_global_context" "dont do anything special for local"
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
      debug "======= Partial (Root) Steps =======";
      debug (SearchLib.steps2str 1 tbl.search part_steps);
      GoalTableFactory.mkroot tbl part_steps;
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

  (*find a global solution, given the set of partials that have been applied*)
  let find_global_solution (ms:musearch) (nsols:int) : sstep snode list option =
    let tbl = mk_global_tbl ms in
    (*find the global steps *)
    let depth = get_glbl_int "slvr-global-depth" in
    let results : sstep snode list option =
      SolverEqn.solve tbl nsols depth
    in
    SearchLib.clear_cursor tbl.search;
    results

  (*get the existing global solution*)
  let get_existing_global_solution (ms:musearch) (key:string) (id:int) : (string,mid) sln =
    let gtree = MAP.get ms.state.globals key in
    let ptbl = GoalTableFactory.mktbl ms.state.env in 
    debug ("=> Global Solution: "^key^" :: "^(string_of_int id));
    let slnnode = SearchLib.id2node gtree id in 
    SearchLib.move_cursor gtree ptbl slnnode;  
    ptbl.sln_ctx

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
      tbl
    | None -> error "mk_partial_table" "there is no root"

  let find_partial_solution (ms:musearch) (pvar:string) (nslns:int) : ((sstep snode) list) option =
    let mint,musr = mkmenu ms in
    let ptbl = mk_partial_tbl ms pvar in
    let currsols : int = SearchLib.num_solutions ptbl.search None in
    (*original solution set*)
    let orig : (sstep snode) list= SearchLib.get_solutions ptbl.search None in
    begin
      let is_new (q:sstep snode) =
        List.length (LIST.filter (fun (x:sstep snode) -> q.id = x.id) orig) = 0
      in
      let depth = get_glbl_int "slvr-partial-depth" in
      debug "find a partial solution";
      debug "== Finding Local Solution ==";
      debug ("== Current # Solutions: "^(string_of_int currsols));
      debug ("== # New Solutions To Find: "^(string_of_int nslns));
      musr ();
      let maybe_results : ((sstep snode) list) option = SolverEqn.solve ptbl (nslns+currsols) depth in
      SearchLib.clear_cursor ptbl.search;
      debug "found partial solutions";
      match maybe_results with
      | None -> None
      | Some(results) ->
        let new_results :(sstep snode) list = List.filter (fun result -> is_new result) results in
        begin
          match new_results with
          | [] -> None
          | lst -> Some(lst)
        end
    end




  (*Find and add a new partial solutions to different nodes *)
    let augment_with_partial_solution (ms:musearch) (pvar:string) (slns: sstep snode list option) :  'a option =
      let mint,musr = mkmenu ms in
      let curs = SearchLib.cursor ms.search in
      let add_glbl_sln (curs:mustep snode) (node:sstep snode)  = 
        let key = (set2key ms.state.local) and ident = node.id in
        let steps = [MSGlobalApp({mvr_seq=key;ident=ident})] in
        let glbl_node :mustep snode =
          SearchLib.mknode_child_from_steps ms.search ms.state steps 
        in
        if get_unsolved_var ms = None then
          noop (SearchLib.solution ms.search glbl_node)
        else
          ()
      in
      let add_lcl_sln (curs:mustep snode) (node:sstep snode) = 
        let partial = MAP.get ms.state.partials pvar in
        let steps : mustep list= List.fold_left (fun lst step -> match step with
            |SModGoalCtx(SGRemoveGoal(goal_data)) ->
              begin
                match goal_data.d with
                | GUnifiable(GUMathGoal(g)) ->
                  (MSSolveVar(g.d.name))::lst
                | _ -> lst
              end
            | _ -> lst
          ) [MSPartialApp({mvr=pvar;ident=node.id})] (SearchLib.get_path partial node)
        in
        SearchLib.mknode_child_from_steps (ms.search) (ms.state) steps 
      in
      let add_solution (sln:sstep snode) =
        let _ = debug "== Finding Global Solution ==" in
        let partial_node = add_lcl_sln curs sln in 
        SearchLib.move_cursor ms.search ms.state partial_node;
        musr ();
        (*find a global solution*)
        match find_global_solution ms 1 with
        | Some(slns) ->
          debug (">> Found # Global Solutions: "^(string_of_int (List.length slns)));
          List.iter (fun sln -> add_glbl_sln partial_node sln) slns  
        | None ->
          debug (">> Found NO Solutions");
          noop (SearchLib.deadend ms.search partial_node)
      in
      match slns with
      | Some(cslns) ->
        debug "found some partial solutions. Will add partial solution node and global";
        List.iter (fun x -> add_solution x) cslns;
        slns
      | None ->
        debug "could not find any more partial solutions.";
        slns
      
    let augment_with_new_partial_sln (ms:musearch) (pvar) (nslns) =
      let _ = _print_debug "finding new partial solution" in
      let slns : (sstep snode list) option = find_partial_solution ms pvar nslns in
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



    let msolve sl (ms:musearch) (nslns:int): (((string,mid) sln) list) option =
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
            let root = OPTION.force_conc (SearchLib.root ms.search) in
            SearchLib.move_cursor ms.search ms.state root;
            _msolve();
            ()
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
                debug ("need more solutions. find another solution");
                _msolve ();
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
      let snodes = SearchLib.get_solutions ms.search None in
      debug ("Number of Solutions:"^(string_of_int (List.length  snodes)));
      let slns = List.fold_right (
          fun (x:mustep snode) (rest:(string,mid) sln list) ->
            SearchLib.move_cursor ms.search ms.state x;
            match ms.state.global with 
            | Some(gid) ->
              let s : (string,mid) sln  =
                get_existing_global_solution ms gid.mvr_seq gid.ident
              in
                s::rest
            | None -> rest
      ) snodes []
      in
      match slns with
      | h::t -> Some(h::t)
      |[] ->None

  let order_var (vars:string queue) (x:'a mvar) : unit =
    if x.knd = MOutput or x.knd = MLocal then
      noop (QUEUE.enqueue vars x.name) 
    

  let mkmulti (env:uenv) : musearch =
    (*make a top level table with default goals*)
    let scratch = GoalTableFactory.mktbl env in
    let _ = GoalTableFactory.mkgoalroot scratch  in
    (*create ordering*)
    let order = QUEUE.make () in
    MathLib.iter_vars  env.math (fun v -> order_var order v);
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
    }
    in
    msearch




end
