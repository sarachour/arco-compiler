open AST
open Unit
open Util

type mid = string

type mrel = State of (mid ast)*float | Function of (mid ast) | None

type mv_kind = Input | Output | Param of float

type mv_ensure =
  | MMagEns of float*float
  | MErrEns of (mid ast)

type mv_assume =
  | MMagAsm of float*float
  | MErrAsm of (mid ast)

type mvar = {
  name: mid;
  kind: mv_kind;
  ens: mv_ensure list;
  asm: mv_assume list;
  rel: mrel;
  typ: unt;
}

type menv = {
  mutable vars : (mid, mvar) map;
  mutable units: unt_env;
}


module MathLib:
sig
  val create_env : unit -> menv

end =
struct
  let create_env () : menv =
    {vars=make_map 10; units=UnitLib.create_env()}

end
