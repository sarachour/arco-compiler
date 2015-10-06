open AST
open Unit
open Util

exception MathException of string

let error n s = raise (MathException (n^": "^s))
type mid = string

type mrel = State of (mid ast)*float | Function of (mid ast) | None

type mkind = Input | Output | Local | Param of float

type mv_ensure =
  | MMagEns of float*float
  | MErrEns of (mid ast)

type mv_assume =
  | MMagAsm of float*float
  | MErrAsm of (mid ast)

type mtype = mkind*unt

type mvar = {
  name: mid;
  mutable ens: mv_ensure set;
  mutable asm: mv_assume set;
  mutable rel: mrel option;
  typ: mtype;
}

type menv = {
  mutable vars : (mid, mvar) map;
  mutable units: unt_env;
}


module MathLib:
sig
  val mkenv : unit -> menv
  val print : menv -> unit
  val mkvar : menv -> mid -> mkind -> unt -> menv
end =
struct
  let refl x y = (x = y)
  let mkenv () : menv =
    {vars=MAP.make(); units=UnitLib.mkenv()}

  let kind2str (k:mkind) : string = match k with
    | Input -> "input"
    | Output -> "output"
    | Local -> "local"
    | Param(v) -> "param ("^(string_of_float v)^")"

  let typ2str (v:mtype) : string = match v with
    |(k,u) -> (kind2str k)^":"^(UnitLib.unit2str u)

  let print_var (v:mvar) : unit=
    Printf.printf "%s of %s\n" (v.name) (typ2str v.typ)


  let print m =
   Printf.printf "==== Units ====\n";
   UnitLib.print (m.units);
   Printf.printf "==== Vars =====\n";
   MAP.iter (m.vars) (fun k v -> print_var v)

  let mkvar e name knd un =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      let v = {name=name; ens=(SET.make refl); asm=(SET.make refl); rel=None; typ=(knd,un)} in
      e.vars <- MAP.put (e.vars) name v;
      e
end
