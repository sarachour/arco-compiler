open Util;;


type sciopt_st =
  | SCIInitialize of float*int*int
  | SCIInitGuess of int*float 
  | SCIBound of float*float
  | SCIEq of string*string
  | SCINeq of string*string
  | SCIGTE of string*string
  | SCILTE of string*string
  | SCIInterval of string*float*float
  | SCIObjective of string
  | SCISolve
  | SCIWrite of string
  | SCIComment of string 
  | SCINewline 

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
