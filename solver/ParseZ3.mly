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

%token <string> TOKEN STRING
%token <int> INTEGER
%token <bool> BOOL

%type <Z3Data.z3assign> assignm
%type <Z3Data.z3assign list> assignms
%type <Z3Data.z3model> model
%type <Z3Data.z3sln> stmts
%type <Z3Data.z3sln option> env

%start env

%%


assignm:
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN BOOLTYPE BOOL CPARAN {
    let n = $3 in
    let v = $7 in
    Z3SetBool(n,v)
  }
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN INTTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    Z3SetInt(n,v)
  }


errorst:
  | error OPARAN ERROR STRING CPARAN {()}

assignms:
  | assignm          {
    let h = $1 in [h]
  }
  | assignms assignm {
    let h = $2 in let t = $1 in
    h::t
  }

model:
  | OPARAN MODEL assignms CPARAN {$3}

stmts:
  | sat           {{sat=$1;model=None}}
  | stmts model   {
    let x = $1 in
    let mdl = $2 in
    let _ = x.model <- Some mdl in
    x
  }
  | stmts errorst {
    $1
  }

sat:
  | SAT           {true}
  | UNSAT         {false}


env :
  | stmts EOF {Some $1}
  | EOF       {None}
