{
open ParseMath;;

exception MathLexerError of string*string
let error s n = raise (MathLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "Math Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}


rule env = parse
  | ['\t'' ']*              {env lexbuf}
  | '\n'['\t' ' ']*'\n'      {env lexbuf}
  | '%'[^'\n']*'\n'         {env lexbuf}
  | '\n'                    {EOL}
  | eof                     {EOF}
  | "|"                     {VBAR}
  | ":"                     {COLON}
  | "name"                  {NAME}
  | '"' [^ '"']* '"' as t   {STRING(t)}
  | _ as q                  { report lexbuf q }
