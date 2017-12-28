open HWData;;
open HWLib;;
open Util;;
open SolverData;;


open SMapData;;
open SMapHwSpecGen;;
open SMapSolverData;;
open SMapHwConfigGen;;
open SMapSolver;;

open Z3Lib;;
exception SMapMain_error of string

module SMapMain = struct

  (*
  let mkctx () =
    {comps=MAP.make()}
  *)

  (**)
  let _ctx = REF.mk None;;

  let _mkctx : hwvid hwenv -> (hwcompname,ucomp) map ->  map_hw_spec =
    fun hwenv cmptbl ->
      let env = {comps=MAP.make()} in
      MAP.iter cmptbl (fun name comp ->
          print ("> MAKE "^(HwLib.hwcompname2str name)^"\n");
          let hwcomp = comp.d in
          let mapcomp : map_comp = 
            SMapHwSpecGen.build_comp hwenv hwcomp
          in
          MAP.put env.comps name mapcomp;
          () 
        );
      REF.upd _ctx (fun _ -> Some env);
      env

  (*do not make duplicates*)
  let mkctx : hwvid hwenv -> (hwcompname,ucomp) map ->  map_hw_spec =
    fun hwenv tbl ->
      match REF.dr _ctx with
      | Some(ctx) -> ctx
      | None -> _mkctx hwenv tbl

  (*build a macro-component from building blocks.*)
  let infer : (gltbl) -> mapslvr_opt -> (wireid,linear_transform) map option=
    fun tbl optimize ->
      let problem_opt = SMapHwConfigGen.build_config tbl.map_ctx tbl in
      match problem_opt with
      | Some(problem) ->
        let mappings : 'a option = SMapSolver.compute_transform tbl problem 60 optimize in
        mappings
      | None -> None

  let infer_feasible : gltbl -> bool =
    fun tbl ->
      let prob_opt = SMapHwConfigGen.build_config tbl.map_ctx tbl in
      let timeout = Globals.get_glbl_int "map-infer-feasible-timeout" in
      match prob_opt with
      | Some(prob) ->
        begin
          let is_sat = SMapSolver.compute_transform_exists tbl prob timeout in
          is_sat
        end

      | None -> false

  let infer_has_mapping : gltbl -> bool =
    fun tbl ->
      let prob_opt = SMapHwConfigGen.build_config tbl.map_ctx tbl in
      let timeout = Globals.get_glbl_int "map-infer-solution-timeout" in
      match prob_opt with
      | Some(prob) ->
        begin
          let is_sat = SMapSolver.compute_transform_exists tbl prob timeout in
          is_sat
        end

      | None -> false


end
