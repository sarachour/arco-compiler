(*Ocaml Libraries*)
open Sys
open Core

(*Self Libraries*)
open AST
open Math
open Sym
open HW
open Logic
open Util

open ParseGen



exception MainException of string*string;;

let read_data f h a =
  let fenv = ParserGenerator.file_to_formula f in
  let henv = ParserGenerator.file_to_hwspec h in
  (fenv,henv)

let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-formula" (optional string) ~doc:"formula specification"
      +> flag "-analogy" (optional string) ~doc:"hardware analogy. Use 'voltage' or 'current'."
      +> flag "-interactive" no_arg ~doc:"interactively solve the system."
    )
    (fun hwspec formula analogy is_interactive () ->
      match (hwspec,formula,analogy) with
      | (Some h, Some f, Some a) ->
        let f,h = read_data f h a in
        ()
      | (_,_,_) -> raise (MainException("command","Must provide hwspec and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
