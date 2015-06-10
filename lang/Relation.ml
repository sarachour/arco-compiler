exception RelationException of string;;

type relation = 
   | Plus of relation list
   | Minus of relation list
   | Mult of relation list
   | Divide of relation*relation
   | Exp of relation*relation
   | Symbol of string
   | Decimal of float
   | Integer of int 
;;

let rec subst4rel (e:relation) (subs:(string*string) list) : relation =
    let update_varname (s:string) : string =
      match List.filter (fun (ename,rname) -> rname = s) subs with
         | [(ename,rname)] -> ename
         | [] -> s
         | _ -> raise (RelationException "repeated substitutions in list")
    in
    let rec sub_rel_list (e:relation list) : relation list = 
      match e with
        | h::t -> (subst4rel h subs)::(sub_rel_list t)
        | [] -> []
    in
    let rec sub_rel (e:relation) : relation =
      match e with
      | Symbol(s) -> Symbol (update_varname s)
      | Plus(e) -> Plus (sub_rel_list e)
      | Minus(e) -> Minus (sub_rel_list e)
      | Mult(e) -> Mult (sub_rel_list e)
      | Divide(e1,e2) -> Divide ((sub_rel e1), (sub_rel e2))
      | Exp(e,t) -> Exp ((sub_rel e),(sub_rel t))
      | Decimal(f) -> Decimal(f)
      | Integer(i) -> Integer(i)
    in
      sub_rel e


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