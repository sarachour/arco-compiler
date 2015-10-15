
%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token ADD SUB MULT POW OPAR CPAR COMMA DIV EOF OBRAC CBRAC DOT EXP DERIV



%{
  open AST

  exception ParseASTException of string*string

  let error n m = raise (ParseASTException (n,m) )

  let get lst i =
    List.nth lst i

  let to_elem lst =
    List.nth lst 0

  let assert_len lst len msg =
    if (List.length lst) = len then
      lst
    else
      error "assert_len" msg
%}


%type <string AST.ast> expr

%type <string> term
%type <(string AST.ast) list> explst

%type <string AST.ast> par
%type <string AST.ast> pow
%type <string AST.ast> md
%type <string AST.ast> sa

%start expr

%%

explst(node,delim):
  | node delim node {let el1 = $1 and el2 = $3 in [el1;el2]}
  | node delim explst(node,delim) {let el = $1 and lst = $3 in el::lst}

term:
  | TOKEN {let name = $1 in name}
  | term OBRAC explst(term,COMMA) CBRAC {
    "unknown"
  }
  | term OPAR explst(term,COMMA) CPAR {
    "unknown"
  }
  | term DOT TOKEN {let a = $1 and b = $3 in a^"."^b}



par:
  | OPAR expr CPAR { let e = $2 in e}
  | DERIV OPAR term COMMA term CPAR {
      let a = $3 and b =$5 in
      match (a,b) with
      | (x,"t") -> Term(Deriv(x, "t"))
      | (x, _ )-> error "deriv" "only supports derivatives with respect to t"
    }
  | EXP OPAR expr CPAR {
      let a = $3 in
      Op1(Exp,a)
  }
  | term {let term = $1 in Term(Literal(term))}
  | DECIMAL {let dec = $1 in Decimal(dec)}
  | INTEGER {let dec = $1 in Integer(dec)}

pow:
  | par {let e = $1 in e}
  | explst(par,POW) {
    let args = $1 in
    let _ = assert_len args 2 "pow must have two args" in
    Op2(Power, get args 0, get args 1)
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
    Op2(Div, get args 0, get args 1)
  }

sa:
  | md     {
    let e = $1 in e
  }
  | SUB md {
      let e = $2 in Op1(Neg,e)
  }

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
