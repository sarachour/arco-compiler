open Util
open HW
open Math
open AST
open Unit

type slvr =  {
  interactive: bool;
  hw: hwenv;
  prob: menv;
  max_depth: int;
  cnt: int;
}

(*Unified math and hardware ids*)

type unid =
  |MathId of mid
  |HwId of hwvid

type urel =
  | UFunction of unid*(unid ast)
  | UState of unid*(unid ast)*(unid)*unid


type unodeid =
  | UNoInput of string
  | UNoOutput of string
  | UNoCopy of string
  | UNoComp of string
  | UNoConcComp of string*int

type unode = {
  mutable rels : urel set;
  name : string;
}

(*A particular goal to strive for*)
type goal = urel

type wireid = unodeid*int*string

type label =
  | LMagnitude of range*untid*range*unt
  | LTime of range*untid*range*untid
  | LError
  | LBindValue of float
  | LBindVar of mid

type sln = {
  (*how many of each component is used *)
  mutable comps: (unodeid,(int set)*int) map;
  mutable conns: (wireid, wireid set) map;
  mutable labels: (wireid, (string, label set) map) map;
}


type step =
  | SSolUseNode of unodeid*int
  | SSolAddConn of wireid*wireid
  | SSolAddLabel of wireid*propid*label
  | SRemoveGoal of goal
  | SAddGoal of goal
  | SAddNode of unodeid*(urel list)
  | SRemoveNode of unodeid


type steps = {
  mutable s :step list;
  id : int;
}
type score = float

type buffer = {
  paths: (steps, score) tree;
  mutable step_buf: steps option;
  (*the total number of step bundles*)
  mutable visited: int set;
  mutable cnt: int;
  mutable curr: (steps,score) cursor option;
}


type gltbl = {
  mutable goals : urel set;
  mutable nodes : (unodeid, unode) map;
  mutable search: buffer;
  mutable sln: sln;
}
