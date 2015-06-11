open ExtString

exception DiffEQASTException of string;;

type symbol = string;;

type term = 
  | Decimal of float
  | Integer of int
  | Symbol of symbol 
  | Hole
;;

type expr =
  | Deriv of term*symbol*symbol
  | Add of expr list
  | Sub of expr list
  | Mult of expr list
  | Div of expr*expr
  | Exp of expr*expr
  | Term of term
;;

type stmt = 
  | Eq of expr*expr
  | Decl of string*string*expr

let rec fillhole4expr (e:expr) (s:expr) : expr = 
    let rec _fill_expr (e:expr) : expr = 
      match e with
      | Add(e) -> Add (List.map (fun x -> _fill_expr x) e)
      | Sub(e) -> Sub (List.map (fun x -> _fill_expr x) e)
      | Mult(e) -> Mult (List.map (fun x -> _fill_expr x) e)
      | Div(e1,e2) -> Div ((_fill_expr e1), (_fill_expr e2))
      | Exp(e,t) -> Exp ((_fill_expr e),(_fill_expr t))
      | Term(Hole) -> s
      | t -> t
    in
      _fill_expr e

let rec subst4expr (e:expr) (subs:(string*string) list) : expr =
    let sub_word (s:string) : string = 
        match List.filter (fun (nw,targ) -> targ = s) subs with
          | [(nw,targ)] -> nw
          | [] -> s
          | _ -> raise (DiffEQASTException "repeated substitutions in list")
    in
    let sub_term (t:term) : term =
      match t with
        | Symbol(s) -> Symbol (sub_word s)
        | x -> x 
    in
    let rec sub_expr_list (e:expr list) : expr list = 
      match e with
        | h::t -> (subst4expr h subs)::(sub_expr_list t)
        | [] -> []
    in
    let rec sub_expr (e:expr) : expr =
      match e with
      | Term(t) -> Term (sub_term (t))
      | Add(e) -> Add (sub_expr_list e)
      | Sub(e) -> Sub (sub_expr_list e)
      | Mult(e) -> Mult (sub_expr_list e)
      | Div(e1,e2) -> Div ((sub_expr e1), (sub_expr e2))
      | Exp(e,t) -> Exp ((sub_expr e),(sub_expr t))
      | Deriv(a,s1,s2) -> Deriv (sub_term a, sub_word s1, sub_word s2)
    in
      sub_expr e

let rec eq2tex (e:expr) : string = 
   let sanitize s : string = 
      let rec _sanitize (lst: char list) (cap:bool): char list = 
        match (lst,cap) with
          | ('_'::t,_) -> _sanitize t true
          | ('-'::t,_) -> _sanitize t true
          | (x::t,true) -> (Char.uppercase x)::(_sanitize t false)
          | (x::t,false) -> (x)::(_sanitize t false)
          | ([],_) -> []
      in
        ExtString.String.implode (_sanitize (ExtString.String.explode s) false)
   in
   let term2tex (t:term) : string =
    match t with
      | Decimal(f) -> string_of_float f
      | Integer(i) -> string_of_int i
      | Symbol(s) -> sanitize s
      | Hole -> "@"
   in
   let rec exprlist2tex lst delim = 
      match lst with
      h::[] -> (eq2tex h)
      |h::t -> (eq2tex h)^delim^(exprlist2tex t delim)
      |[] -> ""
   in
    match e with
      | Deriv(t,dep,indep) -> "\\frac{\\delta "^(sanitize dep)^"} {\\delta "^(sanitize indep)^"} "^(term2tex t)^""
      | Add(t) -> exprlist2tex t " \\plus "
      | Sub(t) -> exprlist2tex t "-"
      | Mult(t) -> exprlist2tex t " \\cdot "
      | Div(a,b) -> "\\frac {"^(eq2tex a)^"} {"^(eq2tex b)^"}"
      | Exp(base,exp) -> " {"^(eq2tex base)^"}^{ "^(eq2tex exp)^" }"
      | Term(a) -> term2tex(a)

let stmt2tex (s:stmt) : string = 
    match s with
      | Eq(x,y) -> (eq2tex x)^"="^(eq2tex y)
      | Decl(q,n,e) ->q^" "^n^"="^(eq2tex e)

let rec stmts2tex (s:stmt list) : string = 
    match s with
      | h::t -> (stmt2tex h)^"\n"^(stmts2tex t)
      | [] -> ""

let rec eq2str (e:expr) : string = 
   let term2str (t:term) : string =
    match t with
      | Decimal(f) -> string_of_float f
      | Integer(i) -> string_of_int i
      | Symbol(s) -> s
      | Hole -> "@"
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
      | Exp(base,exp) -> (eq2str base)^"^"^"("^(eq2str exp)^")"
      | Term(a) -> term2str(a)

let stmt2str (s:stmt) : string = 
    match s with
      | Eq(x,y) -> (eq2str x)^"="^(eq2str y)
      | Decl(q,n,e) ->q^" "^n^"="^(eq2str e)

let rec stmts2str (s:stmt list) : string = 
    match s with
      | h::t -> (stmt2str h)^"\n"^(stmts2str t)
      | [] -> ""