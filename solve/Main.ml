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
  let hwstr = HwLib.print henv in
  let hwstr = MathLib.print fenv in
  (fenv,henv)

let gen h f o is_interactive=
  let _ = set_
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
      +> flag "-output" (optional string) ~doc:"output file specification"
      +> flag "-interactive" no_arg ~doc:"interactively solve the system."
      +> flag "-debug" no_arg ~doc:"debug the benchmark."
    )
    (fun hwspec formula output is_interactive debug () ->
      match (hwspec,formula, output) with
      | (Some h, Some f, Some o) ->
        gen h f o is_interactive
      | (Some h, Some f, None) ->
        gen h f "out.ckt" is_interactive debug
      | (_,_,_) ->
        raise (MainException("command","Must provide hwspec output, and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
