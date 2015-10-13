open AST
open Unit
open Util

exception MathException of string

let error n s = raise (MathException (n^": "^s))
type mid = string

type mrel = MState of (mid ast)*float | MFunction of (mid ast) | MNothing

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
  mutable rel: mrel;
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
  val mkstrel : menv -> mid -> mid ast -> float -> menv
  val mkrel : menv -> mid -> mid ast -> menv
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

  let rel2str (v:mrel) : string = match v with
    | MState(r,ic) -> (ASTLib.ast2str r (fun x -> x))^" | ic = "^(string_of_float ic)
    | MFunction(r) -> (ASTLib.ast2str r (fun x -> x))
    | MNothing -> "(none)"

  let typ2str (v:mtype) : string = match v with
    |(k,u) -> (kind2str k)^":"^(UnitLib.unit2str u)

  let print_var (v:mvar) : unit=
    Printf.printf "%s : %s = %s\n" (v.name) (typ2str v.typ) (rel2str v.rel)


  let print m =
   Printf.printf "==== Units ====\n";
   UnitLib.print (m.units);
   Printf.printf "==== Vars =====\n";
   MAP.iter (m.vars) (fun k v -> print_var v)

  let mkvar e name knd un =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      let v = {name=name; ens=(SET.make refl); asm=(SET.make refl); rel=MNothing; typ=(knd,un)} in
      e.vars <- MAP.put (e.vars) name v;
      e

  let mkstrel e name rhs ic =
    if MAP.has (e.vars) name = false then
      error "mkstrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MNothing then
        error "mkstrel" ("variable "^name^" already has relation defined.")
      else
        dat.rel <- MState(rhs,ic);
        e

  let mkrel e name rhs =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MNothing then
        error "mkrel" ("variable "^name^" already has relation defined.")
      else
        dat.rel <- MFunction(rhs);
        e
end
