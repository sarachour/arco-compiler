
type rule = 
   | Hole 
   | Plus of rule list
   | Minus of rule list
   | Times of rule list
   | Relation
   | Input of string
   | Output

exception RuleException of string;;

let rec def4rule (r:rule) (sym: string list) : unit=
   let def_literal (s:string) : unit = 
      match List.filter (fun x -> x = s) sym with
         | [_] -> ()
         | [] -> raise (RuleException ("literal "^s^" is not defined."))
         | _ -> raise (RuleException ("literal "^s^" has too many matches"))
   in
   match r with
      | Hole -> ()
      | Plus(xlst) -> List.fold_right (fun x e -> def4rule x sym; e) xlst ()
      | Minus(xlst) -> List.fold_right (fun x e -> def4rule x sym; e) xlst ()
      | Times(xlst) -> List.fold_right (fun x e -> def4rule x sym; e) xlst ()
      | Input(s) -> def_literal s
      | Output -> ()
      | Relation -> ()

let rec def4rules (r:(string*rule) list) (sym: string list) :unit =
   let def_literal (s:string) : unit = 
      match List.filter (fun x -> x = s) sym with
         | [_] -> ()
         | [] -> raise (RuleException ("literal "^s^" is not defined."))
         | _ -> raise (RuleException ("literal "^s^" has too many matches"))
   in
   match r with
      | (n,h)::t -> def_literal n; def4rule h sym; def4rules t sym
      | [] -> ()

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
