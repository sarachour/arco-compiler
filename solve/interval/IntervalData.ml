open AST
open Util
(* Spanning Variables *)
type interval = {
  min: float;
  max: float;
}
(* Spann *)
type span =
  | SPNInterval of interval
  | SPNUnknown 
  | SPNInfinite

type span_ast = span ast


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
