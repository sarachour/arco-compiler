%{
  open Math
  open Util
  open Unit

  open AST
  open ParseGenUtil

  let dat = MathLib.mkenv()
  exception ParseMathError of string*string

  let error s n = raise (ParseMathError(s,n))

%}

%token EOF EOL VBAR COLON
%token NAME TYPE LET EQ INPUT OUTPUT LOCAL PARAM
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%type <string> expr
%type <untid ast> typ
%type <float> number
%type <unit> seq
%type <unit> st
%type <Math.menv option> env

%start env

%%

expr:
  | OPERATOR          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in string_of_float e}
  | expr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | expr DECIMAL      {let rest = $1 and e = string_of_float $2 in rest^e}
  | expr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | expr OPERATOR     {let rest = $1 and e = $2 in rest^e}


number:
  | DECIMAL   {let e = $1 in e}
  | INTEGER   {let e = $1 in float(e)}

typ:
  | expr {string_to_ast $1}


st:
  | NAME STRING EOL                       {}
  | TYPE TOKEN EOL                        {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET number TOKEN EQ number TOKEN EOL  {
    let u1 = $3 and n1 = $2 in
    let u2 = $6 and n2 = $5 in
    dat.units <- UnitLib.mkrule (dat.units) u1 n1 u2 n2
  }
  | INPUT TOKEN COLON typ EOL {
    let knd : mkind = Input in
    let name : string = $2 in
    let typ : unt = UExpr($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | OUTPUT TOKEN COLON expr EOL {

  }
  | LOCAL TOKEN COLON expr EOL {

  }
  | PARAM TOKEN COLON expr EQ number EOL {

  }
  | EOL                                  {

  }

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
