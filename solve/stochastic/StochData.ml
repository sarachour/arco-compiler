open AST

type stoch_shape =
  | STCHGAUSS
  | STCHPOISS
  | STCHUNIFORM
  | STCHNONE

type 'a stoch = {
  shape: stoch_shape;
  std: 'a ast;
}
