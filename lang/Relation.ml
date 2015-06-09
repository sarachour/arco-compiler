
type relation = 
   Plus of relation list
   | Minus of relation list
   | Mult of relation list
   | Divide of relation*relation
   | Exp of relation*relation
   | Symbol of string
   | Decimal of float
   | Integer of int 
;;


let rec to_string (r:relation) : string = 
   match r with
   | Plus(h::r) -> let delim="+" in 
      List.fold_right (fun e str -> str^delim^(to_string e)) r ((to_string h))
   | Plus([]) -> "" 

   | Minus(h::r) -> let delim="-" in 
      List.fold_right (fun e str -> str^delim^(to_string e)) r ((to_string h))
   | Minus([]) -> "" 

   | Mult(h::r) -> let delim="*" in 
      List.fold_right (fun e str -> str^delim^(to_string e)) r ((to_string h))  
   | Mult([]) -> "" 
   
   | Divide(t,b) -> "("^(to_string t)^")/("^(to_string b)^")"  
   | Exp(t,b) -> "("^(to_string t)^")^("^(to_string b)^")"  
   | Symbol(t) -> t
   | Decimal(f) -> string_of_float f
   | Integer(f) -> string_of_int f