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
    | BNDInf(QDPositive)-> "+inf"
    | BNDInf(QDNegative)-> "-inf"
    | BNDZero -> "0"
    | BNDNum(_,x) -> string_of_float x
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
    if n > 0. then BNDNum(QDPositive,n)
    else if n < 0. then BNDNum(QDNegative,n)
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

  let get_direction (a:bound) : bound_dir option = match a with
    | BNDNum(dir,_) -> Some dir
    | BNDInf(dir) -> Some dir
    | _ -> None

  let contains_zero (a:interval) = match a.min,a.max with
    | BNDZero,_ -> true
    | _,BNDZero -> true
    | BNDVar(_),_ -> error "contains_zero" "cannot determine"
    | _,BNDVar(_) -> error "contains_zero" "cannot determine"
    | _ ->
      begin match get_direction a.min, get_direction a.max with
        | Some QDNegative,Some QDPositive -> true
        | _ -> false 
      end
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


 
  let cast_zero (x:bound) = match x with
    | BNDZero -> BNDNum(QDPositive,0.)
    | _ -> x

  let coerce_zero (x:bound) = match x with
    | BNDNum(adir,av) -> if av = 0. then BNDZero else x
    | _ -> x

  let min_bound (a:bound) (b:bound) = match cast_zero a,cast_zero b with
    | BNDNum(adir,av) ,BNDNum(bdir,bv) -> if av < bv then a else b
    | _,BNDInf(QDNegative) -> BNDInf(QDNegative)
    | BNDInf(QDNegative),_ -> BNDInf(QDNegative)
    | _,BNDInf(QDPositive) -> a
    | BNDInf(QDPositive),_ -> b


  let max_bound (a:bound) (b:bound) = match cast_zero a,cast_zero b with
    | BNDNum(adir,av) ,BNDNum(bdir,bv) -> if av > bv then a else b
    | _,BNDInf(QDPositive) -> BNDInf(QDPositive)
    | BNDInf(QDPositive),_ -> BNDInf(QDPositive)
    | _,BNDInf(QDNegative) -> a
    | BNDInf(QDNegative),_ -> b

  let max_of_list (lst:bound list) : bound =
    match lst with
    | h::t -> List.fold_right (fun bnd max -> max_bound bnd max) t h
    | [] -> error "max_of_list" "list is empty"

  let min_of_list (lst:bound list) : bound =
    match lst with
    | h::t -> List.fold_right (fun bnd max -> min_bound bnd max) t h
    | [] -> error "max_of_list" "list is empty"


  let _rule_of_x (a:interval) (b:interval) (compute:bound->bound->bound): interval =
    let corners = [compute a.min b.min; compute a.min b.max;
                   compute a.max b.min; compute a.max b.max] in
    let max = max_of_list corners in
    let min = min_of_list corners in
    {min=min;max=max}


  let bound_sum (a:bound) (b:bound) : bound = match cast_zero a,cast_zero b with
    | BNDNum(adir,av),BNDNum(bdir,bv) -> float_to_bound (av +. bv)
    | BNDInf(adir),BNDInf(bdir) -> if adir = bdir then a
      else error "bound_sum" "cannot add two infinities"
    | BNDInf(_),_ -> a
    | _,BNDInf(_) -> b
    | _ -> error "bound_sum" "unimplemented"

  let bound_sub (a:bound) (b:bound) : bound = match cast_zero a,cast_zero b with
    | BNDNum(adir,av),BNDNum(bdir,bv) -> float_to_bound (av -. bv)
    | BNDInf(adir),BNDInf(bdir) -> if adir = bdir then a
      else error "bound_sub" "cannot sub two infinities"
    | BNDInf(_),_ -> a
    | _,BNDInf(_) -> b
    | _ -> error "bound_sub" "unimplemented"


  let bound_prod (a:bound) (b:bound) : bound =
    let derive_dir adir bdir = match adir,bdir with
        | QDPositive,QDPositive -> (QDPositive)
        | QDNegative,QDNegative -> (QDPositive)
        | _ -> (QDNegative)
    in
    match a,b with
    | BNDNum(adir,av),BNDNum(bdir,bv) -> BNDNum(derive_dir adir bdir,av *. bv)
    | BNDNum(adir,_),BNDInf(bdir) -> BNDInf(derive_dir adir bdir)
    | BNDInf(adir),BNDNum(bdir,_) -> BNDInf(derive_dir adir bdir)
    | BNDInf(adir),BNDInf(bdir) -> BNDInf(derive_dir adir bdir)
    | BNDZero,_ -> BNDZero
    | _,BNDZero -> BNDZero
    | _ -> error "bound_prod" "cannot bound variable"

  let rule_sum (a:interval) (b:interval) : interval = _rule_of_x a b bound_sum

  let rule_prod (a:interval) (b:interval) = _rule_of_x a b bound_prod

  let rule_sub (a:interval) (b:interval) : interval = _rule_of_x a b bound_sub

  let rule_div (a:interval) (b:interval) : interval =
    error "rule" "div unimplemented"

  let rule_power (a:interval) (b:interval) : interval =
    error "rule" "pow unimplemented"


  let rule_exp (a:interval) : interval =
    error "rule" "exp unimplemented"


  let rule_neg (a:interval)  : interval =
    error "rule" "neg unimplemented"


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


