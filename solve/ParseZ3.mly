%{
  open Z3Data
  open Util


  exception ParseZ3Error of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseZ3Error(s,n))

%}


%token EOF EOL OPARAN CPARAN
%token SAT UNSAT BOOLTYPE INTTYPE MODEL DEFINEFUN ERROR

%token <string> TOKEN STRING Z3VAR
%token <int> INTEGER
%token <bool> BOOL

%type <unit> errorst
%type <Z3Data.z3assign option> assignm
%type <Z3Data.z3assign list> assignms
%type <Z3Data.z3model> model
%type <Z3Data.z3sln> stmts
%type <Z3Data.z3sln option> env

%start env

%%


errorst:
  | OPARAN ERROR STRING CPARAN {()}

assignm:
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN BOOLTYPE BOOL CPARAN {
    let n = $3 in
    let v = $7 in
    Some (Z3SetBool(n,v))
  }
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN INTTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    Some (Z3SetInt(n,v))
  }
  | OPARAN DEFINEFUN Z3VAR OPARAN CPARAN INTTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    None
  }
  | OPARAN DEFINEFUN Z3VAR OPARAN CPARAN BOOLTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    None
  }

assignms:
  | assignm          {
    let h = $1 in match h with
    | Some(h) -> [h]
    | None -> []
  }
  | assignms assignm {
    let h = $2 in let t = $1 in
    match h with
    | Some(h) -> h::t
    | None -> t
  }

model:
  | OPARAN MODEL assignms CPARAN {$3}
    | OPARAN MODEL CPARAN {[]}

sat:
  | SAT           {true}
  | UNSAT         {false}

stmts:
  | errorst {
    {sat=false;model=None}
  }
  | sat           {
    {sat=$1;model=None}
  }

  | stmts sat     {
    let q = $1 in
    let s = $2 in
    {sat=s; model=q.model}
  }
  | stmts model   {
    let x = $1 in
    let mdl = $2 in
    let _ = x.model <- Some mdl in
    x
  }
  | stmts errorst {
    let q = $1 in
    q
  }




env :
  | stmts EOF {Some $1}
  | EOF       {None}
