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

open SimCompile
open Compile
open SolverSln


exception MainException of string*string;;

let error s s2 =
  raise (MainException (s,s2))

let read_data h s c =
  let _ = Printf.printf "# PARSING\n" in
  let senv = SimParserGenerator.file_to_slnspec s in
  let senv = match senv with
    | Some(sln) -> sln
    | None -> error "read_data" "no solution read."
  in
  let str = SlnLib.tostr senv in
  let _ = Printf.printf "-> parsed sln.\n" in
  let _ = Printf.printf "%s\n\n" str in 
  (*let cfg = SimParserGenerator.file_to_simcfg c in*)
  let cfg = "" in
  let _ = Printf.printf "-> parsed simulation.\n" in
  (*let henv = ParserGenerator.file_to_hwspec h in*)
  let henv = "" in
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
    (fun hwspec solution sim () ->
      match (hwspec,sim,solution) with
      | (Some(h),Some(c),Some(s)) ->
        let _ = gen h s c in
        ()
      | _ ->
        raise (MainException("command","Must provide hwspec output, and formula"))
    )

let main () = Command.run command;;

if !Sys.interactive then () else main ();;
