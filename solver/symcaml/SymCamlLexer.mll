{
   open SymCamlParser
}

rule main = parse
   |[' ''\t''\n'] {main lexbuf}
   | [','] {COMMA}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | ['''] {APOS}
   | ['"'] {QUOTE}
   | ['A'-'Z' 'a'-'z' '_']+['A'-'Z' 'a'-'z' '_' '0'-'9' '|' '.']* as word {TOKEN(word)}
   | ['0'-'9']+'.'['0'-'9']* as dec {DECIMAL(float_of_string dec)}
   | ['0'-'9']+ as dec {INTEGER(int_of_string dec)}   
   | eof {EOF}
