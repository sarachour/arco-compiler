{
   open HWSpecParser
}

rule main = parse
   "/*" _* "*/" {main lexbuf}
   |[' ''\t''\n'] {main lexbuf}
   | [':'] {COLON}
   | ['{'] {OBRACE}
   | ['}'] {CBRACE}
   | ['('] {OPARAN}
   | [')'] {CPARAN}
   | [';'] {SEMICOLON}
   | ['|'] {VBAR}
   | "begin" {BEGIN}
   | "aggregate-component" {AGG_COMPONENT}
   | "switch-component" {SWITCH_COMPONENT}
   | "component" {COMPONENT}
   | "wire" {WIRE}
   | "join" {JOIN}
   | "schematic" {SCHEMATIC}
   | "enforce" {RELATION}
   | "elem" {ELEM}
   | "in" {INPUT_PIN}
   | "out" {OUTPUT_PIN}
   | "param" {PARAM}
   | "map" {MAP}
   | "cond" {COND}
   | "to" {TO}
   | ['A'-'Z' 'a'-'z' '_' '0'-'9']+ as word {TOKEN(word)}
   | ['0'-'9']+('.'['0'-'9']*)? as dec {DECIMAL(float_of_string dec)}
   | ['.'] {DOT}
   | ['*'] {MULT}
   | ['/'] {DIV}
   | ['+'] {ADD}
   | ['-'] {SUB}
   | ['^'] {SUB}
   | ":=" {ASSIGN}
   | ['='] {EQ}
   | eof {EOF}
