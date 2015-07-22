
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
end = 
struct
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