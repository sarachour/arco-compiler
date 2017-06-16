open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;


exception SMapHwConfigGen_error of string

module SMapHwConfigGen =
struct


  let build_config : map_hw_spec -> gltbl -> bool -> map_hw_config option =
    fun henv comp ->
      raise (SMapHwConfigGen_error "unimpl")

end
