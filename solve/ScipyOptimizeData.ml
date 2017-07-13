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


type sciopt_status =
  | SCISuccess
  | SCIExceededIter
  | SCIMalformedProb

type sciopt_result = {
  status:sciopt_status;
  obj: float;
  vect: float list option;
}
