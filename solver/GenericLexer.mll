{
   open GenericParser
}

rule main = parse
   | "/*" _* "*/" {main lexbuf}
   | "#" [^ '\n']* "\n" {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [';'] {SEMICOLON}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | [','] {COMMA}
   | "namespace" {NAMESPACE}
   | "in" {INP}
   | "out" {OUTP}
   | "var" {VAR}
   | "param" {PARAM}
   | ['-']?['0'-'9']+['.'](['0'-'9']*)? as dec {DECIMAL(float_of_string dec)}
   | ['-']?['0'-'9'] as ing {INTEGER(int_of_string ing)}
   | ['A'-'Z' 'a'-'z' '_' '0'-'9']+ as word {TOKEN(word)}
   | ['*'] {MULT}
   | ['/'] {DIV}
   | ['+'] {ADD}
   | ['-'] {SUB}
   | ['^'] {EXP}
   | ['='] {EQ}
   | eof {EOF}
