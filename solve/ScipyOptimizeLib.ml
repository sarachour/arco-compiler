open ScipyOptimizeData;;


exception ScipyOptimizeLib_error of string
module ScipyOptimizeLib =
struct


  let exec : sciopt_st list -> sciopt_result =
    raise (ScipyOptimizeLib_error "unimpl")

end
