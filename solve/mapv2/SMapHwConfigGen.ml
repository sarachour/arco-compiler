open HWData;;
open HWLib;;
open Util;;
open SolverData;;
open MathData;;
open MathLib;;


open IntervalData;;
open IntervalLib;;

open AST;;
open SMapSolverData;;

open SMapData;;
open SMapIntervalCompute;;
open SMapHwSpecGen;;

exception SMapHwConfigGen_error of string
module SMapCfggenUtil=
struct

  let bind_val_to_wire: cfggen_ctx -> map_loc_val -> wireid -> unit=
    fun ctx v wire ->
      let cmp : map_comp_ctx = MAP.get ctx.insts wire.comp in
      MAP.put cmp.ports wire.port v;
      ()

  let bind_val_to_wire_collection: cfggen_ctx -> map_loc_val -> (wireid->wireid list) -> wire_coll -> unit =
    fun ctx v wirefxn wires ->
        match wires with
          | WCollOne(wid) ->
            List.iter (fun wire -> bind_val_to_wire ctx v wire) (wirefxn wid)
          | WCollMany(wlist) ->
            List.iter (fun wid ->
                List.iter
                  (fun wire -> bind_val_to_wire ctx v wire)
                  (wirefxn wid)
              ) wlist
          | WCollEmpty -> ()

  let bind_time_cstrs_to_wire: cfggen_ctx -> number option -> number option -> wireid -> unit=
    fun ctx sample_maybe speed_maybe wire ->
      let cmp : map_comp_ctx = MAP.get ctx.insts wire.comp in
      begin
        match sample_maybe with
        | Some(sample) -> noop (MAP.put cmp.sample wire.port sample)
        | _ -> ()
      end;
      begin
        match speed_maybe with
        | Some(speed) -> noop (MAP.put cmp.speed wire.port speed)
        | _ -> ()
      end;
      ()

  let bind_time_cstrs_to_wire_collection: cfggen_ctx -> number option -> number option -> wire_coll -> unit =
    fun ctx sample speed wires ->
        match wires with
          | WCollOne(wid) ->
            bind_time_cstrs_to_wire ctx sample speed wid
          | WCollMany(wlist) ->
            List.iter (fun wire -> bind_time_cstrs_to_wire ctx sample speed wire) wlist
        | WCollEmpty -> ()

  
  let connect_bins_by_cstr :cfggen_ctx -> hwcompinst -> map_cstr -> bool =
    fun ctx inst cstr ->
      match cstr with
      | SCVarEqVar(mv1,mv2) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapVar(inst,mv2))) true

      | SCVarEqConst(mv1,n) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBNumber n)) true

      | SCVarEqExpr(mv1,me1) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapExpr(inst,me1))) true

      | SCExprEqExpr(me1,me2) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapExpr(inst,me1)) (SMBMapExpr(inst,me2))) true

      | SCExprEqConst(me1,n) ->
        ret (SMapCfggenCtx.connect_bins ctx (SMBMapExpr(inst,me1)) (SMBNumber n)) true

      | SCExprNeqConst(me,n) ->
        ret (SMapCfggenCtx.make_bin ctx (SMBMapExpr(inst,me))) false

      | SCVarNeqConst(mv,n) ->
        ret (SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,mv))) false

      | SCCoverInterval(mrng,hrng,mexpr,hexpr) -> false
      | SCCoverTime(n,n2) -> false

      | SCTrue -> false | SCFalse -> false
      | _ -> false 

end


module SMapGraphSimplifier =
struct



  (*this simplifies every expression and adds the simplifcation*)
  let simplify_expressions : cfggen_ctx -> unit =
    fun ctx ->
      GRAPH.iter_node ctx.bins (fun node -> match node with
          | SMBMapExpr(i,e) ->
            let new_node : cfggen_bin = SMBMapExpr(i,SMapExpr.simpl e) in
            (*if this is simplified*)
            if new_node <> node then
              begin
                SMapCfggenCtx.connect_bins ctx (node) new_node;
                SMapCfggenCtx.export_bin ctx node false;
                ()
              end
          | _ -> ()
        )

  let simplify : cfggen_ctx -> unit =
    fun ctx ->
      simplify_expressions ctx;
      ()
