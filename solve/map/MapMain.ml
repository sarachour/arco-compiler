open HWData
open MapData
open Util
open SolverData
open MapProblemGenerator
open MapResolver

module MapMain = struct

  let mkctx () =
    {comps=MAP.make()}

  (**)
  let mkctx (tbl:(hwcompname,ucomp) map) : map_ctx =
    let env = {comps=MAP.make()} in
    (*create compressed problem for each component*)
    error "MapMain.build"
      "not implemented, construct compressed reprs"

  (*build a macro-component from building blocks.*)
  let infer (tbl:gltbl) : (wireid,hw_mapping) map option=
    error "test_config" "test the configuration."

  let infer_feasible (tbl:gltbl)
    : bool =
    error "infer_feasible" "unimpl"

  let infer_best (tbl:gltbl) : (wireid,hw_mapping) map option =
    error "find_best_config" "test the config."



end

(*
module MapMain = struct


  let infer (tbl:gltbl)  : (wireid,hw_mapping) map option =
    match MapProblemGenerator.generate_problem tbl with
    | Some(stmts) ->
      let sln : (wireid,hw_mapping) map option = MapSMTResolver.solve tbl stmts in
      sln
    | None -> None

  let save_z3_problem (tbl:gltbl) name inst =
    match MapProblemGenerator.generate_problem tbl with
    | Some(stmts) ->
      noop (MapSMTResolver.save_z3_problem tbl stmts name inst) 
    | None ->() 

end
*)
