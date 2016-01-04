open Util
open HW
open Math
open AST
open Unit
open Common
open HWData

type simport = string
type simprop = string
type simrelkind = SimState | SimFunction


type simident = string*int*simport*simprop

type simvar =
  | SVVar of simident
  | SVThis
  | SVUnset 

type simrel = simvar ast

type simval =
  SimFxn of (float -> float)*float
  | SLVal of float
  | SLExtern of string
  | SLVar of simident

type simbhv = {
    kind: simrelkind;
    rel: simrel;
    err: simrel;
    min: float;
    max: float;
    ic: simval;
}


type simplace =
  | PlcNode of simident
  | PlcIface of simident

(*determine the wire situation*)
type simwire = (simport, simport set) map

type simnode = {
  rel: simrel;
  err: simrel;
  min: float;
  max: float;
}


type simiface = {
  ident:simident;
  v: simval;
}

type simgraph = {
  ins: (simident,simval) map;
  outs: (simident,simval) map;
  g: (simident,simbhv) map;
  mutable props: simprop set;
}
