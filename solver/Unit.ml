open AST
open Util

exception UnitException of string

let error n s = raise (UnitException (n^": "^s))
type untid = string

type unt =
  | UNone
  | UVar
  | UExpr of untid ast



type unt_conv = untid*float

type unit_node =
  | Node of untid*(unit_node ref) list

type unt_env = {
  mutable units : untid set;
  mutable graph: (untid,float) graph;
}

module UnitLib :
sig
  val mkenv : unit -> unt_env
  val define : unt_env -> string -> unt_env
  val mkrule : unt_env -> string -> float -> string ->float -> unt_env
  val print : unt_env -> unit
  val unit2str : unt -> string
end =

struct

  let mkenv () =
    let node2str x = x in
    let val2str v = string_of_float v in
    let cmpval v1 v2 = true in
    {units=SET.make (fun x y -> x = y); graph=(GRAPH.make cmpval node2str val2str)}

  let print e =
    let print_elem src snk flt  =
      Printf.printf "%s -> %s: %f\n" src snk  flt
    in
    SET.iter e.units (fun x -> Printf.printf "type %s\n" x);
    GRAPH.iter e.graph print_elem

  let unit2str u =
    match u with
    | UExpr(u) -> ASTLib.ast2str u (fun x -> x)
    | UNone -> "_"
    | UVar  -> "*"

  let mkrule (e:unt_env) (u1:untid) (n1:float) (u2:untid) (n2:float) =
    let _ = GRAPH.mkedge (e.graph) u1 u2 (n2/.n1) in
    let _ = GRAPH.mkedge (e.graph) u2 u1 (n1/.n2) in
    e

  let define e name =
    let _ = GRAPH.mknode (e.graph) name in
    e
end

module UnitTypeChecker =
struct
  let typecheck (e1: untid ast) (e2:untid ast) : bool=
    let cnv x = x in
    let todecl x = SymbolVar(x) in
    let res = ASTLib.eq e1 e2 cnv todecl in
    res

  let typeof (expr:'b ast) (lookup : 'b -> unt) : untid ast =
    let tostr (v: untid ast) : string = ASTLib.ast2str v (fun x -> x) in
    let get_expr (v: 'b) : untid ast =
    let t = lookup v in
      match t with
      | UNone -> Integer(1)
      | UVar -> error "typechecker.typeof" "cannot have variant types."
      | UExpr(e) -> e
    in
    let tclist lst : untid ast =
      let tc x r = if typecheck x r then r else
        error "typerror" ("term "^(tostr x)^" does not match type "^(tostr r))
      in
      match lst with
      | h::t -> List.fold_right tc t h
      | [] -> Integer(1)
    in
    let conv (v:untid ast) : (untid ast) option =
      match v with
      | Term(Deriv(name,t)) -> let num = get_expr name and den = get_expr t in
        Some (Op2(Div,num,den))
      | Term(Literal(name)) -> let ty = get_expr name in
        Some ty
      | OpN(Add, lst) -> Some(tclist lst)
      | OpN(Sub,lst) -> Some(tclist lst)
      | _ -> None
    in
    ASTLib.trans expr conv



end
