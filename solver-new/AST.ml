open SymCamlData

type 'a ast_term =
  | Literal of 'a
  | Decimal of float
  | Integer of int
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
  | Deriv of 'a ast_term

exception ASTException of (string*string)
let error n msg = raise (ASTException(n,msg))

module AST : sig
    val to_string : ('a ast) -> ('a -> string) -> string
    val map : ('a ast) -> ('a -> 'b) -> ('b ast)
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
end =
struct
    let to_string ast fn : string = error "to_string" "unimplemented"
    let map n fn  = error "conv" "unimplemented"
    let to_symcaml ast fn : symexpr = error "to_symcaml" "unimplemented"


end
