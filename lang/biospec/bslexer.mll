{
   open BSParser
}

rule main = parse
   "/*" _* "*/" {main lexbuf}
   | "//" [^'\n'] {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [':'] {COLON}
   | "action" {ACTION}
   | "kind" {KIND}
   | ['A'-'Z' 'a'-'z' '_']+ as word {TOKEN(word)}
   | eof {EOF}
