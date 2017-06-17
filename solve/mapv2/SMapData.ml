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

type map_loc = {
  loc : int;
  value : map_loc_val;
}

(*remap a value along a wire to a different number*)
type map_cstr =
  | SCReflowValue of int*number
  | SCEquality of (map_var ast)*(map_var ast)
  | SCUnifyVars of map_var*map_var
  | SCUnifyVarConst of map_var*number
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
type map_ctx = unit

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


  
