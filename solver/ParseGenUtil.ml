open LexAST
open ParseAST
open AST

exception Lex_error of string
exception Parse_error of string

let parse_lexbuf prefix plroutine lexbuf  =
    try
      plroutine lexbuf
    with
    | Failure e ->
      if e = "lexing: empty token" then
        let pos = lexbuf.Lexing.lex_curr_p in
        let line = pos.Lexing.pos_lnum in
        let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol + 1 in
        raise (Lex_error (Printf.sprintf "%s|%d:%d" prefix line column))
      else failwith e
    | Parsing.Parse_error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      let line = pos.Lexing.pos_lnum in
      let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
      let token = Lexing.lexeme lexbuf in
      raise (Parse_error (Printf.sprintf "%s|%d:%d: '%s'" prefix line column token))
    | Error ->
      let pos = lexbuf.Lexing.lex_curr_p in
      let line = pos.Lexing.pos_lnum in
      let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
      let token = Lexing.lexeme lexbuf in
      raise (Parse_error (Printf.sprintf "%s|  %d:%d: '%s'" prefix line column token))
let string_to_ast fn =
  let lb = Lexing.from_string fn in
  parse_lexbuf "ast" (fun x -> ParseAST.expr LexAST.expr x) lb
