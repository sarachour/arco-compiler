{
   open SymCamlParser
   open Printf
}

rule main = parse
   |[' ''\t''\n'] {main lexbuf}
   | [','] {COMMA}
   | ['='] {EQ}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | ['"'] {QUOTE}
   | ['A'-'Z' 'a'-'z' '_']+['A'-'Z' 'a'-'z' '_' '0'-'9' '|' '.']* as word {
         flush_all();
         TOKEN(word)
      }
   | ['''][^ ''']*['''] as word {
         let qword = List.nth (Str.split (Str.regexp "\'") word) 0 in 
         flush_all();
         QTOKEN(qword)
      }
   | ['-']? ['0'-'9']+'.'['0'-'9']* as dec {DECIMAL(float_of_string dec)}
   | ['-']? ['0'-'9']+ as dec {INTEGER(int_of_string dec)}   
   | eof {EOF}
