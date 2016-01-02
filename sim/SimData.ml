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

type simvar = simport*simprop

type simrel = {
    kind: simrelkind;
    rel: simvar ast;
    err: simvar ast;
    min: float;
    max: float;
    value: float;
}


type simnode = {
  inputs : simport list;
  outputs : simport list;
  rels : (simvar, simrel) map;
  id: string*int;
}

(*determine the wire situation*)
type simwire = (simport, simport set) map

type simval = SimVar of string | SimVal of float

type simiface = {
  comp: string*int;
  port: simport;
  prop: simprop;
  v: simval;
}

type simgraph = {
  ins: simiface set;
  outs: simiface set;
  g: (simnode,simwire) graph;
  mutable props: simprop set;
}
