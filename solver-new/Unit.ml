open AST
open Util

type untid = string

type unt =
  | USimple of untid
  | UNone
  | UExpr of untid ast



type unt_conv = float*untid

type unt_env = {
  units : untid list;
  conv : (unt, unt_conv list) map;
}

module UnitLib :
sig
  val create_env : unit -> unt_env

end =
struct
  let create_env () =
    {units=[]; conv=make_map 10}

end
