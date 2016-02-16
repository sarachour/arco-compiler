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
open Interactive
open Globals

exception MainException of string*string;;
let main_exec_debug = exec_debug 0 

let read_data f h =
  let fenv = ParserGenerator.file_to_formula f in
  let henv = ParserGenerator.file_to_hwspec h in
  let hwstr = main_exec_debug (fun () -> HwLib.to_file henv "henv.debug.txt") in
  let hwstr = main_exec_debug (fun () -> MathLib.to_file fenv "fenv.debug.txt" ) in
  (fenv,henv)

let gen h f o cfg =
  let _ = match cfg with
    | Some(c) ->
      let nglbls = ParserGenerator.file_to_config c in
      let _ = upd_glbls nglbls in
      let _ = Printf.printf "==== Loaded Config File (%s) ====\n" c in
      let _ = print_glbls () in
      let _ = Printf.printf "=================================\n" in
      ()
    | None -> ()
  in
  let mathenv,hwenv = read_data f h in
  let _ = Solver.solve hwenv mathenv o in
  ()

let gen_cfg o =
  let _ = glbls_to_file o in
  ()

let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-formula" (optional string) ~doc:"formula specification"
      +> flag "-output" (optional string) ~doc:"output file specification"
      +> flag "-config" (optional string)  ~doc:"interactively solve the system."
      +> flag "-print-config" (no_arg)  ~doc:"dump teh default set of globals."
    )
    (fun hwspec formula output config dumpglobals () ->
      if dumpglobals then
        match output with
        | Some(o) ->
          gen_cfg o
        | None ->
          gen_cfg "default.cfg"
      else
        match (hwspec,formula,output) with
        | (Some h, Some f, Some o) ->
          gen h f o config
        | (Some h, Some f, None) ->
          gen h f "out.ckt" config
        | (_,_,_) ->
          raise (MainException("command","Must provide hwspec output, and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
