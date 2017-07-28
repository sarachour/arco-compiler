open Util;;
open AST;;
open IntervalData;;
open IntervalLib;;
open HWData;;
open HWLib;;

type map_var =
  | SMOffset of string 
  | SMScale of string 
  | SMFreeVar of int 
  | SMTimeConstant 

(*a value into a port*)
type map_loc_val =
  | SVSymbol of interval
  | SVNumber of number
  | SVZero
  | SVDC

type map_comp_ctx = {
    ports : (string, map_loc_val) map;
    params: (string, number) map;
    sample: (string,number) map;
    speed: (string,number) map;
}

type map_loc = {
  loc : int;
  value : map_loc_val;
}

type map_range = {
  min : number;
  max : number;
}
(*remap a value along a wire to a different number*)

(*
reflow is when you alter a numerical value to increase
the freedom of the scale, offset variables.
*)
type map_params = {
  allow_reflow : bool;
}

type map_expr =
  | SEVar of map_var
  | SENumber of number
  | SEAdd of map_expr*map_expr
  | SESub of map_expr*map_expr
  | SEMult of map_expr*map_expr
  | SEDiv of map_expr*map_expr
  | SEPow of map_expr*map_expr

type map_op =
  | SCLTE of number
  | SCGTE of number
  | SCNEQ of number
  | SCOr of map_op*map_op

type map_cstr =
  | SCFalse
  | SCTrue
  (*cover constraint*)
  | SCCoverInterval of map_range*map_range*map_expr*map_expr
  | SCCoverTime of number option*number option
  (*expr constraints*)
  | SCExprEqExpr of map_expr*map_expr
  | SCExprEqConst of map_expr*number
  | SCVarEqVar of map_var*map_var
  | SCVarEqExpr of map_var*map_expr
  | SCVarEqConst of map_var*number
  (*test*)
  | SCExprIneq of map_op*map_expr
  | SCVarIneq of map_op*map_var
  (*var constraints*)
 
(*get the constraints*)
type map_result = {
  mutable cstrs: map_cstr list;
  mutable scale: map_expr;
  mutable offset: map_expr;
  mutable value: map_loc_val;
}

type linear_transform = {
  mutable scale : float;
  mutable offset: float;
}


(*information on what is bound*)
type map_ctx = map_comp_ctx 

type map_late_bind = map_ctx -> map_result list ->  map_params -> map_result

type map_assoc =
  | MAssocAdd
  | MAssocMult

type map_cstr_gen =
  | SCLateBind of map_late_bind*(map_cstr_gen list)
  | SCAssoc of map_assoc*map_cstr_gen list
  | SCStaticBind of map_result

type map_comp = {
  inputs: (string,map_cstr_gen) map;
  outputs: (string,map_cstr_gen) map;
}
type map_hw_spec = {
  comps : (hwcompname,map_comp) map;
}

module SMapLocVal =
struct

  let to_string : map_loc_val -> string =
    fun lv ->
      match lv with
      | SVSymbol(interval) -> IntervalLib.interval2str interval
      | SVNumber(number) -> string_of_number number
      | SVZero -> "zero"
      | SVDC -> "dc"

end


module SMapVar =
struct

  exception SMapVar_error of string
  let to_string : map_var -> string =
    fun v ->
      match v with
      |SMFreeVar(id) -> "f."^(string_of_int id) 
      |SMScale(name) -> "sc."^name
      |SMOffset(name) -> "of."^name
      |SMTimeConstant -> "tau"
end

