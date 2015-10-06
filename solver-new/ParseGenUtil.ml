open LexAST
open ParseAST
open AST

let string_to_ast fn =
  let lb = Lexing.from_string fn in
  ParseAST.expr LexAST.expr lb
