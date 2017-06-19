open HWData;;
open HWLib;;
open Util;;
open SolverData;;
open MathData;;
open MathLib;;


open IntervalData;;
open AST;;

open SMapData;;
open SMapIntervalCompute;;
open SMapHwSpecGen;;

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
    bins : (cfggen_bin,unit) graph;
  }

  let string_of_bin (b:cfggen_bin) = match b with
    | SMBMapExpr(e) -> SMapExpr.to_string e
    | SMBValue(n) -> string_of_number n
    | SMBMapVar(inst,v) ->
      (HwLib.hwcompinst2str inst)^"."^
      (SMapVar.to_string v)

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

  let bind_labels_to_wires : gltbl -> cfggen_ctx -> (string,mid) labels->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (string->interval->map_loc_val) ->
    (mid ast -> interval -> map_loc_val) -> 
    (number -> map_loc_val) -> unit =
    fun gltbl ctx lbls infxn outfxn localfxn exprfxn numfxn ->
      begin
        (*bind values*)
        let interval_of_expr : mid ast -> interval =
          fun expr ->
            SMapIntervalCompute.compute_mexpr_interval gltbl expr
        in
        let interval_of_var : mkind -> string -> interval =
          fun knd name ->
            interval_of_expr (Term(MNVar(MOutput, name)))  
        in
        MAP.iter lbls.outs (fun name wire_coll ->
            let ival : interval = interval_of_var MOutput name in
            bind_val_to_wire_collection ctx (outfxn name ival)  wire_coll
          );
        MAP.iter lbls.ins (fun name wire_coll ->
            let ival : interval = interval_of_var MInput name in
            bind_val_to_wire_collection ctx (infxn name ival) wire_coll
          );
        MAP.iter lbls.locals (fun name wire_coll ->
            let ival : interval = interval_of_var MLocal name in
            bind_val_to_wire_collection ctx (localfxn name ival)  wire_coll
          );
        MAP.iter lbls.exprs (fun (expr:mid ast) (wire_coll) ->
            let ival : interval = interval_of_expr expr in
            bind_val_to_wire_collection ctx (exprfxn expr ival)  wire_coll
          );
        MAP.iter lbls.vals (fun (num:number) (wire_coll) ->
            (*TODO: if input number then transformable. Otherwise not. *)
            bind_val_to_wire_collection ctx (numfxn num)  wire_coll
          );
        ()
      end


  let connect_bins : cfggen_ctx -> cfggen_bin -> cfggen_bin -> unit =
    fun ctx bin1 bin2 ->
      GRAPH.mkedge ctx.bins bin1 bin2 ();
      ()

  let evaluate : map_comp_ctx -> map_hw_spec -> hwcompname -> string -> map_result =
    fun comp_ctx mapspec comp port ->
      let cstr_generator : map_cstr_gen =
        SMapHwSpec.get_port mapspec comp port
      in
      let cstr_gen_params : map_params =
        {allow_reflow = false}
      in
      let result : map_result =
        SMapHwSpec.evaluate comp_ctx cstr_gen_params  cstr_generator 
      in
      result

  let build_config : map_hw_spec -> gltbl ->  map_hw_config option =
    fun tblspec tbl ->
      let ctx = {insts = MAP.make();
                 bins=GRAPH.make
                     (fun a b -> a = b)
                     (fun bin -> string_of_bin bin)
                     (fun () -> "");
                 results = MAP.make();
                }
      in
      let sln : (string,mid) sln = tbl.sln_ctx in
      
      SET.iter sln.comps (fun (inst:hwcompinst) ->
          let data : map_comp_ctx =
            {ports = MAP.make(); params = MAP.make()}
          in
          MAP.put ctx.insts inst data;
          ()
        );
      (*map routes*)
      bind_labels_to_wires tbl ctx sln.route
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun expr interval -> SVSymbol(interval) )
        (fun number -> SVNumber(number) )
      ;
      (*map generates*)
      bind_labels_to_wires tbl ctx sln.generate
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun (port:string) (interval:interval) -> SVSymbol(interval) )
        (fun expr interval -> SVSymbol(interval) )
        (fun number -> SVNumber(number) )
      ;
      (*Add connections *)
      MAP.iter sln.conns.src2dest (fun (src:wireid) (dests:wireid set) ->
          SET.iter dests (fun (dest:wireid) ->
              connect_bins ctx
                (SMBMapVar(src.comp,SMScale(src.port)))
                (SMBMapVar(dest.comp,SMScale(dest.port)));
              connect_bins ctx
                (SMBMapVar(src.comp,SMOffset(src.port)))
                (SMBMapVar(src.comp,SMOffset(src.port)));
           )
      );
      (*evaluate components to get results*)
      MAP.iter ctx.insts (fun (inst:hwcompinst) (inst_data:map_comp_ctx) ->
          MAP.iter inst_data.ports (fun (port:string) (port_data:map_loc_val) ->
              let result : map_result =
                evaluate inst_data tblspec inst.name port
              in
              let wire :wireid = {comp=inst; port=port} in
              MAP.put ctx.results wire result;
              ()
            )
        );
      raise (SMapHwConfigGen_error "unimpl: connect constraints. This should remove all equivalence constraints and stick them in the graph.");
      raise (SMapHwConfigGen_error "unimpl: get final equivalences. An equivalence with the number should replace that variable with a number. ");
      raise (SMapHwConfigGen_error "rewrite map expressions to use bin variable number");
      raise (SMapHwConfigGen_error "perform term rewriting.");
      raise (SMapHwConfigGen_error "emit problem");
      None

      

end
