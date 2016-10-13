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



  let corners (a:interval) (b:interval) (f:float->float->float) =
    [f a.min b.min; f a.min b.max; f a.max b.min; f a.max b.max]

  let rule_sum (a:interval) (b:interval) =
    
    {min=a.min+b.min}
  let derive_interval (expr:'a ast) (lookup:'a -> interval) =
    let rec trans_node e = match e with
      | Term(v) -> lookup v 
      | OpN(op,lst) ->
        let ivals = List.map (fun x -. trans_node x) lst in
        begin
          match op with
          | Add ->
          | Mult ->
          | Sub ->
          | Func -> error "derive_interval" "cannot derive over function"
        end
      | Op2(Power,arg1,arg2) ->
      | Op2(Div,arg1,arg2) ->
      | Op1(Exp,arg) ->
      | Op1(Neg,arg) ->
      | Decimal(flt) -> {min=Decimal flt; max=Decimal flt} 
      | Integer(flt) -> {min=Integer flt; max=Integer flt} 
    in
end


