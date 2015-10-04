open SymCamlData

type 'a ast_term =
  | Literal of 'a
  | Decimal of float
  | Integer of int


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

type 'a ast_node =
  | Term of 'a ast_term
  | OpL of ast_opn*(('a ast_node) list)
  | Op2 of ast_op2*(('a ast_node)*('a ast_node))
  | Op1 of ast_op1*(('a ast_node))

exception ASTException of (string*string)
module AST : sig
    val to_string : ('a ast_node) -> ('a -> string) -> string
    val conv : ('a ast_node) -> ('a -> 'b) -> ('b ast_node)
    val to_symcaml : ('a ast_node) -> ('a -> symvar) -> (symexpr)
end =
struct
    let to_string ast fn : string = raise (ASTException("to_string","unimplemented"))
    let conv ast fn  = raise (ASTException("to_string","unimplemented"))
    let to_symcaml ast fn : symexpr = raise (ASTException("to_symcaml","unimplemented"))

end
