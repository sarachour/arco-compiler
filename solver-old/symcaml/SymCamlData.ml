
exception SymCamlParserError of string;;
exception SymCamlException of string;;
exception SymCamlFunctionException of string*string;;
exception PyCamlWrapperException of string;;

type symvar = string


type symexpr = 
   | Symbol of symvar
   | Integral of symexpr*symvar
   | Cos of symexpr
   | Sin of symexpr
   | Tan of symexpr
   | Mult of symexpr list
   | Add of symexpr list
   | Exp of symexpr*symexpr
   | Div of symexpr*symexpr
   | Deriv of symexpr*((symvar*int) list)
   | NatExp of symexpr
   | Sub of symexpr list
   | Paren of symexpr
   | Decimal of float
   | Integer of int
   | Function of symvar*(symexpr list)
   | Eq of symexpr*symexpr

module SymExpr : 
sig
   val get_vars: symexpr -> string list
   val expr2str: symexpr -> string
end = 
struct

   let expr2str (e:symexpr) : string= 
      let rec _expr2str (e:symexpr) : string = 
         let exprlst2str (fn:'a -> string -> string) (lst:'a list) : string =
            match lst with
            | h::t -> List.fold_right fn  t (_expr2str h)
            | [] -> ""
         in
         match e with
         | Symbol(name) -> name
         | Integral(e,s) -> "Integral("^(_expr2str e)^","^(s)^")"
         | Cos(e) -> "cos("^(_expr2str e)^")"
         | Sin(e) -> "sin("^(_expr2str e)^")"
         | Tan(e) -> "tan("^(_expr2str e)^")"
         | Mult(es) -> exprlst2str (fun x r ->r^"*"^(_expr2str x)) es 
         | Add(es) -> exprlst2str (fun x r ->r^"+"^(_expr2str x)) es 
         | Exp(a,b) -> (_expr2str (Paren a))^"^"^(_expr2str (Paren b))
         | NatExp(a) -> "exp("^(_expr2str (Paren a))^")"
         | Sub(es)  -> exprlst2str (fun x r ->r^"-"^(_expr2str x)) es
         | Paren(e) -> "("^(_expr2str e)^")" 
         | Decimal(x) -> string_of_float x
         | Integer(x) -> string_of_int x
         | Div(n,d) -> (_expr2str (Paren n))^"/"^(_expr2str (Paren d))
         | Function(x,lst) -> x^"("^(exprlst2str (fun x r -> r^","^(_expr2str x)) lst)^")"
         | Deriv(e,lst) -> "Derivative("^(_expr2str e)^
            (List.fold_right (
               fun (v,n) r -> 
                  let sn = string_of_int n in
                  r^","^v^","^sn
            ) lst "")^")"
         | Eq(lhs,rhs) -> "Eq("^(_expr2str lhs)^","^(_expr2str rhs)^")"
      in 
         _expr2str e

   let rec get_vars (s:symexpr) : string list =
      let get_vars_explst (e:symexpr list) =
         List.fold_right (fun x r-> (get_vars x) @ r) e []
      in
      match s with 
      | Symbol(e) -> [e]
      | Integral(e,v) -> get_vars e
      | Cos(e) -> get_vars e
      | Sin(e) -> get_vars e
      | Tan(e) -> get_vars e 
      | Mult(e) -> get_vars_explst e
      | Add(e) -> get_vars_explst e 
      | Exp(e,t) -> get_vars_explst [e;t]
      | Div(a,b) -> get_vars_explst [a;b]
      | Deriv(e,v) -> get_vars e 
      | NatExp(e) -> get_vars e
      | Sub(e) -> get_vars_explst e 
      | Paren(e) -> get_vars e 
      | Decimal(_) -> []
      | Integer(_) -> [] 
      | Function(x,e) -> x::(get_vars_explst e)
      | Eq(a,b) -> get_vars_explst [a;b]

end