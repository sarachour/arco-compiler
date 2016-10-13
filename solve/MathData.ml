open AST 
open Unit
open Util
open StochData

type mkind =   MInput | MOutput | MLocal
type mid =
  | MNVar of mkind*string
  | MNParam of string*number
  | MNTime



type mparam = {
  name: string;
  typ:unt;
  value:number;
}

type 'a mfxn = {
  mutable rhs: 'a ast;
  mutable stoch:'a stoch;
}
type 'a mderiv = {
  mutable rhs: 'a ast;
  ic: number;
  mutable stoch:'a stoch;
}

type 'a mbhv =
  | MBhvStateVar of 'a mderiv
  | MBhvVar of 'a mfxn
  | MBhvInput 
  | MBhvUndef

type 'a mvar = {
  name: string;
  typ:unt;
  knd:mkind;
  mutable bhvr:'a mbhv;
}
type 'a menv = {
  mutable vars: (string, mid mvar) map;
  mutable params: (string, mparam) map;
  mutable units : unt_env;
  mutable time : string option;
}
