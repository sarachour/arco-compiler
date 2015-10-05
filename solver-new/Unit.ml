open AST
open Util

type unit_id = string

type unit =
  | USimple of unit_id
  | UNone
  | UExpr of unit_id ast



type unit_conv = float*unit_id

type unit_env = {
  units : unit_id list;
  conv : (unit, unit_conv list) map;
}

module UnitLib :
sig


end =
struct


end
