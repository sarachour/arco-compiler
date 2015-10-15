%{
  open HW
  open Util
  open Unit

  open AST
  open ParseGenUtil

  let dat = HwLib.mkenv()

  exception ParseHwError of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseHwError(s,n))

%}


%token EOF EOL
%token EQ COLON QMARK COMMA
%token TYPE LET NONE

%token PROP TIME
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%type<string list> strlist
%type <string> expr
%type <unt> typ
%type <float> number

%type <unit> st
%type <unit> seq
%type <HW.hwenv option> env

%start env

%%

strlist:
  | TOKEN                    {let e = $1 in [e]}
  | TOKEN COMMA strlist      {let lst = $3 and e = $1 in e::lst }

expr:
  | OPERATOR          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in string_of_float e}
  | expr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | expr DECIMAL      {let rest = $1 and e = string_of_float $2 in rest^e}
  | expr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | expr OPERATOR     {let rest = $1 and e = $2 in rest^e}
  | expr COMMA        {let rest = $1 in rest^"," }


number:
  | DECIMAL   {let e = $1 in e}
  | INTEGER   {let e = $1 in float(e)}

typ:
  | expr {UExpr(string_to_ast $1)}
  | NONE {UNone}
  | QMARK {UVariant}

st:
  | TYPE TOKEN EOL  {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET number TOKEN EQ number TOKEN EOL  {
    let u1 = $3 and n1 = $2 in
    let u2 = $6 and n2 = $5 in
    dat.units <- UnitLib.mkrule (dat.units) u1 n1 u2 n2
  }
  | PROP TOKEN COLON strlist EOL {
    let units = $4 and name = $2 in
    let _ = HwLib.mkprop dat name units in
    ()
  }
  | TIME TOKEN COLON strlist EOL {
    let units = $4 and name = $2 in
    let _ = HwLib.mktime dat name units in
    ()
  }
  | EOL             {}

seq:
  | st              {}
  | seq st          {}

env:
  | seq EOF {Some (dat)}
  | EOF     {None}
