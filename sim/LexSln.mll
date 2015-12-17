{
open ParseSln;;

exception SlnLexerError of string*string
let error s n = raise (SlnLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "Sln Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let comment = '%'[^'\n']*
let name = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_' '.']*
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_']*
let str = '"' [^ '"']* '"'
let decimal = ['0'-'9']*'.'['0'-'9']*
let integer = ['0'-'9']+
let op = [ '+' '-' '^' '/']+

rule sln = parse
  | ['\n']                  {Lexing.new_line lexbuf; EOL}
  | whitespace              {sln lexbuf}
  | comment                 {sln lexbuf}
  | "comp"                  {COMPONENT}
  | "conn"                  {CONN}
  | "value"                 {VALUE}
  | "var"                   {VAR}
  | "::"                    {CCOLON}
  | "of"                    {OF}
  | "bind"                  {BIND}
  | "\n"                    {EOL}
  | name as v               {TOKEN(v)}
  | decimal as v            {DECIMAL(float_of_string v)}
  | integer as v            {INTEGER(int_of_string v)}
  | eof                     {EOF}
