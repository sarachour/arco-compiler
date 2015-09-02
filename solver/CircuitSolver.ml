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

open GenericParser
open GenericLexer


exception CircuitSolverException of string;;

let compile_hwspec f : hwarch = 
  let in_chan = open_in(f) in
  let lexbuf = Lexing.from_channel in_chan in
  HWSpecParser.main HWSpecLexer.main lexbuf 

let compile_gexpr f : genv = 
  let in_chan = open_in(f) in 
  let lexbuf = Lexing.from_channel in_chan in
  GenericParser.main GenericLexer.main lexbuf 

      
let process specname formula kind = 
  let form = compile_gexpr formula in 
  Printf.printf "Relation: %s\n" (GenericUtils.genv2str form); 
  let hw = compile_hwspec specname in 
  let cenv = ConfigSearch.init kind hw in 
  let config = ConfigSearch.convert cenv form in
  (**Format.printf "%s\n" (HWArch.arch2str hw);*)
  Format.printf "%s\n" (HWArch.config2str config)

let command =
  Command.basic
    ~summary:"Compile to circuit"
    Command.Spec.(
      empty
      +> flag "-hwspec" (optional string) ~doc:"hardware specification"
      +> flag "-formula" (optional string) ~doc:"formula specification"
      +> flag "-analogy" (optional string) ~doc:"hardware analogy. Use 'voltage' or 'current'."
    )
    (fun hwspec formula analogy () -> 
      match (hwspec,formula,analogy) with
      | (Some(h),Some(f),None) -> process h f Voltage
      | (Some(h),Some(f),Some("voltage")) -> process h f Voltage
      | (Some(h),Some(f),Some("current")) -> process h f Current
      | (Some(h),Some(f),Some(_)) -> raise (CircuitSolverException "Unknown analogy")
      | (_,_,_) -> raise (CircuitSolverException "Must provide hwspec and formula"))

let main () = Command.run command;;


if !Sys.interactive then () else main ();;
