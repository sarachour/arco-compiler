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
   | ['-']?['0'-'9']+['.'](['0'-'9']*)? as dec {DECIMAL(float_of_string dec)}
   | ['-']?['0'-'9'] as ing {INTEGER(int_of_string ing)}
   | ['A'-'Z' 'a'-'z' '_' '0'-'9']+ as word {TOKEN(word)}
   | ['*'] {MULT}
   | ['/'] {DIV}
   | ['+'] {ADD}
   | ['-'] {SUB}
   | ['^'] {SUB}
   | ['='] {EQ}
   | eof {EOF}
