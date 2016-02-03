
type symbol = string;;

type term = 
  Decimal of float
  | Integer of int
  | Symbol of symbol 
;;

type expr =
  Deriv of term*symbol*symbol
  | Add of expr list
  | Sub of expr list
  | Mult of expr list
  | Div of expr*expr
  | Exp of expr*term
  | Term of term
;;

(* = = = =, equality expression *)
type relation = expr list 
type assignment = relation -> symbol -> term -> relation

type relations = relation list

module DEQEnv:
sig
  type env = {
    mutable relations : relations;
  }
  val create: unit -> env
  val add: env -> relation -> env
  val term2str: term -> string
  val expr2str: expr -> string
  val rel2str: relation -> string
  val env2str: env -> string
end =
struct
  type env = {
    mutable relations : relations;
  }
  let create() = {relations=[];}

  let add env (r:relation) : env = env.relations <- r::env.relations; env

  let term2str (t:term) : string = 
    match t with
      Decimal(f) -> string_of_float f
    | Integer(i) -> string_of_int i
    | Symbol(s) -> s

  let rec expr2str (e:expr) = 
    let rec exprlist2str lst delim = 
      match lst with
        h::[] -> (expr2str h)
        |h::t -> (expr2str h)^delim^(exprlist2str t delim)
        |[] -> ""
    in
    match e with
      | Deriv(t,dep,indep) -> "d"^dep^"/d"^indep^"("^(term2str t)^")"
      | Add(t) -> exprlist2str t "+"
      | Sub(t) -> exprlist2str t "-"
      | Mult(t) -> exprlist2str t "*"
      | Div(a,b) -> (expr2str a)^"/"^(expr2str b)
      | Exp(base,exp) -> (expr2str base)^"^"^"("^(term2str exp)^")"
      | Term(a) -> term2str(a)

  let rec rel2str (r:relation) = match r with
        h::t::l -> (expr2str h)^"="^(expr2str t)^(rel2str l)
        |h::[] -> (expr2str h)
        |[] -> ""
  

  let env2str (e:env) : string = 
    List.fold_right(fun x y -> y^(rel2str x)^"\n") e.relations ""

end