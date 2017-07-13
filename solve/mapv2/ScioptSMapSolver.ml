open SMapData;;
open SMapSolverData;;

open ScipyOptimizeData;;

open HWData;;
open HWLib;;
open MathData;;

open Util;;

exception ScioptSMapSolver_error of string
module ScioptSMapSolver =
struct

  let to_scipy : mapslvr_ctx -> sciopt_st list =
    fun ctx ->
      raise (ScioptSMapSolver_error "unimpl: to_scipy")

  let parse_sln : (string,mid) sln -> map_hw_spec -> (int,cfggen_mapvar list) map
    -> float list -> (wireid, linear_transform) map =
    fun sln mapspec mapper asgns ->
      raise (ScioptSMapSolver_error "unimpl: parse_sln")
end
