open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open MathData;;

open IntervalLib;;
open IntervalData;;

open Z3Data;;
open Z3Lib;;

open ScipyOptimizeData;;
open ScipyOptimizeLib;;

open SMapHwConfigGen;;
open SMapData;;
open SMapSolverData;;
open Z3SMapSolver;;
open ScioptSMapSolver;;


                        
let string_of_cfggen_mapvar = SMapCfggenCtx.string_of_mapvar;;



exception SMapSolver_error of string

module SMapSolver =
struct

 
    let map_var_to_xid_var : mapslvr_ctx -> hwcompinst -> map_var -> int =
    fun ctx inst vr ->
      let name = string_of_cfggen_mapvar {comp=inst;mapvar=vr} in
      if MAP.has ctx.varmap name then
        MAP.get ctx.varmap name
      else
        raise (SMapSolver_error ("not found:"^name))

  

  let decl_var : mapslvr_ctx ->int -> hwcompinst -> map_var -> int =
    fun ctx varid inst mapvar ->
      let curr_decls = if MAP.has ctx.xidmap varid 
        then MAP.get ctx.xidmap varid else []
      in
      let new_decl : cfggen_mapvar = {comp=inst;mapvar=mapvar} in
      let name = string_of_cfggen_mapvar new_decl in
      (*only add the mapping if it doesn't exist already, and is not
      already mapped to an xid*)
      if LIST.has curr_decls new_decl = false &&
         MAP.has ctx.varmap name = false
      then
        begin
          (*Printf.printf("[slvr] -> decl %s\n") name;*)
          noop (MAP.put ctx.varmap name varid);
          noop (MAP.put ctx.xidmap varid (new_decl::curr_decls));
          varid
        end
      else
        begin
          let idx = MAP.get ctx.varmap name in
          (*Printf.printf("[slvr] -> get %s -> %d\n") name idx;*)
          idx
        end

  let max_xid : mapslvr_ctx -> int =
    fun ctx ->
      let _,curr_id =
        LIST.max float_of_int (MAP.keys ctx.xidmap)
      in
      curr_id

  let map_expr_to_xid_expr : mapslvr_ctx -> hwcompinst -> map_expr -> map_expr =
    fun ctx inst expr ->
      let rec _compute : map_expr -> map_expr =
        fun e -> match e with
          | SEVar(SMFreeVar(v)) ->
            let freevar_id = (max_xid ctx) + 1 in
            let act_var = decl_var ctx freevar_id inst (SMFreeVar v) in
            SEVar(SMFreeVar(act_var))

          | SEVar(v) ->
            SEVar(SMFreeVar(map_var_to_xid_var ctx inst v))

          | SENumber(n) -> SENumber(n)
          | SEAdd(a,b) -> SEAdd(_compute a, _compute b)
          | SESub(a,b) -> SESub(_compute a, _compute b)
          | SEMult(a,b) -> SEMult(_compute a, _compute b)
          | SEDiv(a,b) -> SEDiv(_compute a, _compute b)
          | SEPow(a,b) -> SEPow(_compute a, _compute b)
      in
      _compute (expr)

 
    
  
  let convert_mapvar_graph_to_xid_graph : mapslvr_ctx -> cfggen_ctx -> unit=
    fun slvr_ctx ctx ->
      let bin_set = GRAPH.disjoint ctx.bins in
      Printf.printf "[slvr] === Declaring Vars ====\n";
      List.iteri (fun (i:int) (bins:cfggen_bin set) ->
          SET.iter bins (fun (bin:cfggen_bin) ->
              match bin with
              | SMBMapVar(inst,varname) ->
                noop (decl_var slvr_ctx i inst varname)
              | _ -> ()
            )
        ) bin_set;
      Printf.printf "[slvr] === Constructing XID Graph ====\n";
      (*convert to exprs, merging as you go*) 
      let new_graph = GRAPH.map_nodes ctx.bins slvr_ctx.bins.node2str
          (fun (bin:cfggen_bin)  ->
             match bin with
             | SMBMapExpr(inst,e) ->
               SMVMapExpr(map_expr_to_xid_expr slvr_ctx inst e)

             | SMBMapVar(inst,varname) ->
               let xid = map_var_to_xid_var slvr_ctx inst varname in
               SMVMapVar(xid)

             | SMBNumber(n) ->
               SMVMapExpr(SENumber(n))

             | SMBIneq(inst,op,me) ->
               let xid = map_expr_to_xid_expr slvr_ctx inst me in
               SMVOp(op,xid)

             | SMBCoverTime(n1,n2) ->
               SMVCoverTime(n1,n2)

             | SMBTimeConstant -> SMVTimeConstant
          )
      in
      GRAPH.destroy slvr_ctx.bins;
      slvr_ctx.bins <- new_graph;
      Printf.printf "[slvr] === Constructing Constraints ====\n";
      MAP.iter ctx.cstrs (fun inst cstrs ->
          LIST.iter (fun cstr ->
              (*Printf.printf "  cstr: %s\n" (SMapCstr.to_string cstr);*)
              match cstr with
              (*
              | SCExprIneq(op,me) ->
                begin
                  let xidexpr = (map_expr_to_xid_expr slvr_ctx inst me) in
                  let xidexpr_bin = SMVMapExpr(xidexpr) in
                  let op_bin = SMVOp(op,xidexpr) in
                  if GRAPH.hasnode slvr_ctx.bins op_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins op_bin);
                  GRAPH.mkedge slvr_ctx.bins xidexpr_bin op_bin ();
                  ()
                end

              | SCVarIneq(op,mv) ->
                begin
                  let xidvar = (map_var_to_xid_var slvr_ctx inst mv) in
                  let xidvar_bin = SMVMapVar(xidvar) in
                  let op_bin = SMVOp(op,SEVar (SMFreeVar xidvar)) in
                  if GRAPH.hasnode slvr_ctx.bins op_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins op_bin);
                  GRAPH.mkedge slvr_ctx.bins xidvar_bin op_bin ();
                  ()
                end

              | SCCoverTime(min,max) ->
                begin
                  let cstr_bin = SMVCoverTime(min,max) in
                  if GRAPH.hasnode slvr_ctx.bins cstr_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins cstr_bin);
                  if GRAPH.hasnode slvr_ctx.bins SMVTimeConstant then
                    noop (GRAPH.mkedge slvr_ctx.bins SMVTimeConstant cstr_bin);
                  ()
                end
 
              *)
              | SCCoverInterval(hwival,mival,SEVar sc,SEVar off) ->
                begin
                  let sc_xid = (map_var_to_xid_var slvr_ctx inst sc) in
                  let off_xid = (map_var_to_xid_var slvr_ctx inst off) in
                  SET.add slvr_ctx.sts (SMVCover(sc_xid,off_xid,hwival,mival));
                  ()
                end

              | SCTrue -> () 
              | SCFalse -> slvr_ctx.success <- false 
             

              | _ -> ()
          ) cstrs
      );
      (*remove any nodes that are not being exported*)
      MAP.iter ctx.export (fun bin export ->
          if export = false then
            begin
              let slvr_bin = match bin with
                | SMBMapExpr(inst,e) ->
                  SMVMapExpr(map_expr_to_xid_expr slvr_ctx inst e)
                | SMBIneq(inst,op,e) ->
                  SMVOp(op,map_expr_to_xid_expr slvr_ctx inst e)
                | SMBCoverTime(n1,n2) ->
                  SMVCoverTime(n1,n2)
                | SMBMapVar(inst,e) ->
                  raise (SMapSolver_error "unexpected: must export var")
              in
              SMapSlvrCtx.export_bin slvr_ctx slvr_bin false;
            end
        );
      (*remove any nodes that are not being exported*)
      MAP.iter ctx.export_eq (fun (bin1,bin2) export ->
          if export = false then
            begin
              let slvr_bin1 = match bin1 with
                | SMBMapExpr(inst,e) ->
                  SMVMapExpr(map_expr_to_xid_expr slvr_ctx inst e)
                | SMBMapVar(inst,v) ->
                  SMVMapVar(map_var_to_xid_var slvr_ctx inst v)
                | SMBNumber(n) ->
                  SMVMapExpr(SENumber n)
                | SMBIneq(inst,op,e) ->
                  SMVOp(op,map_expr_to_xid_expr slvr_ctx inst e)
              in
              let slvr_bin2 = match bin2 with
                | SMBMapExpr(inst,e) ->
                  SMVMapExpr(map_expr_to_xid_expr slvr_ctx inst e)
                | SMBMapVar(inst,v) ->
                  SMVMapVar(map_var_to_xid_var slvr_ctx inst v)
                | SMBNumber(n) ->
                  SMVMapExpr(SENumber n)
                | SMBIneq(inst,op,e) ->
                  SMVOp(op,map_expr_to_xid_expr slvr_ctx inst e)

              in
              SMapSlvrCtx.export_edge slvr_ctx slvr_bin1 slvr_bin2 false;
          end
      )


  
  let print_slvr_bins : mapslvr_ctx -> unit =
    fun ctx ->
      let disjoint = GRAPH.disjoint ctx.bins in
      Printf.printf "=== SOLVER CTX ==";
      List.iteri (fun d bset ->
          Printf.printf "--- Bin %d ---\n" d;
          SET.iter bset (fun bin ->
              Printf.printf "%s\n" (SMapSlvrCtx.string_of_bin bin)
            );
          Printf.printf "---------\n"
        ) disjoint

  let build_linmap_transform : (string,mid) sln -> map_hw_spec -> (int,cfggen_mapvar list) map
    -> (int,float) map -> (wireid, linear_transform) map =
    fun sln mapspec mapper asgns ->
      let wire_to_mapping : (wireid,linear_transform) map = MAP.make () in
      MAP.iter mapper (fun xid (mapvars:cfggen_mapvar list) ->
          List.iter (fun (var:cfggen_mapvar) ->
              let wire_maybe  = match var.mapvar with
                | SMScale(port) ->Some (mkwire var.comp.name var.comp.inst port)
                | SMOffset(port) -> Some (mkwire var.comp.name var.comp.inst port)
                | _ -> None
              in
              let value = MAP.get asgns xid in
              match wire_maybe with
              | Some(wire) ->
                let linear_trans :linear_transform= if MAP.has wire_to_mapping wire 
                  then MAP.get wire_to_mapping wire else {scale=1.0;offset=0.0}
                in
                begin
                  match var.mapvar with
                  | SMScale(_) -> linear_trans.scale <- value 
                  | SMOffset(_) -> linear_trans.offset <- value
                end;
                noop (MAP.put wire_to_mapping wire linear_trans)

              | None -> ()

            ) mapvars
        );
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let spec : map_comp = MAP.get mapspec.comps inst.name in
          MAP.iter spec.inputs (fun port _ ->
              let wire : wireid = {comp=inst;port=port} in
              if MAP.has wire_to_mapping wire = false then
                noop (MAP.put wire_to_mapping wire {scale=1.0;offset=0.0})
            );
          MAP.iter spec.outputs (fun port _ ->
              let wire : wireid = {comp=inst;port=port} in
              if MAP.has wire_to_mapping wire = false then
                noop (MAP.put wire_to_mapping wire {scale=1.0;offset=0.0})
            )
        );
      Printf.printf "=== Mappings ===\n%s\n=======\n"
        (SLinearTransform.map_to_string wire_to_mapping);
      wire_to_mapping

  (*compute a tight bound then gradually relax it*)
  let validate_model : int -> mapslvr_ctx -> (int,float) map -> float -> bool*(int,float) map =
    fun compute_time slvr_ctx stdmodel ctol ->
      let evaluate prec tol = 
        let z3prob =
          Z3SMapSolver.slvr_ctx_to_z3_validate slvr_ctx stdmodel prec tol
        in
        let mapsln : z3sln = Z3Lib.exec "mapver" z3prob compute_time true in
        match mapsln.model with
        | Some(model) -> false,true,Z3SMapSolver.get_standard_model model
        | None ->
          if mapsln.sat = Z3Timeout then
            true,false,stdmodel
          else
            false,false,stdmodel
      in
      let rec _work prec_coeff tol maxtries =
        let new_prec = prec_coeff in
        let timeout,succ,model = evaluate new_prec tol in
        if succ then
          succ,model
        else if timeout || maxtries == 0 then
          succ,model
        else
          _work (prec_coeff *. 10.0) (tol *. 10.0) (maxtries-1)
      in
      _work 0.001 ctol 4

  let get_validated_model : gltbl -> mapslvr_ctx  -> int -> sciopt_result ->
    (wireid, linear_transform) map option =
    fun tbl slvr_ctx compute_time mapsln ->
      (*determine if we should validate a nonlinear optimizer solution with dReal*)
      let do_validate = Globals.get_glbl_bool "jaunt-validate" in
      let mapping = slvr_ctx.xidmap in
      match mapsln.vect with
      | Some(model) ->
        begin
          let stdmodel = ScioptSMapSolver.get_standard_model model in
          let sci_xform =
            build_linmap_transform tbl.sln_ctx tbl.map_ctx mapping stdmodel
          in
          if do_validate then
            begin
              let is_valid,accmodel =
                validate_model compute_time slvr_ctx stdmodel
                  mapsln.tolerance
              in
              if is_valid then
                Some (build_linmap_transform tbl.sln_ctx tbl.map_ctx mapping accmodel)
              else
                None
            end
          else
            Some(sci_xform)
        end
      | None -> None



  let compute_mapping_with_sciopt :
    gltbl -> mapslvr_ctx -> mapslvr_opt -> (wireid,linear_transform) map option =
    fun tbl slvr_ctx optimize ->
      let compute_time = Globals.get_glbl_int "jaunt-optimize-localopt-timeout" in
      let scipy_prob = ScioptSMapSolver.to_scipy slvr_ctx optimize in
      Printf.printf "[OPTIMIZE] === FIND CANDIDATE MINIMA === \n";
      let conc_mapslns : sciopt_result list =
        ScipyOptimizeLib.exec "map" scipy_prob compute_time
      in
      let conc_result = List.fold_right (fun result validated_result ->
          match validated_result with
          | None -> get_validated_model tbl slvr_ctx compute_time result
          | Some(_) -> validated_result
        ) conc_mapslns None
      in
      conc_result

  let cfggen_ctx_to_sln : gltbl -> cfggen_ctx -> int -> mapslvr_opt -> (wireid,linear_transform) map option =
    fun tbl ctx compute_time optimize ->
      let slvr_ctx = SMapSlvrCtx.mk_ctx () in
      convert_mapvar_graph_to_xid_graph slvr_ctx ctx;
      (*print_slvr_bins slvr_ctx;*)
      (*reduce_xid_graph slvr_ctx ctx;*)
      if slvr_ctx.success = false then
        None
      else
        let mapping = slvr_ctx.xidmap in
        let incorp_cover = Globals.get_glbl_bool "enable-jaunt-cover" in
        Z3SMapSolver.set_option "use-cover" incorp_cover;
        ScioptSMapSolver.set_option "use-cover" incorp_cover;
        (*find solution for linearized problem and s*)
         let sln =
             compute_mapping_with_sciopt tbl slvr_ctx optimize
         in
         sln

  let compute_transform : gltbl ->  cfggen_ctx -> int -> mapslvr_opt ->
    (wireid, linear_transform) map option=
    fun tbl ctx compute_time optimize ->
      cfggen_ctx_to_sln tbl ctx compute_time optimize

  let compute_transform_exists : gltbl -> cfggen_ctx -> int -> bool =
    fun tbl ctx compute_time ->
      (cfggen_ctx_to_sln tbl ctx compute_time SMONone) <> None

end
