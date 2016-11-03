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

  let mkdflt_ival () : interval =
    IntervalUnknown([])

  let is_undefined i = match i with
    | IntervalUnknown(_) -> true
    | _ -> false

  let bnd2str (s:bound) : string = match s with
    | BNDInf(QDPositive)-> "+inf"
    | BNDInf(QDNegative)-> "-inf"
    | BNDNum(x) -> string_of_float x

  let intervaldata2str (v:interval_data) : string =
    "["^(bnd2str v.min)^","^(bnd2str v.max)^"]"

  let interval2str (v:interval) : string = match v with
    | Interval(i) -> intervaldata2str i
    | MixedInterval(i) -> "{"^(List.fold_left (fun r x ->
        (intervaldata2str x)^" "^r) "}" i)
    | Quantize(q) -> "{"^(List.fold_left (fun r x ->
        (string_of_float x)^","^r) "}" q)
    | IntervalUnknown(_) -> "??"
    | _ -> "UNIMPLEMENTED"

  let mapper2str (mpr:'a mapper) (f:'a->string) : string = match mpr with
    | MAPLinear(d) -> "@"^"*"^(ASTLib.ast2str (d.scale) f)^
                      " + "^(ASTLib.ast2str d.offset f)
    | MAPScale(d) -> "@"^"*"^(ASTLib.ast2str d.scale f)
    | MAPOffset(d) -> "@"^"+"^(ASTLib.ast2str d.offset f)
    | MAPDirect -> "@"

  let get_max (x) = match x with
    | Interval(x) ->
      begin match x.max with
        | BNDNum(n) -> n
        | _ -> error "get_max" "unbounded"
      end
    | IntervalUnknown(_) -> error "get_max" "cannot get max of unknown interval"
    | _ -> error "get_max" "haven't thought of it yet"

  let get_min (x) = match x with
    | Interval(x) ->
      begin match x.min with
        | BNDNum(n) -> n
        | _ -> error "get_max" "unbounded"
      end
    | IntervalUnknown(_) -> error "get_max" "cannot get max of unknown interval"
    | _ -> error "get_max" "haven't thought of it yet"


  let stdmapper2str mpr = mapper2str mpr ident

  let float_to_dir (n:float) : bound_dir =
    if n >= 0. then QDPositive
    else QDNegative


  let float_to_bound (n:float) : bound =
    BNDNum(n)

  let floats_to_interval (n:float list) : interval =
    Quantize(n)

  let mk_ival_data (min) max : interval_data =
    {min=min; max=max}

  let mk_ival min max : interval =
    Interval(mk_ival_data min max)

  let mk_ival_from_floats min max : interval =
    mk_ival (float_to_bound min) (float_to_bound max)

  let float_to_interval (x:float) : interval =
    mk_ival_from_floats x x


  let interval_to_interval_data (x:interval) : interval_data = match x with
    | Interval(d) -> d
    | _ -> error "interval_to_interval_data" "expected interval"

  let get_direction (a:bound) : bound_dir option = match a with
    | BNDNum(v) -> Some (float_to_dir v) 
    | BNDInf(dir) -> Some dir
    | _ -> None

  let ival_data_contains_zero (a:interval_data) = match a.min,a.max with
    | BNDNum(n),BNDNum(n2) -> n <= 0. && n2 >= 0.
    | BNDNum(n),BNDInf(QDPositive) -> n <= 0.
    | BNDInf(QDNegative),BNDInf(QDPositive) -> true
    | _ -> false

  let bound_is_zero (b:bound) = match b with
    | BNDNum(n) -> n = 0.
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


  let min_bound (a:bound) (b:bound) = match a,b with
    | BNDNum(av) ,BNDNum(bv) -> if av < bv then a else b
    | _,BNDInf(QDNegative) -> BNDInf(QDNegative)
    | BNDInf(QDNegative),_ -> BNDInf(QDNegative)
    | _,BNDInf(QDPositive) -> a
    | BNDInf(QDPositive),_ -> b
    | _ -> error "max_bound" "can only compute max of normalized"


  let max_bound (a:bound) (b:bound) = match a,b with
    | BNDNum(av) ,BNDNum(bv) -> if av > bv then a else b
    | _,BNDInf(QDPositive) -> BNDInf(QDPositive)
    | BNDInf(QDPositive),_ -> BNDInf(QDPositive)
    | _,BNDInf(QDNegative) -> a
    | BNDInf(QDNegative),_ -> b
    | _ -> error "max_bound" "can only compute max of normalized"
    (*quantized vs continuous bound*)

  (*find the maximum of a list of bounds*)
  let list_to_bound (lst:bound list) (f:bound->bound->bound): bound =
    match lst with
    | h::t -> List.fold_right (fun bnd max -> f bnd max) t h
    | [] -> error "list_to_bound" "list is empty"

  let max_of_list (lst:bound list) = list_to_bound lst max_bound
  let min_of_list (lst:bound list) = list_to_bound lst min_bound
 
  (*
     expand an interval to include 
  *)
  let expand_interval (a:interval) (b:bound) : interval = match a,b with
    | Quantize(els), BNDNum(res_el) ->
      Quantize(res_el::els)
    | Quantize(els), BNDInf(QDPositive) ->
      mk_ival (BNDNum (MATH.min els)) (BNDInf(QDPositive))
    | Quantize(els), BNDInf(QDNegative) ->
      mk_ival (BNDInf(QDNegative)) (BNDNum(MATH.max els))
    | Interval(ival),bnd ->
      mk_ival (min_bound (ival.min) bnd) (max_bound (ival.max) bnd)
    | MixedInterval(ival),_ ->
      error "expand_interval" "unclear how to expand mixed interval"
    (*add constraints to interval*)
    | IntervalUnknown(cstrs),BNDNum(res_el) ->
      IntervalUnknown((ICstrContains(res_el))::cstrs)
    | IntervalUnknown(cstrs),BNDInf(QDNegative) ->
      IntervalUnknown((ICstrLowerBound(BNDInf QDNegative))::cstrs)
    | IntervalUnknown(cstrs),BNDInf(QDPositive) ->
      IntervalUnknown((ICstrUpperBound(BNDInf QDPositive))::cstrs)

  let flip_if flip x y =
    if flip then (y,x) else (x,y)

  let _quant_quant_compute_interval2 (a:float list) (b:float list)
      (compute:bound->bound->bound) flip: interval =
    let a,b = flip_if flip a b in
    List.fold_right (fun (a_el:float) (res:interval) ->
        List.fold_right (fun (b_el:float) (res:interval) ->
            let res_el : bound =
              compute (BNDNum a_el) (BNDNum b_el) in
            expand_interval res res_el
          ) a res) b (Quantize [])

  let _quant_ival_compute_interval2 (a:float list) (b:interval_data)
      (compute:bound->bound->bound) flip: interval =
    let intervals : interval_data list =
      List.map (fun (a_el:float) ->
          let a = {min=BNDNum a_el; max = BNDNum a_el} in
          let a,b = flip_if flip a b in
          let corners : bound list= [
            compute (a.min) (b.min);
            compute (a.max) (b.max);
          ]
          in
          mk_ival_data (min_of_list corners) (max_of_list corners)
      ) a
    in
    MixedInterval(intervals)

  let _quant_ivals_compute_interval2 (a:float list) (b:interval_data list)
    (compute:bound->bound->bound) flip : interval =
    let intervals: interval_data list =
      List.fold_right (fun ival res ->
          match _quant_ival_compute_interval2 a ival compute flip with
          | MixedInterval(data) -> data @ res
          | _ -> error "_quant_ivals_compute_interval2" "unexpected")
        b []
    in
    MixedInterval(intervals)

  (*if you're crossing*)
  let crosses_zero (x:interval_data) :bool =
    match x.min,x.max with
    |BNDNum(min),BNDNum(max) -> min < 0. && max > 0.
    |BNDNum(min),BNDInf(QDPositive) -> min < 0.
    |BNDInf(QDNegative),BNDNum(max) -> max > 0.
    |BNDInf(QDNegative),BNDInf(QDPositive) -> true

  let _ival_ival_compute_interval2 (a:interval_data) (b:interval_data) 
      (compute:bound->bound->bound) flip : interval =
    let c,d = flip_if flip a b in
    let corners : bound list = [
      compute c.min d.max; compute c.max d.max;
      compute c.max d.min; compute c.min d.min;
    ] in
    let zero:bound = BNDNum(0.) in
    let zeroes:bound list= match crosses_zero c, crosses_zero d with
      | true,true ->
        [
          compute c.min zero; compute c.max zero;
          compute zero d.min; compute zero d.max;
          compute zero zero
        ]
      | true, false ->
        [
          compute zero d.min; compute zero d.max;
        ]
      | false,true ->
        [
          compute c.min zero; compute c.max zero;
        ]
      | false,false -> []
    in
    mk_ival (min_of_list (corners@zeroes)) (max_of_list (corners@zeroes))

  let _ival_ivals_compute_interval2 (a:interval_data ) (b:interval_data list) 
      (compute:bound->bound->bound) flip : interval  =
    let data : interval_data list= List.map (fun (ival:interval_data) ->
        match _ival_ival_compute_interval2 a ival compute flip with
        | Interval(data) -> data
        | _ -> error "ival_ivals_compute_interval2" "unknown"
      ) b
    in
    MixedInterval(data)

  let _ivals_ivals_compute_interval2 (a:interval_data list) (b:interval_data list) 
      (compute:bound->bound->bound) (flip:bool) : interval =
    let data : interval_data list = List.fold_right (
        fun (ival:interval_data) (lst:interval_data list) ->
          match _ival_ivals_compute_interval2 ival b compute flip with
          | MixedInterval(data) -> data @ lst
          | _ -> error "ivals_ivals_compute_interval2" "unknown"
      ) a []
    in
    MixedInterval(data)

  let _compute_interval2 (a:interval) (b:interval)
      (compute:bound->bound->bound): interval =
    match a,b with
    (*quantize is always first*)
    | Quantize(alst),Quantize(blst) ->
      _quant_quant_compute_interval2 alst blst compute false
    | Quantize(alst),Interval(blst) ->
      _quant_ival_compute_interval2 alst blst compute false
    | Quantize(alst),MixedInterval(blst) ->
      _quant_ivals_compute_interval2 alst blst compute false
    (* interval computation *)
    | Interval(alst),Quantize(blst) ->
      _quant_ival_compute_interval2 blst alst compute true
    | Interval(alst),Interval(blst) ->
      _ival_ival_compute_interval2 alst blst compute false
    | Interval(alst),MixedInterval(blst) ->
      _ival_ivals_compute_interval2 alst blst compute false
    (*interval collection computation*)
    | MixedInterval(alst),Quantize(blst) ->
      _quant_ivals_compute_interval2 blst alst compute true
    | MixedInterval(alst),Interval(blst) ->
      _ival_ivals_compute_interval2 blst alst compute true
    | MixedInterval(alst),MixedInterval(blst) ->
      _ivals_ivals_compute_interval2 alst blst compute false
    (**)
    | a,b ->
      error "_compute_interval2" ("unimplemented: "^(interval2str a)^", "^(interval2str b))

  let _quant_compute_interval1 (lst:float list) (compute:bound->bound) : interval =
    let compute_float (f:float) : float = match compute (BNDNum f) with
      | BNDNum(f2) -> f2
      | _ -> error "_quant_compute_interval" "compute_float cannot be infinity"
    in
    Quantize(List.map compute_float lst)

  let _ival_compute_interval1 (ival:interval_data ) (compute:bound->bound) : interval =
    let nmin = compute ival.min and nmax = compute ival.max in
    let corners = [nmin;nmax] in
    Interval({min=min_of_list corners; max=max_of_list corners})

  let _ivals_compute_interval1 (lst:interval_data list) compute =
    let data : interval_data list= List.map (fun (ival:interval_data) ->
        match _ival_compute_interval1 ival compute with
        | Interval(data) -> data
        | _ -> error "ival_ivals_compute_interval2" "unknown"
      ) lst
    in
    MixedInterval(data)


  let _compute_interval1 (a:interval) (compute:bound->bound) : interval = match a with
    | Quantize(alst) -> _quant_compute_interval1 alst compute
    | Interval(alst) -> _ival_compute_interval1 alst compute
    | MixedInterval(alst) -> _ivals_compute_interval1 alst compute


  let bound_sum (a:bound) (b:bound) : bound = match a,b with
    | BNDNum(av),BNDNum(bv) -> float_to_bound (av +. bv)
    | BNDInf(adir),BNDInf(bdir) -> if adir = bdir then a
      else error "bound_sum" "cannot add two infinities"
    | BNDInf(_),_ -> a
    | _,BNDInf(_) -> b
    | _ -> error "bound_sum" "unimplemented"

  let bound_sub (a:bound) (b:bound) : bound = match a,b with
    | BNDNum(av),BNDNum(bv) -> float_to_bound (av -. bv)
    | BNDInf(adir),BNDInf(bdir) -> if adir = bdir then a
      else error "bound_sub" "cannot sub two infinities"
    | BNDInf(_),_ -> a
    | _,BNDInf(_) -> b
    | _ -> error "bound_sub" "unimplemented"


  let bound_neg (a:bound) : bound = match a with
    | BNDNum(av) -> BNDNum(0.-.av)
    | BNDInf(QDPositive)-> BNDInf(QDNegative)
    | BNDInf(QDNegative)-> BNDInf(QDPositive)
   
  let bound_prod (a:bound) (b:bound) : bound =
    let derive_dir adir bdir = match adir,bdir with
        | QDPositive,QDPositive -> (QDPositive)
        | QDNegative,QDNegative -> (QDPositive)
        | _ -> (QDNegative)
    in
    if bound_is_zero a || bound_is_zero b then BNDNum(0.)
    else
    match a,b with
    | BNDNum(av),BNDNum(bv) ->
      BNDNum(av *. bv)
    | BNDNum(av),BNDInf(bdir) -> BNDInf(derive_dir bdir (float_to_dir av))
    | BNDInf(adir),BNDNum(bv) -> BNDInf(derive_dir adir (float_to_dir bv))
    | BNDInf(adir),BNDInf(bdir) -> BNDInf(derive_dir adir bdir)

  let bound_div (num:bound) (denom:bound): bound =
    let derive_dir adir bdir = match adir,bdir with
        | QDPositive,QDPositive -> (QDPositive)
        | QDNegative,QDNegative -> (QDPositive)
        | _ -> (QDNegative)
    in
    match num,denom with
    | BNDNum(av),BNDNum(bv) ->
      begin
        match bound_is_zero num, bound_is_zero denom with
        | true,true -> error "bound_div" "0/0 = NaN"
        | true,false -> BNDNum(0.)
        | false,true -> BNDInf(float_to_dir av)
        | false,false -> BNDNum (av /. bv)
      end
    | BNDNum(_),BNDInf(_) ->BNDNum(0.)
    | BNDInf(adir),BNDNum(bv) -> BNDInf(derive_dir adir (float_to_dir bv))
    | BNDInf(adir),BNDInf(bv) -> error "bound_div" "inf/inf = NaN"
    | _ -> error "bound_div" "unimplemented"

  let bound_pow (base:bound) (exp:bound): bound =
    warn ("pow doesn't handle functions that cross the axis");
    match base,exp with
    | BNDNum(basev),BNDNum(expv) ->
      begin
        match bound_is_zero base, bound_is_zero exp with
        | false,false -> BNDNum(basev**expv)
        | false,true -> BNDNum(1.)
        | true,false -> BNDNum(0.)
        | true,true -> BNDNum(1.)
      end
    | BNDNum(_),BNDInf(QDNegative) -> BNDNum(0.)
    | BNDNum(_),BNDInf(QDPositive) -> BNDNum(0.)
    | BNDInf(_),BNDInf(_) -> error "bound_pow" "infinity to the infinity"
    | _ -> error "bound_pow" "unimplemented"

  let rule_sum (a:interval) (b:interval) : interval = _compute_interval2 a b bound_sum

  let rule_prod (a:interval) (b:interval) = _compute_interval2 a b bound_prod

  let rule_sub (a:interval) (b:interval) : interval = _compute_interval2 a b bound_sub

  let rule_div (a:interval) (b:interval) : interval = _compute_interval2 a b bound_div

  let rule_power (a:interval) (b:interval) : interval = _compute_interval2 a b bound_pow

  let rule_exp (a:interval) : interval =
    error "rule" "exp unimplemented"


  let rule_neg (a:interval)  : interval = _compute_interval1 a bound_neg

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


