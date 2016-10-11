open StochData

open AST

module StochLib = struct

  let map_stoch (type a) (type b) (x:a stoch) (f:a->b) : b stoch =
    {shape=x.shape;std=ASTLib.map x.std f}


end
