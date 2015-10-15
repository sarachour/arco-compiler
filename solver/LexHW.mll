{
open ParseHW;;

exception HwLexerError of string*string
let error s n = raise (HwLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "HW Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let comment = '%'[^'\n']*
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_']*
let str = '"' [^ '"']* '"'
let decimal = ['0'-'9']*'.'['0'-'9']+
let integer = ['0'-'9']+
let op = ['[' ']' '(' ')' '+' '-' '*' '^' '.' '/' ]+

rule env = parse
  | ['\n']                  {Lexing.new_line lexbuf; EOL}
  | whitespace              {env lexbuf}
  | comment                 {env lexbuf}
  | ":"                     {COLON}
  | "="                     {EQ}
  | "?"                     {QMARK}
  | ","                     {COMMA}
  | "none"                  {NONE}
  | "let"                   {LET}
  | "type"                  {TYPE}
  | "prop"                  {PROP}
  | "time"                  {TIME}
  | "comp"                  {COMP}
  | "end"                   {END}
  | "input"                 {INPUT}
  | "output"                {OUTPUT}
  | "where"                 {WHERE}
  | "param"                 {PARAM}
  | "in"                    {IN}
  | "rel"                   {REL}
  | decimal as t            {let v = float_of_string t in DECIMAL(v)}
  | integer as t            {let v = int_of_string t in INTEGER(v)}
  | token as t              {TOKEN(t)}
  | op as t                 {OPERATOR(t)}
  | str as t                {STRING(t)}
  | eof                     {EOF}
