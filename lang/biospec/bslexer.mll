{
   open BSParser
   exception Eof
}

rule main = parse
   "   "|'\t' {TAB}
   | [':'] {COLON}
   | ['\n'] {EOL}
   | "action" {ACTION}
   | "kind" {KIND}
   | ['A'-'Z' 'a'-'z' '_']+ as word {TOKEN(word)}
   | eof {raise Eof}
