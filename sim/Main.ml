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

open SimParserGenerator
open Compile



exception MainException of string*string;;

let read_data h s c =
  let henv = ParserGenerator.file_to_hwspec h in
  let senv = SimParserGenerator.file_to_slnspec s in
  let cfg = SimParserGenerator.file_to_simcfg c in
  (henv,senv,cfg)

let gen h s c =
  let henv,snv,cfg = read_data h s c in
  ()

let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-solution" (optional string) ~doc:"solution specification"
      +> flag "-sim" (optional string) ~doc:"simulation config specification"
    )
    (fun hwspec sim solution () ->
      match (hwspec,sim,solution) with
      | (Some(h),Some(c),Some(s)) ->
        let _ = gen h s c in
        ()
      | _ ->
        raise (MainException("command","Must provide hwspec output, and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
