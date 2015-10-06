{
open ParseMath;;

exception MathLexerError of string*string
let error s n = raise (MathLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "Math Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let comment = '%'[^'\n']*
let token = ['A'-'Z''a'-'z']+
let str = '"' [^ '"']* '"'
let decimal = ['0'-'9']*'.'['0'-'9']+
let integer = ['0'-'9']+

rule env = parse
  | whitespace              {env lexbuf}
  | comment                 {env lexbuf}
  | '\n'                    {EOL}
  | eof                     {EOF}
  | "|"                     {VBAR}
  | ":"                     {COLON}
  | "="                     {EQ}
  | "name"                  {NAME}
  | "let"                   {LET}
  | "type"                  {TYPE}
  | decimal as t            {let v = float_of_string t in NUMBER(v)}
  | integer as t            {let v = float_of_string t in NUMBER(v)}
  | token as t              {TOKEN(t)}
  | str as t                {STRING(t)}
  | _ as q                  { report lexbuf q }
