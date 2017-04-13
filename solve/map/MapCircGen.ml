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
open MapMathGen

open AST
open MathData
open MathLib
open SolverUtil
open SymCamlData

open StrMap;;

exception MapCircGenError of string

let error n m  : unit= raise (MapCircGenError (n^":"^m))

module MapCircGen = struct

  type circ_gen_state = {
    a2c_map : (hwcompinst,int) smap;
    l2c_map : (hwcompinst*int,int) smap;
    mapequiv : (wireid map_var map_expr) partition;
    vargrps: (wireid map_var) partition;

    mutable is_valid : bool;
    deriv_wire: wireid;
    deriv_port : map_port_info;
  }

  let destroy_circ_gen_state cgst =
    MapPartition.destroy cgst.vargrps;
    SET.destroy ();
    ()

  let conc_of_abs_map_comp (cgst:circ_gen_state) (inst:hwcompinst)=
    if SMAP.has cgst.a2c_map inst then
      SMAP.get cgst.a2c_map inst
    else
      begin
        raise (MapCircGenError ("get_map_conc: dne:"^
          ((HwLib.hwcompinst2str inst)^":"^
            (SMAP.str cgst.a2c_map string_of_int)
          )))
      end

  let add_time_cstrs  (circ:'a map_circ) (gltbl:gltbl) =
    let speed_q = QUEUE.make () in 
    let sample_period_q = QUEUE.make () in
    let find_best q f : float option =
      QUEUE.fold q (fun el rest ->
          match el, rest with
          | Some(el),None -> Some el
          | Some(el),Some(curr) ->
            if f el curr then Some el else
              Some curr
          | _ -> rest
        ) None
    in
    MathLib.iter_vars gltbl.env.math (fun (v:mid mvar) ->
        match v.defs with
        | MDefStVar(defs) ->
          begin
            noop (QUEUE.enqueue speed_q
                    ((OPTION.map defs.speed float_of_number )));
            noop (QUEUE.enqueue sample_period_q
                    (OPTION.map defs.sample float_of_number ))
          end

        | _ -> ()
      );
    (*i'm interested in the smallest sampling freqency.*)
    let max_sample_period : float option =
      find_best sample_period_q (fun el smallest -> el < smallest)
    in
    (*i'm interested in the fastest sampling rate.*)
    let min_speed: float option =
      find_best speed_q (fun el fastest -> el > fastest)
    in
    QUEUE.clear sample_period_q;
    (*enumerate*)
    let us_to_s = 1000.*.1000. in
    HwLib.iter_comps gltbl.env.hw (fun c ->
        HwLib.comp_iter_vars c (fun v ->
            match v.defs with
            | HWDDigital(d) ->
              let sample,_ = d.sample in 
              noop (QUEUE.enqueue sample_period_q
                      (Some ((float_of_number sample) /. us_to_s))
                   )
            | _ -> ()
        )
        
    );
    let max_port_period : float option =
      find_best sample_period_q (fun el largest -> el > largest)
    in
    circ.time.min_speed <- min_speed;
    begin
      match max_sample_period,max_port_period with
      | Some(max_sample),Some(max_port) ->
        circ.time.max_speed <- Some (max_sample /. max_port )
      | _ -> ();
    end;
    ()



  (* Add all the other items contained under the variable. *)
  let build_connection 
      (cgst:circ_gen_state) (ctx:map_port map_ctx) 
      (w:wireid) (cont:wireid map_var) =
    let w_conc_id = conc_of_abs_map_comp cgst w.comp in
    let part lst = MapPartition.add_partition cgst.vargrps lst in
    (*get the abstract variable that corresponds to the port*)
    let mvar : map_port map_abs_var =
      match cont with
      | MPVScale(w2) ->
        begin
          part [MPVScale(w);MPVScale(w2)];
          MapSpec.ctx_get_scale_var ctx
              w.comp.name w_conc_id w.port
        end

      | MPVOffset(w2) ->
        begin
          part [MPVOffset(w);MPVOffset(w2)];
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
        part [cont;mem_var] 
    ) mvar.members



  let build_instance cgst (ctx:map_port map_ctx) 
      (hi:hwcompinst) =
    let part lst = MapPartition.add_partition cgst.vargrps lst in
    let part_map_equiv lst =
      MapPartition.add_partition cgst.mapequiv lst
    in
    let conc_id : int =conc_of_abs_map_comp cgst hi in
    let conc_cmp : map_port map_comp =
      MapSpec.get_comp ctx hi.name conc_id
    in
    MAP.iter conc_cmp.vars (fun id vr ->
        let mems : wireid map_var list =
          List.map (fun (v:map_port map_var) ->
              MapSpec.map_var v
              (fun ((c,p):map_port) -> mkwire c hi.inst p)
            )
            vr.members
        in
         part mems 
      );
    ()

  

  let populate_a2c_map (cgst:circ_gen_state) ctx gltbl (inst:hwcompinst) =
    print("->"^(HwLib.hwcompinst2str inst)^"\n");
    let ccomp = SolverCompLib.get_conc_comp gltbl inst in
    let matches : map_port map_comp list =
      MapSpec.find_comp_config ctx inst.name ccomp.cfg.pars
    in
    (*find parameter combo*)
    match matches with
    | [h] ->
      begin
        noop (SMAP.put cgst.a2c_map inst h.id)
      end

    | _ -> error "find instances" "failed."


  let portvar_add_map_math_info_stub 
      (cgst:circ_gen_state) (circ:wireid map_circ) (ctx:map_port map_ctx)  (gltbl:gltbl)
      inst (port:hwvid hwportvar) port_is_stvar : map_math_info =
(*get the map expression.*)
    let part lst = MapPartition.add_partition cgst.vargrps lst in
    let part_map_equiv lst =
      MapPartition.add_partition cgst.mapequiv lst
    in
    let conc_map_comp_id = conc_of_abs_map_comp cgst inst in
    let conc_map_comp = MapSpec.get_comp ctx inst.name conc_map_comp_id in
    let conc_bhv_comp = SolverCompLib.get_conc_comp gltbl inst in
    let map_expr_opt : mid ast option =
      OPTION.map
        (SolverCompLib.comp_get_port_cfg conc_bhv_comp port.port)
        uast2mast 
    in
    let wire = (mkwire inst.name inst.inst port.port) in
    let math_mapping : map_math_info = {
      is_stvar = false;
      range = None;
      deriv_range = None;
      offset = {priority=0;abs_var=0-1};
      scale = {priority=0;abs_var=0-1};
    }
    in
    begin
    match map_expr_opt with
    | None -> ()
    | Some(mast) ->
      begin
        let math_ival = (IntervalCompute.compute_mexpr_interval gltbl mast) in
        if IntervalLib.is_unbounded_interval math_ival then
          begin
            cgst.is_valid <- false
          end
        else
          begin
          math_mapping.range <- Some
              (IntervalLib.interval2numinterval math_ival);
          if MathLib.expr_is_stvar gltbl.env.math mast && port_is_stvar then
            begin
              math_mapping.is_stvar <- true;
              let math_deriv_ival =
                (IntervalCompute.compute_mexpr_interval_deriv gltbl mast)
              in
              if IntervalLib.is_unbounded_interval math_deriv_ival then
                cgst.is_valid <- false
              else
                math_mapping.deriv_range <- Some
                (IntervalLib.interval2numinterval math_deriv_ival);
              
              part [MPVScale(cgst.deriv_wire);MPVScale(wire)];
              part [MPVOffset(cgst.deriv_wire);MPVOffset(wire)];
              ()
            end

          (*there is a basic assignment*)
          else if MathLib.expr_is_stvar gltbl.env.math mast && port_is_stvar = false then
            begin
              math_mapping.is_stvar <- true;
              part [MPVScale(cgst.deriv_wire);MPVScale(wire)];
              part [MPVOffset(cgst.deriv_wire);MPVOffset(wire)];
              ()
            end

          else if MathLib.expr_has_stvar gltbl.env.math mast then
            begin
              (*the scaling expression of the port, in terms of other expressions*)
              let equivs, sexpr_opt =
                MapMathGen.gen_scale_expr gltbl.env.math mast
                  (MPVScale cgst.deriv_wire)
                  (fun q -> MapExpr.string_of_map_var q HwLib.wireid2str)
              in
              (*the scaling expression of this wire equals sexpr*)
              begin
                match sexpr_opt with
                | Some(sexpr) ->
                  part_map_equiv [sexpr.expr;MEVar(MPVScale(wire))]
                | None -> ()
              end;
              MapPartition.iter equivs (fun (cls:wireid map_var map_expr list) ->
                  part_map_equiv cls
              )
            end
          else
            begin
              ()
            end
          end

      end
    end;
    SMAP.put circ.mappings wire math_mapping;
    math_mapping


  let portvar_add_map_port_info_stub
          (cgst:circ_gen_state) circ (ctx:map_port map_ctx) (gltbl:gltbl) inst (port:hwvid hwportvar) =
    let part lst = MapPartition.add_partition cgst.vargrps lst in
    let conc_map_comp_id = conc_of_abs_map_comp cgst inst in
    let conc_map_comp = MapSpec.get_comp ctx inst.name conc_map_comp_id in
    let port_data : map_port_info =
      {
        port=port.port;
        range=None;
        deriv_range=None;
        offset={priority=0;abs_var=0-1};
        scale={priority=0;abs_var=0-1};
        is_stvar=false;
      }
    in 
    let map_port_data = MapSpec._get_port conc_map_comp port.port in
    (*add the compression range*)
    port_data.range <- map_port_data.range; 
    port_data.deriv_range <- map_port_data.deriv_range; 
    port_data.is_stvar <- map_port_data.is_stvar;
    let wire = (mkwire inst.name inst.inst port.port) in
    if port_data.is_stvar then
      begin
        part [MPVScale(cgst.deriv_wire);MPVScale(wire)];
        part [MPVOffset(cgst.deriv_wire);MPVOffset(wire)];
      end;
    SMAP.put circ.ports wire port_data;
    port_data
      


  let add_port_and_math_mappings (cgst:circ_gen_state) circ (ctx:map_port map_ctx) (gltbl:gltbl) (inst:hwcompinst)=
    let conc_bhv_comp = SolverCompLib.get_conc_comp gltbl inst in
    (*iterate over variables*)
    HwLib.comp_iter_vars conc_bhv_comp.d (fun (port:hwvid hwportvar) ->
        let port_info =
          portvar_add_map_port_info_stub cgst circ ctx gltbl inst port
        in
        noop
          (portvar_add_map_math_info_stub cgst circ ctx gltbl inst port port_info.is_stvar)
    )


  let local_to_circ_abs_var (cgst:circ_gen_state) (circ:wireid map_circ) x (i:int) : wireid map_abs_var option =
      if SMAP.has cgst.l2c_map (x,i) then
        let q : int = SMAP.get cgst.l2c_map (x,i) in
        let v = MAP.get circ.vars q in
        Some (v) 
      else
        None

  let circ_of_local_map_var cgst circ x id =
      match local_to_circ_abs_var cgst circ x id with
      | Some(v) -> v.id
      | None ->
        ret
          (error "mkexprs" "deps must be contained in var ") 0

  let circ_of_local_map_expr gltbl cgst (circ:wireid map_circ) 
      (x:hwcompinst) (expr:int map_expr) =
    let _interpret (ast:hwvid ast) =
      let conc_comp = ConcCompLib.get_conc_comp gltbl x in
      let expr = ConcCompLib.concrete_hwexpr_from_compid 
          (HCMLocal(x.name)) conc_comp.cfg ast
      in
      ASTLib.compute expr
    in
    let fvar = 999 in
    let interp_expr : int map_expr = MapExpr.interpret expr _interpret in
    let gexpr =
      MapExpr.map interp_expr (fun i -> circ_of_local_map_var cgst circ x i)
    in
    MapExpr.simpl gexpr (fvar) string_of_int int_of_string  

  let circ_of_local_map_cstr gltbl cgst circ
      (inst:hwcompinst) (cstr:int map_cstr) =
    let _interpret (ast:hwvid ast) =
      let conc_comp = ConcCompLib.get_conc_comp gltbl inst in
      let expr = ConcCompLib.concrete_hwexpr_from_compid 
          (HCMLocal(inst.name)) conc_comp.cfg ast
      in
      ASTLib.compute expr
    in
    let fvar = 999 in
    let icstr :int map_cstr = MapExpr.interpret_cstr cstr _interpret in
    let newicstr = MapExpr.map_cstr icstr
        (fun x -> circ_of_local_map_var cgst circ inst x)
    in
    MapExpr.map_cstr_expr newicstr
      (fun e ->
         MapExpr.simpl e (fvar) string_of_int int_of_string  
      )

  let circ_of_wire_map_expr cgst circ (expr:wireid map_var map_expr) =
    if MapExpr.has_uninterp expr then
      raise
        (MapCircGenError "circ_of_wire_map_expr: was not expecting uninterpreted")
    else
      MapExpr.map expr (fun id ->
          let wire = MapExpr.unwrap_map_var id in
          let global_var : int= match id with
            | MPVScale(wire) ->
              if wire = cgst.deriv_wire then
                cgst.deriv_port.scale.abs_var
              else
                MapSpec.circ_get_scale_var circ wire

            | MPVOffset(wire) ->
              if wire = cgst.deriv_wire then
                cgst.deriv_port.scale.abs_var
              else
                MapSpec.circ_get_offset_var circ wire

          in
          global_var 
        )

  let add_global_exprs_to_circ gltbl (cgst:circ_gen_state)
      (circ:wireid map_circ) (ctx:map_port map_ctx) (hi:hwcompinst) =
    let part_map_equiv lst =
      MapPartition.add_partition circ.equiv lst
    in
    let conc_id : int =conc_of_abs_map_comp cgst hi in
    let conc_cmp : map_port map_comp =
      MapSpec.get_comp ctx hi.name conc_id
    in
    MAP.iter conc_cmp.vars (fun id vr ->
        if List.length vr.members = 0 &&
           (List.length vr.cstrs > 0 || List.length vr.exprs > 0)
        then
          let iexprs =
            List.map (circ_of_local_map_expr gltbl cgst circ hi)
              vr.exprs
          in
          part_map_equiv iexprs;
          ()
      )

  let add_abs_var_cstrs (cgst:circ_gen_state) circ (ctx:map_port map_ctx) (gltbl:gltbl) (inst:hwcompinst)=
    let conc_map_comp_id = conc_of_abs_map_comp cgst inst  in
    let conc_map_comp = MapSpec.get_comp ctx inst.name conc_map_comp_id in
    (*convert to global variables*)
    (*for each variable, add the exprs and constraints.*)
    MAP.iter conc_map_comp.vars (fun vid vdata ->
        let t_exprs : int map_expr list =
          List.map (fun (e:int map_expr) ->
              circ_of_local_map_expr gltbl cgst circ inst e
            ) vdata.exprs
        in
        let t_cstrs : (int map_cstr) list =
          List.map (fun (c:int map_cstr) ->
              circ_of_local_map_cstr gltbl cgst circ inst c
            ) vdata.cstrs
        in
        (*convert local to absolute variable*)
        match local_to_circ_abs_var cgst circ inst vid with
        | None -> ()
        | Some(glbl_var) ->
          begin
            let new_value =
              match glbl_var.value,vdata.value with
              | Some(q),Some(r) -> if q = r then vdata.value else
                  begin
                    print ("contridiction has two values: "^
                            (string_of_number q)^","^(string_of_number r)^"\n");
                    cgst.is_valid <- false;
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

  let update_local_to_circ_map cgst inst id gid =
    SMAP.put cgst.l2c_map (inst,id) gid

  let update_port_and_math_with_id (cgst:circ_gen_state) (circ:wireid map_circ)
      (ctx:map_port map_ctx) (wirevar:wireid map_var) abs_id  : unit=
    let wire : wireid = MapExpr.unwrap_map_var wirevar in
    if cgst.deriv_wire = wire then
      begin
        print ("-> setting deriv\n");
        match wirevar with
        | MPVScale(_) ->
          begin
            circ.time.vid <- abs_id;
            cgst.deriv_port.scale.abs_var <- abs_id
          end

        | MPVOffset(_) ->
          cgst.deriv_port.offset.abs_var <- abs_id
      end
    else
      let conc_id = conc_of_abs_map_comp cgst wire.comp in
      let local_abs_var =
        match wirevar with
          | MPVScale(x) ->
            MapSpec.ctx_get_scale_var ctx
              x.comp.name conc_id x.port

          | MPVOffset(x) ->
              MapSpec.ctx_get_offset_var
                ctx x.comp.name conc_id x.port
      in
      update_local_to_circ_map cgst wire.comp local_abs_var.id abs_id;
      match wirevar with
      | MPVOffset(wire) ->
        MapSpec.circ_set_offset_var circ wire abs_id
      | MPVScale(wire) ->  
        MapSpec.circ_set_scale_var circ wire abs_id



  let build_prob (ctx:map_port map_ctx) (gltbl:gltbl)  =
    let cgst : circ_gen_state = {
      a2c_map = SMAP.mk (HwLib.hwcompinst2str);
      l2c_map = SMAP.mk (fun (h,i) -> (HwLib.hwcompinst2str h)^"."^(string_of_int i));
      vargrps = MapPartition.mk 
          (fun x -> MapExpr.string_of_map_var x HwLib.wireid2str);

      mapequiv = MapPartition.mk 
          (fun x ->
             MapExpr.string_of_map_expr x
               (fun v ->
                  MapExpr.string_of_map_var v HwLib.wireid2str)
          );

      deriv_wire = mkwire (HWCmComp "**deriv**") 0 "**deriv**";
      deriv_port = {is_stvar=true;range=None;deriv_range=None;
                    offset={priority=0;abs_var=0-2};
                    scale={priority=0;abs_var=0-3};
                    port="**deriv**";
                   };
      is_valid = true;
    }
    in
    let circ : wireid map_circ =
      {
        vars=MAP.make();
        ports=SMAP.mk(HwLib.wireid2str);
        mappings=SMAP.mk(HwLib.wireid2str);
        equiv=MapPartition.mk (fun x ->
            MapExpr.string_of_map_expr x string_of_int);
        time={min_speed=None;max_speed=None;vid=0-4}
          
      }
    in
    add_time_cstrs circ gltbl;
    MapPartition.add_partition cgst.vargrps [MPVScale cgst.deriv_wire];
    MapPartition.add_partition cgst.vargrps [MPVOffset cgst.deriv_wire];
    debug "==== Populating A2C Map ====\n";
    SET.iter gltbl.sln_ctx.comps (fun (inst:hwcompinst) ->
        populate_a2c_map cgst ctx gltbl inst
    );
    (*partition*)
    debug "==== Grouping by Connections====\n";
    MAP.iter gltbl.sln_ctx.conns.src2dest (
      fun (src:wireid) (snks:wireid set) ->
        SET.iter snks (fun snk ->
            build_connection cgst ctx src (MPVScale snk);
            build_connection cgst ctx snk (MPVOffset src);
          )
      );
    print "=== Proc Insts ===\n";
    SET.iter gltbl.sln_ctx.comps (fun (inst:hwcompinst) ->
        build_instance cgst ctx inst;
        add_port_and_math_mappings cgst circ ctx gltbl inst;
    );
    (*set the initial mappings.*)
    print "=== Construct Initial Mappings from Partition ===\n"; 
    MapPartition.iter cgst.vargrps
      (fun (members:(wireid map_var) list) ->
          let id = MAP.size circ.vars in
          List.iter (fun (wire:wireid map_var) ->
              update_port_and_math_with_id cgst circ ctx wire id
            ) members;
          let avar : wireid map_abs_var =
            {
              exprs=[MEVar(id)];
              cstrs=[];
              value=None;
              members=members;
              priority=0;
              id=id
            }
          in
          noop (MAP.put circ.vars id avar)
      );

    print ("===Constructing Abs Var Contraints ("^
           (string_of_int (SMAP.size cgst.l2c_map))^") ===\n");
    SET.iter gltbl.sln_ctx.comps (fun (x:hwcompinst) ->
        add_abs_var_cstrs cgst circ ctx gltbl x 
      );
    print "=== Constructing Global Constraints ===\n";
    SET.iter gltbl.sln_ctx.comps (fun (inst:hwcompinst) ->
        add_global_exprs_to_circ gltbl cgst circ ctx inst 
      );
    print ("== Adding Global Variables ==");
    MapPartition.iter cgst.mapequiv (fun (exprs:wireid map_var map_expr list) ->
        let iexprs : int map_expr list = List.map (
            fun (expr:wireid map_var map_expr) ->
              let iexpr : int map_expr =
                circ_of_wire_map_expr cgst circ expr
              in
              iexpr
          ) exprs
        in
        MapPartition.add_partition circ.equiv iexprs
        
      );
    let is_valid = cgst.is_valid in
    destroy_circ_gen_state cgst;
    if is_valid then
      Some circ
    else
      None


end

