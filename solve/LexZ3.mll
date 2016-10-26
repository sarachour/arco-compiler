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
let float = '-'? ['0'-'9']+'.'['0'-'9']*
let op = ['[' ']' '+' '-' '*' '^' '.' '/']+
let z3var = "z3name!"['!''A'-'Z''a'-'z''0'-'9''_' '<' '>']*

rule env = parse
  | whitespace              {env lexbuf}
  | '\n'                    {let _ = Lexing.new_line lexbuf in env lexbuf}
  | "define-fun"            {DEFINEFUN}
  | "sat"                   {SAT}
  | "unsat"                 {UNSAT}
  | "Bool"                  {BOOLTYPE}
  | "Real"                  {REALTYPE}
  | "Int"                   {INTTYPE}
  | "model"                 {MODEL}
  | "error"                 {ERROR}
  | "objectives"            {OBJECTIVES}
  | "("                     {OPARAN}
  | ")"                     {CPARAN}
  | "/"                     {DIV}
  | "+"                     {PLUS}
  | "-"                     {MINUS}
  | "*"                     {MULT}
  | "oo"                    {INFTY}
  | "false"                 {BOOL(false)}
  | "true"                  {BOOL(true)}
  | float as i              {FLOAT(float_of_string i)}
  | integer as i            {INTEGER(int_of_string i)}
  | str as st               {STRING(st)}
  | z3var as tok            {Z3VAR(tok)}
  | token as tok            {TOKEN(tok)}
  | eof                     {EOF}
  | _ as q                  { report lexbuf q }
