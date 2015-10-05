
%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token ADD SUB MULT POW OPAR CPAR COMMA DIV EOF



%{
  open AST

  exception ParseASTException of string*string

  let error n m = raise (ParseASTException (n,m) )

  let fun_to_ast(name,args) =
    match (name, List.length args) with
    | ("deriv",2) -> error "fun_to_ast" "deriv"
    | ("exp", 2)
    | _ -> error "fun_to_ast" "unimplemented"

  let to_tuple2 lst =
    (List.nth lst 0, List.nth lst 1)

  let to_elem lst =
    List.nth lst 0

  let assert_len lst len msg =
    if (List.length lst) = len then
      lst
    else
      error "assert_len" msg
%}


%type <string AST.ast> expr
(*
%type <string ast_term> term
%type <(string AST.ast) list> explst

%type <string AST.ast> par
%type <string AST.ast> pow
%type <string AST.ast> md
%type <string AST.ast> sa
*)
%start expr

%%

explst(node,delim):
  | node delim node {let el1 = $1 and el2 = $3 in [el1;el2]}
  | node delim explst(node,delim) {let el = $1 and lst = $3 in el::lst}

term:
  | TOKEN {let name = $1 in Literal(name)}

par:
  | OPAR expr CPAR { let e = $2 in e}
  | TOKEN OPAR explst(expr,COMMA) CPAR {
    let name = $1 and args = $3 in
    match fun_to_ast(name,args) with
    | Some(v) -> v
    | None -> error "fun_parse" "function doesn't exist"
  }
  | term {let term = $1 in Term(term)}
  | DECIMAL {let dec = $1 in Decimal(dec)}
  | INTEGER {let dec = $1 in Integer(dec)}

pow:
  | par {let e = $1 in e}
  | explst(par,POW) {
    let args = $1 in
    let _ = assert_len args 2 "pow must have two args" in
    Op2(Power, to_tuple2 args)
  }

md:
  | pow {let e = $1 in e}
  | explst(pow,MULT) {
    let args = $1 in
    OpN(Mult, args)
  }
  | explst(pow,DIV) {
    let args = $1 in
    let _ = assert_len args 2 "div must have two args" in
    Op2(Div, to_tuple2 args)
  }

sa:
  | SUB md {let e = $2 in Op1(Neg,e)}
  | explst(md,ADD) {
    let args = $1 in
    OpN(Add,args)
  }
  | explst(md,SUB) {
    let args = $1 in
    OpN(Sub,args)
  }

expr:
  | sa EOF {let exp = $1 in exp}
