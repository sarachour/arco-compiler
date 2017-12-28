open Util;;
open SMapData;;
open HWData;;
open HWLib;;


type cfggen_bin =
    | SMBMapExpr of hwcompinst*map_expr
    | SMBNumber of number
    | SMBTimeConstant
    | SMBMapVar of hwcompinst*map_var
    | SMBIneq of hwcompinst*map_op*map_expr
    | SMBCoverTime of number option*number option

  


type cfggen_mapvar = {
  comp:hwcompinst;
  mapvar:map_var;
}

type cfggen_mapexpr = {
  inst:hwcompinst;
  expr:map_expr;
}
type cfggen_ctx = {
  insts : (hwcompinst, map_comp_ctx) map;
  cstrs: (hwcompinst, map_cstr list) map;
  bins : (cfggen_bin,unit) graph;
  export: (cfggen_bin,bool) map;
  export_eq: (cfggen_bin*cfggen_bin,bool) map;
  mutable success: bool;
}

type z3map_partial =
  | Z3MPNoScale 
  | Z3MPNoOffset
  | Z3MPPositiveOffset
  | Z3MPPositiveScale
    

module SMapCfggenCtx =
struct

  let string_of_bin (b:cfggen_bin) = match b with
    | SMBMapExpr(inst,e) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapExpr.to_string e)
    | SMBNumber(n) -> string_of_number n
    | SMBTimeConstant -> "tau"
    | SMBMapVar(inst,v) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapVar.to_string v)
    | SMBIneq(inst,op,e) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapExpr.to_string e)^":"^
      (SMapCstr.string_of_op op)
    | SMBCoverTime(n1,n2) ->
      "tau."^
      (OPTION.tostr n1 string_of_number)^" -> "^
      (OPTION.tostr n1 string_of_number)

  let expr_to_bin : hwcompinst -> map_expr -> cfggen_bin =
    fun inst expr -> match expr with
      | SEVar(v) -> SMBMapVar(inst,v)
      | SENumber(Decimal 1.0) -> SMBNumber(Integer 1)
      | SENumber(Decimal 0.0) -> SMBNumber(Integer 0)
      | SENumber(n) -> SMBNumber(n)
      | _ -> SMBMapExpr(inst,expr)
        

  let string_of_mapvar : cfggen_mapvar -> string =
    fun v ->
      (HwLib.hwcompinst2str v.comp)^":"^(SMapVar.to_string v.mapvar)

  let mkctx () =
  {
    insts = MAP.make();
    bins=GRAPH.make
        (fun a b -> a = b)
        (fun bin -> string_of_bin bin)
        (fun () -> "");
    cstrs= MAP.make();
    export=MAP.make();
    export_eq=MAP.make();
    success=true;
  }
  let make_bin : cfggen_ctx -> cfggen_bin -> unit =
    fun ctx bin ->
      if GRAPH.hasnode ctx.bins bin= false then
        noop (GRAPH.mknode ctx.bins bin);
      ()

  let disabled :cfggen_ctx -> cfggen_bin -> bool =
    fun ctx bin ->
      MAP.has ctx.export bin && (MAP.get ctx.export bin) == false

  let add_cstr : cfggen_ctx -> hwcompinst -> map_cstr -> unit =
    fun ctx inst cstr ->
      match MAP.ifget ctx.cstrs inst with
      | Some(curr_cstrs) -> noop (MAP.put ctx.cstrs inst (cstr::curr_cstrs))
      | None -> noop (MAP.put ctx.cstrs inst [cstr])

  let equal_bins : cfggen_ctx -> cfggen_bin -> cfggen_bin -> bool =
    fun ctx bin1 bin2 ->
      if bin1 == bin2 then true
      else if
        (GRAPH.hasnode ctx.bins bin1 && GRAPH.hasnode ctx.bins bin2)
      then
        let group = GRAPH.group ctx.bins bin1 in
        SET.has group bin2
      else
        false


  let group : cfggen_ctx -> cfggen_bin -> cfggen_bin list =
    fun ctx bin ->
      if GRAPH.hasnode ctx.bins bin = false then [] else
        SET.to_list (GRAPH.group ctx.bins bin)

  let equal_exprs : cfggen_ctx -> hwcompinst -> map_expr -> map_expr -> bool =
    fun ctx inst expr1 expr2 ->
      if expr1 = expr2 then true else
        equal_bins ctx (SMBMapExpr(inst,expr1)) (SMBMapExpr(inst,expr2))

  let equal_vars : cfggen_ctx -> hwcompinst -> map_var -> map_var -> bool =
    fun ctx inst var1 var2 ->
      if var1 = var2 then true else
        equal_bins ctx (SMBMapVar(inst,var1)) (SMBMapVar(inst,var2))

  let equal_var_and_expr : cfggen_ctx -> hwcompinst -> map_var -> map_expr -> bool =
    fun ctx inst vr expr2 ->
      if SEVar(vr) = expr2 then true else
        equal_bins ctx (SMBMapVar(inst,vr)) (SMBMapExpr(inst,expr2))

  let get_cstrs :cfggen_ctx -> cfggen_bin -> cfggen_bin list =
    fun ctx bin ->
      if GRAPH.hasnode ctx.bins bin = false then [] else
      let conn = GRAPH.group ctx.bins bin in
      let cstrs = SET.filter conn (fun bin2 -> match bin2 with
          | SMBIneq(_) -> true
          | SMBCoverTime(_) -> true
          | _ -> false

        ) 
      in
      cstrs

  let ineq_expr : cfggen_ctx -> hwcompinst -> map_op  -> map_expr -> bool =
    fun ctx inst op expr ->
      let bin = SMBMapExpr(inst,expr) in
      let cstrs = get_cstrs ctx bin in
      let matched = List.filter (fun q ->
          match q with
          | SMBIneq(_,op2,_) -> op2 = op
          | _ -> false
        ) cstrs
      in
      List.length matched > 0
      (*
      let conn = GRAPH.connected ctx.bins bin in
      let cstrs = MAP.ifget ctx.cstrs inst in
      match cstrs with
      | Some(cstrlst) ->
        let matches = List.filter (fun cstr ->
            match cstr with
            | SCVarIneq(c_op,c_var) ->
              c_op == op && equal_var_and_expr ctx inst c_var expr
            | SCExprIneq(c_op,c_expr) ->
              c_op == op && equal_exprs ctx inst expr c_expr
            | _ -> false
          ) cstrlst
        in
        List.length matches > 0
      | None -> false
      *)

  let ineq_var : cfggen_ctx -> hwcompinst -> map_op  -> map_var-> bool =
    fun ctx inst op vr ->
      let cstrs = MAP.ifget ctx.cstrs inst in
      let bin = SMBMapVar(inst,vr) in
      let cstrs = get_cstrs ctx bin in
      let matched = List.filter (fun q ->
          match q with
          | SMBIneq(_,op2,_) -> op2 = op
          | _ -> false
        ) cstrs
      in
      List.length matched > 0
      (*
      match cstrs with
      | Some(cstrlst) ->
        let matches = List.filter (fun cstr ->
            match cstr with
            | SCVarIneq(c_op,c_var) ->
              let op_eq = (c_op = op) in
              let expr_eq = equal_vars ctx inst vr c_var in
              begin
                op_eq && expr_eq
              end

            | SCExprIneq(c_op,c_expr) ->
              c_op = op && equal_var_and_expr ctx inst vr c_expr 
            | _ -> false
          ) cstrlst
        in
        List.length matches > 0
      | None -> false
      *)

  let connect_bins : cfggen_ctx -> cfggen_bin -> cfggen_bin -> unit =
    fun ctx bin1 bin2 ->
      make_bin ctx bin1;
      make_bin ctx bin2;
      GRAPH.mkedge ctx.bins bin1 bin2 ();
      ()

  let merge_bins : cfggen_ctx -> cfggen_bin -> cfggen_bin -> unit =
    fun ctx bin1 bin2 ->
      GRAPH.merge ctx.bins bin1 bin2;
      ()

  let export_bin :cfggen_ctx -> cfggen_bin -> bool -> unit =
    fun ctx e v ->
      MAP.put ctx.export e v;
      ()

  let export_edge :cfggen_ctx -> cfggen_bin -> cfggen_bin -> bool -> unit =
    fun ctx e1 e2 v ->
      MAP.put ctx.export_eq (e1,e2) v;
      MAP.put ctx.export_eq (e2,e1) v;
      ()


  let is_edge_exported: cfggen_ctx -> cfggen_bin -> cfggen_bin -> bool =
    fun ctx e1 e2 ->
     let export =  if MAP.has ctx.export_eq (e1,e2)
       then MAP.get ctx.export_eq (e1,e2)
       else true
     in
     (*Printf.printf "export (%s,%s) -> %b\n"
       (string_of_bin e1)
       (string_of_bin e2)
       export;*)
     export


  let is_node_exported: cfggen_ctx -> cfggen_bin -> bool=
    fun ctx bin ->
      let export =
        if MAP.has ctx.export bin then MAP.get ctx.export bin else true
      in
      (*Printf.printf "export (%s) -> %b\n"
        (string_of_bin bin)
        export;*)
      export

