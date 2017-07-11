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

open SMapHwConfigGen;;
open SMapData;;

exception SMapSimplifier_error of string
exception SMapSolver_error of string
module SMapSolver =
struct

  type map_problem = SMapHwConfigGen.cfggen_ctx

  type cfggen_bin = SMapHwConfigGen.cfggen_bin
  type cfggen_mapvar= SMapConfigData.cfggen_mapvar
  type cfggen_mapexpr = SMapConfigData.cfggen_mapexpr

  let string_of_cfggen_mapvar = SMapConfigData.string_of_mapvar;;

  let vmax = 1e6;;
  let vmin = 0. -. vmax;;

  let rec xid_to_z3_var : int -> string =
    fun idx ->
      "x"^(string_of_int idx)

  let z3_var_to_xid : string -> int =
        fun name ->
          int_of_string (STRING.removeprefix name "x")

  let rec xid_expr_to_z3_expr : map_expr -> z3expr =
    fun expr -> match expr with
      | SEVar(SMFreeVar(idx)) -> Z3Var(xid_to_z3_var idx)
      | SENumber(i) -> Z3Number(i)
      | SEAdd(a,b) -> Z3Plus(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SESub(a,b) -> Z3Sub(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEMult(a,b) -> Z3Mult(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEDiv(a,b) -> Z3Div(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)
      | SEPow(a,b) -> Z3Power(xid_expr_to_z3_expr a, xid_expr_to_z3_expr b)

  let number_to_z3_expr : number -> z3expr =
    fun num -> match num with
      | Integer(i) -> Z3Number(Integer i)
      | Decimal(i) -> Z3Number(Decimal i)

  type mapslvr_bin =
    | SMVMapExpr of map_expr
    | SMVMapVar of int
    | SMVNeq of map_expr*number
    | SMVCoverTime of number option*number option
    | SMVTimeConstant

  type mapslvr_st =
    | SMVCover of int*int*map_range*map_range

  type mapslvr_ctx = {
    varmap: (string,int) map;
    xidmap: (int,cfggen_mapvar list) map;
    
    mutable bins: (mapslvr_bin,unit) graph;
    sts: mapslvr_st set;
    mutable success: bool;
  }

  let string_of_mapslvr_bin step = match step with
    | SMVMapExpr(me) -> "me."^(SMapExpr.to_string me)
    | SMVMapVar(mv) -> "mv."^(string_of_int mv)
    | SMVNeq(e,n) -> "neq."^(SMapExpr.to_string e)^"."^(string_of_number n)
    | SMVCoverTime(n,m) -> "ct."^
                           (OPTION.tostr n string_of_number)^
                           (OPTION.tostr m string_of_number)
    | SMVTimeConstant -> "tc"

  let mk_mapslvr_ctx () = {
    varmap = MAP.make();
    xidmap= MAP.make();
    bins = GRAPH.make (fun a b -> a=b) 
        (fun step -> string_of_mapslvr_bin step)
        (fun () -> "");
    sts = SET.make_dflt();
    success = true;
  }
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
          Printf.printf("[slvr] -> decl %s\n") name;
          noop (MAP.put ctx.varmap name varid);
          noop (MAP.put ctx.xidmap varid (new_decl::curr_decls));
          varid
        end
      else
        begin
          let idx = MAP.get ctx.varmap name in
          Printf.printf("[slvr] -> get %s -> %d\n") name idx;
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

 
  let cover_cstr_to_z3 : int->int-> map_range -> map_range -> z3st list =
    fun scale_xid offset_xid hwival mival ->
      let scvar = Z3Var (xid_to_z3_var scale_xid) in
      let ofvar = Z3Var (xid_to_z3_var offset_xid) in
      let hmin =  number_to_z3_expr hwival.min
      and hmax = number_to_z3_expr hwival.max in
      let mmin =  number_to_z3_expr mival.min
      and mmax = number_to_z3_expr mival.max in
      if not (NUMBER.eq mival.min mival.max)  then
        begin
          let max_cover =
            Z3And(
              Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax),
              Z3GTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmin)
            )
          in
          let min_cover =
            Z3And(
              Z3LTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmax),
              Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin)
            ) 
          in
          Z3Comment("cover cstr")::Z3Assert(min_cover)::Z3Assert(max_cover)::[]
        end
        
      else
        begin
          let num_cover =
            Z3And(
              Z3GTE(Z3Plus(Z3Mult(scvar,mmin),ofvar),hmin),
              Z3LTE(Z3Plus(Z3Mult(scvar,mmax),ofvar),hmax)
            ) 
          in
          Z3Comment("cover cstr")::Z3Assert(num_cover)::[]
        end
                

  
  let time_cstr_to_z3 : z3expr -> number option -> number option -> z3st list =
    fun expr tmin_maybe tmax_maybe ->
        begin
          match tmin_maybe, tmax_maybe with
          | Some(tmin),Some(tmax) ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(expr,number_to_z3_expr tmax))::
            Z3Assert(Z3LTE(number_to_z3_expr tmin,expr))::
            []


          | Some(tmin),None ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(number_to_z3_expr tmin,expr))::
            []

          | None,Some(tmax) ->
            Z3Comment("time cstr")::
            Z3Assert(Z3LTE(expr,number_to_z3_expr tmax))::
            []

          | None,None -> [] 
        end

  
  
  let convert_mapvar_graph_to_xid_graph : mapslvr_ctx -> map_problem -> unit=
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

             | SMBTimeConstant -> SMVTimeConstant
          )
      in
      GRAPH.destroy slvr_ctx.bins;
      slvr_ctx.bins <- new_graph;
      Printf.printf "[slvr] === Constructing Contraints ====\n";
      MAP.iter ctx.cstrs (fun wire cstrs ->
          let inst = wire.comp in
          LIST.iter (fun cstr ->
              Printf.printf "  cstr: %s\n" (SMapCstr.to_string cstr);
              match cstr with
              | SCExprNeqConst(me,n) ->
                begin
                  let xidexpr = (map_expr_to_xid_expr slvr_ctx inst me) in
                  let xidexpr_bin = SMVMapExpr(xidexpr) in
                  let neq_bin = SMVNeq(xidexpr,n) in
                  if GRAPH.hasnode slvr_ctx.bins neq_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins neq_bin);
                  GRAPH.mkedge slvr_ctx.bins xidexpr_bin neq_bin ();
                  ()
                end
                
              | SCVarNeqConst(mv,n) ->
                begin
                  let xidvar = (map_var_to_xid_var slvr_ctx inst mv) in
                  let xidvar_bin = SMVMapVar(xidvar) in
                  let neq_bin = SMVNeq(SEVar (SMFreeVar xidvar), n) in
                  if GRAPH.hasnode slvr_ctx.bins neq_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins neq_bin);
                  GRAPH.mkedge slvr_ctx.bins xidvar_bin neq_bin ();
                  ()
                end
                
              
              | SCCoverInterval(hwival,mival,SEVar sc,SEVar off) ->
                begin
                  let sc_xid = (map_var_to_xid_var slvr_ctx inst sc) in
                  let off_xid = (map_var_to_xid_var slvr_ctx inst off) in
                  SET.add slvr_ctx.sts (SMVCover(sc_xid,off_xid,hwival,mival));
                  ()
                end

              | SCTrue -> () 
              | SCFalse -> slvr_ctx.success <- false 
              | SCCoverTime(min,max) ->
                begin
                  let cstr_bin = SMVCoverTime(min,max) in
                  if GRAPH.hasnode slvr_ctx.bins cstr_bin = false then
                    noop (GRAPH.mknode slvr_ctx.bins cstr_bin);
                  if GRAPH.hasnode slvr_ctx.bins SMVTimeConstant then
                    noop (GRAPH.mkedge slvr_ctx.bins SMVTimeConstant cstr_bin);
                  ()
                end
              | _ -> ()
          ) cstrs
      );
    (*remove any nodes that are not being exported*)
    MAP.iter ctx.export (fun bin export ->
        if export = false then
          begin
            let to_remove = match bin with
              | SMBMapExpr(inst,e) ->
                SMVMapExpr(map_expr_to_xid_expr slvr_ctx inst e)
              | _ ->
                raise (SMapSolver_error "unexpected: must export var")
            in
            if GRAPH.hasnode slvr_ctx.bins to_remove then
              begin
                let other = List.nth (GRAPH.connected slvr_ctx.bins to_remove) 0 in
                GRAPH.merge new_graph to_remove other
              end
          end
      )


  let remap_xid_graph : mapslvr_ctx -> unit =
    fun ctx ->
      let remap = MAP.make () in
      let max_remap () =
        let _,v =LIST.max float_of_int (MAP.to_values remap) in
        v
      in
      let bin_set = GRAPH.disjoint ctx.bins in
      List.iteri (fun (i:int) (bins:mapslvr_bin set) ->
          SET.iter bins (fun (bin:mapslvr_bin) ->
              match bin with
              | SMVMapVar(old_i) ->
                noop (MAP.put remap old_i i)
              | _ -> ()
            )
        ) bin_set;
      MAP.iter ctx.xidmap (fun (i:int) _ ->
          if MAP.has remap i then () else
            noop (MAP.put remap i (max_remap() + 1))
        );
      raise (SMapSolver_error "unimpl")
        
  let z3st_decl_xid : int -> cfggen_mapvar list -> z3st list =
    fun idx mappings ->
      let varname = xid_to_z3_var idx in
      let decl = Z3ConstDecl(varname , Z3Real) in
      let s_max_float = 1e10 in
      let s_min_float = 1e-100 in
      let not_too_large =
        Z3Assert(Z3And(
            Z3LTE(Z3Var varname,Z3Number(Decimal s_max_float)),
            Z3GTE(Z3Var varname,Z3Number(Decimal (0.-.s_max_float)))
          ))
      in
      let comment =
        Z3Comment(LIST.tostr string_of_cfggen_mapvar ", " mappings)
      in
      (*not part of constraint problem.*)
      comment::decl::not_too_large::[]
      


  
  let map_problem_to_z3 : (map_problem) -> ((int,cfggen_mapvar list)map*(z3st list)) option=
    fun ctx ->
      let slvr_ctx = mk_mapslvr_ctx () in
      convert_mapvar_graph_to_xid_graph slvr_ctx ctx;
      (*reduce_xid_graph slvr_ctx ctx;*)
      if slvr_ctx.success = false then
        None
      else
        let decls = QUEUE.make() in
        let cover = QUEUE.make() in
        let time_cover = QUEUE.make() in
        let equals = SET.make_dflt() in
        let not_equals = SET.make_dflt() in
        let bin_set = GRAPH.disjoint slvr_ctx.bins in
        MAP.iter slvr_ctx.xidmap (fun id mappings ->
            noop (QUEUE.enqueue_all decls (z3st_decl_xid id mappings));
          );
        List.iter (fun (bins:mapslvr_bin set) ->
            let is_tc = REF.mk false in
            let cls :z3expr list = SET.fold bins (fun bin rest -> match bin with
                | SMVMapVar(id) ->
                    (Z3Var(xid_to_z3_var id))::rest

                | SMVMapExpr(mapexpr) ->
                  (xid_expr_to_z3_expr mapexpr)::rest

                | SMVTimeConstant -> ret (REF.upd is_tc (fun _ -> true)) rest
                | _ -> rest
              ) []
            in
            (*equivalence constraints*)
            LIST.diag_iter cls (fun expr1 expr2 ->
                noop (SET.add equals (Z3Assert(Z3Eq(expr1,expr2))))
              );
            SET.iter bins (fun (bin:mapslvr_bin) ->
                match bin with
                | SMVNeq(_,n) ->
                  let neqs = List.map (
                      fun expr ->
                        if NUMBER.is_zero n then
                          let z3n = number_to_z3_expr (Decimal 1e-15) in
                          Z3Assert(Z3Or(
                              Z3LT(expr,Z3Neg(z3n)),
                              Z3GT(expr,z3n)
                            ))
                        else
                          let z3n = number_to_z3_expr n in
                          Z3Assert(Z3Or(
                              Z3LT(expr,z3n),
                              Z3GT(expr,z3n)
                            ))
                    ) cls
                  in
                  noop (SET.add_all not_equals neqs)

                | SMVCoverTime(min,max) ->
                  List.iter (
                    fun expr ->
                       noop (QUEUE.enqueue_all time_cover (time_cstr_to_z3 expr min max))
                  ) cls
                | _ -> ()
              );
          ) bin_set;
        SET.iter slvr_ctx.sts (fun st -> match st with
            | SMVCover(sc,off,hwival,mival) ->
              let sts = cover_cstr_to_z3 sc off hwival mival in
              noop (QUEUE.enqueue_all cover sts)
          );
        let problem =
          (QUEUE.to_list decls) @
          [Z3Comment("");Z3Comment("== Equivalences==")] @
          (SET.to_list equals) @
          [Z3Comment("");Z3Comment("== Not Equals==")] @
          (SET.to_list not_equals) @
          [Z3Comment("");Z3Comment("== Covers ==")] @
          (QUEUE.to_list cover) @
          [Z3Comment("");Z3Comment("== Time ==")] @
          (QUEUE.to_list time_cover)
        in
        Some (slvr_ctx.xidmap, problem)
      (*TODO: put back coverage statements*)
      
  let parse_sln : (string,mid) sln -> map_hw_spec -> (int,cfggen_mapvar list) map
    -> z3assign list -> (wireid, linear_transform) map =
    fun sln mapspec mapper asgns ->
      let xid_to_val : (int,number) map= MAP.make () in 
      List.iter (fun asgn -> match asgn with
          | Z3Set(varname,qty) ->
            let xid = z3_var_to_xid varname in
            begin
              match qty with
              | Z3QInt(i) ->
                MAP.put xid_to_val xid (Integer i)
              | Z3QFloat(f) ->
                MAP.put xid_to_val xid (Decimal f)
              | Z3QInterval(Z3QRange(min,max)) ->
                MAP.put xid_to_val xid (Decimal (MATH.max[min;max]))
              (*anything with infinity is basically a don't care.*)
              | Z3QInterval(Z3QAny) ->
                MAP.put xid_to_val xid (Integer 0)
              | Z3QInterval(Z3QInfinite(QDNegative)) ->
                MAP.put xid_to_val xid (Decimal vmin)
              | Z3QInterval(Z3QInfinite(QDPositive)) ->
                MAP.put xid_to_val xid (Decimal vmax)
              (*if the interval has a lower or upper bound, set value to lower or upper bound*)
              | Z3QInterval(Z3QLowerBound(b)) ->
                MAP.put xid_to_val xid (Decimal b)
              | Z3QInterval(Z3QUpperBound(b)) ->
                MAP.put xid_to_val xid (Decimal b)
              | Z3QBool(_) ->
                raise (SMapSolver_error "unexpected: boolean datatype")

            end;
            ()
        ) asgns;
      let wire_to_mapping : (wireid,linear_transform) map = MAP.make () in
      MAP.iter mapper (fun xid (mapvars:cfggen_mapvar list) ->
          List.iter (fun (var:cfggen_mapvar) ->
              let wire_maybe  = match var.mapvar with
                | SMScale(port) ->Some (mkwire var.comp.name var.comp.inst port)
                | SMOffset(port) -> Some (mkwire var.comp.name var.comp.inst port)
                | _ -> None
              in
              let value = float_of_number (MAP.get xid_to_val xid) in
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

  let compute_transform : gltbl ->  map_problem -> int ->
    (wireid, linear_transform) map option=
    fun tbl ctx compute_time ->
      match map_problem_to_z3 ctx with
      | Some(mapping,z3prob) -> 
        begin
          let mapsln : z3sln = Z3Lib.exec "map" z3prob compute_time true in
          match mapsln.model with
          | Some(model) ->
            Some (parse_sln tbl.sln_ctx tbl.map_ctx mapping model)
          | None -> None
        end
      | None -> None

  let compute_transform_exists : gltbl -> map_problem -> int -> z3status =
    fun tbl ctx compute_time ->
      match map_problem_to_z3 ctx with
      | Some(mapping,z3prob) -> 
        begin
          let mapsln : z3sln = Z3Lib.exec "map" z3prob compute_time true in
          mapsln.sat
        end

      | None -> Z3UNSAT 

end
