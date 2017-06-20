open Util;;
open AST;;
open IntervalData;;
open HWData;;

type map_var =
  | SMOffset of string 
  | SMScale of string 
  | SMFreeVar of int 


(*a value into a port*)
type map_loc_val =
  | SVSymbol of interval
  | SVNumber of number
  | SVZero

type map_comp_ctx = {
    ports : (string, map_loc_val) map;
    params: (string, number) map;
}

type map_loc = {
  loc : int;
  value : map_loc_val;
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

type map_cstr =
  | SCFalse
  | SCTrue
  (*cover constraint*)
  | SCCoverInterval of interval*interval*map_expr*map_expr
  (*expr constraints*)
  | SCExprEqExpr of map_expr*map_expr
  | SCExprEqConst of map_expr*number
  | SCExprNeqConst of map_expr*number
  (*var constraints*)
  | SCVarEqVar of map_var*map_var
  | SCVarEqExpr of map_var*map_expr 
  | SCVarEqConst of map_var*number
  | SCVarNeqConst of map_var*number

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

type map_cstr_gen =
  | SCLateBind of map_late_bind*(map_cstr_gen list)
  | SCStaticBind of map_result

type map_comp = {
  inputs: (string,map_cstr_gen) map;
  outputs: (string,map_cstr_gen) map;
}
type map_hw_spec = {
  comps : (hwcompname,map_comp) map;
}

type map_hw_config = {
  mutable cstrs: map_cstr list;
}

module SMapVar =
struct

  exception SMapVar_error of string
  let to_string : map_var -> string =
    fun v ->
      match v with
      |SMFreeVar(id) -> "f."^(string_of_int id) 
      |SMScale(name) -> "sc."^name
      |SMOffset(name) -> "of"^name

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
end




  
