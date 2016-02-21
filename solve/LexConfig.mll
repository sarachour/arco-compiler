
{

open ParseConfig;;

}


let integer = ['0' - '9']+
let float = ['0'-'9']*"."['0' - '9']+
let token = ['A'-'Z''a'-'z''_']['A'-'Z''a'-'z''0'-'9''_''-']*
let str = '"' [^ '"']* '"'



rule toplvl = parse
   |[' ''\t''\n'] {toplvl lexbuf}
   | "bool"           {TBOOL}
   | "float"          {TFLOAT}
   | "int"            {TINT}
   | "string"         {TSTRING}
   | "true"           {BOOL(true)}
   | "false"          {BOOL(false)}
   | float as tok     {let v = float_of_string tok in FLOAT(v)}
   | integer as tok   {let v = int_of_string tok in INTEGER(v)}
   | str as s         {let s = Str.global_replace (Str.regexp "\"") "" s in STRING(s)}
   | token as tok     {TOKEN(tok)}
   | eof              {EOF}
