open IntervalData
open AST

open Util

exception IntervalLibError of string

let error n m = raise (IntervalLibError (n^":"^m))


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

  let mkdflt_ival () =
    {min=BNDVar; max=BNDVar}

  let bnd2str (s:bound) : string = match s with
    | BNDPosInf-> "+inf"
    | BNDNegInf -> "-inf"
    | BNDZero -> "0"
    | BNDPosNum(x) -> string_of_float x
    | BNDNegNum(x) -> string_of_float x
    | BNDNums(x) ->
      "["^(List.fold_right (fun x r -> (string_of_float x)^","^r) x "")^"]"
    | BNDVar -> "@"

  let interval2str (v:interval) : string =
    "["^(bnd2str v.min)^","^(bnd2str v.max)^"]"

  let mapper2str (mpr:mapper) : string = match mpr with
    | MAPLinear(d) -> "@"^"*"^(ASTLib.ast2str (d.scale) ident)^
                      " + "^(ASTLib.ast2str d.offset ident)
    | MAPScale(d) -> "@"^"*"^(ASTLib.ast2str d.scale ident)
    | MAPOffset(d) -> "@"^"+"^(ASTLib.ast2str d.offset ident)
    | MAPDirect -> "@"

  let float_to_bound (n:float) : bound =
    if n > 0. then BNDPosNum(n)
    else if n < 0. then BNDNegNum(n)
    else BNDZero

  let floats_to_interval (n:float list) : interval =
    {min=BNDNums(n);max=BNDNums(n)}

  let mk_ival (min) max =
    {min=float_to_bound min; max=float_to_bound max}


  let float_to_interval (x:float) : interval =
    mk_ival x x


  let is_undefined (a:interval) = match a.min,a.max with
    | BNDVar,_ -> true
    | _,BNDVar -> true
    | _ -> false

  let contains_zero (a:interval) = match a.min,a.max with
    | BNDZero,_ -> true
    | _,BNDZero -> true
    | BNDNegNum(_),BNDPosNum(_) -> true
    | BNDNegInf(_),BNDPosNum(_) -> true
    | BNDNegNum(_),BNDPosInf(_) -> true
    | BNDNegInf(_),BNDPosInf(_) -> true
    | BNDVar(_),_ -> error "contains_zero" "cannot determine"
    | _,BNDVar(_) -> error "contains_zero" "cannot determine"
    | _ -> false

  (*
  let corners (a:interval) (b:interval) (f:float->float->float) =
    let base =
      [f a.min b.min; f a.min b.max; f a.max b.min; f a.max b.max] in
    base
      
  let contains_negative (a:interval) =
    a.min <= 0.

  let rule_sum (a:interval) (b:interval) =
    let corns = corners a b (fun x y -> x+.y) in 
    {min=MATH.min corns; max=MATH.max corns}

  let rule_prod (a:interval) (b:interval) =
    let corns = corners a b (fun x y -> x*.y) in 
    {min=MATH.min corns; max=MATH.max corns}

  let rule_sub (a:interval) (b:interval) =
    let corns = corners a b (fun x y -> x-.y) in 
    {min=MATH.min corns; max=MATH.max corns}


  let rule_power (base:interval) (exp:interval) =
    if contains_negative exp && contains_zero base then
        error "rule_power" "contains infinity."
    else
      let corns = corners base exp (fun x y -> x**y) in
      {min=MATH.min corns; max=MATH.max corns}


  let rule_exp expo = error "rule_exp" "unimpl"
  let rule_div numer denom = error "rule_div" "unimpl"
  let rule_neg expr = error "rule_neg" "unimpl"
  *)
  let rule_sum (a:interval) (b:interval) : interval =
    error "rule" "unimplemented"

  let rule_prod (a:interval) (b:interval) : interval =
    error "rule" "unimplemented"

  let rule_sub (a:interval) (b:interval) : interval =
    error "rule" "unimplemented"

  let rule_div (a:interval) (b:interval) : interval =
    error "rule" "unimplemented"

  let rule_power (a:interval) (b:interval) : interval =
    error "rule" "unimplemented"


  let rule_exp (a:interval) : interval =
    error "rule" "unimplemented"


  let rule_neg (a:interval)  : interval =
    error "rule" "unimplemented"


  let derive_interval (expr:'a ast) (lookup:'a -> interval) =
    let rec to_ival (e:'a ast) : interval = match e with
      | Term(v) -> lookup v 
      | OpN(op,h::t) ->
        begin
          match op with
          | Add ->
            List.fold_right (fun x ival -> rule_sum ival (to_ival x)) t (to_ival h)
          | Mult ->
            List.fold_right (fun x ival -> rule_prod ival (to_ival x)) t (to_ival h)
          | Sub ->
            List.fold_right (fun x ival -> rule_sub ival (to_ival x)) t (to_ival h)
          | Func(_) -> error "derive_interval" "cannot derive over function"
        end
      | OpN(op,[]) ->
        error "derive_interval" "cannot derive op"
      | Op2(Power,arg1,arg2) ->
        rule_power (to_ival arg1) (to_ival arg2)
      | Op2(Div,arg1,arg2) -> rule_div (to_ival arg1) (to_ival arg2)
      | Op1(Exp,arg) -> rule_exp (to_ival arg)
      | Op1(Neg,arg) -> rule_neg (to_ival arg)
      | Deriv(_) -> error "derive_interval" "cannot derive derivative"
      | Decimal(flt) -> float_to_interval flt  
      | Integer(i) -> float_to_interval (float_of_int i)
      | _ -> error "derive_interval" "unhandled"
    in
    to_ival expr
end


