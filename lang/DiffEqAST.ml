
type symbol = string;;

type term = 
  Decimal of float
  | Integer of int
  | Symbol of symbol 
;;

type expr =
  Deriv of term*symbol*symbol
  | Add of expr list
  | Sub of expr list
  | Mult of expr list
  | Div of expr*expr
  | Exp of expr*term
  | Term of term
;;


let rec eq2tex (e:expr) : string = 
   let term2tex (t:term) : string =
    match t with
      | Decimal(f) -> string_of_float f
      | Integer(i) -> string_of_int i
      | Symbol(s) -> s
   in
   let rec exprlist2tex lst delim = 
      match lst with
      h::[] -> (eq2tex h)
      |h::t -> (eq2tex h)^delim^(exprlist2tex t delim)
      |[] -> ""
   in
    match e with
      | Deriv(t,dep,indep) -> "\\frac{\\delta "^dep^"} {\\delta "^indep^"} "^(term2tex t)^""
      | Add(t) -> exprlist2tex t "\\plus"
      | Sub(t) -> exprlist2tex t "-"
      | Mult(t) -> exprlist2tex t "\\cdot"
      | Div(a,b) -> "\\frac {"^(eq2tex a)^"} {"^(eq2tex b)^"}"
      | Exp(base,exp) -> "{"^(eq2tex base)^"}^{"^(term2tex exp)^"}"
      | Term(a) -> term2tex(a)


let rec eq2str (e:expr) : string = 
   let term2str (t:term) : string =
    match t with
      | Decimal(f) -> string_of_float f
      | Integer(i) -> string_of_int i
      | Symbol(s) -> s
   in
   let rec exprlist2str lst delim = 
      match lst with
      h::[] -> (eq2str h)
      |h::t -> (eq2str h)^delim^(exprlist2str t delim)
      |[] -> ""
   in
    match e with
      | Deriv(t,dep,indep) -> "d"^dep^"/d"^indep^"("^(term2str t)^")"
      | Add(t) -> exprlist2str t "+"
      | Sub(t) -> exprlist2str t "-"
      | Mult(t) -> exprlist2str t "*"
      | Div(a,b) -> (eq2str a)^"/"^(eq2str b)
      | Exp(base,exp) -> (eq2str base)^"^"^"("^(term2str exp)^")"
      | Term(a) -> term2str(a)
