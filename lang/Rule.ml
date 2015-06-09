
type rule = 
   Hole 
   | Plus of rule*rule
   | Minus of rule*rule
   | Times of rule*rule
   | Relation
   | Input of string
   | Output

let rec to_string (r:rule) =
   match r with
      | Hole -> "[_]"
      | Minus(a,b) -> (to_string a)^"-"^(to_string b)
      | Plus(a,b) -> (to_string a)^"+"^(to_string b)
      | Times(a,b) -> (to_string a)^"*"^(to_string b)
      | Relation -> "f(x)"
      | Input(s) -> "in("^s^")"
      | Output -> "out"
      