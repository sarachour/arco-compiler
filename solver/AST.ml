open SymCamlData

type 'a ast_term =
  | Literal of 'a
  | Deriv of ('a*'a)


type ast_opn =
  | Mult
  | Add
  | Sub

type ast_op2 =
  | Power
  | Div

type ast_op1 =
  | Exp
  | Neg

type 'a ast =
  | Term of 'a ast_term
  | OpN of ast_opn*(('a ast) list)
  | Op2 of ast_op2*(('a ast)*('a ast))
  | Op1 of ast_op1*(('a ast))
  | Decimal of float
  | Integer of int


exception ASTException of (string)
let error n msg = raise (ASTException(n^": "^msg))

module ASTLib : sig
    val ast2str : ('a ast) -> ('a -> string) -> string
    val map : ('a ast) -> ('a -> 'b) -> ('b ast)
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
end =
struct

    let rec ast2str a fn : string =
      let list2str lst delim =
        match lst with
        | h::h2::t -> List.fold_right (fun x r -> r^delim^(ast2str x fn)) (h2::t) (ast2str h fn)
        | [h] -> ast2str h fn
        | [] -> ""
      in
      let term2str t = match t with
      | Literal(x) -> fn x
      | Deriv(x,v) -> "deriv("^(fn x)^","^(fn v)^")"
      in
      let opn2str t = match t with
      | Mult -> "*"
      | Add -> "+"
      | Sub -> "-"
      in
      let op12str t = match t with
      | Exp -> "exp"
      | Neg -> "-"
      in
      let op22str t = match t with
      | Power -> "^"
      | Div -> "/"
      in
      match a with
      | Term(x) -> term2str x
      | OpN(v,lst) -> list2str lst (opn2str v)
      | Op2(v,(a,b)) -> (ast2str a fn)^(op22str v)^(ast2str b fn)
      | Op1(v,a) -> (op12str v)^"("^(ast2str a fn)^")"
      | Decimal(d) -> string_of_float d
      | Integer(i) -> string_of_int i

    let map n fn  = error "conv" "unimplemented"
    let to_symcaml ast fn : symexpr = error "to_symcaml" "unimplemented"


end
