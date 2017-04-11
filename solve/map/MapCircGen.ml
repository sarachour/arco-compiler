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
open MapExpr
open MapSpec
open MapPartition


exception MapCircGenError of string

let error n m  : unit= raise (MapCircGenError (n^":"^m))

module MapCircGen = struct

  

  (* Add all the other items contained under the variable. *)
  let build_connection (enq:wireid map_var list->unit)
      (ctx:map_port map_ctx) (param_map:hwcompinst->int)
      (w:wireid) (cont:wireid map_var) =
    let w_conc_id = param_map w.comp in
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
      (ctx:map_port map_ctx) (param_map:hwcompinst -> int)
      (hi:hwcompinst) =
    let conc_id =param_map hi in
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
      );
  cmp
 

  let build_prob (ctx:map_port map_ctx) (gltbl:gltbl)  =
    let param_map : (string,int) map = MAP.make() in
    let partition : (wireid map_var) partition =
      MapPartition.mk
        (fun x -> MapExpr.string_of_map_var x HwLib.wireid2str)
    in
    let sln = gltbl.sln_ctx in
    let get_map_noparam (compid:hwcompinst) =
      let key = HwLib.hwcompinst2str compid in
      if MAP.has param_map key then
        MAP.get param_map key
      else
        begin
          error "get_map_conc: dne"
            ((HwLib.hwcompinst2str compid)^":"^
             (MAP.str param_map  
                (fun (k) ->
                   k)
                string_of_int)
            );
          -1
        end
    in
    (*find instances*)
    print"---------\n";
    SET.iter sln.comps (fun (inst:hwcompinst) ->
        print("->"^(HwLib.hwcompinst2str inst)^"\n");
        let ccomp = SolverCompLib.get_conc_comp gltbl inst in
        let matches : map_port map_comp list =
          MapSpec.find_comp_config ctx inst.name ccomp.cfg.pars
        in
        (*find parameter combo*)
        match matches with
        | [h] ->
          begin
            noop (MAP.put param_map (HwLib.hwcompinst2str inst) h.id)
          end

        | _ -> error "find instances" "failed."
    );
    (*partition*)
    MAP.iter sln.conns.src2dest (
      fun (src:wireid) (snks:wireid set) ->
        SET.iter snks (fun snk ->
            let part lst =
              MapPartition.add_partition partition lst in
            build_connection part ctx get_map_noparam src (MPVScale snk);
            build_connection part ctx get_map_noparam snk (MPVOffset src);
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
        let part lst =
          MapPartition.add_partition partition lst in
        let mapcmp = build_instance part ctx get_map_noparam inst in
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
            let map_port_data = MapSpec._get_port mapcmp port.port in
            (*add the compression range*)
            port_data.range <- map_port_data.range; 
            port_data.deriv_range <- map_port_data.deriv_range; 
            (*get the map expression.*)
            let map_expr =
              (SolverCompLib.comp_get_port_cfg ccomp port.port)
            in
            let iwire = (mkwire inst.name inst.inst port.port) in
            let iwirestr = HwLib.wireid2str iwire in
            begin
              match OPTION.map map_expr uast2mast with
              | Some(mast) ->
                let ival : interval =
                  IntervalCompute.compute_mexpr_interval gltbl mast in
                begin
                  noop (MAP.put circ.mappings iwirestr
                          (IntervalLib.interval2numinterval ival));
                  if port_data.is_stvar then
                    begin
                      let deriv_ival = 
                        IntervalCompute.compute_mexpr_interval_deriv
                          gltbl mast
                      in
                      noop (MAP.put circ.deriv_mappings iwirestr
                              (IntervalLib.interval2numinterval deriv_ival))
                    end
                end
              | None ->
                ()
            end;
            noop (MAP.put circ.ports iwirestr (iwire,port_data));
        )
      );
    (*set the initial mappings.*)
    let absmap : (hwcompinst*int, int) map= MAP.make () in
    print "=== Construct Initial Mappings from Partition ===\n"; 
    QUEUE.iter partition.els
      (fun (members:(string,wireid map_var) map) ->
        let id = MAP.size circ.vars in
        MAP.iter members (fun _ (w:wireid map_var) ->
            let local_id : hwcompinst*int =
              match w with
                | MPVScale(x) ->
                  let conc_id = get_map_noparam x.comp in
                  let local_abs_var =
                    MapSpec.ctx_get_scale_var ctx
                      x.comp.name conc_id x.port
                  in
                  (x.comp,local_abs_var.id)
                | MPVOffset(x) ->
                  let conc_id = get_map_noparam x.comp in
                  let local_abs_var =
                    MapSpec.ctx_get_offset_var
                      ctx x.comp.name conc_id x.port
                  in
                  (x.comp,local_abs_var.id)
            in
            noop (MAP.put absmap local_id id);
            match w with
            | MPVOffset(wire) ->
              MapSpec.circ_set_offset_var circ wire id
            | MPVScale(wire) ->  
              MapSpec.circ_set_scale_var circ wire id
        );
        let avar : wireid map_abs_var =
          {
            exprs=[MEVar(id)];
            cstrs=[];
            value=None;
            members=MAP.to_values members;
            priority=0;id=id
          }
        in
        noop (MAP.put circ.vars id avar); 
        SET.destroy members
      );
    MapPartition.destroy partition;
    print ("===Constructing Final Contraints ("^
           (string_of_int (MAP.size absmap))^") ===\n");
    let is_valid = REF.mk true in
    SET.iter gltbl.sln_ctx.comps (fun (x:hwcompinst) ->
        let conc_id = get_map_noparam x in
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


end

