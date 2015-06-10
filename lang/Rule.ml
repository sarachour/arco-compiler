
type rule = 
   | Hole 
   | NewHole
   | Plus of rule list
   | Minus of rule list
   | Times of rule list
   | Relation
   | Input of string
   | Output

let rec to_string (r:rule) =
   match r with
      | Hole -> "[_]"
      | Minus(h::t) -> List.fold_right (fun x r -> r^"-"^(to_string x)) t (to_string h)
      | Plus(a,b) -> (to_string a)^"+"^(to_string b)
      | Times(a,b) -> (to_string a)^"*"^(to_string b)
      | Relation -> "f(x)"
      | Input(s) -> "in("^s^")"
      | Output -> "out"

