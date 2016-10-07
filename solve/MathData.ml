open Common
open AST 
open Unit
open Util

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
}
type 'a mderiv = {
  mutable rhs: 'a ast;
  ic: number;
}

type 'a mbhv =
  | MBhvStateVar of 'a mderiv
  | MBhvVar of 'a mfxn
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
