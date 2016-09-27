%{
  open MathData
  open MathLib
  open Util
  open Unit
  open Common

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

%token CSTR IN MAG ERR

%token NAME TYPE LET NONE
%token INPUT OUTPUT LOCAL PARAM TIME
%token REL WITH
%token <string> STRING TOKEN OPERATOR
%token <float> DECIMAL
%token <int> INTEGER

%type <string> sexpr
%type <mid ast> expr
%type <meid ast> errexpr
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

errexpr:
  | expr {
    let s = $1 in
    let mp x =
      match x with
      |MVar(k,x,u) -> MEVar(k,x,u)
      |MParam(x,v,u) -> MEParam(x,v,y)
      |MTime(u) -> METime(u)
    let conv x =
      match x with
      | Func("E",[Term(MEVar(k,x,u))]) -> Some(Term(MEError(k,x,u)))
      | Func(_,_) -> error "errexp" "not expecting func"
    in
    let res = AST.trans (AST.map s mp) conv in
    res
  }

number:
  | DECIMAL   {let e = $1 in Decimal(e)}
  | INTEGER   {let e = $1 in Integer(e)}

numlist:
  | number                    {let e = $1 in [e]}
  | number COMMA numlist      {let lst = $3 and e = $1 in e::lst}


typ:
  | sexpr {UExpr(string_to_ast $1)}
  | NONE {UNone}
  | QMARK {UVariant}

erel:
  | expr EQ expr {
    let lhs : mid ast = $1 in
    let rhs : mid ast = $3 in
    let map_hwerr (x:mid): meid =
      match x with
      | MNVar(k,n,u) -> MEVar(k, n, u)
      | MNParam(n,v,u) -> MEParam(n,v,u)
      | MNTime(u) -> METime(u)
    in
    let trans_hwerr (x:meid ast): (meid ast) option =
      match x with
      | OpN(Func("E"), [Term(MEVar(k,x,u))]) -> Some (Term(MEError(k,x,u)))
      | OpN(Func(_), _) -> error "erel/trans_hwerr" "cannot have function"
      | _ -> None
    in
    let lhs = ASTLib.trans (ASTLib.map lhs map_hwerr) trans_hwerr in
    let rhs = ASTLib.trans (ASTLib.map rhs map_hwerr) trans_hwerr in
    match lhs with
    | Deriv(Term(MEError(knd,name,u)),Term(METime(ut))) -> (name,MEState(rhs))
    | Term(MEError(knd,name,u)) -> (name,MEFunction(rhs))
    | Deriv(Term(MEError(_,_,_)),_) -> error "erel" "unsupported time expression"
    | Deriv(Term(_),Term(_)) -> error "erel" "unsupported terms in derivative"
    | Deriv(_,_) -> error "erel" "unsupported derivative expression"
    | _ -> error "erel" "unsupported left hand side."
  }

rel:
  | expr EQ expr WITH TOKEN OPARAN INTEGER CPARAN EQ number {
      let lhs = $1 in
      let rhs = $3 in
      let ic = $10 and lbr = $6 and rbr = $8 and tic : int = $7 and icn = $5 in
      if tic <> 0 then
        error "rel_parse" "initial condition must be for t=0"
      else
      match lhs with
      |Term(MNVar(_,name)) ->
        error "rel_parse" ("stateless variable "^name^" is qualitifed with 'with' statement")
      |Deriv(Term(MNVar(k,name)), Term(MNTime)) ->
        if icn <> name then
          error "rel_parse" ("name of variable "^name^" must match initial condition variable name")
        else
          MathLib.mkstrel dat name rhs ic
      | Deriv(_,_) -> error "rel_parse" "not a supported derivative"
      | _ -> error "rel_parse" "could not parse relation."
    }
  | expr EQ expr {
    let lhs = $1 in
    let rhs = $3 in
    match lhs with
      | Term(MNVar(k, name)) ->
        if k = MInput then error "rel" "input cannot be on lhs." else
        MathLib.mkrel dat name rhs
      | Deriv(Term(MNVar(_,name)),wrt) ->
        error "rel_parse" ("variable with state "^name^" missing the 'with V(0) = 0.001' clause")
      | _ -> error "rel_parse" ("disallowed left hand side.")
  }


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
  | CSTR MAG TOKEN IN OBRAC numlist CBRAC typ EOL {
    let name : string= $3 in
    let bounds = $6 in
    if List.length bounds == 2 then
       let min : number = List.nth bounds 0 in
       let max : number = List.nth bounds 1 in
       let typ : unt = $8 in 
       MathLib.set_mag dat name min max typ
    else
       error "cstr mag" "bounds is more than two elements"
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
