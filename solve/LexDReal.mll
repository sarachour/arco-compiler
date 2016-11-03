{
open ParseDReal;;
open Util;;
exception DRealLexerError of string*string
let error s n = raise (DRealLexerError(s,n))
let report lexbuf q =
  let ofst = string_of_int (Lexing.lexeme_start lexbuf) in
  let chr = Char.escaped q in
  error "DReal Lexer Error" ("At offset "^ofst^": unexpected character: <"^chr^">")
}

let whitespace = ['\t'' ']*
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_']*
let integer = '-'? ['0'-'9']+
let floatexp = '-'? ['0'-'9']+('.'['0'-'9']*)?'e'['-''+']?['0'-'9']+
let float = '-'? ['0'-'9']+'.'['0'-'9']*

rule env = parse
  | whitespace              {env lexbuf}
  | '\n'                    {let _ = Lexing.new_line lexbuf in EOL}
  | "["                     {OBRAC}
  | "]"                     {CBRAC}
  | ","                     {COMMA}
  | "="                     {EQ}
  | ":"                     {COLON}
  | "ENTIRE"                {ENTIRE}
  | "-INFTY"                {NEG_INFTY}
  | "+INFTY"                 {POS_INFTY}
  | "Solution"              {SOLUTION}
  | floatexp as i           { let str = i in
                              let args = STRING.split str "e" in
                              let base = float_of_string (List.nth args 0) in
                              let expo = float_of_string (List.nth args 1) in
                              FLOAT((base)*.(10.**expo))
                            }
  | float as i              {FLOAT(float_of_string i)}
  | integer as i            {INTEGER(int_of_string i)}
  | token as tok            {TOKEN(tok)}
  | eof                     {EOF}
  | _ as q                  { report lexbuf q }
