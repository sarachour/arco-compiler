open Util
open Interactive;;

exception MapUtilError of string

let error n m = raise (MapUtilError (n^":"^m))

let debug = print_debug 2 "eqn"



module MapUtil = struct

  let string_of_mapping map =
    error "string_of_mapping" "dne"
end
