open Util
open HW
open Math
open AST
open Unit
open Common
open HWData

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
  | LBindVar of hwvkind*mid

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

type steps = {
  mutable s :step list;
  id : int;
}
type score = unit


(*
the status of the node.
If the node is a dead end, there is no solution
If the node

*)
type status =
  (*A node that's a dead end. *)
  | DeadEnd
  (*A node that's blocking on some other node*)
  (*| Active of int*)

type status_table = {
  (*stalled, waiting for another subtree to finish*)
  mutable tbl: (int,status) map;
  (*current number of nodes*)
}

type buffer = {
  (*search tree*)
  paths: (steps, score) tree;
  mutable step_buf: steps option;
  (*the total number of step bundles*)
  mutable curs: (steps,score) cursor option;
  mutable st: status_table;
  mutable cnt: int;
}


type gltbl = {
  mutable goals : urel set;
  mutable nodes : (unodeid, unode) map;
  mutable search: buffer;
  mutable sln: sln;
}