module SMapExpr =
struct
  exception SMapExpr_error of string;;

  let rec to_string : map_expr -> string =
    fun expr ->
      match expr with
      | SEVar(v) -> SMapVar.to_string v
      | SENumber(n) -> string_of_number n
      | SEAdd(a,b) -> "("^(to_string a)^"+"^(to_string b)^")"
      | SEMult(a,b) -> "("^(to_string a)^"*"^(to_string b)^")"
      | SESub(a,b) -> "("^(to_string a)^"-"^(to_string b)^")"
      | SEPow(a,b) -> "("^(to_string a)^"^"^(to_string b)^")"
      | SEDiv(a,b) -> "("^(to_string a)^"/"^(to_string b)^")"
      | _ -> "unimpl"

  let sub : map_expr -> (map_var -> map_expr option) -> map_expr =
    fun expr fn -> 
    let rec _work e = match e with
      | SEVar(v) -> begin match fn v with | Some(e) -> e | _ ->  SEVar(v) end
      | SENumber(n) -> SENumber(n)
      | SEAdd(a,b) -> SEAdd(_work a, _work b)
      | SESub(a,b) -> SESub(_work a, _work b)
      | SEPow(a,b) -> SEPow(_work a, _work b)
      | SEMult(a,b) -> SEMult(_work a, _work b)
      | SEDiv(a,b) -> SEDiv(_work a, _work b)
    in
    _work expr 

  (*extract the largest term that satisfies *)
  let factor: map_expr -> (map_expr -> bool) -> (map_expr*map_expr) option =
    fun expr fn ->
      let rec _work e =
        if fn e then
          Some (e,SENumber (Integer 1))
        else

          match e with
          | SEMult(a,b) ->
            begin
              match _work a, _work b with
              | Some(a1,a2),_ -> Some(a1,SEMult(a2,b))
              | _,Some(b1,b2) -> Some(b1,SEMult(a,b2))
              | _ -> None
            end
            
          | SEDiv(SENumber (Integer 1),SEMult(a,b)) ->
            let one_over_a = SEDiv(SENumber (Integer 1),a) in
            let one_over_b = SEDiv(SENumber (Integer 1),b) in
            begin
              match _work one_over_a, _work one_over_b with
              | Some(a1,a2),_ -> Some(a1,SEMult(a2,one_over_b))
              | _,Some(b1,b2) -> Some(b1,SEMult(one_over_a,b2))
              | _ -> None
            end

          | SEDiv(SENumber (Integer 1), b) ->
            None

          | SEDiv(a,b) ->
            let one_over_b = SEDiv(SENumber (Integer 1),b) in
            begin
              match _work a, _work one_over_b with
              | Some(a1,a2),_ -> Some(a1,SEDiv(a2,b))
              | _,Some(b1,b2) -> Some(b1,SEDiv(b2,a))
              | _ -> None
            end
            
          | expr -> None  
          
      in
      _work expr

  let simpl : map_expr -> map_expr =
    fun expr ->
      let rec _work expr =
        let proc arg1 arg2 fn =
          let simpl_arg1 = _work arg1 in
          let simpl_arg2 = _work arg2 in
          fn simpl_arg1 simpl_arg2
        in
        match expr with
        | SEVar(v) -> SEVar(v)
        | SENumber(n) -> SENumber(n)
        | SEAdd(a,b) ->
          proc a b (fun x y -> match x,y with
              | SENumber(n1),SENumber(n2) -> SENumber(NUMBER.add n1 n2)
              | SENumber(n1),ye -> if NUMBER.is_zero n1 then ye else SEAdd(x,y)
              | xe,SENumber(n1) -> if NUMBER.is_zero n1 then xe else SEAdd(x,y)
              | _ -> SEAdd(x,y)
            )
        | SESub(a,b) ->
          proc a b (fun x y -> match x,y with
              | SENumber(a),SENumber(b) -> SENumber(NUMBER.sub a b)
              | expr,SENumber(a) -> if NUMBER.is_zero a then expr else SESub(x,y)
              | _ -> SESub(x,y)
            )
        | SEMult(a,b) ->
          proc a b (fun x y -> match x,y with
              | SENumber(n1),SENumber(n2) ->
                SENumber(NUMBER.mult n1 n2)
              | expr,SENumber(n1) ->
                if NUMBER.is_zero n1 then SENumber(Integer 0)
                else if NUMBER.is_one n1 then expr
                else SEMult(x,y)
              | SENumber(n1),expr ->
                if NUMBER.is_zero n1 then SENumber(Integer 0)
                else if NUMBER.is_one n1 then expr
                else SEMult(x,y)

              | _ -> SEMult(x,y)
            )
        | SEDiv(a,b) ->
          proc a b (fun x y -> match x,y with
              | SENumber(n1),SENumber(n2) ->
                SENumber(NUMBER.div n1 n2)

              | expr,SENumber(n1) ->
                if NUMBER.is_zero n1 then
                  SENumber(NUMBER.div (Decimal 1.0) (Decimal 0.0))
                else if NUMBER.is_one n1 then
                  expr
                else
                  SEDiv(x,y)

              | SENumber(n1),expr ->
                if NUMBER.is_zero n1 then
                  SENumber(Integer 0)
                else SEDiv(x,y)

              | _ -> if x = y then SENumber(Integer 1) else SEDiv(x,y)
            )

        | SEPow(a,b) ->
          proc a b (fun x y -> match x,y with
              | SENumber(a),SENumber(b) -> SENumber(NUMBER.pow a b)
              | xe,SENumber(a) ->
                if NUMBER.is_zero a then SENumber(Integer 1)
                else if NUMBER.is_one a then xe
                else if NUMBER.is_neg_one a then
                  _work (SEDiv(SENumber(Integer 1),xe))
                else SEPow(x,y)

              | SENumber(a),ye ->
                if NUMBER.is_zero a then SENumber(Integer 0)
                else if NUMBER.is_one a then SENumber(Integer 1)
                else SEPow(x,y)

              | _ -> SEPow(x,y)
            )


        | _ -> expr

      in
      _work expr 
