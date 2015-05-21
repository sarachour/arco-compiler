{
   open DEQParser
}

rule main = parse
   "/*" _* "*/" {main lexbuf}
   | "//" [^'\n'] {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [';'] {SEMICOLON}
   | ['='] {EQ}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | "deriv" {DERIV}
   | ['^'] {EXP}
   | ['/'] {DIV}
   | ['*'] {MULT}
   | ['+'] {ADD}
   | ['-'] {SUB}
   | ['0'-'9']'.'['0'-'9']* as num {DECIMAL(float_of_string num)}
   | ['0'-'9']+ as num {INTEGER(int_of_string num)}
   | ['A'-'Z' 'a'-'z' '_']+ as word {SYMBOL(word)}
   | eof {EOF}
