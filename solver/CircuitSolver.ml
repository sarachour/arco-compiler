open Sys
open Core
open Core.Std

open Util
open Generic 
open HWData
open HWLib
open GenToHW

open HWSpecParser
open HWSpecLexer

exception CircuitSolverException of string;;

let compile_hwspec f : hwarch = 
   let in_chan = open_in(f) in
   let out = (Filename.chop_extension f) in
   let lexbuf = Lexing.from_channel in_chan in
    HWSpecParser.main HWSpecLexer.main lexbuf 
   
      
let process specname formula = 
  let expr : grel= Eq(
    Deriv(Literal(Symbol(0, Some "X"))),
    Add(
      [Literal(Symbol(1, Some "Y"));
      Literal(Symbol(2, Some "Z"))]
    )
  ) 
  in
  let hw = compile_hwspec specname in 
  let config = HWConv.convert hw expr Current in
  Format.printf "%s\n" (HWArch.arch2str hw);
  Format.printf "%s\n" (HWArch.config2str config)

let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-formula" (optional string) ~doc:"formula specification"
    )
    (fun hwspec formula () -> 
      match (hwspec,formula) with
      | (Some(h),Some(f)) -> process h f 
      | (Some(h),None) -> process h ""
      | (_,_) -> raise (CircuitSolverException "Must provide hwspec and formula"))
let main () = Command.run command;;


if !Sys.interactive then () else main ();;