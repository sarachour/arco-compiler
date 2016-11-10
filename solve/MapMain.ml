open HWData
open MapData
open Util
open SolverData
open MapProblemGenerator
open MapResolver

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
