{

open ParseAST;;

}

let token = ['A'-'Z' 'a' - 'z']['A'-'Z' 'a'-'z' '0' - '9' ':' ';']*
let integer = ['0' - '9']+
let float = ['0'-'9']*"."['0' - '9']+

rule expr = parse
   |[' ''\t''\n'] {expr lexbuf}
   | "-"              {SUB}
   | "*"              {MULT}
   | "("              {OPAR}
   | ")"              {CPAR}
   | "["              {OBRAC}
   | "]"              {CBRAC}
   | "."              {DOT}
   | "/"              {DIV}
   | ","              {COMMA}
   | "^"              {POW}
   | "deriv"          {DERIV}
   | "exp"            {EXP}
   | float as tok     {let v = float_of_string tok in DECIMAL(v)}
   | integer as tok   {let v = int_of_string tok in INTEGER(v)}
   | token as tok     {TOKEN(tok)}
   | eof              {EOF}
