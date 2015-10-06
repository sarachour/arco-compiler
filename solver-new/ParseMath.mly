%{
  open Math
  open Util

  let env_ref = REF.mk (MathLib.create_env())
  exception ParseMathError of string*string

  let error s n = raise (ParseMathError(s,n))

%}

%token EOF EOL VBAR COLON
%token NAME
%token <string> STRING
%token <string> EXPR
%token <string> TYPE
%type <unit> seq
%type <unit> st
%type <Math.menv option> env

%start env

%%

st:
  | NAME COLON STRING EOL {}

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (REF.deref env_ref)}
  | EOF     {None}
