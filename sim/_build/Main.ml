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

open Compile



exception MainException of string*string;;

let read_data f h =
  let fenv = ParserGenerator.file_to_formula f in
  let henv = ParserGenerator.file_to_hwspec h in
  (fenv,henv)

let gen h f o is_interactive=
  let mathenv,hwenv = read_data f h in
  let _ = Solver.solve hwenv mathenv o is_interactive in
  ()
let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-formula" (optional string) ~doc:"formula specification"
      +> flag "-solution" (optional string) ~doc:"solution"
      +> flag "-config" (optional string) ~doc:"config file specification"
    )
    (fun hwspec formula config solution () ->
      match (hwspec,formula,config,solution) with
      | _ ->
        raise (MainException("command","Must provide hwspec output, and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
