open Util;;


type sciopt_st =
  | SCINameVar of int*string
  

type sciopt_status =
  | SCISuccess
  | SCIExceededIter
  | SCIMalformedProb

type sciopt_result = {
  status:sciopt_status;
  obj: float;
  vect: float list;
}
