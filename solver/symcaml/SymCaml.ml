open Pycaml
open Sys
open Printf
(* Check out sympy *)

module SymCaml : 
sig
   val init : unit -> unit
end = 
struct 
   let init () = Printf.printf("testing\n"); pyrun_simplestring("print \"hello world\""); ()

end

let main () = 
   SymCaml.init()
;;

if !Sys.interactive then () else main ();;

