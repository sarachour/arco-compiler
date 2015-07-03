%{

open Printf
open SymCamlData


%}



%token <string> TOKEN
%token <float> DECIMAL
%token <int> INTEGER
%token COMMA OPARAN CPARAN EOF APOS QUOTE



%type <SymCamlData.spy_expr> main
%type <SymCamlData.spy_expr list> arglist
%type <SymCamlData.spy_expr> arg


%start main

%%

main:
   QUOTE arg QUOTE {let c = $2 in c}
;

arglist:
   | arg {let a = $1 in [a]}
   | arg COMMA arglist {let t = $3 and h = $1 in h::t}
;

arg:
  | TOKEN OPARAN APOS TOKEN APOS CPARAN {
   let name = $1 and varname = $4 in
   if name = "Symbol" then
      Symbol(varname)
   else 
      raise (SymCamlParserError "only symbols can have token arguments")
  }
  | TOKEN OPARAN INTEGER CPARAN {
   let name = $1 and value = $3 in
   if name = "Integer" then
      Integer(value)
   else 
      raise (SymCamlParserError "only integers can have int arguments")
  }
  | TOKEN OPARAN DECIMAL CPARAN {
   let name = $1 and value = $3 in
   if name = "XXX" then
      Decimal(value)
   else 
      raise (SymCamlParserError "only XXX can have decimal arguments")
  }
  | TOKEN OPARAN arglist CPARAN {
   let name = $1 and lst = $3 in
   match (name,List.length lst) with
   | ("Pow",2) -> Exp(List.nth lst 0,List.nth lst 1)
   | ("Add",_) -> Add(lst)
   | ("Mul",_) -> Mult(lst)
   | (n,l) -> raise (SymCamlParserError 
      ("unexpected function "^n^" or number of arguments "^(string_of_int l)))
  }
;

%%
