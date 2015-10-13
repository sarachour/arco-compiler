%{
  open Math
  open Util
  open Unit

  open AST
  open ParseGenUtil

  let dat = MathLib.mkenv()

  exception ParseMathError of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseMathError(s,n))

%}

%token EOF EOL COLON
%token NAME TYPE LET EQ INPUT OUTPUT LOCAL PARAM TIME REL WITH
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

rel:
  | expr EQ expr WITH TOKEN OPERATOR INTEGER OPERATOR EQ number {
      let lhs = string_to_ast $1 in
      let rhs = string_to_ast $3 in
      let ic = $10 and lbr = $6 and rbr = $8 and tic : int = $7 and icn = $5 in
      if lbr <> "(" || rbr <> ")" then
        error "rel_parse" "expecting parens around initial condition"
      else if tic <> 0 then
        error "rel_parse" "initial condition must be for t=0"
      else
      match lhs with
      |Term(Literal(name)) ->
        error "rel_parse" ("stateless variable "^name^" is qualitifed with 'with' statement")
      |Term(Deriv(name, wrt)) ->
        if wrt <> "t" then
          error "rel_parse" ("derivative of "^name^" can only be wrt t")
        else if icn <> name then
          error "rel_parse" ("name of variable "^name^" must match initial condition variable name")
        else
          MathLib.mkstrel dat name rhs ic
    }
  | expr EQ expr {
    let lhs = string_to_ast $1 in
    let rhs = string_to_ast $3 in
    match lhs with
      | Term(Literal(name)) ->
        MathLib.mkrel dat name rhs
      | Term(Deriv(name,wrt)) ->
        error "rel_parse" ("variable with state "^name^" missing the 'with V(0) = 0.001' clause")

  }

st:
  | NAME STRING EOL                       {

  }
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
  | OUTPUT TOKEN COLON typ EOL {
    let knd : mkind = Output in
    let name : string = $2 in
    let typ : unt = UExpr($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | LOCAL TOKEN COLON typ EOL {
    let knd : mkind = Local in
    let name : string = $2 in
    let typ : unt = UExpr($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | PARAM TOKEN COLON typ EQ number EOL {
    let knd : mkind = Param($6) in
    let name : string = $2 in
    let typ : unt = UExpr($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | TIME TOKEN COLON typ EOL {
    error "time_parse" "unimplemented"
  }
  | REL rel EOL {
    ()
  }
  | EOL  {

  }

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
