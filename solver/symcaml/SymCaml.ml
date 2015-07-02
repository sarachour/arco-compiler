open Pycaml
open Sys
(* Check out sympy *)

module SymCaml : 
sig
   val init : unit -> unit
end = 
struct 
   let init () = py_initialize()

end

let main () = 
   SymCaml.init()
;;

if !Sys.interactive then () else main ();;

