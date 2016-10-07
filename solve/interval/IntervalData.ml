open AST
open Util
(* Spanning Variables *)
type interval = {
  min: number;
  max: number;
}
(* Spann *)
type span =
  | SPNInterval of interval
  | SPNUnknown of interval
  | SPNNone

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
