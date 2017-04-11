open HWData 
open AST
open IntervalData
open StochData
open MathData


open Util

type map_type =
  | MTOffset | MTScale;;

type map_port = hwcompname*string

type 'a map_var =
  | MPVOffset of 'a 
  | MPVScale of 'a

type map_cstr =
  | MCNE | MCGT | MCGTE

(*a constrained configuration*)
type 'a map_expr =
  | MEVar of 'a
  | MEAny
  | MEConst of number 
  | MEPower of ('a map_expr)*number
  | MEAdd of ('a map_expr)*('a map_expr)
  | MESub of ('a map_expr)*('a map_expr)
  | MEMult of ('a map_expr)*('a map_expr)
  | MEDiv of ('a map_expr)*('a map_expr)

(*general map statement*)
type map_stmt =
  | MSDeclParam of map_port*number
  | MSDeclOutput of map_port
  | MSDeclInput of map_port
  | MSValid
  | MSVarEqualsConst of map_port map_var*number
  | MSVarHasCstr of map_port map_var*map_cstr*
                    (map_port map_var) map_expr
  | MSSetVarPriority of map_port map_var*int
  | MSSetPortCover of map_port*hwdefs
  | MSInvalid 
  | MSVarEqualsVar of (map_port map_var)*(map_port map_var) 
  | MSVarEqualsExpr of (map_port map_var)*(map_port map_var) map_expr
  | MSExprEqualsExpr of (map_port map_var) map_expr* (map_port map_var) map_expr 
  | MSExprEqualsConst of (map_port map_var) map_expr*number


  
(*the port mappings, perturb function.*)

(*a particular variable is equal to this.*)
type 'a map_abs_var = {
  mutable exprs : int map_expr list;
  mutable cstrs : (map_cstr*int map_expr) list;
  mutable value: number option;
  mutable members: 'a map_var list;
  mutable priority: int;
  id:int;
}

type map_var_info = {
  mutable priority: int;
  mutable abs_var:int;
}
type map_port_info = {
  port: string;
  mutable range: num_interval option;
  mutable deriv_range: num_interval option;
  mutable is_stvar: bool;

  offset: map_var_info;
  scale: map_var_info;
}

type 'a map_comp = {
  vars: (int,'a map_abs_var) map;
  inps: (string,map_port_info) map;
  outs: (string,map_port_info) map;
  params: (string,number) map;
  mutable id:int;
}


type 'a map_abs_comp = {
  spec:(int,'a map_comp) map;
  name: hwcompname;
}

type 'a map_ctx = {
  comps: (hwcompname,'a map_abs_comp) map;
}


(*for a circuit*)
type 'a map_circ = {
  vars: (int,'a map_abs_var) map;
  ports: (wireid,map_port_info) map;
  mappings: (wireid,num_interval) map;
  deriv_mappings: (wireid,num_interval) map;
}


type hw_mapping = {
  mutable scale:float;
  mutable offset:float;
  mutable mrng:num_interval;
  mutable hrng:num_interval;
  mutable wire: wireid;
}
(*determines the kind of variable*)
