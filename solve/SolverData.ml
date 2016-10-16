open Util
open AST
open Unit


open HWData
open HWLib

open MathLib
open MathData

open SearchData

open IntervalData
open StochData


(*Unified math and hardware ids*)

type unid =
  |MathId of mid
  |HwId of hwvid

(*Tableau Data*)


(*
abstract hardware resources, including potentially
partially set parameters and multiple relations.

*)
type ucomp = {
  d: unid hwcomp;
}
(*A particular goal to strive for*)
(*
type goal =
  | TrivialGoal of uvar
  | NonTrivialGoal of uvar
*)
(*
   you start off with v = expr. You unify with
   h = expr', you are mapping v to h

   the mapping of v to h also maps [v] to [h]
   and enforces mapper [v] to [h]. the stochastic
   behavior 

   the vars h' in expr' are mapped to expressions
   in the math env 
*)

(* a math variable *)
type goal_math = {
  d: mid mvar;
}
(*
   map a math relation to the input port
*)
type goal_hw_input = {
  input_port:hwvid;
  expr:mid ast;
}
(*connect *)
(*connect two ports*)
type goal_hw_conn = {
  output_port:hwvid;
  input_port:hwvid;
}
(*map to the digital interface*)
type goal_hw_varmap = {
  expr: mid ast;
  port:hwvid;
}
(*port input goals*)
type goal_data =
  | GMathGoal of goal_math
  | GUnifyInPortGoal of goal_hw_input
  (*terminal goal*)
  | GPortConnGoal of goal_hw_conn
  | GInPortMapGoal of goal_hw_varmap  
  | GOutPortMapGoal of goal_hw_varmap  

type goal = {
  d: goal_data;
  mutable active:bool;
  id:int;
}
(*
solving goals generates facts:
   map an input port to a math variable
   map an input port to a math expr
   map an output port to a math variable 
*)
type hwvar_config = {
  expr: unid ast;
}
type hwcomp_config = {
  mutable asgns_in: (string,hwvar_config) map;
  mutable asgns_out: (string,hwvar_config) map;
  mutable par_asgns: (string,number) map;
  mutable mapvar_asgns: (string,float) map;
}

type ucomp_conc = {
  d: hwvid hwcomp;
  inst: int;
  mutable cfg: hwcomp_config; 
}
type portlabel_expr =
  |PLbVar of mid
  |PLbVal of number
  |PLbExpr of mid ast

(*map an expression to a hardware port*)
type portlabel = {
  hwid: hwvid;
  expr: portlabel_expr;
}

(*Different kinds of labels*)

type sln = {
  (*how many of each component is used *)
  mutable comps: (hwcompname,(int set)*int) map;
  mutable conns: (wireid, wireid set) map;
  mutable labels: (wireid, portlabel) map;
}


type sslnctx =
  | SSolUseNode of hwcompname*int
  | SSolAddConn of wireconn
  | SSolAddLabel of portlabel
  | SSolRemoveLabel of portlabel

type scmpctx =
  | SCAddUsedComp of ucomp*int

type sgoalctx =
  | SGAddGoal of goal
  | SGRemoveGoal of goal 
  | SGChangeGoalStatus of int*bool

type smapctx = unit
  
type sstep =
  | SModifySln of sslnctx 
  | SModifyCompCtx of scmpctx
  | SModifyGoalCtx of sgoalctx
  | SModifyMapCtx of smapctx
  (*add a relation for a node*)


type uenv =  {
  hw: hwvid hwenv;
  math: mid menv;
  mutable goal_cnt:int;
}
type gltbl = {
  (*solution env*)
  env: uenv;
  mutable sln_ctx: sln;
  mutable comp_ctx : (hwcompinst,ucomp) map;
  mutable map_ctx : hwvid map_ctx; 
  mutable avail_comps : (hwcompname, ucomp) map;
  (*state of table*)
  mutable goals : (int,goal) map;
  mutable search: (sstep,gltbl) ssearch;
  }
