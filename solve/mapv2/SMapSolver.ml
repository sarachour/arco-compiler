open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;


exception SMapSolver_error of string

module SMapSolver =
struct


  let compute_transform : gltbl -> map_hw_config -> int ->
    (wireid, linear_transform) map option=
    fun tbl config compute_time ->
      raise (SMapSolver_error "unimpl")

  let compute_transform_exists : gltbl -> map_hw_config -> int -> bool =
    fun tbl config compute_time ->
      match compute_transform tbl config compute_time with
      | Some(_) -> true
      | _ -> false

end
