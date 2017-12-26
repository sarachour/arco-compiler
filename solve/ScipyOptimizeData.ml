open Util;;


type sciopt_method =
  | SCICOBYLA
  | SCISLSQP
  | SCILinOpt
  | SCIGeometric

type sciopt_linear_expr =
  | SCILinTerm of float*int
  | SCILinOffset of float
  | SCILinAdd of sciopt_linear_expr list

type sciopt_st =
  | SCIInitialize of int
  | SCISetIters of int
  | SCISetTries of int
  | SCISetResults of int
  | SCISetMethod of sciopt_method
  | SCISetCstrTol of float
  | SCISetMinTol of float
  | SCIInitGuess of int*float
  | SCIReflowVar of int*int
  | SCIBound of float*float
  | SCIEq of string*string
  | SCINeq of string*string
  | SCIGTE of string*string
  | SCILTE of string*string
  | SCIGT of string*string
  | SCILT of string*string
  | SCIInterval of string*float*float
  | SCIObjective of string
  | SCISolve
  | SCIWrite of string
  | SCIComment of string 
  | SCINewline 
  | SCILinInterval of int*int*float*float*float
  | SCILinEq of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinNeq of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinGTE of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinLTE of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinGT of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinLT of sciopt_linear_expr*sciopt_linear_expr 
  | SCILinObjective of sciopt_linear_expr


type sciopt_error_code =
  | SCIGradEvalRequired
  | SCIFunctionEvalRequired
  | SCIMoreEqCstrThanVars
  | SCIMoreThan3nItersInLSQProb
  | SCIIncompatCstr
  | SCISingularMatE
  | SCISingularMatC
  | SCIRankDefEqCstr
  | SCIPosDirectDerivative
  | SCIMaxIters
  | SCIUnknown

type sciopt_status =
  | SCISuccess
  | SCIError of sciopt_error_code
  | SCIMalformedProb

type sciopt_result = {
  status:sciopt_status;
  obj: float;
  tolerance: float;
  vect: ((int,float) map) option;
}

let string_of_sciopt_method : sciopt_method -> string =
  fun x -> match x with
    | SCICOBYLA -> "COBYLA"
    | SCISLSQP -> "SLSQP"
    | SCILinOpt -> "LINOPT"
    | SCIGeometric -> "GEOMETRIC"

