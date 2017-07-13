open ScipyOptimizeData;;


exception ScipyOptimizeLib_error of string
module ScipyOptimizeLib =
struct


  let exec : string -> sciopt_st list -> int -> sciopt_result =
    fun suffix sts timeout ->
      raise (ScipyOptimizeLib_error "unimpl")

end
