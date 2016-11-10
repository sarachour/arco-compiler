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

  let mk_num_ival () : num_interval =
    {min=0.;max=0.}

  let numinterval2str (x:num_interval) =
    "["^(string_of_float x.min)^","^(string_of_float x.max)^"]"

  let clamp (clamp:num_interval) (x:num_interval): num_interval =
    {min=MATH.max [clamp.min;x.min];max=MATH.min [clamp.max;x.max]}

  let transform (x:num_interval) scale offset =
    let mmin = x.min*.scale+.offset in
    let mmax = x.max*. scale +. offset in
    {min=MATH.min [mmin;mmax];max=MATH.max [mmin;mmax]}

  let inv_transform (x:num_interval) scale offset =
    let mmin = (x.min-.offset)/.scale in
    let mmax = (x.max-.offset)/. scale in
    {min=MATH.min [mmin;mmax];max=MATH.max [mmin;mmax]}


  let covergap2str gap =
    "<"^(string_of_float gap.left)^","^(string_of_float gap.right)^">"


  let compute_frac_gap (cover:num_interval) (gap:cover_gap) =
    let uncovered = gap.left +. gap.right in
    let cover = cover.max -. cover.min in
    if cover = 0. && uncovered = 0. then
      0.
    else if cover = 0. then
      infinity
    else
      uncovered /. cover

  let midpoint (v:num_interval) : float =
    (v.max +. v.min) /. 2.

  let compute_cover_gap (cover:num_interval) (targ:num_interval) : cover_gap =
    let left = MATH.max [0.;targ.min -. cover.min] in
    let right = MATH.max [0.;cover.max -. targ.max] in
    {left=left;right=right}

  let compute_offset_for_value  (host:num_interval) (targ:float) =
    let no_error = {left=0.;right=0.} in
    if targ < host.min then
      targ -. host.min,no_error
    else if targ > host.max then
      host.max -. targ,no_error
    else
      1.,no_error

  let compute_scale_for_value (host:num_interval) (targ:float) =
    let no_error = {left=0.;right=0.} in
    let some_error = {left=1.;right=1.} in
    if host.min = 0. && host.max = 0. then
      begin
        if targ = 0. then 1.,no_error else 1.,some_error
      end
    else if targ = 0. then
      begin
        if targ >= host.min && targ <= host.max then
          1.,no_error
        else
          1.,{left=host.min;right=host.max}
      end
    else
      if targ < host.min && host.min != 0.  then
        targ /. host.min,no_error
      else if targ > host.max && host.max != 0. then
        targ /. host.max,no_error
      else if host.min = 0. || host.max = 0. then
        targ /. (midpoint host),no_error
      else
        1.,no_error

  let compute_direct_for_value host targ =
    let no_error = {left=0.;right=0.} in
    let some_error = {left=host.min -. targ;right=host.max -. targ} in
    if host.min = host.max then
      begin
        if host.max = targ then
          no_error
        else
          some_error
      end

    else
      begin
        if targ <= host.max && targ >= host.min then
          no_error
        else
          some_error
      end
      

  (*map host to targ,maximizing the cover. The mapping takes us from host to targ*)
  let compute_linear (host:num_interval) (targ:num_interval) : float*float*cover_gap =
    if host.max = host.min && targ.max = targ.min then
      begin
       let off,ret = compute_offset_for_value host targ.max in 
       0.,off,ret
      end
    else if host.max = host.min then
      begin
        1.,0.,{left=1.;right=1.}
      end
    else if targ.max = targ.min then
      begin
        let off,ret = compute_offset_for_value host targ.max in 
        0.,off,ret
      end
    else
      begin
        let scale = (targ.max -. targ.min) /. (host.max -. host.min) in
        let offset=  targ.max -. scale *. host.max in 
        scale,offset,{left=0.; right=0.}
      end

  let compute_scale (host:num_interval) (targ:num_interval) =
    if host.max = host.min && targ.max = targ.min then
      compute_scale_for_value host targ.max

    else if host.max = host.min then
        0.,{left=1.;right=1.}

    (* the case where we're mapping to a value*)
    else if targ.max = targ.min then
      compute_scale_for_value host targ.max

    else
      let scale = targ.max /. host.max in
      let new_host = transform host scale 0. in
      scale,(compute_cover_gap new_host targ)

  let compute_offset (host:num_interval) (targ:num_interval) =
    if host.max = host.min && targ.max = targ.min then
      compute_offset_for_value host targ.max
    else if host.max = host.min then
      begin
        0.,{left=1.;right=1.}
      end
    else if targ.max = targ.min then
      compute_offset_for_value host targ.max
    else
    let offset = targ.min -. host.min in
    let new_host = transform host 1. offset in
    offset,compute_cover_gap new_host targ


  let compute_direct (host:num_interval) (targ:num_interval) =
    if  targ.max = targ.min then
      compute_direct_for_value host targ.max
    else
      compute_cover_gap host targ

  let is_mixed_interval (x:interval) =
    match x with
    | MixedInterval(h::h2::t) -> true
    | _ -> false

  let interval2numbounds (x:interval) =
    match x with
    | Interval(i) ->
      begin
        match i.min,i.max with
        | BNDNum(min),BNDNum(max) -> min,max
        | _ -> error "interval2numbounds" "not expecting inf bound"
      end
    (*this happens*)
    | MixedInterval([i]) ->
      begin
        match i.min,i.max with
        | BNDNum(min),BNDNum(max) -> min,max
        | _ -> error "interval2numbounds" "mix not expecting inf bound"
      end
    | MixedInterval(i) ->
      error "interval2numbounds" "not expecting mixed interval"
    | Quantize([v]) ->
      v,v
    | Quantize(_) -> 
      error "interval2numbounds" "not expecting quantized interval"
    | IntervalUnknown(_) ->
      error "interval2bounds" "unxpected unknown interval"

  let interval2numinterval (x:interval) =
    let min,max = interval2numbounds x in
    {min=min;max=max}

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

  let is_inf_bound (a:bound) = match a with
    | BNDInf(_) -> true
    | _ -> false

  let rec has_inf_bound (x:interval) =
    match x with
    | Interval(a) ->
      (is_inf_bound a.min) || (is_inf_bound a.max)
    | MixedInterval(alst) ->
      List.fold_left (fun x (a:interval_data) ->
          (is_inf_bound a.max) || (is_inf_bound a.min)||x)false alst
    | Quantize(_) -> false
    | IntervalUnknown(_) -> true

  let ival_data_contains_zero (a:interval_data) = match a.min,a.max with
    | BNDNum(n),BNDNum(n2) -> n <= 0. && n2 >= 0.
    | BNDNum(n),BNDInf(QDPositive) -> n <= 0.
    | BNDInf(QDNegative),BNDInf(QDPositive) -> true
    | _ -> false

  let bound_is_zero (b:bound) = match b with
    | BNDNum(n) -> n = 0.
    | _ -> false



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
          let a : interval_data= {min=BNDNum a_el; max = BNDNum a_el} in
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
      else
        BNDInf(bdir)
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
        | true,true -> BNDInf(QDPositive)
        | true,false -> BNDNum(0.)
        | false,true -> BNDInf(float_to_dir av)
        | false,false -> BNDNum (av /. bv)
      end
    | BNDNum(_),BNDInf(_) ->BNDNum(0.)
    | BNDInf(adir),BNDNum(bv) -> BNDInf(derive_dir adir (float_to_dir bv))
    | BNDInf(adir),BNDInf(bv) ->
      BNDInf(derive_dir adir bv)
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
    | BNDInf(x),BNDNum(y) -> BNDInf(x) 
    | _ -> error "bound_pow" "unimplemented"

  let rule_sum (a:interval) (b:interval) : interval = _compute_interval2 a b bound_sum

  let rule_prod (a:interval) (b:interval) = _compute_interval2 a b bound_prod

  let rule_sub (a:interval) (b:interval) : interval = _compute_interval2 a b bound_sub

  let rule_div (a:interval) (b:interval) : interval = _compute_interval2 a b bound_div

  let rule_power (a:interval) (b:interval) : interval = _compute_interval2 a b bound_pow

  let rule_exp (a:interval) : interval =
    error "rule" "exp unimplemented"

  let add (a:interval) (b:interval) = rule_sum a b


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


