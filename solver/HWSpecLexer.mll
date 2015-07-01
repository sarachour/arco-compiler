{
   open HWSpecParser
}

rule main = parse
   "/*" _* "*/" {main lexbuf}
   | "//" [^'\n'] {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [':'] {COLON}
   | ['{'] {OBRACE}
   | ['}'] {CBRACE}
   | [';'] {SEMICOLON}
   | "begin" {BEGIN}
   | "aggregate-component" {AGG_COMPONENT}
   | "switch-component" {SWITCH_COMPONENT}
   | "component" {COMPONENT}
   | "wire" {WIRE}
   | "join" {JOIN}
   | "schematic" {SCHEMATIC}
   | "enforce" {RELATION}
   | "elem" {ELEM}
   | "pinin" {INPUT_PIN}
   | "pinout" {OUTPUT_PIN}
   | "param" {PARAM}
   | "map" {MAP}
   | "cond" {COND}
   | ['A'-'Z' 'a'-'z' '_' '0'-'9']+ as word {TOKEN(word)}
   | eof {EOF}
