open Util;;
open AST;;
open IntervalData;;
open HWData;;

type map_var =
  | SMOffset of int
  | SMScale of int
  | SMFreeVar of int

(*a value into a port*)
type map_loc_val =
  | SVSymbol of interval
  | SVNumber of number
  | SVZero
  | SVOne

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

(*get the constraints*)
type map_result = {
  mutable cstrs: map_cstr list;
  mutable scale: map_var ast option;
  mutable offset: map_var ast option;
  mutable math_interval: interval;
  mutable hw_interval: interval;
}

type linear_transform = {
  mutable scale : float;
  mutable offset: float;
}
type map_late_bind = map_loc list ->  map_params -> map_result

type map_cstr_gen =
  | SCLateBind of map_late_bind
  | SCStaticBind of map_result

type map_comp = {

  subproblem: (int,map_cstr_gen) map;
}
type map_hw_spec = {
  comps : (hwcompname,map_comp) map;
}

type map_hw_config = {
  mutable cstrs: map_cstr list;
}


  
