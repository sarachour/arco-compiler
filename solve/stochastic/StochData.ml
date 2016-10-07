open AST

type stoch_shape =
  | STCHGAUSS
  | STCHPOISS
  | STCHUNIFORM

type 'a stoch = {
  shape: stoch_shape;
  std: 'a ast;
}
