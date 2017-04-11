open HWData
open MapData
open Util
open SolverData
open MapSpecGen
open Interactive
open SolverCompLib
open HWLib
open SolverUtil

open IntervalData
open IntervalLib
open MapIntervalCompute
open MapSolve
exception MapMainError of string

let error n m  : unit= raise (MapMainError (n^":"^m))

module MapMain = struct

  (*
  let mkctx () =
    {comps=MAP.make()}
  *)

  (**)
  let _ctx = REF.mk None;;

  let mkctx hwenv (tbl:(hwcompname,ucomp) map) : 'a map_ctx =
    let env = {comps=MAP.make()} in
    MAP.iter tbl (fun name comp ->
        let hwcomp = comp.d in
        let stmts :
          (((string,number) map)*(map_stmt list)) list =
          MapCompSpecGenerator.derive_mapping_comp hwenv hwcomp
        in
        let cfgs =
          List.fold_right (fun (pars,stmts) lst ->
              let cmp : 'a map_comp option =
                MapCompSpecCompressor.compress hwcomp.name stmts
              in
              match cmp with
              | Some(c) -> c::lst
              | None -> lst
            ) stmts []
        in
        (*update the ids*)
        let cfg_map : (int,map_port map_comp) map = MAP.make () in
        List.iteri (fun (idx:int) (cfg:'a map_comp) ->
            begin
              cfg.id <- idx;
              noop (MAP.put cfg_map idx cfg)
            end
          ) cfgs;
        noop (MAP.put env.comps name {spec=cfg_map; name=name});
        () 
      );
    print_string (MapSpec.string_of_map_ctx env
                    MapSpec.string_of_map_port);
    REF.upd _ctx (fun _ -> Some env);
    env

  (*do not make duplicates*)
  let mkctx hwenv tbl =
    match REF.dr _ctx with
    | Some(ctx) -> ctx
    | None -> mkctx hwenv tbl

  let add_part (partition:wireid map_var set queue)
      (lst:wireid map_var list) =
    let matches, rest = QUEUE.split partition
        (fun (s:wireid map_var set) ->
           SET.has_any s lst 
        )
    in
    let new_set : wireid map_var set = SET.make () in
    List.iter (fun st -> SET.add_set new_set st) matches;
    List.iter (fun x -> noop (SET.add new_set x)) lst;
    QUEUE.clear partition;
    noop (QUEUE.enqueue_all partition (rest));
    noop (QUEUE.enqueue partition new_set);
    ()

  (* Add all the other items contained under the variable. *)
  let build_connection (enq:wireid map_var list->unit)
      (ctx:map_port map_ctx) (param_map:(hwcompinst,int) map)
      (w:wireid) (cont:wireid map_var) =
    let w_conc_id = MAP.get param_map w.comp in
    (*get the abstract variable that corresponds to the port*)
    let mvar : map_port map_abs_var =
      match cont with
      | MPVScale(_) ->
        begin
          enq [MPVScale(w);cont];
          MapSpec.ctx_get_scale_var ctx
              w.comp.name w_conc_id w.port
        end

      | MPVOffset(_) ->
        begin
          enq [MPVOffset(w);cont];
          MapSpec.ctx_get_offset_var ctx
              w.comp.name w_conc_id w.port
        end
    in
    (*go through each of the members and add to the partition*)
    List.iter (fun (mem:map_port map_var) ->
        let mem_var : wireid map_var =
          MapSpec.map_var mem
            (fun ((c,p):map_port) -> mkwire c w.comp.inst p)
        in
        enq [cont;mem_var] 
    ) mvar.members



  let build_instance (enq:wireid map_var list -> unit)
      (ctx:map_port map_ctx) (param_map:(hwcompinst,int) map)
      (hi:hwcompinst) =
    let conc_id = MAP.get param_map hi in
    let cmp : map_port map_comp =
      MapSpec.get_comp ctx hi.name conc_id
    in
    MAP.iter cmp.vars (fun id vr ->
        let mems : wireid map_var list =
          List.map (fun (v:map_port map_var) ->
              MapSpec.map_var v
              (fun ((c,p):map_port) -> mkwire c hi.inst p)
            )
            vr.members
        in
        enq mems 
    )
 

  let build_prob (ctx:map_port map_ctx) (gltbl:gltbl)  =
    let param_map : (hwcompinst,int) map = MAP.make() in
    let partition : (wireid map_var) set queue = QUEUE.make () in
    let sln = gltbl.sln_ctx in
    (*find instances*)
    print "=== Find Instances ===";
    SET.iter sln.comps (fun (inst:hwcompinst) ->
        let ccomp = SolverCompLib.get_conc_comp gltbl inst in
        let matches : map_port map_comp list =
          MapSpec.find_comp_config ctx inst.name ccomp.cfg.pars
        in
        (*find parameter combo*)
        match matches with
        | [h] -> noop (MAP.put param_map inst h.id)
        | _ -> error "find instances" "failed."
    );
    (*partition*)
    print "=== Proc Connections ===";
    MAP.iter sln.conns.src2dest (
      fun (src:wireid) (snks:wireid set) ->
        SET.iter snks (fun snk ->
            let part lst = add_part partition lst in
            build_connection part ctx param_map src (MPVScale snk);
            build_connection part ctx param_map snk (MPVOffset src);
          )
      );
    print "=== Proc Insts ===\n";
    let circ : wireid map_circ =
      {
        vars=MAP.make(); ports=MAP.make();
       deriv_mappings=MAP.make();mappings=MAP.make()
      }
      
    in
    SET.iter sln.comps (fun (inst:hwcompinst) ->
        let part lst = add_part partition lst in
        build_instance part ctx param_map inst;
        let ccomp = SolverCompLib.get_conc_comp gltbl inst in
        (*iterate over variables*)
        HwLib.comp_iter_vars ccomp.d (fun (port:hwvid hwportvar) ->
            let port_data : map_port_info =
              {
                port=port.port;
                range=None;
                deriv_range=None;
                offset={priority=0;abs_var=0};
                scale={priority=0;abs_var=0};
                is_stvar=false;
              }
            in
            let iwire = (mkwire inst.name inst.inst port.port) in 
            noop (MAP.put circ.ports iwire port_data);
            MapCompSpecCompressor.port_info_set_cover
              port_data port.defs;
            let map_expr =
              (SolverCompLib.comp_get_port_cfg ccomp port.port)
            in
            match OPTION.map map_expr uast2mast with
            | Some(mast) ->
              let ival : interval =
                IntervalCompute.compute_mexpr_interval gltbl mast in
              begin
                noop (MAP.put circ.mappings iwire
                        (IntervalLib.interval2numinterval ival));
                if port_data.is_stvar then
                  begin
                    let deriv_ival = 
                      IntervalCompute.compute_mexpr_interval_deriv
                        gltbl mast
                    in
                    noop (MAP.put circ.deriv_mappings iwire
                            (IntervalLib.interval2numinterval deriv_ival))
                  end
              end
            | None ->
              ()
        )
      );
    (*set the initial mappings.*)
    let absmap : (hwcompinst*int, int) map= MAP.make () in 
    print "=== Construct Initial Mappings from Partition ===\n"; 
    QUEUE.iter partition (fun (members:wireid map_var set) ->
        let id = MAP.size circ.vars in
        SET.iter members (fun (w:wireid map_var) ->
            let local_id : hwcompinst*int = match w with
              | MPVScale(x) ->
                let conc_id = MAP.get param_map x.comp in
                let local_abs_var =
                  MapSpec.ctx_get_scale_var ctx
                    x.comp.name conc_id x.port
                in
                (x.comp,local_abs_var.id)
              | MPVOffset(x) ->
                let conc_id = MAP.get param_map x.comp in
                let local_abs_var =
                  MapSpec.ctx_get_offset_var
                    ctx x.comp.name conc_id x.port
                in
                (x.comp,local_abs_var.id)
            in
            noop (MAP.put absmap local_id id);
            match w with
            | MPVOffset(wire) ->
              MapSpec.set_offset_var circ wire id
            | MPVScale(wire) ->  
              MapSpec.set_scale_var circ wire id
        );
        let avar : wireid map_abs_var =
          {
            exprs=[MEVar(id)];
            cstrs=[];
            value=None;
            members=SET.to_list members;
            priority=0;id=id
          }
        in
        noop (MAP.put circ.vars id avar); 
        SET.destroy members
      );
    QUEUE.destroy partition;
    print ("===Constructing Final Contraints ("^
           (string_of_int (MAP.size absmap))^") ===\n");
    let is_valid = REF.mk true in
    SET.iter gltbl.sln_ctx.comps (fun (x:hwcompinst) ->
        let conc_id = MAP.get param_map x in
        let templ = MapSpec.get_comp ctx x.name conc_id in
        (*convert to global variables*)
        let local_to_circ_abs_var (i:int) : wireid map_abs_var option =
          if MAP.has absmap (x,i) then
            let q = MAP.get absmap (x,i) in
            Some (MAP.get circ.vars q) 
          else
            None
        in
        (*for each variable, add the exprs and constraints.*)
        MAP.iter templ.vars (fun vid vdata ->
            let t_exprs : int map_expr list =
              List.map (fun (e:int map_expr) ->
                  MapExpr.map e (fun id ->
                      match local_to_circ_abs_var id with
                      | Some(v) -> v.id
                      | None ->
                        ret
                          (error "mkexprs" "deps must be contained in var ") 0
                    )
                ) vdata.exprs
            in
            let t_cstrs : (map_cstr*int map_expr) list =
              List.map (fun (c,e:map_cstr*int map_expr) ->
                  let t_e = MapExpr.map e (fun id ->
                      match local_to_circ_abs_var id with
                      | Some(v) -> v.id
                      | None ->
                        ret
                          (error "mkexprs" "deps must be contained in var ") 0
                    )
                  in
                  (c,t_e)
                ) vdata.cstrs
            in
            (*convert local to absolute variable*)
            match local_to_circ_abs_var vid with
            | None -> ()
            | Some(glbl_var) ->
              begin
                let new_value =
                  match glbl_var.value,vdata.value with
                  | Some(q),Some(r) -> if q = r then vdata.value else
                      begin
                        print ("contridiction has two values: "^
                               (string_of_number q)^","^(string_of_number r)^"\n");
                        REF.upd is_valid (fun _ -> false);
                        None
                      end
                  | None,_ -> vdata.value
                  | Some(q),None -> glbl_var.value
                in 
                glbl_var.exprs <- glbl_var.exprs @ t_exprs;
                glbl_var.cstrs <- glbl_var.cstrs @ t_cstrs;
                glbl_var.value <- new_value;
                ()
              end
          )
      );
    if REF.dr is_valid then
      Some circ
    else
      None

  (*build a macro-component from building blocks.*)
  let infer (tbl:gltbl) : (wireid,hw_mapping) map option=
    let prob_opt = build_prob tbl.map_ctx tbl in
    match prob_opt with
    | Some(prob) ->
      let mappings = MapSolver.mappings tbl prob in
      mappings
    | None -> None

  let infer_feasible (tbl:gltbl)
    : bool =
    let prob_opt = build_prob tbl.map_ctx tbl in
    match prob_opt with
    | Some(prob) ->
      MapSolver.sat tbl prob  
      
    | None -> false



  let infer_best (tbl:gltbl) : (wireid,hw_mapping) map option =
    let prob_opt = build_prob tbl.map_ctx tbl in
    match prob_opt with
    | Some(prob) ->
      let mappings = MapSolver.mappings tbl prob in
      mappings
    | None -> None



end