end

module SMapRange =
struct

  let to_string : map_range -> string =
  fun range ->
      "["^(string_of_number range.min)^","^(string_of_number range.max)^"]"

end


module SMapCstr =
struct
  exception SMapCstr_error of string;;

  let string_of_op : map_op -> string =
    fun op ->
      match op with
      | SCLTE(x) -> "<="^(string_of_number x)
      | SCGTE(x) -> ">="^(string_of_number x)
      | SCNEQ(x) -> "!="^(string_of_number x)

  let to_string : map_cstr -> string =
    fun cstr ->
      match cstr with
      | SCFalse -> "assert(false)"
      | SCTrue -> "assert(true)"
      | SCExprEqExpr(e1,e2) -> (SMapExpr.to_string e1)^"="^(SMapExpr.to_string e2)^" (e.e)"
      | SCExprEqConst(e1,n) -> (SMapExpr.to_string e1)^"="^(string_of_number n)^" (e.n)"
      | SCExprIneq(op,e1) -> (SMapExpr.to_string e1)^(string_of_op op)^" (e)"

      | SCVarEqExpr(v1,e2) -> (SMapVar.to_string v1)^"="^(SMapExpr.to_string e2)^" (v.e)"
      | SCVarEqVar(v1,v2) -> (SMapVar.to_string v1)^"="^(SMapVar.to_string v2)^" (v.v)"
      | SCVarEqConst(v1,n) -> (SMapVar.to_string v1)^"="^(string_of_number n)^" (v.n)"
      | SCVarIneq(op,v1)-> (SMapVar.to_string v1)^(string_of_op op)^" (v)"

      | SCCoverInterval(hwrng,mrng,sc,off) ->
        (SMapExpr.to_string sc)^"*"^(SMapRange.to_string mrng)^"+"^(SMapExpr.to_string off)^" \\in "^
        (SMapRange.to_string hwrng)

      | SCCoverTime(min,max) ->
        (OPTION.tostr min string_of_number)^" <= tau <= "^(OPTION.tostr max string_of_number)

end


module SLinearTransform =
struct

  
  let to_string : linear_transform -> string =
    fun trans ->
      (string_of_float trans.scale)^"@"^"+"^(string_of_float trans.offset)^"->"

  let map_to_string : (wireid,linear_transform) map -> string =
    fun maps ->
      MAP.str maps HwLib.wireid2str to_string

end



  
