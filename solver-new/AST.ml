

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
