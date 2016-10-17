open StochData

open AST

module StochLib = struct

  let map_stoch (type a) (type b) (x:a stoch) (f:a->b) : b stoch =
    {shape=x.shape;std=ASTLib.map x.std f}

  let create_stoch (type a) (std:a ast) (shape:stoch_shape): a stoch =
    {shape=shape;std=std}

  let mkstoch (): 'a stoch =
    {shape=STCHNONE;std=Integer(0)}

  let shape2str (st:stoch_shape) = match st with
    | STCHGAUSS -> "gauss"
    | STCHUNIFORM -> "uniform"
    | STCHPOISS -> "poiss"
    | STCHNONE -> "none"

  let stoch2str (type a) (st:a stoch) (f:a->string) : string =
    (shape2str st.shape)^" "^(ASTLib.ast2str st.std f)

  let get_vars (type a) (st:a stoch) =
    ASTLib.get_vars st.std
end
