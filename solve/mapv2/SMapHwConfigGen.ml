open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;
open MathData;;
open MathLib;;

open IntervalData;;
open AST;;

exception SMapHwConfigGen_error of string

module SMapHwConfigGen =
struct

  
  type cfggen_bin =
    | SMBMapExpr of map_expr
    | SMBValue of number
    | SMBMapVar of hwcompinst*map_var

  type cfggen_ctx = {
    insts : (hwcompinst, map_comp_ctx) map;
    results : (wireid, map_result) map;
    bins : (unit,cfggen_bin) graph;
  }

  let bind_val_to_wire: cfggen_ctx -> map_loc_val -> wireid -> unit=
    fun ctx v wire ->
      let cmp : map_comp_ctx = MAP.get ctx.insts wire.comp in
      MAP.put cmp.ports wire.port v;
      ()

  let bind_val_to_wire_collection: cfggen_ctx -> map_loc_val -> wire_coll -> unit =
    fun ctx v wires ->
        match wires with
        | WCollOne(wid) -> bind_val_to_wire ctx v wid
        | WCollMany(wlist) -> List.iter (fun wid -> bind_val_to_wire ctx v wid) wlist
        | WCollEmpty -> ()

  let bind_labels_to_wires : cfggen_ctx -> (string,mid) labels->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (mid ast -> interval -> map_loc_val) -> 
    (number -> map_loc_val) =
    fun ctx lbls inpfxn outfxn localfxn exprfxn numfxn ->
      begin
        (*bind values*)
        raise (SMapHwConfigGen_error "find the function for getting var intervals");
        MAP.iter lbls.outs (fun name wire_coll ->
            let ival : interval = MathLib.get_interval menv name in
            bind_val_to_wire_collection ctx (outfxn name ival)
          );
        MAP.iter lbls.inps (fun name wire_coll ->
            let ival : interval = MathLib.get_interval menv name in
            bind_val_to_wire_collection ctx (infxn name ival)
          );
        MAP.iter lbls.locals (fun name wire_coll ->
            let ival : interval = MathLib.get_interval menv name in
            bind_val_to_wire_collection ctx (localfxn ival)
          );
        MAP.iter lbls.exprs (fun (expr:mid ast) (wire_coll) ->
            let ival : interval = MathLib.get_interval menv expr in
            bind_val_to_wire_collection ctx (exprfxn ival)
          );
        MAP.iter lbls.vals (fun (num:number) (wire_coll) ->
            (*TODO: if input number then transformable. Otherwise not. *)
            bind_val_to_wire_collection ctx (numfxn ival)
          );
        ()
      end


  let connect_bins : t -> t_bin -> t_bin =
    fun ctx bin1 bin2 ->
      GRAPH.connect ctx.bins bin1 bin2

  let evaluate : mapcfggen_ccomp -> map_hw_spec -> string -> string =
    fun mapcompcfg mapspec comp port ->
      let mapcomp : map_comp = MapHwSpec.get_port mapcompcfg comp port in
      raise (SMapHwConfigGen_error "unimpl")

  let build_config : map_hw_spec -> gltbl ->  map_hw_config option =
    fun tblspec tbl ->
      let ctx = {insts = MAP.make(); bins=(unit,map_var) graph} in
      let sln : (string,mid) sln = tbl.sln in
      
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let data : t_cfg =
            {ports = MAP.make(); params = MAP.make; result=None} in
          MAP.put inst data;
          ()
        );
      (*map routes*)
      bind_labels_to_wires ctx sln.route
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun expr interval -> MVSymbol(interval) )
        (fun number -> MVNumber(number) )
      ;
      (*map generates*)
      bind_labels_to_wires ctx sln.generate
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun (port:string) (interval:interval) -> MVSymbol(interval) )
        (fun expr interval -> MVSymbol(interval) )
        (fun number -> MVNumber(number) )
      ;
      (*Add connections *)
      MAP.iter sln.conns.src2dest (fun (src:wireid) (dests:wireid set) ->
          SET.iter dests (fun (dest:wireid) ->
              connect_bins ctx
                (SMBMapVar(src.comp,MVScale(src.port)))
                (SMBMapVar(dest.comp,MVScale(dest.port)));
              connect_bins ctx
                (SMBMapVar(src.comp,MVOffset(src.port)))
                (SMBMapVar(src.comp,MVOffset(src.port)));
           )
      );
      (*evaluate components to get results*)
      MAP.iter ctx.insts (fun (inst:hwcompinst) (inst_data:mapcfggen_comp) ->
          MAP.iter inst_data.ports (fun (port:string) (port_data:mapcfggen_port) ->
              let result : map_result = evaluate inst_data tblspec inst.name port in
              let wire = {comp=inst; port=port} in
              MAP.put wire result
              ()
            )
        );
      raise (SMapHwConfigGen_error "unimpl: connect constraints. This should remove all equivalence constraints and stick them in the graph.");
      raise (SMapHwConfigGen_error "unimpl: get final equivalences. An equivalence with the number should replace that variable with a number. ");
      raise (SMapHwConfigGen_error "rewrite map expressions to use bin variable number");
      raise (SMapHwConfigGen_error "perform term rewriting.");
      raise (SMapHwConfigGen_error "emit problem");
      ()

      

end
