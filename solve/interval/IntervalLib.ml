open IntervalData
open AST

open Util

module IntervalLib =
struct


  let mk_map_ctx () : 'a map_ctx =
    {
      inst= MAP.make();
      usedin= MAP.make();
      uses= MAP.make();
      conv= MAP.make();
      ival_phys= MAP.make();
      ival_abs= MAP.make();
    }

  let span2str (s:span) : string = match s with
    | SPNInfinite -> "*"
    | SPNUnknown -> "?"
    | SPNInterval(v) -> "["^(string_of_number v.min)^","^(string_of_number v.max)^"]"

  let mapper2str (mpr:mapper) : string = match mpr with
    | MAPLinear(d) -> "@"^"*"^(ASTLib.ast2str (d.scale) ident)^
                      " + "^(ASTLib.ast2str d.offset ident)
    | MAPScale(d) -> "@"^"*"^(ASTLib.ast2str d.scale ident)
    | MAPOffset(d) -> "@"^"+"^(ASTLib.ast2str d.offset ident)
    | MAPDirect -> "@"

  let mk_ival (min) max =
    SPNInterval({min=min;max=max})
end


