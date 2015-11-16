open LexAST
open ParseAST
open AST

exception Lex_error of string
exception Parse_error of string


let parse_lexbuf prefix plroutine lexbuf  =
    let throw_error ex lex =
      let pos = lexbuf.Lexing.lex_curr_p in
      let line = pos.Lexing.pos_lnum in
      let column = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
      let token = if lex = false then Lexing.lexeme lexbuf else "?" in
      let exstr =  Printexc.to_string ex in
      let locstr = Printf.sprintf "%s|%d:%d: '%s'" prefix line column token in
      let _ = Printf.printf "=========\n%s\n\n%s\n============\n" locstr exstr in
      flush_all();
      if lex then
        raise (Lex_error(locstr^exstr))
      else
        raise (Parse_error(locstr^exstr))
    in
    try
      plroutine lexbuf
    with
    | Failure e ->
      if e = "lexing: empty token" then
        throw_error (Failure e) true
      else failwith e
    | e ->
      throw_error e false

let string_to_ast fn =
  let _ = Printf.printf "PARSING:::: %s\n" fn in 
  let lb = Lexing.from_string fn in
  parse_lexbuf "ast" (fun x -> ParseAST.toplvl LexAST.expr x) lb
