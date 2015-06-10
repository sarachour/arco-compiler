type 'a maybe = 
   Some of 'a 
   | None
;;

module type GENERIC_TYPE = sig type t end

exception TypeException of string;;
exception GraphException of string;;
exception PrintException of string;;