end

module SMapHwConfigGen =
struct


  (*get range of expression*)
  let interval_of_expr : gltbl -> mid ast -> interval =
    fun tbl expr ->
      let ival = SMapIntervalCompute.compute_mexpr_interval tbl expr in
      Printf.printf " : interval.e %s : %s\n" (MathLib.mast2str expr) (IntervalLib.interval2str ival);
      ival

  (*get range of variable*)
  let interval_of_var : gltbl -> mkind -> string -> interval =
    fun tbl knd name ->
      let id = MNVar(knd,name) in
      let ival = SMapIntervalCompute.compute_mid_interval tbl id in
      Printf.printf " : interval.v %s : %s\n" (MathLib.mid2str id) (IntervalLib.interval2str ival);
      ival

  let time_constraints_of_var : gltbl ->  string -> number option*number option =
    fun gltbl mvar ->
      let sample,speed = MathLib.var_gettimecstr gltbl.env.math mvar in
      sample,speed
  (*
     Given a label conversion algorithm that converts labels to map values
     and a wire conversion algorithm that returns the set of wires to apply the label to given
      a wire
  *)
  let bind_labels_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels->
    (wireid->wireid list) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (mid ast -> interval -> map_loc_val) -> 
    (number -> map_loc_val) -> unit =
    fun gltbl ctx lbls wirefxn infxn outfxn localfxn exprfxn numfxn ->
      begin
        MAP.iter lbls.outs (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MOutput name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (outfxn name ival) wirefxn wire_coll 
          );
        MAP.iter lbls.ins (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MInput name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (infxn name ival) wirefxn wire_coll
          );
        MAP.iter lbls.locals (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MLocal name in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (localfxn name ival)  wirefxn wire_coll
          );
        MAP.iter lbls.exprs (fun (expr:mid ast) (wire_coll) ->
            let ival : interval = interval_of_expr gltbl expr in
            SMapCfggenUtil.bind_val_to_wire_collection ctx (exprfxn expr ival)  wirefxn wire_coll
          );
        MAP.iter lbls.vals (fun (num:number) (wire_coll) ->
            (*TODO: if input number then transformable. Otherwise not. *)
            SMapCfggenUtil.bind_val_to_wire_collection ctx (numfxn num)  wirefxn wire_coll
          );
        ()
      end

  
  let bind_time_constraints_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels -> unit =
    fun gltbl ctx lbls ->
      MAP.iter lbls.outs (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.ins (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.locals (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          SMapCfggenUtil.bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      ()


  
  let bind_numbers_to_params : gltbl -> cfggen_ctx -> unit =
    fun tbl ctx ->
      MAP.iter tbl.comp_ctx (fun (compname:hwcompname) compctx ->
          MAP.iter compctx.insts (fun (compinst:int) (conccomp:ucomp_conc) ->
              let inst : hwcompinst = {name=compname; inst=compinst} in
              let map_inst = MAP.get ctx.insts inst in
              MAP.iter conccomp.cfg.pars (
                fun (param_name:string) (param_val:number) ->
                  Printf.printf "par: %s[%d].%s = %s\n"
                    (HwLib.hwcompname2str compname) compinst 
                    (param_name) (string_of_number param_val);
                  MAP.put map_inst.params param_name param_val;
                  ()
              );
          )
        )

    
  

  let evaluate : map_comp_ctx -> map_hw_spec -> hwcompname -> string -> map_result =
    fun comp_ctx mapspec comp port ->
      let cstr_generator : map_cstr_gen = SMapHwSpec.get_port mapspec comp port in
      let cstr_gen_params : map_params = {allow_reflow = false} in
      let result : map_result =
        SMapHwSpecLateBind.evaluate comp_ctx cstr_gen_params cstr_generator 
      in
      result

  let build_config : map_hw_spec -> gltbl ->  cfggen_ctx option =
    fun tblspec tbl ->
      let ctx : cfggen_ctx = SMapCfggenCtx.mkctx() in
      let sln : (string,mid) sln = tbl.sln_ctx in
      SMapCfggenCtx.make_bin ctx (SMBTimeConstant);
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let data : map_comp_ctx =
            {
              ports = MAP.make(); params = MAP.make();
              sample = MAP.make(); speed = MAP.make();
            }
          in
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          MAP.iter spec.inputs (fun port _ ->
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMScale(port)));
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          MAP.iter spec.outputs (fun port _ ->
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMScale(port)));
              SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          (*all the component time constants are the same*)
          SMapCfggenCtx.make_bin ctx (SMBMapVar(inst,SMTimeConstant));
          SMapCfggenCtx.connect_bins ctx
            SMBTimeConstant (SMBMapVar(inst,SMTimeConstant));
          MAP.put ctx.insts inst data;
          ()
        );
      let interval_to_val : interval -> map_loc_val =
        fun interval ->
          if IntervalLib.is_value interval then
            let num = IntervalLib.get_value interval in
            if num = 0.0 then SVZero
            else SVNumber(Decimal num)
          else
            SVSymbol(interval)
      in
      (*bind route values to the ports in each inst.*)
      bind_labels_to_wires tbl ctx sln.route
        (fun (wire:wireid) -> [wire])
        (fun (port:string) (interval:interval) -> interval_to_val interval)
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun expr interval -> interval_to_val interval )
        (fun number -> SVNumber(number) )
      ;
      (*map generate values to the ports in each inst. Also map the value to each
      sink the generate port feeds into.*)
      bind_labels_to_wires tbl ctx sln.generate
        (fun (wire:wireid) -> [wire] )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun (port:string) (interval:interval) -> interval_to_val interval )
        (fun expr interval -> interval_to_val interval )
        (fun number -> SVNumber(number) )
      ;
      bind_time_constraints_to_wires tbl ctx sln.generate;
      bind_time_constraints_to_wires tbl ctx sln.route;
      bind_numbers_to_params tbl ctx;
      (* Merge variables joined through a connection *)
      MAP.iter sln.conns.src2dest (fun (src:wireid) (dests:wireid set) ->
          SET.iter dests (fun (dest:wireid) ->
              SMapCfggenCtx.connect_bins ctx
                (SMBMapVar(src.comp,SMScale(src.port)))
                (SMBMapVar(dest.comp,SMScale(dest.port)));
              SMapCfggenCtx.connect_bins ctx
                (SMBMapVar(src.comp,SMOffset(src.port)))
                (SMBMapVar(dest.comp,SMOffset(dest.port)));
           )
        );
      (* begin evaluation process *)
      let config_success = REF.mk true in
      let evaluate_port : hwcompinst -> map_comp_ctx -> string -> unit =
        fun inst comp_ctx port ->
          let wire :wireid = {comp=inst; port=port} in
          (* bind config and evaluate constraints *)
          let result : map_result = evaluate comp_ctx tblspec inst.name port in
          let remaining_cstrs : map_cstr list =
            List.filter (fun (cstr:map_cstr) ->
                Printf.printf "  -> cstr %s\n" (SMapCstr.to_string cstr);
                (SMapCfggenUtil.connect_bins_by_cstr ctx inst cstr)=false)
              result.cstrs
          in
          (*if any of the constraints are false, terminate early during sunthesis process*)
          REF.upd config_success
            (fun is_succ -> is_succ && (not (LIST.has result.cstrs SCFalse)));
          MAP.put ctx.cstrs wire remaining_cstrs;
          ()
      in
      (*evaluate components to get results*)
      MAP.iter ctx.insts (fun (inst:hwcompinst) (inst_data:map_comp_ctx) ->
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          Printf.printf "=== Component %s.%d ===\n"
            (HwLib.hwcompname2str inst.name) inst.inst;
          MAP.iter spec.inputs (fun (port:string) _ ->
              Printf.printf "-> evaluate input <%s>\n" port;
              evaluate_port inst inst_data port 
            );
          MAP.iter spec.outputs (fun (port:string) _ ->
              Printf.printf "-> evaluate output <%s>\n" port;
              evaluate_port inst inst_data port 
          )
        );
      (*Derive simpler rules from graph*)
      SMapGraphSimplifier.simplify ctx;
      (*found a trivially false clause*)
      if REF.dr config_success = false then
        None
      (*otherwise, flatten graph into buckets*)
      else
        (*TODO: perform rewriting*)
        Some ctx 

      
      

end
