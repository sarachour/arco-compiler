%{
  open Math
  open Util
  open Unit

  let dat = MathLib.mkenv()
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
  | TYPE TOKEN EOL                        {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET NUMBER TOKEN EQ NUMBER TOKEN EOL  {
    let u1 = $3 and n1 = $2 in
    let u2 = $6 and n2 = $5 in
    dat.units <- UnitLib.add_rule (dat.units) u1 n1 u2 n2
  }
  | EOL                                   {}

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
