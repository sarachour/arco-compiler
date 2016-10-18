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
type linear_mapper = {
  scale:mapvar ast;
  offset:mapvar ast;
}
(*MAPPING VARIABLES*)
type scale_mapper = {
  scale:mapvar ast;
}

type offset_mapper = {
  offset:mapvar ast;
}

type mapper =
  | MAPLinear of linear_mapper
  | MAPScale of scale_mapper
  | MAPOffset of offset_mapper
  | MAPDirect

(*the mapping environment that each component has*)
type 'a mapper_env = {
  mutable vars: mapvar list;
  mutable mappings: ('a,mapper) map;
}

type 'a interval_env = {
  mutable intervals : ('a,interval) map;
}

type 'a map_ctx = {
  mutable inst: (string,int) map;
  (*cstrs*)
  mutable usedin: (string*int, 'a) map;
  mutable uses: ('a,string*int) map;
  (*convert the hardware intervals to effective math intervals*)
  mutable conv : ('a,mapper) map;
  (*the hardware interval*)
  mutable ival_phys : ('a,interval) map;
  (*the interval you're imposing*)
  mutable ival_abs : ('a,interval) map;
}
