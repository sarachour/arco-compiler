open Sys
open Core

open Util
open GenericData
open GenericLib
open HWData
open HWLib
open ConfigSearch

open HWSpecParser
open HWSpecLexer

exception CircuitSolverException of string;;

let compile_hwspec f : hwarch = 
   let in_chan = open_in(f) in
   let out = (Filename.chop_extension f) in
   let lexbuf = Lexing.from_channel in_chan in
    HWSpecParser.main HWSpecLexer.main lexbuf 
   
      
let process specname formula = 
  let relexpr : grel= Eq(
    Deriv(Literal(Symbol("X"))),
    Add(
      [Literal(Symbol("Y"));
      Literal(Symbol("Z"))]
    )
  ) 
  in
  let relenv : genv = {
    rel=relexpr;
    inputs=["Y";"Z"];
    outputs=["X"];
    params=[];
  }
  in
  Printf.printf "Relation: %s\n" (GenericUtils.grel2str relenv.rel); 
  let hw = compile_hwspec specname in 
  let cenv = ConfigSearch.init Voltage hw in 
  let config = ConfigSearch.convert cenv relenv in
  (**Format.printf "%s\n" (HWArch.arch2str hw);*)
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
