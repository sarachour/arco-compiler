{
  open ParseAST
}

rule expr = parse
   |[' ''\t''\n'] {expr lexbuf}
