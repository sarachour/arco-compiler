open Util
open HW
open Math
open AST
open Unit
open Common
open HWData
open SearchData

type slvr =  {
  hw: hwenv;
  prob: menv;
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
type goal =
  | TrivialGoal of urel
  | NonTrivialGoal of urel

type wireid = unodeid*int*string

type label =
  | LMagnitude of range*untid*range*unt
  | LTime of range*untid*range*untid
  | LError
  | LBindValue of number
  | LBindVar of hwvkind*mid

type sln = {
  (*how many of each component is used *)
  mutable comps: (unodeid,(int set)*int) map;
  mutable conns: (wireid, wireid set) map;
  mutable labels: (wireid, (string, label set) map) map;
}


type sstep =
  | SSolUseNode of unodeid*int
  | SSolAddConn of wireid*wireid
  | SSolAddLabel of wireid*propid*label
  | SSolRemoveLabel of wireid*propid*label
  | SRemoveGoal of goal
  | SAddGoal of goal
  | SMakeGoalPassive of goal
  | SMakeGoalActive of goal
  | SAddNodeRel of unodeid*int*(urel)


type gltbl = {
  mutable goals : goal set;
  mutable blacklist : goal set;
  mutable nodes : (unodeid, unode) map;
  mutable dngl : (unodeid*int,unode) map;
  is_trivial: urel->bool;
  mutable search: (sstep,slvr*gltbl) ssearch;
  mutable sln: sln;
}
