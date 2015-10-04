%{
  open AST

  exception ParseASTException of string*string

  let error n m = raise (ParseASTException (n,m) )

  let fun_to_ast(name,args) =
    match (name, List.length args) with
    | _ -> error "fun_to_ast" "unimplemented"

  let to_tuple2 lst =
    (List.get lst 0, List.get lst 1)

  let to_elem lst =
    List.get lst 0

  let assert_len lst len msg =
    if (List.length lst) = len then
      lst
    else
      error "assert_len" lsg
%}

%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token ADD SUB DERIV EXP PAREN MULT POW OPAR CPAR COMMA DIV

%type <string AST.ast_term> term
%type <(string AST.ast list)> explst

%type <string AST.ast> expr
%type <string AST.ast> par
%type <string AST.ast> pow
%type <string AST.ast> md
%type <string AST.ast> sa

%start expr

%%

explst(node,delim):
  | node {let el = $1 in el}
  | node delim explst(node,delim) {let el = $1 and lst = $3 in el::lst}

term:
  | TOKEN {let name = $1 in Literal(name)}

par:
  | OPAR expr CPAR {}
  | TOKEN OPAR explst(expr,COMMA) CPAR {
    let name = $1 and args = $3 in
    fun_to_ast(name,args)
  }
  | term {Term(term)}

pow:
  | explst(par,POW) {
    let args = $1 in
    assert_len args 2 "pow must have two args";
    Op2(Power, to_tuple2 args)
  }

md:
  | explst(par,MULT) {
    let args = $1 in
    OpN(Mult, args)
  }
  | explst(par,DIV) {
    let args = $1 in
    assert_len args 2 "div must have two args";
    Op2(Div, to_tuple2 args)
  }

sa:
  | explst(par,ADD) {
    let args = $1 in
    OpN(Add,args)
  }
  | explst(par,SUB) {
    let args = $1 in
    OpN(Sub,args)
  }

expr:
  | sa {let exp = $1 in exp}
