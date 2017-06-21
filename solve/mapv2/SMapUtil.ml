open Util
open Interactive;;
open SMapData;;
open HWData;;
open HWLib;;

exception MapUtilError of string

let error n m = raise (MapUtilError (n^":"^m))

let debug = print_debug 2 "eqn"



module SMapUtil = struct

  let string_of_map_range : map_range -> string =
    fun range ->
      "["^(string_of_number range.min)^","^(string_of_number range.max)^"]"

  let string_of_mapping : linear_transform -> string =
    fun trans ->
      (string_of_float trans.scale)^"@"^"+"^(string_of_float trans.offset)^"->"

  let string_of_mappings (maps:(wireid,linear_transform) map) =
    MAP.str maps HwLib.wireid2str string_of_mapping
end