end

type mapslvr_opt =
  | SMOMinTC
  | SMOMaxTC
  | SMONone

type mapslvr_bin =
  | SMVMapExpr of map_expr
  | SMVMapVar of int
  | SMVOp of map_op*map_expr
  | SMVCoverTime of number option*number option
  | SMVTimeConstant

type mapslvr_st =
  | SMVCover of int*int*map_range*map_range
                
type mapslvr_ctx = {
  varmap: (string,int) map;
  xidmap: (int,cfggen_mapvar list) map;
  export: (mapslvr_bin,bool) map;
  export_eq: (mapslvr_bin*mapslvr_bin,bool) map;

  mutable bins: (mapslvr_bin,unit) graph;
  sts: mapslvr_st set;
  mutable success: bool;
}

module SMapSlvrOpts =
struct

  let vmax = 1e20;;
  let vmin = 0. -. vmax;;

end

module SMapSlvrCtx =
struct
  let string_of_bin step = match step with
    | SMVMapExpr(me) -> "me."^(SMapExpr.to_string me)
    | SMVMapVar(mv) -> "mv."^(string_of_int mv)
    | SMVOp(op,e) -> (SMapCstr.string_of_op op)^"."^(SMapExpr.to_string e)
    | SMVCoverTime(n,m) -> "ct."^
                           (OPTION.tostr n string_of_number)^
                           (OPTION.tostr m string_of_number)
    | SMVTimeConstant -> "tc"
    (*
    | SMVIC(e,n) -> "ic."^(SMapExpr.to_string e)^"."^(string_of_number n)
    | SMVNumber(n) -> "mn."^(string_of_number n)
    *)

  let mk_ctx () = {
    varmap = MAP.make();
    xidmap= MAP.make();
    bins = GRAPH.make (fun a b -> a=b) 
        (fun step -> string_of_bin step)
        (fun () -> "");
    export=MAP.make();
    export_eq=MAP.make();
    sts = SET.make_dflt();
    success = true;
  }


  let export_bin :mapslvr_ctx -> mapslvr_bin -> bool -> unit =
    fun ctx e v ->
      MAP.put ctx.export e v;
      ()

  let export_edge :mapslvr_ctx -> mapslvr_bin -> mapslvr_bin -> bool -> unit =
    fun ctx e1 e2 v ->
      MAP.put ctx.export_eq (e1,e2) v;
      MAP.put ctx.export_eq (e2,e1) v;
      ()

  let is_edge_exported: mapslvr_ctx -> mapslvr_bin -> mapslvr_bin -> bool =
    fun ctx e1 e2 ->
     let export =  if MAP.has ctx.export_eq (e1,e2)
       then MAP.get ctx.export_eq (e1,e2)
       else true
     in
     (*Printf.printf "export (%s,%s) -> %b\n"
       (string_of_bin e1)
       (string_of_bin e2)
       export;*)
     export


  let is_node_exported: mapslvr_ctx -> mapslvr_bin -> bool=
    fun ctx bin ->
      let export =
        if MAP.has ctx.export bin then MAP.get ctx.export bin else true
      in
      (*Printf.printf "export (%s) -> %b\n"
        (string_of_bin bin)
        export;*)
      export

end

