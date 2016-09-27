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

(*Tableau Data*)

type ubhv_vk_analog_var = unit
type ubhv_vk_digital_var = unit 
type ubhv_vk_math_var = unit

type ubhv_var_kind =
  | UBHAnalogVar of ubhv_vk_analog_var
  | UBHDigitalVar of ubhv_vk_digital_var
  | UBMMathVar of ubhv_vk_math_var

type u_fxn_var = {
  mutable knd: ubhv_var_kind;
  mutable rhs : unid ast;
}

type ubhv_stub_kind =
  | UBHPortConn of unid
  | UBHPortVal of number

type u_stub_var = {
  mutable knd: ubhv_stub_kind;
}

type ubhv_sk_math_state = unit 
type ubhv_sk_analog_state = unit
type ubhv_state_kind =
  | UBHAnalogStateVar of ubhv_sk_analog_state
  | UBMMathStateVar of ubhv_sk_math_state

type u_state_var = {
  mutable knd : ubhv_state_kind;
  mutable rhs : unid ast;
  mutable ic : unid init_cond;
}
(**)

type ubhv =
  | UBhvVar of u_fxn_var
  | UBhvState of u_state_var
  | UBhvStub of u_stub_var
  | UBhvUndef

(*math *)
type uvar = {
  bhvr: ubhv;
  mutable lhs: unid;
}
type uparam = {
  name: string;
  values: number list;
}
(*abstract hardware resources, including potentially
partially set parameters and multiple relations.*)
type unode = {
  mutable params: (string,uparam) map;
  mutable vars: (unid,(uvar) list) map;
  name : string;
  comp_id: unodeid;
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
