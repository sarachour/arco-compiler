open ParseAST
open LexAST
open AST

open ParseMath
open LexMath
open Math

open ParseGenUtil

open HW
(*
open ParseHW
open LexHW
*)

exception ParserGeneratorException of string*string

let error s m = raise (ParserGeneratorException(s,m))


module ParserGenerator :
sig
  val file_to_ast : string -> string ast
  val string_to_ast : string -> string ast
  val file_to_formula : string -> Math.menv
  val string_to_formula : string -> Math.menv
  val file_to_hwspec : string -> HW.hwenv
  val string_to_hwspec : string -> HW.hwenv

end =
struct

  let string_to_lexbuf f =
    let lexbuf = Lexing.from_string f in
    lexbuf

  let file_to_lexbuf f =
    let in_chan = open_in(f) in
    let lexbuf = Lexing.from_channel in_chan in
    lexbuf

  let file_to_ast fn =
    let lb = file_to_lexbuf fn in
    ParseAST.toplvl LexAST.expr lb

  let string_to_ast fn =
    let lb = string_to_lexbuf fn in
    ParseAST.toplvl LexAST.expr lb

  let file_to_formula fn =
    let lb = file_to_lexbuf fn in
    let res = parse_lexbuf "math" (fun x -> ParseMath.env LexMath.env x) lb in
    match res with
    | Some(v) -> let res = v in
      MathLib.print res;
      res
    | None -> error "file_to_formula" "could not parse math environment."

  let file_to_hwspec fn =
    let lb = file_to_lexbuf fn in
    let res = parse_lexbuf "hw" (fun x -> ParseHW.env LexHW.env x) lb in
    match res with
    | Some (v) -> let res = v in
      HwLib.print res;
      res
    | None -> error "file_to_formula" "could not parse the hw environment"

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

end
