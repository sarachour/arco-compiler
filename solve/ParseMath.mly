%{
  open MathData
  open MathLib
  open IntervalData 
  open IntervalLib
  open Util
  open Unit

  open AST
  open CompileUtil

  let dat = MathLib.mkenv()

  exception ParseMathError of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseMathError(s,n))

  let mkrng (m,x) =
    (float_of_number m,float_of_number x)
%}

%token EOF EOL COLON QMARK EQ OBRAC CBRAC OPARAN CPARAN COMMA

%token DEF IN MAG VAR

%token NAME TYPE LET NONE
%token INPUT OUTPUT LOCAL PARAM TIME
%token REL INIT DDT  
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%token SHAPE GAUSS UNIFORM POISS

%type <string> sexpr
%type <mid ast> expr
%type <unt> typ
%type <number> number
%type <unit> seq
%type <unit> st
%type <MathData.mid MathData.menv option> env

%start env

%%



sexpr:
  | OPERATOR          {let e = $1 in e}
  | TOKEN             {let e = $1 in e}
  | INTEGER           {let e = $1 in string_of_int e}
  | DECIMAL           {let e = $1 in str_of_float e}
  | OPARAN            {"("}
  | sexpr INTEGER      {let rest = $1 and e = string_of_int $2 in rest^e}
  | sexpr DECIMAL      {let rest = $1 and e = str_of_float $2 in rest^e}
  | sexpr TOKEN        {let rest = $1 and e = $2 in rest^e}
  | sexpr OPERATOR     {let rest = $1 and e = $2 in rest^e}
  | sexpr OPARAN       {let rest = $1 in rest^"("}
  | sexpr CPARAN       {let rest = $1 in rest^")"}
  | sexpr COMMA        {let rest = $1 in rest^","}

expr:
  | sexpr {
    let s = $1 in
    let am = string_to_ast s in
    let ast2id x =
      if MathLib.hasvar dat x then
         let v = MathLib.getvar dat x in
         MNVar(v.knd,v.name)
      else if MathLib.isparam dat x then
        let v = MathLib.getparam dat x in
        MNParam(v.name,v.value)
      else
        MNTime
    in
    let am : mid ast = ASTLib.map am ast2id in
    am
  }

number:
  | DECIMAL   {let e = $1 in Decimal(e)}
  | INTEGER   {let e = $1 in Integer(e)}

numlist:
  | number                    {let e = $1 in [e]}
  | number COMMA numlist      {let lst = $3 and e = $1 in e::lst}

flt:
  | DECIMAL   {let e = $1 in (e)}
  | INTEGER   {let e = $1 in float_of_int (e)}

fltlist:
  | flt                    {let e = $1 in [e]}
  | flt COMMA fltlist      {let lst = $3 and e = $1 in e::lst}


shape:
  | GAUSS {STCHGAUSS}
  | UNIFORM {STCHUNIFORM}
  | POISS {STCHPOISS}
typ:
  | sexpr {UExpr(string_to_ast $1)}
  | NONE {UNone}
  | QMARK {UVariant}


st:
  | NAME STRING EOL                       {

  }
  | TYPE TOKEN EOL                        {
    let t = $2 in
    dat.units <- UnitLib.define dat.units t
  }
  | LET number TOKEN EQ number TOKEN EOL  {
    let u1 = $3 and n1 = float_of_number $2 in
    let u2 = $6 and n2 = float_of_number $5 in
    dat.units <- UnitLib.mkrule (dat.units) u1 n1 u2 n2
  }
  | INPUT TOKEN COLON typ EOL {
    let knd : mkind = MInput in
    let name : string = $2 in
    let typ : unt = ($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | DEF TOKEN MAG EQ OBRAC QMARK CBRAC typ EOL {
    let v = $2 in
    MathLib.upd_def dat v (fun x -> match x with
    | MDefVar(d) -> d.ival <- IntervalLib.mkdflt_ival (); x 
    | MDefStVar(d) -> d.stvar.ival <- IntervalLib.mkdflt_ival ();x
    );
    ()

  }
  | DEF DDT TOKEN MAG EQ OBRAC QMARK CBRAC typ EOL {
    let v = $3 in
    MathLib.upd_def dat v (fun x -> match x with
    | MDefStVar(d) -> d.deriv.ival <- IntervalLib.mkdflt_ival();x
    | _ -> error "def ddt mag" "must be defined after relation"
    );
    ()
  }

  | DEF TOKEN MAG EQ OBRAC fltlist CBRAC typ EOL {
    let name : string= $2 in
    let bounds = $6 in
    if List.length bounds == 2 then
       let min : float = List.nth bounds 0 in
       let max : float = List.nth bounds 1 in
       let typ : unt = $8 in 
       MathLib.upd_def dat name (fun x -> match x with
       | MDefVar(d) -> d.ival <- IntervalLib.mk_ival min max; x
       | MDefStVar(d) -> d.stvar.ival <- IntervalLib.mk_ival min max; x
       );
       ()
   else
       error "cstr mag" "bounds is more than two elements"
  }
  | DEF DDT TOKEN MAG EQ OBRAC fltlist CBRAC typ EOL {
    let name : string= $3 in
    let bounds = $7 in
    if List.length bounds == 2 then
       let min : float = List.nth bounds 0 in
       let max : float = List.nth bounds 1 in
       let typ : unt = $9 in 
       MathLib.upd_def dat name (fun x -> match x with
       | MDefStVar(d) -> d.deriv.ival <- IntervalLib.mk_ival min max; x
       | _ -> error "def ddt mag []" "must be defined after relation"
       );
       ()
    else
       error "cstr mag" "bounds is more than two elements"
  }
  | DEF DDT TOKEN TIME number {
    let name = $3 and step = $5 in
    MathLib.upd_def dat name (fun x -> match x with
       | MDefStVar(d) -> d.time_step <- step; x
       | _ -> error "def ddt time" "must be defined after relation"
       );
  }
  | OUTPUT TOKEN COLON typ EOL {
    let knd : mkind = MOutput in
    let name : string = $2 in
    let typ : unt = ($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | LOCAL TOKEN COLON typ EOL {
    let knd : mkind = MLocal in
    let name : string = $2 in
    let typ : unt = ($4) in
    MathLib.mkvar dat name knd typ;
    ()
  }
  | PARAM TOKEN COLON typ EQ number EOL {
    let name : string = $2 in
    let typ : unt = $4 in
    let vl : number = $6 in
    MathLib.mkparam dat name vl typ;
    ()
  }
  | TIME TOKEN COLON typ EOL {
    let typ : unt = $4 in
    let name : string = $2 in
    MathLib.mktime dat name typ;
    ()
  }
  | VAR DDT TOKEN EQ expr SHAPE shape EOL {
      let rhs = $5 and v = $3 and shape = $7 in
      MathLib.mkstd dat v rhs shape;
      ()
  }

  | VAR TOKEN EQ expr SHAPE shape EOL {
      let rhs = $4 and v = $2 and shape = $6 in
      MathLib.mkstd dat v rhs shape;
      ()
  }
  | REL DDT TOKEN EQ expr INIT number EOL {
      let rhs = $5 in
      let v = $3 in
      let ic = $7 in
      MathLib.mkstrel dat v rhs ic;
      ()
  }

  | REL TOKEN EQ expr EOL {
      let rhs = $4 in
      let v = $2 in 
      MathLib.mkrel dat v rhs;
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
