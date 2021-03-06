{
open ParseSimCfg;;

exception SimCfgLexerError of string*string
let error s n = raise (SimCfgLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "Sim Cfg Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let comment = '%'[^'\n']*
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_']*
let str = '"' [^ '"']* '"'
let decimal = ['0'-'9']*'.'['0'-'9']+
let integer = ['0'-'9']+
let op = [ '+' '-' '^' '/']+

rule cfg = parse
  | ['\n']                  {Lexing.new_line lexbuf; EOL}
  | whitespace              {cfg lexbuf}
  | comment                 {cfg lexbuf}
  | eof                     {EOF}
