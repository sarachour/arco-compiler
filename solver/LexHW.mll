

rule lex = parse
  | ['\n']['\t'' ']* as ind {lex lexbuf}
  | '%'[^'\n']*'\n' {lex lexbuf}
  | ['\n' '\t' ' ']* {lex lexbuf}
  | ['\n']           {EOL}
  | eof              {EOF}
