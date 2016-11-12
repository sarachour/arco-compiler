open AST
open IntervalData

type stoch_shape =
  | STCHGAUSS
  | STCHPOISS
  | STCHUNIFORM
  | STCHNONE

type 'a stoch = {
  shape: stoch_shape;
  std: 'a ast;
}


(*the mean value interval and the standard deviation interval*)
type rand_var = {
  mean: interval;
  std: interval;
}



