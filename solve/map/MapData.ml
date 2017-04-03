open HWData 
open AST
open IntervalData
open StochData


open Util

type map_type =
  | MTOffset | MTScale;;


type map_port = hwcompname*string

type 'a map_var =
  | MPVOffset of 'a 
  | MPVScale of 'a

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
  | MSDeclParam of map_port*float list
  | MSDeclOutput of map_port
  | MSDeclInput of map_port
  | MSValid
  | MSVarEqualsConst of map_port map_var*number
  | MSSetVarPriority of map_port map_var*int
  | MSSetPortCover of map_port*hwdefs
  | MSInvalid 
  | MSVarEqualsVar of (map_port map_var)*(map_port map_var) 
  | MSVarEqualsExpr of (map_port map_var)*(map_port map_var) map_expr
  | MSExprEqualsExpr of (map_port map_var) map_expr* (map_port map_var) map_expr 
  | MSExprEqualsConst of (map_port map_var) map_expr*number


  
(*the port mappings, perturb function.*)

(*a particular variable is equal to this.*)
type map_abs_var = {
  exprs : int ast list;
  value: number option;
  members: map_port map_var list;
  priority: int;
  id:int;
}

type map_var_info = {
  priority: int;
  abs_var:int;
}
type map_port_info = {
  port: string;
  comp: hwcompname;
  priority: int;
  range: num_interval;
  offset: map_var_info;
  scale: map_var_info;
}

type map_comp = {
  vars: (int,map_abs_var) map;
  inps: (map_port,map_port_info) map;
  outs: (map_port,map_port_info) map;
  params: (string,float) map;
}

type param_config = (string*float) list

type map_abs_comp = {
  spec:(param_config,map_comp) map;
}
type map_ctx = {
  comps: (hwcompname,map_abs_comp) map;
}

type hw_mapping = {
  mutable scale:float;
  mutable offset:float;
  mutable mrng:num_interval;
  mutable hrng:num_interval;
  mutable wire: wireid;
}
(*determines the kind of variable*)
(*
type linear_slack_dir =
  | SVMin | SVMax

type linear_id =
  | SVScaleVar of wireid
  | SVOffsetVar of wireid

type linear_smt_id =
  | SVLinVar of linear_id
  | SVSlackVar of linear_slack_dir*float*wireid*int

type linear_stmt =
  | SVNoOffset of linear_id ast
  | SVNoScale of linear_id ast
  | SVNeq of (linear_id ast)*linear_id ast
  | SVEquals of (linear_id ast) list
  | SVCoverEq of (linear_smt_id ast) list
  | SVCoverLTE of (linear_smt_id ast) list
  | SVCoverGTE of (linear_smt_id ast) list
  | SVDeclMapVar of linear_smt_id
  | SVLTE of (linear_id ast*linear_id ast)

type linear_mapping = {
  scale : linear_id ast;
  offset : linear_id ast;
  term: hwvid ast;
}


type map_heuristic = {
  math_rng:num_interval;
  hw_rng:num_interval;
  math_noise:rand_var;
  hw_noise:rand_var;
  mutable scale: bool;
  mutable offset: bool;
}

type map_heuristics = {
  mappings:(wireid,map_heuristic) map;
  mutable valid: bool;
}
*)
