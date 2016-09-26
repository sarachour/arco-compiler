open ParseAST
open LexAST
open AST

open ParseMath
open LexMath
open MathLib

open CompileUtil

open HWLib
(*
open ParseHW
open LexHW
*)

exception ParserGeneratorException of string*string

let error s m = raise (ParserGeneratorException(s,m))


module ParserGenerator =
struct

  let string_to_lexbuf f =
    let lexbuf = Lexing.from_string f in
    lexbuf

  let file_to_lexbuf f =
    let in_chan = open_in(f) in
    let lexbuf = Lexing.from_channel in_chan in
    let close_fd = (fun () -> close_in in_chan) in
    close_fd, lexbuf



  let file_to_ast fn =
    let close_file, lb = file_to_lexbuf fn in
    let res = ParseAST.toplvl LexAST.expr lb in
    let _ = close_file () in
    res

  let string_to_ast fn =
    let lb = string_to_lexbuf fn in
    ParseAST.toplvl LexAST.expr lb

  let file_to_config fn =
    let close_file, lb = file_to_lexbuf fn in
    let res = parse_lexbuf "config" (fun x -> ParseConfig.toplvl LexConfig.toplvl x) lb in
    let _ = close_file () in
    res

  let file_to_formula fn =
    let close_file, lb = file_to_lexbuf fn in
    let res = parse_lexbuf "math" (fun x -> ParseMath.env LexMath.env x) lb in
    let _ = close_file () in
    match res with
    | Some(v) -> let res = v in
      res
    | None -> error "file_to_formula" "could not parse math environment."

  let file_to_hwspec fn =
    let close_file, lb = file_to_lexbuf fn in
    let res = parse_lexbuf "hw" (fun x -> ParseHW.env LexHW.env x) lb in
    let _ = close_file () in
    match res with
    | Some (v) -> let res = v in
      res
    | None -> error "file_to_formula" "could not parse the hw environment"

  let file_to_z3sln fn =
    let close_file,lb = file_to_lexbuf fn in
    let res = parse_lexbuf "z3" (fun x -> ParseZ3.env LexZ3.env x) lb in
    let _ = close_file () in
    match res with
    | Some (v) -> let res = v in
      res
    | None -> error "file_to_formula" "could not parse the z3 environment"


  let string_to_formula fn =
    let lb = string_to_lexbuf fn in
    let res = parse_lexbuf "math" (fun x -> ParseMath.env LexMath.env x) lb in
    match res with
    | Some(v) -> v
    | None -> error "file_to_formula" "could not parse math environment."

  let string_to_hwspec fn =
    let lb = string_to_lexbuf fn in
    let res = parse_lexbuf "hw" (fun x -> ParseHW.env LexHW.env x) lb in
    match res with
    | Some (v) -> v
    | None -> error "file_to_formula" "could not parse the hw environment"

  let string_to_z3sln fn =
    let lb = string_to_lexbuf fn in
    let res = parse_lexbuf "z3" (fun x -> ParseZ3.env LexZ3.env x) lb in
    match res with
    | Some (v) -> let res = v in
      res
    | None -> error "file_to_formula" "could not parse the z3 environment"


end
