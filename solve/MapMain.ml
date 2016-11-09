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

end
