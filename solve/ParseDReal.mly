%{
  open Z3Data
  open IntervalData
  open AST
  open Util


  exception ParseDRealError of string*string

  let error s n =
    let _ = Printf.printf "==== %s ====\n%s\n========\n" s n in
    let _ = flush_all () in
    raise (ParseDRealError(s,n))

  let debug (s:string) =
    Printf.printf "[dreal-debug] %s\n" s;
    flush_all ();
    ()
%}


%token EOF EOL OBRAC CBRAC EQ COMMA COLON UNSAT DELTASAT
%token SOLUTION ENTIRE NEG_INFTY POS_INFTY UNKNOWN SAT

%token <string> TOKEN
%token <int> INTEGER
%token <float> FLOAT

%type <IntervalData.bound> number
%type <Z3Data.z3assign> model_stmt 
%type <Z3Data.z3sln> stmts
%type <Z3Data.z3sln option> env

%start env

%%


lst(E):
  | E                            {[$1]}
  | E lst(E)                     {$1::$2}


number:
  | INTEGER     {BNDNum(float_of_int $1)}
  | FLOAT       {BNDNum($1)}
  | POS_INFTY   {BNDInf(QDPositive)}
  | NEG_INFTY   {BNDInf(QDNegative)}

model_stmt:
  | TOKEN COLON OBRAC ENTIRE CBRAC EQ OBRAC number COMMA number CBRAC EOL {
    let name = $1 and min = $8 and max = $10 in
    let qty = match min, max with
      | BNDNum(min),BNDNum(max) ->
        begin
          if min = max then
            Z3QFloat(min)
          else
            Z3QInterval(Z3QRange(min,max))
        end
      | BNDInf(mindir),BNDInf(maxdir) ->
        begin
        if mindir = maxdir then
          Z3QInterval(Z3QInfinite(mindir))
        else
          Z3QInterval(Z3QAny)
        end
      | BNDInf(_),BNDNum(max) ->
        Z3QInterval(Z3QUpperBound(max))
      | BNDNum(min),BNDInf(_) ->
        Z3QInterval(Z3QLowerBound(min))
    in
    Z3Set(name,qty)
  }

stmts:
  | SOLUTION COLON EOL {
    {sat=Z3SAT;model=None}
  }
  | stmts UNKNOWN EOL {
    {sat=Z3Unknown;model=None}
  }
  | stmts lst(model_stmt) {
    let mdl = $2 and obj = $1 in
    obj.model <- Some(mdl);
    obj
  }
  | stmts SAT EOL {
    $1.sat <- Z3SAT;
    $1
  }
  | stmts DELTASAT EQ FLOAT EOL {
    $1.sat <- Z3DeltaSAT($4);
    $1
  }
  | stmts DELTASAT EOL {
    $1.sat <- Z3DeltaSAT(-1.0);
    $1
  }
  | UNSAT EOL {
    {sat=Z3UNSAT;model=None}
  }
  | stmts EOL {
     $1
  }
env :
  | stmts EOF {Some $1}
  | EOF       {Some {sat=Z3Timeout;model=None}}
  
