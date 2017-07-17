open Util;;
open SMapData;;
open HWData;;
open HWLib;;


type cfggen_bin =
    | SMBMapExpr of hwcompinst*map_expr
    | SMBNumber of number
    | SMBTimeConstant
    | SMBMapVar of hwcompinst*map_var

  


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
  cstrs: (wireid, map_cstr list) map;
  bins : (cfggen_bin,unit) graph;
  export: (cfggen_bin,bool) map;
  mutable success: bool;
}
module SMapCfggenCtx =
struct

  let string_of_bin (b:cfggen_bin) = match b with
    | SMBMapExpr(inst,e) -> SMapExpr.to_string e
    | SMBNumber(n) -> string_of_number n
    | SMBTimeConstant -> "tau"
    | SMBMapVar(inst,v) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapVar.to_string v)

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
    success=true;
  }
  let make_bin : cfggen_ctx -> cfggen_bin -> unit =
    fun ctx bin ->
      if GRAPH.hasnode ctx.bins bin= false then
        noop (GRAPH.mknode ctx.bins bin);
      ()

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

end

type mapslvr_bin =
  | SMVMapExpr of map_expr
  | SMVMapVar of int
  | SMVOp of map_op*map_expr*number
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

module SMapSlvrOpts =
struct

  let vmax = 1e6;;
  let vmin = 0. -. vmax;;

end

module SMapSlvrCtx =
struct
  let string_of_bin step = match step with
    | SMVMapExpr(me) -> "me."^(SMapExpr.to_string me)
    | SMVMapVar(mv) -> "mv."^(string_of_int mv)
    | SMVOp(op,e,n) -> (SMapCstr.string_of_op op)^"."^(SMapExpr.to_string e)^"."^(string_of_number n)
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
    sts = SET.make_dflt();
    success = true;
  }


end

