open AST
open Unit
open Util

exception MathException of string

let error n s = raise (MathException (n^": "^s))
type mid = string

type mrel = MState of (mid ast)*float | MFunction of (mid ast) | MNothing

type mkind = Time | Input | Output | Local | Param of float

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
  mutable time : mid option;
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
    {vars=MAP.make(); time=None; units=UnitLib.mkenv()}

  let kind2str (k:mkind) : string = match k with
    | Input -> "input"
    | Output -> "output"
    | Local -> "local"
    | Param(v) -> "param ("^(string_of_float v)^")"
    | Time -> "time"

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

  let getvar e name =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      MAP.get (e.vars) name

  let getunit e name =
    let n = getvar e name in
    match n.typ with
    | (k,u) -> u


  let mkvar e name knd un : menv =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      begin
      if knd = Time then
        e.time <- Some(name);
      if UnitTypeChecker.valid (e.units) un then
        let v = {name=name; ens=(SET.make refl); asm=(SET.make refl); rel=MNothing; typ=(knd,un)} in
        let _ = e.vars <- MAP.put (e.vars) name v in
        e
      else
        error "mkvar" "type is invalid"
      end
  let mkstrel e name rhs ic =
    if MAP.has (e.vars) name = false then
      error "mkstrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MNothing then
        error "mkstrel" ("variable "^name^" already has relation defined.")
      else
        let get_type x = getunit e x in
        match e.time with
        | Some(tv) ->
          let tl = UnitTypeChecker.typeof (Deriv(Term(name),Term(tv))) get_type in
          let tr = UnitTypeChecker.typeof rhs get_type in
          if UnitTypeChecker.typecheck tl tr then
            let _ = dat.rel <- MState(rhs,ic) in
            e
          else
            error "mkstrel" ("variable "^name^" doesn't type check with expression: "^
              (UnitLib.unit2str (UExpr tl))^" =? "^(UnitLib.unit2str (UExpr tr)))
        | None ->
          error "mkstrel"  "time variable not defined anywhere."


  let mkrel e name rhs : menv =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MNothing then
        error "mkrel" ("variable "^name^" already has relation defined.")
      else
        let get_type x = getunit e x in
        let tl = UnitTypeChecker.typeof (Term(name)) get_type in
        let tr = UnitTypeChecker.typeof rhs get_type in
        if UnitTypeChecker.typecheck tl tr then
          let _ = dat.rel <- MFunction(rhs) in
          e
        else
          error "mkrel"  ("variable "^name^" doesn't type check with expression: "^
            (UnitLib.unit2str (UExpr tl))^" =? "^(UnitLib.unit2str (UExpr tr)))
end
