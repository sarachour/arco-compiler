%{
  open Z3Data
  open AST
  open Util


  exception ParseZ3Error of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseZ3Error(s,n))

  let debug (s:string) =
    Printf.printf "[z3-debug] %s\n" s;
    flush_all ();
    ()
%}


%token EOF EOL OPARAN CPARAN
%token SAT UNSAT BOOLTYPE INTTYPE REALTYPE MODEL DEFINEFUN DIV ERROR
%token PLUS MULT MINUS LT LTE GT GTE INFTY OBJECTIVES
%token <string> TOKEN STRING Z3VAR
%token <int> INTEGER
%token <float> FLOAT
%token <bool> BOOL

%type <unit> errorst
%type <string AST.ast> expr
%type <float> real
%type <Z3Data.z3assign option> assignm
%type <Z3Data.z3assign list> assignms
%type <Z3Data.z3model> model
%type <Z3Data.z3sln> stmts
%type <Z3Data.z3sln option> env

%start env

%%


lst(E):
  | E                            {[$1]}
  | E lst(E)                     {$1::$2}

expr:
  | OPARAN PLUS lst(expr) CPARAN {OpN(Add,$3)}
  | OPARAN MULT lst(expr) CPARAN {OpN(Mult,$3)}
  | OPARAN MINUS lst(expr) CPARAN {OpN(Sub,$3)}
  | OPARAN TOKEN lst(expr) CPARAN {OpN(Func($2),$3)}
  | FLOAT                        {Decimal($1)}
  | INTEGER                      {Integer($1)}
  | TOKEN                        {Term($1)}
  | OPARAN LTE lst(expr) CPARAN      {Term("?")}  
  | OPARAN GTE lst(expr) CPARAN      {Term("?")}  
  | OPARAN LT lst(expr) CPARAN      {Term("?")}  
  | OPARAN GT lst(expr) CPARAN      {Term("?")}  
  | OPARAN lst(expr) CPARAN      {Term("?")}  

bnd:
  | INTEGER                     {()}
  | FLOAT                       {()}
  | OPARAN MINUS bnd CPARAN     {()}
  | INFTY                       {()}
  
cost:
  | OPARAN MULT bnd bnd CPARAN  {()}
  | INTEGER                     {()}

objectives:
  | OPARAN OBJECTIVES
           OPARAN expr cost CPARAN
    CPARAN
    {
      ()
    }


errorst:
  | OPARAN ERROR STRING CPARAN {
    debug ("[Z3-Error] "^$3);
    ()
}

real:
  | OPARAN DIV FLOAT FLOAT CPARAN {
    let numer = $3 and denom = $4 in
    numer/.denom
  }
  | FLOAT {
    $1
  }
  | OPARAN MINUS real CPARAN {
    let v = $3 in
    0.0 -. v
  }

assignm:
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN BOOLTYPE BOOL CPARAN {
    let n = $3 in
    let v = $7 in
    Some (Z3Set(n,Z3QBool(v)))
  }
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN INTTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    Some (Z3Set(n,Z3QInt(v)))
  }
  | OPARAN DEFINEFUN TOKEN OPARAN CPARAN REALTYPE real CPARAN {
    let n = $3 in
    let v : float = $7 in
    Some (Z3Set(n,Z3QFloat(v)))
  }
  | OPARAN DEFINEFUN Z3VAR OPARAN CPARAN INTTYPE INTEGER CPARAN {
    let n = $3 in
    let v = $7 in
    None
  }
  | OPARAN DEFINEFUN Z3VAR OPARAN CPARAN BOOLTYPE BOOL CPARAN {
    let n = $3 in
    let v = $7 in
    None
  }
  | OPARAN DEFINEFUN Z3VAR OPARAN CPARAN REALTYPE FLOAT CPARAN {
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
  | stmts objectives {
    let x = $1 in
    let obj = $2 in
    x
  }
  | stmts errorst {
    let q = $1 in
    q
  }




env :
  | stmts EOF {Some $1}
  | EOF       {None}
