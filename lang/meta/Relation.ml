
type relation = 
   Plus of relation list
   | Minus of relation list
   | Mult of relation list
   | Divide of relation*relation
   | Exp of relation*relation
   | Symbol of string
   | Number of float 
;;
