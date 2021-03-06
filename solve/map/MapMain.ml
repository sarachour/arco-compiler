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
open MapCircGen
open MapSpec


exception MapMainError of string

let error n m  : unit= raise (MapMainError (n^":"^m))


module MapMain = struct

  (*
  let mkctx () =
    {comps=MAP.make()}
  *)

  (**)
  let _ctx = REF.mk None;;

  let mkctx hwenv (tbl:(hwcompname,ucomp) map) : 'a map_ctx =
    let env = {comps=MAP.make()} in
    MAP.iter tbl (fun name comp ->
        print ("> MAKE "^(HwLib.hwcompname2str name)^"\n");
        let hwcomp = comp.d in
        let stmts :
          (((string,number) map)*(map_stmt list)) list =
          MapCompSpecGenerator.derive_mapping_comp hwenv hwcomp
        in
        let cfgs =
          List.fold_right (fun (pars,stmts) lst ->
              let cmp : 'a map_comp option =
                MapCompSpecCompressor.compress hwcomp.name stmts
              in
              match cmp with
              | Some(c) -> c::lst
              | None -> lst
            ) stmts []
        in
        (*update the ids*)
        let cfg_map : (int,map_port map_comp) map = MAP.make () in
        List.iteri (fun (idx:int) (cfg:'a map_comp) ->
            begin
              cfg.id <- idx;
              noop (MAP.put cfg_map idx cfg)
            end
          ) cfgs;
        noop (MAP.put env.comps
                (HwLib.hwcompname2str name) {spec=cfg_map; name=name});
        () 
      );
    print_string (MapSpec.string_of_map_ctx env
                    MapSpec.string_of_map_port);
    REF.upd _ctx (fun _ -> Some env);
    env

  (*do not make duplicates*)
  let mkctx hwenv tbl =
    match REF.dr _ctx with
    | Some(ctx) -> ctx
    | None -> mkctx hwenv tbl

  (*build a macro-component from building blocks.*)
  let infer (tbl:gltbl) : (wireid,hw_mapping) map option=
    let prob_opt = MapCircGen.build_prob tbl.map_ctx tbl false in
    match prob_opt with
    | Some(prob) ->
      let mappings : 'a option = MapSolver.mappings tbl prob 60 in
      mappings
    | None -> None

  let infer_feasible (tbl:gltbl)
    : bool =
    let prob_opt = MapCircGen.build_prob tbl.map_ctx tbl true in
    let timeout = Globals.get_glbl_int "map-infer-feasible-timeout" in
    match prob_opt with
    | Some(prob) ->
      begin
        let is_sat = MapSolver.sat tbl prob timeout in
        if is_sat then print "SAT\n" else print "UNSAT\n";
        is_sat
      end
      
    | None -> false



  let infer_best (tbl:gltbl) : (wireid,hw_mapping) map option =
    let prob_opt = MapCircGen.build_prob tbl.map_ctx tbl false in
    match prob_opt with
    | Some(prob) ->
      let mappings = MapSolver.mappings tbl prob 120 in
      mappings
    | None -> None



end
