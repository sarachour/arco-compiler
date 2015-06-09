%{

open Printf
open Data

let env = Data.DEQEnv.create();
exception ParserError of string*string;;
%}


%token <string> SYMBOL
%token EOF SEMICOLON
%token OPARAN CPARAN
%token ADD SUB MULT DIV EXP
%token DERIV
%token EQ
%token <float> DECIMAL
%token <int> INTEGER




%type <Data.term> term
%type <Data.expr> addexpr
%type <Data.expr> expr
%type <Data.relation> relation
%type <Data.relation> declaration
%type <Data.DEQEnv.env> main

%start main

%%


main:
   toplevel {$1}
;

term:
   INTEGER {Integer($1)}
   | DECIMAL {Decimal($1)}
   | SYMBOL {Symbol($1)}
;

addexpr:
   expr ADD addexpr {
      let e = $1 and lst = $3 in 
      match lst with Add(elst) -> Add(e::elst) 
         | _ -> raise (ParserError ("Add Error","Expected type Add"))
   }
   | expr ADD expr {Add([$1;$3])}
;
subexpr:
   expr SUB subexpr {
      let e = $1 and lst = $3 in 
      match lst with Sub(elst) -> Sub(e::elst) 
         | _ -> raise (ParserError ("Sub Error","Expected type Sub"))
   }
   | expr SUB expr {Sub([$1;$3])}
;

mulexpr:
   expr MULT mulexpr {
      let e = $1 and lst = $3 in 
      match lst with Mult(elst) -> Mult(e::elst) 
         | _ -> raise (ParserError ("Mult Error","Expected type Mult"))
   }
   | expr MULT expr {Mult([$1;$3])}
;

expr:
   DERIV term SYMBOL SYMBOL {Deriv($2,$3,$4)}
   | OPARAN expr CPARAN {$2}
   | expr DIV expr {Div($1,$3)}
   | expr EXP term {Exp($1,$3)}
   | addexpr {$1}
   | mulexpr {$1}
   | subexpr {$1}
   | term {Term($1)}
;

relation:
   expr EQ relation {$1::$3}
   | expr {[$1]}

declaration:
   relation SEMICOLON {$1}

toplevel:
   declaration toplevel {Data.DEQEnv.add env $1; env}
   | EOF {env}
;