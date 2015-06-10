
type rule = 
   | Hole 
   | Plus of rule list
   | Minus of rule list
   | Times of rule list
   | Relation
   | Input of string
   | Output

let rec to_string (r:rule) =
   match r with
      | Hole -> "@"
      | Minus(h::t) -> List.fold_right (fun x r -> r^"-"^(to_string x)) t (to_string h)
      | Plus(h::t) ->  List.fold_right (fun x r -> r^"+"^(to_string x)) t (to_string h)
      | Times(h::t) -> List.fold_right (fun x r -> r^"*"^(to_string x)) t (to_string h)
      | Relation -> "f(x)"
      | Input(s) -> "in("^s^")"
      | Output -> "out"
      | _ -> ""
