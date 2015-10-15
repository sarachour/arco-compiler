
%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token ADD SUB MULT POW OPAR CPAR COMMA DIV EOF OBRAC CBRAC EXP DERIV SCOLON



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


%type <string AST.ast> toplvl

%type <string> term
%type <(string AST.ast) list> explst

%type <indices> ind
%type <string AST.ast> par
%type <string AST.ast> pow
%type <string AST.ast> md
%type <string AST.ast> sa
%type <string AST.ast> expr

%start toplvl

%%

explst(node,delim):
  | node delim node {let el1 = $1 and el2 = $3 in [el1;el2]}
  | node delim explst(node,delim) {let el = $1 and lst = $3 in el::lst}

term:
  | TOKEN {let name = $1 in name}

ind:
  | INTEGER {let n = $1 in Index(n)}
  | INTEGER SCOLON INTEGER   {let s = $1 and e = $3 in Range(s,e)}
  | SCOLON INTEGER          {let n = $2 in ToStart(n)}
  | INTEGER SCOLON          {let n = $1 in ToEnd(n)}

par:
  | term OPAR expr CPAR {let name = $1 and arg = $3 in OpN(Func(name),[arg])}
  | term OPAR explst(expr,COMMA) CPAR {let name = $1 and args = $3 in OpN(Func(name),args)}
  | expr OBRAC ind CBRAC {let name = $1 and ind = $3 in Acc(name,ind)}
  | expr OBRAC explst(ind,COMMA) CBRAC {let name = $1 and inds = $3 in Acc(name, And(inds))}
  | DERIV OPAR expr COMMA expr CPAR {
      let a = $3 and b =$5 in
      match (a,b) with
      | (x,v) -> Deriv(a, b)
  }
  | EXP OPAR expr CPAR {
      let a = $3 in
      Op1(Exp,a)
  }

pow:
  | par {let e = $1 in e}
  | OPAR expr CPAR { let e = $2 in e}
  | DECIMAL {let dec = $1 in Decimal(dec)}
  | INTEGER {let dec = $1 in Integer(dec)}
  | explst(expr,POW) {
    let args = $1 in
    let _ = assert_len args 2 "pow must have two args" in
    Op2(Power, get args 0, get args 1)
  }
  | term {let term = $1 in Term(term)}

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
  | SUB md {
      let e = $2 in Op1(Neg,e)
  }

sa:
  | md     {
    let e = $1 in e
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
  | sa {let exp = $1 in exp}

toplvl:
  | expr EOF {let exp = $1 in exp}
