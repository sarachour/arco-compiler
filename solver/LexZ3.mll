{
open ParseZ3;;

exception MathLexerError of string*string
let error s n = raise (MathLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "Z3 Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_']*
let str = '"' [^ '"']* '"'
let integer = '-'? ['0'-'9']+
let op = ['[' ']' '+' '-' '*' '^' '.' '/']+

rule env = parse
  | whitespace              {env lexbuf}
  | '\n'                    {let _ = Lexing.new_line lexbuf in env lexbuf}
  | "define-fun"            {DEFINEFUN}
  | "sat"                   {SAT}
  | "unsat"                 {UNSAT}
  | "Bool"                  {BOOLTYPE}
  | "Int"                   {INTTYPE}
  | "model"                 {MODEL}
  | "("                     {OPARAN}
  | ")"                     {CPARAN}
  | "false"                 {BOOL(false)}
  | "true"                  {BOOL(true)}
  | integer as i            {INTEGER(int_of_string i)}
  | token as tok            {TOKEN(tok)}
  | eof                     {EOF}
  | _ as q                  { report lexbuf q }
