open HWData;;
open HWLib;;
open SMapData;;
open Util;;
open SolverData;;


exception SMapHwSpecGen_error of string
module SMapHwSpecGen =
struct


  let build_comp : hwvid hwenv -> hwvid hwcomp -> map_comp =
    fun henv comp ->
      raise (SMapHwSpecGen_error "unimpl")

end
