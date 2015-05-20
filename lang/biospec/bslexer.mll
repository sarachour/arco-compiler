{
   open BSParser
   exception Eof
}

rule main = parse
   [' ' '\t'] {TAB}
   | eof {raise Eof}
