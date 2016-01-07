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
  | SLUnset

type simbhv = {
    kind: simrelkind;
    rel: simrel;
    err: simrel option;
    min: float option;
    max: float option;
    ic: simval;
}

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
