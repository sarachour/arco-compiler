open Util
open AST
open Unit
open Common


open HWData
open HWLib

open MathLib
open MathData

open SearchData

type slvr =  {
  hw: hwvid hwenv;
  prob: mid menv;
  cnt: int;
}

(*Unified math and hardware ids*)

type unid =
  |MathId of mid
  |HwId of hwvid

type 'a init_cond = 
  | ICVar of 'a
  | ICVal of number 

type unodeid =
  | UNoInput of string
  | UNoOutput of string
  | UNoCopy of string
  | UNoComp of string


type unode_fxn = {
  mutable rhs : unid ast;
}
type unode_deriv = {
  mutable rhs : unid ast;
  mutable ic : unid init_cond;
}
type ubhv =
  |UBhvVar of unode_fxn
  |UBhvState of unode_deriv

type uvar = {
  bhvr: ubhv;
  mutable lhs: unid;
}

(*abstract hardware resources*)
type unode = {
  mutable rels: (unid,uvar list) map;
  name : string;
  id: unodeid;
}

(*A particular goal to strive for*)
type goal =
  | TrivialGoal of uvar
  | NonTrivialGoal of uvar

type wireid = unodeid*int*string

(*Different kinds of labels*)
type label =
  | LMagnitude of range*untid*range*unt
  | LTime of range*untid*range*untid
  | LError
  | LBindValue of hwvkind*number
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
  | SSolAddLabel of wireid*string*label
  | SSolRemoveLabel of wireid*string*label
  | SRemoveGoal of goal
  | SAddGoal of goal
  | SMakeGoalPassive of goal
  | SMakeGoalActive of goal
  (*add a relation for a node*)
  | SAddNodeRel of unodeid*int*(uvar)
  | SRemoveNodeRel of unodeid*int*(uvar)


type gltbl = {
  mutable goals : goal set;
  mutable blacklist : goal set;
  mutable nodes : (unodeid, unode) map;
  mutable used_nodes : (unodeid*int,unode) map;
  is_trivial: uvar->bool;
  mutable search: (sstep,slvr*gltbl) ssearch;
  mutable sln: sln;
}
