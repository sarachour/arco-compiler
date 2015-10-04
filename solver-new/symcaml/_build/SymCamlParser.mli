type token =
  | TOKEN of (string)
  | QTOKEN of (string)
  | DECIMAL of (float)
  | INTEGER of (int)
  | COMMA
  | OPARAN
  | CPARAN
  | EOF
  | QUOTE

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> SymCamlData.symexpr
