open AST
open Util

exception UnitException of string

let error n s = raise (UnitException (n^": "^s))
type untid = string

type unt =
  | USimple of untid
  | UNone
  | UExpr of untid ast



type unt_conv = untid*float

type unt_env = {
  mutable units : untid set;
  mutable conv : (untid, unt_conv set) map;
}

module UnitLib :
sig
  val mkenv : unit -> unt_env
  val define : unt_env -> string -> unt_env
  val add_rule : unt_env -> string -> float -> string ->float -> unt_env
  val print : unt_env -> unit
end =

struct
  let mkenv () =
    {units=SET.make (fun x y -> x = y); conv=MAP.make()}

  let print e =
    let print_deps s  =
      SET.iter s (fun (x,v) -> Printf.printf "%f %s, " v x );
      Printf.printf "\n"
    in
    SET.iter e.units (fun x -> Printf.printf "type %s\n" x);
    MAP.iter e.conv (fun x d -> Printf.printf "%s: " x; (print_deps d))
  let add_rule (e:unt_env) (u1:untid) (n1:float) (u2:untid) (n2:float) =
    if MAP.has (e.conv) u1 = false then
      error "add_rule" ("no type "^u1^" exists in type table.");
    if MAP.has (e.conv) u2 = false then
      error "add_rule" ("no type "^u2^" exists in type table.");
    MAP.upd (e.conv) (fun x -> SET.add x (u2,n2/.n1)) u1;
    MAP.upd (e.conv) (fun x -> SET.add x (u1,n1/.n2)) u2;
    e

  let define e name =
    let cmp_conv x y = match (x,y) with
      | ((n1,_),(n2,_)) -> n1 = n2
    in
    if SET.has e.units name then
      error "define_unit" ("unit with name "^name^" already exists.")
    else
      e.units <- SET.add e.units name;
      MAP.put (e.conv) name (SET.make cmp_conv);
      e
end
