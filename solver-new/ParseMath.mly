%{
  open Math
  open Util

  let env_ref = REF.mk (MathLib.create_env())
  exception ParseMathError of string*string

  let error s n = raise (ParseMathError(s,n))

%}

%token EOF EOL VBAR COLON
%token NAME TYPE LET EQ
%token <string> STRING TOKEN
%token <float> NUMBER
%type <unit> seq
%type <unit> st
%type <Math.menv option> env

%start env

%%

st:
  | NAME STRING EOL                       {}
  | TYPE TOKEN EOL                        {}
  | LET NUMBER TOKEN EQ NUMBER TOKEN EOL  {}
  | EOL                                   {}

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (REF.deref env_ref)}
  | EOF     {None}
