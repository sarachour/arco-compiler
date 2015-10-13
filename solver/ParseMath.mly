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

%token EOF EOL VBAR COLON
%token NAME TYPE LET EQ INPUT OUTPUT LOCAL PARAM TIME
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%type <string> expr
%type <string> rest
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

rest:
  | VBAR rest         {"|"^$2}
  | COLON rest        {":"^$2}
  | TYPE rest         {"type "^$2}
  | TOKEN rest        {$1^" "^$2}
  | DECIMAL rest      {(string_of_float $1)^" "^$2}
  | INTEGER rest      {(string_of_int $1)^" "^$2}
  | STRING rest       {"\""^$1^"\" "^$2}
  | OPERATOR rest     {$1^" "^$2}
  | EQ rest           {"= "^$2}
  | EOL {""}

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
  | PARAM TOKEN rest {let name = $2 and r = $3 in
    error "param_parse" ("param "^name^" with expression <"^r^"> malformed.\n   parameter definitions are: param name : type = decimal")}
  | TIME TOKEN COLON typ EOL {
    error "time_parse" "unimplemented"
  }
  | EOL  {

  }
  | TOKEN {
    let name = $1 in
    error "stmt" ("unknown identifier "^name)
  }

seq:
  | st    {}
  | seq st {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
