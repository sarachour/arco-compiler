open AST
open Util
(* Spanning Variables *)
type bound_dir = QDPositive | QDNegative
(*simple, canonical bound*)

type bound =
  | BNDInf of bound_dir
  | BNDNum of float

type interval_data = {
  min: bound;
  max: bound;
}
type num_interval = {
  min: float;
  max:float;
}

let string_of_num_interval interval =
  "["^(string_of_float interval.min)^","^(string_of_float interval.max)^"]"
type interval_cstr =
  | ICstrContains of float
  | ICstrExcludes of float
  | ICstrLowerBound of bound
  | ICstrUpperBound of bound

type interval =
  | Interval of interval_data
  | MixedInterval of interval_data list 
  (*Quantization*)
  | Quantize of float list
  (*unknown upper bound*)
  | IntervalUnknown of interval_cstr list


type interval_ast = interval ast
type canon_interval_ast = interval ast


type mapvar = string

(*mapping variables*)
type 'a linear_mapper = {
  scale:'a ast;
  offset:'a ast;
}
(*MAPPING VARIABLES*)
type 'a scale_mapper = {
  scale:'a  ast;
}

type 'a offset_mapper = {
  offset:'a ast;
}
type cover_gap = {
  left:float;
  right:float;
}
type 'a mapper =
  | MAPLinear of 'a linear_mapper
  | MAPScale of 'a scale_mapper
  | MAPOffset of 'a offset_mapper
  | MAPDirect

type std_mapper = mapvar mapper
(*the mapping environment that each component has*)
type 'a mapper_env = {
  mutable vars: mapvar list;
  mutable mappings: ('a,'a mapper) map;
}

type 'a interval_env = {
  mutable intervals : ('a,interval) map;
}
(*
type 'a map_ctx = {
  mutable inst: (string,int) map;
  (*cstrs*)
  mutable usedin: (string*int, 'a) map;
  mutable uses: ('a,string*int) map;
  (*convert the hardware intervals to effective math intervals*)
  mutable conv : ('a,'a mapper) map;
  (*the hardware interval*)
  mutable ival_phys : ('a,interval) map;
  (*the interval you're imposing*)
  mutable ival_abs : ('a,interval) map;
}
*)
