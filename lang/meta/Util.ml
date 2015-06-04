type 'a maybe = 
   Some of 'a 
   | None
;;

exception TypeException of string;;
exception GraphException of string;;

