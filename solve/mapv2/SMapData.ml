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
  | SCGT of number
  | SCLT of number

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

type linear_map_expr =
  | SELinTerm of number*map_var
  | SELinOffset of number
  | SELinAdd of linear_map_expr list

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

  let linear_simplify :  linear_map_expr -> linear_map_expr =
    fun expr ->
      let condense lst = match lst with
        | [term] -> term
        | [] -> SELinOffset(Integer 0)
        | lst -> SELinAdd(lst)
      in
      let add_offset lst n =
        let added = REF.mk false in
        let new_lst = List.map (fun x -> match x with
            | SELinOffset(n2) -> begin
                REF.upd added (fun _ -> true);
                SELinOffset(NUMBER.add n n2)
              end

            | _ -> x
          ) lst
        in
        assert(REF.dr added);
        new_lst
      in
      let add_coeff lst v n =
        let added = REF.mk false in
        let new_lst = List.fold_right (fun x rest -> match x with
            | SELinTerm(c,v2) -> begin
                if v2 = v then
                  begin
                    REF.upd added (fun _ -> true);
                    match NUMBER.add c n with
                    | Integer(0) -> rest
                    | Decimal(0.0) -> rest
                    | new_n -> SELinTerm(new_n,v2)::rest
                  end
                else
                  x::rest
              end

            | _ -> x::rest
          ) lst []
        in
        if REF.dr added then
          new_lst
        else
          SELinTerm(n,v)::new_lst
      in
      let rec _work e =  match e with
        | SELinOffset(n) -> SELinOffset(n)
        | SELinTerm(Integer 0,v) -> SELinOffset(Integer 0)
        | SELinTerm(n,v) -> SELinTerm(n,v)
        | SELinAdd(lst) ->
          let terms = List.fold_right (fun a rest -> match _work a,rest with
              | SELinTerm(c,v),SELinAdd(terms) ->
                condense (add_coeff terms v c)
                
              | v, SELinOffset(Integer 0) ->
                v

              | SELinTerm(c1,v1),SELinTerm(c2,v2) ->
                condense (add_coeff [rest] v1 c1)

              | SELinOffset(n1),SELinOffset(n2) ->
                SELinOffset(NUMBER.add n1 n2)

              | SELinOffset(n),SELinAdd(terms) ->
                begin
                  condense (add_offset terms n)
                end

              | SELinAdd(_),SELinAdd(_) -> raise (SMapExpr_error "cannot have nested adds")

              | expr1,expr2 ->
                SELinAdd([expr1;expr2])

            ) lst (SELinOffset (Integer 0))
          in
          terms
      in
      _work expr



  let linearize: map_expr -> linear_map_expr option =
    fun expr ->
      let combine x y = match x,y with
        | SELinAdd(lst),SELinAdd(lst2) -> SELinAdd(lst@lst2)
        | SELinAdd(lst),term -> SELinAdd(term::lst)
        | term, SELinAdd(lst) -> SELinAdd(term::lst)
        | term,term2 -> SELinAdd([term;term2])
      in
      let xform x fn = match x with
        | SELinAdd(lst) -> SELinAdd(List.map fn lst)
        | term -> fn term
      in
      let xform_negate x =
        xform x (fun expr -> match expr with
            | SELinTerm(coeff,v) -> SELinTerm(NUMBER.neg coeff,v)
            | SELinOffset(n) -> SELinOffset(NUMBER.neg n)
            | _ -> raise (SMapExpr_error "xform_negate: cannot negate list")
          )
      in
      let rec xform_prod const term =
        if NUMBER.eq const (Integer 0) then
          SELinOffset(Integer 0)
        else if NUMBER.eq const (Integer 1) then
          term
        else
          match term with
          | SELinTerm(coeff,v) -> SELinTerm(NUMBER.mult coeff const,v)
          | SELinOffset(coeff) -> SELinOffset(NUMBER.mult coeff const)
          | SELinAdd(lst) -> SELinAdd(List.map (fun x -> xform_prod const x) lst) 
      in
      let rec _work e =
        match e with
        | SEVar(v) -> Some (SELinTerm(Integer 1, v))
        | SENumber(n) -> Some (SELinOffset(n))
        | SEAdd(a,b) ->
          begin
            match _work a, _work b with
            | Some(la),Some (lb) ->
              Some (combine la lb)
            | _ -> None
          end
        | SESub(a,b) ->
          begin
            match _work a, _work b with
            | Some(la), Some(lb) ->
              Some (combine la (xform_negate lb))
            | _ -> None
          end
        | SEMult(a,b) ->
          begin
            match _work a, _work b with
            | Some(la), Some(lb) ->
              let simpl_la = linear_simplify la
              and simpl_lb = linear_simplify lb
              in
              begin
                match simpl_la, simpl_lb with
                | SELinOffset(n),term ->
                  Some (xform_prod n term)
                | term,SELinOffset(n) ->
                  Some (xform_prod n term)
                | _ -> None
              end
            | _ -> None
          end
        | SEDiv(a,b) ->
          begin
            match _work a, _work b with
            | Some(la), Some(lb) ->
              let simpl_la = linear_simplify la
              and simpl_lb = linear_simplify lb
              in
              begin
                match simpl_la, simpl_lb with
                | term,SELinOffset(n) ->
                  Some (xform_prod (NUMBER.div (Integer 1) n) term)
                | _ -> None
              end
            | _ -> None
          end

        | SEPow(a,b) ->
          begin
            match _work a, _work b with
            | Some(la), Some(lb) ->
              let simpl_la = linear_simplify la
              and simpl_lb = linear_simplify lb
              in
              begin
                match simpl_la, simpl_lb with
                | SELinOffset(v),SELinOffset(p) ->
                  Some (SELinOffset(NUMBER.pow v p))

                | term, SELinOffset(v) ->
                  if NUMBER.eq v (Integer 0) then
                    Some (SELinOffset(Integer 1))
                  else if NUMBER.eq v (Integer 1) then
                    Some (term)
                  else
                    None
                | _ -> None
              end
            | _ -> None
          end

        | _ -> 
          raise (SMapExpr_error "unimpl")
      in
      OPTION.map (_work expr) linear_simplify

  let linear_simplify : linear_map_expr -> linear_map_expr =
    fun expr ->
      raise (SMapExpr_error "unimpl")


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

  (*extract the largest term that satisfies *)
  let to_rational: map_expr ->  (map_expr list*map_expr list) =
    fun expr  ->
      let rec _work e =
        match e with
        | SEMult(a,b) ->
          begin
            let a1,a2 = _work a and b1,b2 = _work b in
            a1@b1, a2@b2 
          end
            
          | SEDiv(a,b) ->
            begin
              let a1,a2 = _work a and b1,b2 = _work b in
              a1@b2,a2@b1
            end

          | expr -> [expr],[]
          
      in
      _work expr

  let product_of : map_expr list -> (map_expr ) =
    fun terms ->
      match terms with
      | first_term::rest->
        List.fold_right (fun term rest -> SEMult(term,rest)) rest first_term 
      | [] ->
        SENumber(Integer 1)

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
      | SCLT(x) -> "<"^(string_of_number x)
      | SCGT(x) -> ">"^(string_of_number x)
      | SCNEQ(x) -> "!="^(string_of_number x)

  let rec compat_op : map_op -> map_op -> bool =
    fun op1 op2 ->
      match op1, op2 with
      | SCGTE(a),SCLTE(b) -> compat_op op2 op1
      | SCGT(a),SCLT(b) -> compat_op op2 op1
      | SCOr(a,b),SCOr(c,d) ->
        (compat_op a c) && (compat_op a d) &&
        (compat_op b c) && (compat_op b d)
      | _ -> true

  let rec compute_op : map_op -> number -> bool =
    fun op n ->
      match op with
      | SCLTE(n2) -> NUMBER.lte n n2
      | SCGTE(n2) -> NUMBER.gte n n2
      | SCLT(n2) -> NUMBER.lt n n2
      | SCGT(n2) -> NUMBER.gt n n2
      | SCNEQ(n2) -> NUMBER.neq n n2
      | SCOr(a,b) -> compute_op a n || compute_op b n

  let rec op_map : map_op -> (number -> number) -> map_op =
    fun op fn ->
      match op with
      | SCLTE(n) -> SCLTE(fn n)
      | SCGTE(n) -> SCGTE(fn n)
      | SCLT(n) -> SCLT(fn n)
      | SCGT(n) -> SCGT(fn n)
      | SCNEQ(n) -> SCNEQ(fn n)
      | SCOr(a,b) -> SCOr(op_map a fn, op_map b fn)

  let rec op_const : map_op -> number =
    fun op ->
      match op with
      | SCLTE(n) -> n
      | SCGTE(n) -> n
      | SCLT(n) -> n
      | SCGT(n) -> n
      | SCNEQ(n) -> n
      | _ -> raise (SMapCstr_error "or not allowed")

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



  
