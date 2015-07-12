{
   open GenericParser
}

rule main = parse
   "/*" _* "*/" {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [';'] {SEMICOLON}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | "namespace" {NAMESPACE}
   | "in" {INP}
   | "out" {OUTP}
   | "param" {PARAM}
   | ['A'-'Z' 'a'-'z' '_' '0'-'9']+ as word {TOKEN(word)}
   | ['0'-'9']+('.'['0'-'9']*)? as dec {DECIMAL(float_of_string dec)}
   | ['*'] {MULT}
   | ['/'] {DIV}
   | ['+'] {ADD}
   | ['-'] {SUB}
   | ['^'] {SUB}
   | ['='] {EQ}
   | eof {EOF}
