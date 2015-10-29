open AST
open Util

exception UnitException of string

let error n s = raise (UnitException (n^": "^s))
type untid = string

type unt =
  | UNone
  | UVariant
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
  val has: unt_env -> untid -> bool
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

  let has e id =
    SET.has e.units id

  let unit2str u =
    match u with
    | UExpr(u) -> ASTLib.ast2str u (fun x -> x)
    | UNone -> "_"
    | UVariant  -> "*"

  let mkrule (e:unt_env) (u1:untid) (n1:float) (u2:untid) (n2:float) =
    let _ = GRAPH.mkedge (e.graph) u1 u2 (n2/.n1) in
    let _ = GRAPH.mkedge (e.graph) u2 u1 (n1/.n2) in
    e

  let define e name =
    let _ = GRAPH.mknode (e.graph) name in
    let _ = SET.add (e.units) name in
    e
end

module UnitTypeChecker =
struct
  let typecheck (e1: untid ast) (e2:untid ast) : bool=
    let cnv x = x in
    let todecl x cnv = SymbolVar(cnv x) in
    let tvar = UnitLib.unit2str UVariant in
    if e1 = Term(tvar) || e2 = Term(tvar)  then true
    else
    let res = ASTLib.eq e1 e2 cnv todecl in
    res

  let valid (type a) (e: unt_env) (expr: unt) : bool =
    match expr with
    | UNone -> true
    | UVariant -> true
    | UExpr(a) ->
      let check x = match x with
        | Term(n) ->
          if UnitLib.has e n then ()
          else error "type error" ("unit "^n^" does not exist in environment.")
        | _ -> ()
      in
      let _ = ASTLib.iter a (fun x -> check x) in
      true

  let typeof (type b) (expr:b ast) (lookup : b -> unt) : untid ast =
    let tostr (v: untid ast) : string = ASTLib.ast2str v (fun x -> x) in
    let tvar = UnitLib.unit2str UVariant in
    let nvar = UnitLib.unit2str UNone in
    let get_expr (v: b) : untid ast =
    let t = lookup v in
      match t with
      | UNone -> Term(nvar)
      | UVariant -> Term(tvar)
      | UExpr(e) -> e
    in
    let tclist lst : untid ast =
      let tc x r = if typecheck x r then r else
        error "typerror" ("term "^(tostr x)^" does not match type "^(tostr r))
      in
      match lst with
      | h::t -> List.fold_right tc t h
      | [] -> error "typeof" "empty list not expected"
    in
    let conv (v:(untid ast)) : (untid ast) option =
      match v with
      | OpN(Add, lst) -> Some(tclist lst)
      | OpN(Sub,lst) -> Some(tclist lst)
      | Deriv(u1,u2) -> Some(Op2(Div,u1,u2))
      | Integer(_) -> Some(Term(tvar))
      | Decimal(_) -> Some(Term(tvar))
      | _ -> None
    in
    let expr : untid ast= ASTLib.expand expr get_expr in
    ASTLib.trans expr conv



end
