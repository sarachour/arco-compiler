open StochData
open IntervalData
open IntervalLib
open Util
open AST


exception StochLibError of string

let error n m = raise (StochLibError (n^":"^m))


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

  let get_expr (type a) (st:a stoch) = st.std

  let mk_rand_var mean stdev =
    {std=stdev;mean=mean}

  let randvar2str rv =
    "mu="^(IntervalLib.interval2str rv.mean)^" std="^(IntervalLib.interval2str rv.std)

  let rule_sum (a:rand_var) (b:rand_var) =
    let std = IntervalLib.rule_sum a.std b.std in
    let mean = IntervalLib.rule_sum a.mean b.mean in
    {std=std;mean=mean}

  let rule_prod (a:rand_var) (b:rand_var) =
    let stdexpr : interval ast= (OpN(Add,[
        OpN(Mult,[Term(a.std);Term(b.mean)]);
        OpN(Mult,[Term(a.mean);Term(b.std)]);
        OpN(Mult,[Term(a.std);Term(b.std)]);
      ])) 
    in
    let std =  IntervalLib.derive_interval stdexpr ident in
    let mean = IntervalLib.rule_prod a.mean b.mean in
    {std=std;mean=mean}

  let rule_sub (a:rand_var) (b:rand_var) =
    let std = IntervalLib.rule_sum a.std b.std in
    let mean = IntervalLib.rule_sub a.mean b.mean in
    {std=std;mean=mean}

  let rule_div (a:rand_var) (b:rand_var) =
    let mean = IntervalLib.rule_div a.mean b.mean in 
    let std = IntervalLib.derive_interval
        (Op2(Div,
             OpN(Sub,[
                 OpN(Mult,[Term(b.mean);Term(a.std)]);
                 OpN(Mult,[Term(a.mean);Term(b.std)])
               ]),
             OpN(Add,[
                 Term(b.mean);
                 OpN(Mult,[Term(b.std);Term(b.mean)])
               ])))
        ident
    in
    {std=std;mean=mean}

  let rule_neg (a:rand_var) =
    let mean = IntervalLib.rule_neg a.mean in
    let std = a.std in
    {mean=mean;std=std}

  let rule_power (base:rand_var) (exp:rand_var) =
    let mean = IntervalLib.rule_power base.mean exp.mean in
    let stdexpr = (OpN(Sub,[
        Op2(Power,OpN(Add,[Term(base.mean); Term(base.std)]),Term(exp.std));
        Op2(Power,Op2(Div,Term(base.mean),OpN(Add,[Term(base.mean);Term(base.std)])),Term(exp.mean))
      ]))
    in
    let std =  IntervalLib.derive_interval stdexpr ident in
    {mean=mean;std=std}

  let rule_exp (exp:rand_var) =
    let mean = IntervalLib.rule_exp exp.mean in
    let stdexpr : interval ast =
      OpN(Sub,[
          OpN(Mult,[Op1(Exp,Term(exp.mean));Op1(Exp,Term(exp.std))]);
          Op1(Exp,Term(exp.mean))
        ])
    in
    let std =  IntervalLib.derive_interval stdexpr ident in
    {mean=mean;std=std}

  let rule_const (f:float) =
    {mean=Quantize([f]);std=Quantize([0.])}

  let add = rule_sum

  let derive_noise (expr:'a ast) (lookup:'a -> rand_var) =
    let rec to_noise (e:'a ast) : rand_var = match e with
      | Term(v) -> lookup v 
      | OpN(op,h::t) ->
        begin
          match op with
          | Add ->
            List.fold_right (fun x rv -> rule_sum rv (to_noise x)) t (to_noise h)
          | Mult ->
            List.fold_right (fun x rv -> rule_prod rv (to_noise x)) t (to_noise h)
          | Sub ->
            List.fold_right (fun x rv -> rule_sub rv (to_noise x)) t (to_noise h)
          | Func(_) -> error "derive_interval" "cannot derive over function"
        end
      | OpN(op,[]) ->
        error "derive_interval" "cannot derive op"
      | Op2(Power,arg1,arg2) ->
        rule_power (to_noise arg1) (to_noise arg2)
      | Op2(Div,arg1,arg2) -> rule_div (to_noise arg1) (to_noise arg2)
      | Op1(Exp,arg) -> rule_exp (to_noise arg)
      | Op1(Neg,arg) -> rule_neg (to_noise arg)
      | Deriv(_) -> error "derive_interval" "cannot derive derivative"
      | Decimal(flt) -> rule_const flt  
      | Integer(i) -> rule_const (float_of_int i)
      | _ -> error "derive_interval" "unhandled"
    in
    to_noise expr


    
end
