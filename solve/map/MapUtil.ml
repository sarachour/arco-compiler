open Util
open Interactive;;
open MapData;;
open IntervalData;;
open HWData;;
open HWLib;;

exception MapUtilError of string

let error n m = raise (MapUtilError (n^":"^m))

let debug = print_debug 2 "eqn"



module MapUtil = struct

  let string_of_mapping (map:hw_mapping) =
    (string_of_num_interval map.mrng)^"->"^
    (string_of_float map.scale)^"@"^"+"^(string_of_float map.offset)^"->"^
    (string_of_num_interval map.hrng)

  let string_of_mappings (maps:(wireid,hw_mapping) map) =
    MAP.str maps HwLib.wireid2str string_of_mapping
end
