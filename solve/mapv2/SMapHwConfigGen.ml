open HWData;;
open HWLib;;
open Util;;
open SolverData;;
open MathData;;
open MathLib;;


open IntervalData;;
open IntervalLib;;

open AST;;

open SMapData;;
open SMapIntervalCompute;;
open SMapHwSpecGen;;

exception SMapHwConfigGen_error of string

module SMapHwConfigGen =
struct

  
  type cfggen_bin =
    | SMBMapExpr of hwcompinst*map_expr
    | SMBNumber of number
    | SMBTimeConstant
    | SMBMapVar of hwcompinst*map_var

  type cfggen_ctx = {
    insts : (hwcompinst, map_comp_ctx) map;
    cstrs: (wireid, map_cstr list) map;
    bins : (cfggen_bin,unit) graph;
  }


  let string_of_bin (b:cfggen_bin) = match b with
    | SMBMapExpr(inst,e) -> SMapExpr.to_string e
    | SMBNumber(n) -> string_of_number n
    | SMBTimeConstant -> "tau"
    | SMBMapVar(inst,v) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapVar.to_string v)

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
            bind_val_to_wire_collection ctx (outfxn name ival) wirefxn wire_coll 
          );
        MAP.iter lbls.ins (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MInput name in
            bind_val_to_wire_collection ctx (infxn name ival) wirefxn wire_coll
          );
        MAP.iter lbls.locals (fun name wire_coll ->
            let ival : interval = interval_of_var gltbl MLocal name in
            bind_val_to_wire_collection ctx (localfxn name ival)  wirefxn wire_coll
          );
        MAP.iter lbls.exprs (fun (expr:mid ast) (wire_coll) ->
            let ival : interval = interval_of_expr gltbl expr in
            bind_val_to_wire_collection ctx (exprfxn expr ival)  wirefxn wire_coll
          );
        MAP.iter lbls.vals (fun (num:number) (wire_coll) ->
            (*TODO: if input number then transformable. Otherwise not. *)
            bind_val_to_wire_collection ctx (numfxn num)  wirefxn wire_coll
          );
        ()
      end

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

  let bind_time_constraints_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels -> unit =
    fun gltbl ctx lbls ->
      MAP.iter lbls.outs (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.ins (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
        );
      MAP.iter lbls.locals (fun name wire_coll ->
          let min_sample_period,max_speed= time_constraints_of_var gltbl name in
          bind_time_cstrs_to_wire_collection ctx min_sample_period max_speed wire_coll
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
                  MAP.put map_inst.params param_name param_val;
                  ()
              );
          )
        )
  let make_bin : cfggen_ctx -> cfggen_bin -> unit =
    fun ctx bin1 ->
      if GRAPH.hasnode ctx.bins bin1 = false then
        noop (GRAPH.mknode ctx.bins bin1);
      ()

  let connect_bins : cfggen_ctx -> cfggen_bin -> cfggen_bin -> unit =
    fun ctx bin1 bin2 ->
      make_bin ctx bin1;
      make_bin ctx bin2;
      GRAPH.mkedge ctx.bins bin1 bin2 ();
      ()

  let connect_bins_by_cstr :cfggen_ctx -> hwcompinst -> map_cstr -> bool =
    fun ctx inst cstr ->
      match cstr with
      | SCVarEqVar(mv1,mv2) ->
        ret (connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapVar(inst,mv2))) true
      | SCVarEqConst(mv1,n) ->
        ret (connect_bins ctx (SMBMapVar(inst,mv1)) (SMBNumber n)) true
      | SCVarEqExpr(mv1,me1) ->
        ret (connect_bins ctx (SMBMapVar(inst,mv1)) (SMBMapExpr(inst,me1))) true
      | SCExprEqExpr(me1,me2) ->
        ret (connect_bins ctx (SMBMapExpr(inst,me1)) (SMBMapExpr(inst,me2))) true
      | SCExprEqConst(me1,n) ->
        ret (connect_bins ctx (SMBMapExpr(inst,me1)) (SMBNumber n)) true
      | _ -> false 

  

  let evaluate : map_comp_ctx -> map_hw_spec -> hwcompname -> string -> map_result =
    fun comp_ctx mapspec comp port ->
      let cstr_generator : map_cstr_gen = SMapHwSpec.get_port mapspec comp port in
      let cstr_gen_params : map_params = {allow_reflow = false} in
      let result : map_result =
        SMapHwSpecLateBind.evaluate comp_ctx cstr_gen_params cstr_generator 
      in
      result

  type cfggen_prob = {
    (*xid to map vars / exprs*)
    xid_to_number : (int,number) map;
    (* map vars / exprs to xid *)
    mapvar_to_xid : (hwcompinst*map_var,int) map;
    mapexpr_to_xid : (hwcompinst*map_expr,int) map;
    number_to_xid : (number,int) map;
    (*inequality constraints*)
    xid_neq_number : (int,number set) map;
    (*coverage constraints*)
    xid_cover : (int*int,(map_range*map_range) set) map;
    xid_time : (number option*number option) set;
    (*number of variables*)
    mutable n : int;
    mutable tc_to_xid : int option;
    mutable success: bool;
  }

  let insert_map_var_to_xid_mapping : cfggen_prob -> int -> hwcompinst -> map_var -> unit =
        fun prob xvar inst mapvar ->
          MAP.put prob.mapvar_to_xid (inst,mapvar) xvar;
          ()


  let insert_time_constant_to_xid_mapping : cfggen_prob -> int -> unit =
    fun prob xvar ->
      match prob.tc_to_xid with
      | Some (_) -> raise (SMapHwConfigGen_error "unexpected: cannot remap time constant")
      | None -> prob.tc_to_xid <- Some xvar 

  let insert_number_to_xid_mapping : cfggen_prob -> int -> number -> unit =
    fun prob xvar num ->
      if MAP.has prob.xid_to_number xvar then
        begin
          let cnum = MAP.get prob.xid_to_number xvar in
          let neq = MAP.ifget prob.xid_neq_number xvar in
          begin
            match neq with
            | Some(neq) ->
              if SET.count neq (fun cnum -> cnum = num)  > 1
              then prob.success <- false
          end;
          if num <> cnum then prob.success <- false
        end

      else
        begin
          match MAP.ifget prob.number_to_xid num with
          | Some(id) -> if id = xvar then () else
              raise (SMapHwConfigGen_error "unexpected: different vars must map to same number")
          | None ->
            begin
              noop (MAP.put prob.number_to_xid num xvar);
              noop (MAP.put prob.xid_to_number xvar num)
            end

        end

  let insert_map_expr_to_xid_mapping :cfggen_prob -> int -> hwcompinst -> map_expr -> unit=
    fun prob xvar inst expr ->
      if MAP.has prob.mapexpr_to_xid (inst,expr) then
        raise (SMapHwConfigGen_error "unexpected: cannot have an expression that is aliased.")
      else
        noop (MAP.put prob.mapexpr_to_xid (inst,expr) xvar)


  
  let xid_mapping_of_map_var : cfggen_prob -> hwcompinst -> map_var -> int =
    fun prob inst mv ->
      if MAP.has prob.mapvar_to_xid (inst,mv) then
        (MAP.get prob.mapvar_to_xid (inst,mv))
      else
        match mv with
        | SMFreeVar(_) ->
          begin
            let fv = prob.n in
            prob.n <- prob.n + 1;
            insert_map_var_to_xid_mapping prob fv inst mv;
            fv
          end
        | _ ->
          raise (SMapHwConfigGen_error "not well formed. All scales, offsets should be declared.")

  let insert_xid_cstr_neq_number : cfggen_prob -> int -> number -> unit =
    fun prob xvar num ->
      if MAP.has prob.xid_neq_number xvar = false then
        noop (MAP.put prob.xid_neq_number xvar (SET.make_dflt ()));
      let neq_nums = MAP.get prob.xid_neq_number xvar in
      SET.add neq_nums num;
      (* determine if we are claiming xid = v && xid != v *)
      if MAP.has prob.xid_to_number xvar then
        let xvar_val = MAP.get prob.xid_to_number xvar in
        if xvar_val = num then prob.success <- false;
        ()


  let insert_xid_cstr_cover : cfggen_prob -> int -> int -> map_range-> map_range-> unit =
    fun prob xscale xoff hwival mival -> 
      if MAP.has prob.xid_cover (xscale,xoff) then
        begin
          let ivals : (map_range*map_range) set =
            MAP.get prob.xid_cover (xscale,xoff)
          in
          SET.add ivals (hwival, mival);
          ()
        end
      else
        begin
          let ivals = SET.make_dflt () in
          SET.add ivals (hwival,mival);
          noop (MAP.put prob.xid_cover (xscale,xoff) ivals)
        end

  let insert_xid_cstr_time : cfggen_prob -> number option -> number option -> unit =
    fun prob min max ->
      begin
        match prob.tc_to_xid with
        | Some(xid) ->() 
        | None ->
          begin
            let xid = prob.n in
            prob.n <- prob.n + 1
          end
      end;
      SET.add prob.xid_time (min,max);
      ()



  
  let map_expr_to_xid_expr : cfggen_prob -> hwcompinst -> map_expr -> map_expr =
    fun prob inst expr ->
      let rec _compute : map_expr -> map_expr =
        fun e -> match e with
          | SEVar(v) ->
            SEVar(SMFreeVar(xid_mapping_of_map_var prob inst v))
          | SENumber(n) -> SENumber(n)
          | SEAdd(a,b) -> SEAdd(_compute a, _compute b)
          | SESub(a,b) -> SESub(_compute a, _compute b)
          | SEMult(a,b) -> SEMult(_compute a, _compute b)
          | SEDiv(a,b) -> SEDiv(_compute a, _compute b)
          | SEPow(a,b) -> SEPow(_compute a, _compute b)
      in
      _compute expr

  let xid_mapping_of_map_expr : cfggen_prob -> hwcompinst -> map_expr -> int =
    fun prob inst expr ->
      if MAP.has prob.mapexpr_to_xid (inst,expr) then
        MAP.get prob.mapexpr_to_xid (inst,expr)
      else
        raise (SMapHwConfigGen_error ("unexpected: cannot implicitly insert map expressions:"^
              (SMapExpr.to_string expr)))


  let xid_mapping_of_number :cfggen_prob -> number -> int =
    fun prob num ->
      if MAP.has prob.number_to_xid num then
        MAP.get prob.number_to_xid num
      else
        raise (SMapHwConfigGen_error ("unexpected: cannot implicitly insert map number:"^
                                      (string_of_number num)))


  let xid_mapping_of_map_expr_or_var : cfggen_prob -> hwcompinst -> map_expr -> int =
    fun prob inst expr -> match expr with
      | SEVar(v) -> xid_mapping_of_map_var prob inst v
      | SENumber(n) -> xid_mapping_of_number prob n
      | _ -> xid_mapping_of_map_expr prob inst expr

  let map_cstr_to_xid_cstr : cfggen_prob -> hwcompinst -> map_cstr -> unit =
    fun prob inst cstr -> match cstr with
      | SCExprNeqConst(me,n) ->
        let xid = xid_mapping_of_map_expr prob inst me in
        insert_xid_cstr_neq_number prob xid n

      | SCVarNeqConst(mv,n) ->
        let xid = xid_mapping_of_map_var prob inst mv in
        insert_xid_cstr_neq_number prob xid n

  
      | SCCoverInterval(hwival,mival,sc,off) ->
        Printf.printf "%s , %s\n" (SMapExpr.to_string sc) (SMapExpr.to_string off);
        let xid_scale = xid_mapping_of_map_expr_or_var prob inst sc in
        let xid_offset = xid_mapping_of_map_expr_or_var prob inst off in
        insert_xid_cstr_cover prob xid_scale xid_offset hwival mival

      | SCTrue -> ()

      | SCCoverTime(min,max) ->
        insert_xid_cstr_time prob min max

      | _ -> raise (SMapHwConfigGen_error "cannot have an equality constraint.")

  let cfggen_ctx_to_map_problem: cfggen_ctx -> cfggen_prob =
    fun ctx ->
      let sets : cfggen_bin set list = GRAPH.disjoint ctx.bins in
      let prob = {
        xid_to_number=MAP.make();
        (*rewrite expressions / variables*)
        mapexpr_to_xid=MAP.make();
        mapvar_to_xid=MAP.make();
        number_to_xid=MAP.make();
        tc_to_xid = None;
        (*determine if xid maps to numbers *)
        xid_neq_number=MAP.make();
        xid_cover=MAP.make();
        xid_time=SET.make_dflt();
        (*number of variables*)
        n=List.length sets;
        success=true;
      } in
      (*insert mapping into table*)
      
      (*compute the number of true variables*)
      Printf.printf "# true variables: %d\n" (List.length sets);
      List.iteri (fun (i:int) (bin_set:cfggen_bin set) ->
          let xid = i in
          Printf.printf "=== Variable %d === \n" xid;
          SET.iter bin_set (fun (bin:cfggen_bin) ->
              Printf.printf "   %s\n" (string_of_bin bin);
              match bin with
              | SMBMapVar(inst,mv1) -> insert_map_var_to_xid_mapping prob xid inst mv1
              | SMBMapExpr(inst,me1) -> insert_map_expr_to_xid_mapping prob xid inst me1
              | SMBNumber(n) -> insert_number_to_xid_mapping prob xid n
              | SMBTimeConstant -> insert_time_constant_to_xid_mapping prob xid 
            )
        ) sets;
      (*add constraints*)
      Printf.printf "==== Processing assertions\n";
      MAP.iter ctx.cstrs (fun (wire:wireid) (cstrs:map_cstr list) ->
          List.iter (fun cstr ->
              map_cstr_to_xid_cstr prob wire.comp cstr
            ) cstrs
        );
      prob

  let build_config : map_hw_spec -> gltbl ->  cfggen_prob option =
    fun tblspec tbl ->
      let ctx : cfggen_ctx = {
        insts = MAP.make();
        bins=GRAPH.make
            (fun a b -> a = b)
            (fun bin -> string_of_bin bin)
            (fun () -> "");
        cstrs= MAP.make();
      }
      in
      let sln : (string,mid) sln = tbl.sln_ctx in
      make_bin ctx (SMBTimeConstant);
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let data : map_comp_ctx =
            {
              ports = MAP.make(); params = MAP.make();
              sample = MAP.make(); speed = MAP.make();
            }
          in
          let spec : map_comp = MAP.get tblspec.comps inst.name in
          MAP.iter spec.inputs (fun port _ ->
              make_bin ctx (SMBMapVar(inst,SMScale(port)));
              make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          MAP.iter spec.outputs (fun port _ ->
              make_bin ctx (SMBMapVar(inst,SMScale(port)));
              make_bin ctx (SMBMapVar(inst,SMOffset(port)));
              ()
            );
          (*all the component time constants are the same*)
          make_bin ctx (SMBMapVar(inst,SMTimeConstant));
          connect_bins ctx
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
        (fun (wire:wireid) ->
           if MAP.has sln.conns.src2dest wire then
             let sinks = MAP.get sln.conns.src2dest wire in
             wire::(SET.to_list sinks)
           else
             [wire]
        )
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
              connect_bins ctx
                (SMBMapVar(src.comp,SMScale(src.port)))
                (SMBMapVar(dest.comp,SMScale(dest.port)));
              connect_bins ctx
                (SMBMapVar(src.comp,SMOffset(src.port)))
                (SMBMapVar(dest.comp,SMOffset(dest.port)));
           )
        );
      (* begin evaluation process *)
      let config_success = REF.mk true in
      let evaluate_port : hwcompinst -> map_comp_ctx -> string -> unit =
        fun inst comp_ctx port ->
          let wire :wireid = {comp=inst; port=port} in
          let result : map_result = evaluate comp_ctx tblspec inst.name port in
          let remaining_cstrs : map_cstr list =
            List.filter (fun (cstr:map_cstr) ->
                Printf.printf "  -> cstr %s\n" (SMapCstr.to_string cstr);
                (connect_bins_by_cstr ctx inst cstr)=false)
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
          MAP.iter spec.inputs (fun (port:string) _ ->
              Printf.printf "-> evaluate input <%s>\n" port;
              evaluate_port inst inst_data port 
            );
          MAP.iter spec.outputs (fun (port:string) _ ->
              Printf.printf "-> evaluate output <%s>\n" port;
              evaluate_port inst inst_data port 
          )
        );
      (*found a trivially false clause*)
      if REF.dr config_success = false then
        None
      (*otherwise, flatten graph into buckets*)
      else
        begin
          let problem = cfggen_ctx_to_map_problem ctx in 
          (*TODO: perform rewriting*)
          if problem.success then
            Some problem
          else
            None
          

        end

      
      

end
