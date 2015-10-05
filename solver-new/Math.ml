open AST
open Unit
open Util

type mid = string

type mrel = State of (mid ast)*float | Function of (mid ast) | None

type mv_kind = Input | Output | Param of float

type mv_ensure =
  | MMagEns of float*float
  | MErrEns of mv_kind*(mid ast)

type mv_assume =
  | MMagAsm of float*float
  | MErrAsm of mv_kind*mid*(mid ast)

type mvar = {
  name: mid;
  kind: mv_kind;
  ens: mv_ensure list;
  asm: mv_assume list;
  rel: mrel;
  typ: unit;
}

type menv = {
  mutable vars : (mid, mvar) map;
  mutable units: unit_env;
}


module MathLib : sig


end =
struct


end
