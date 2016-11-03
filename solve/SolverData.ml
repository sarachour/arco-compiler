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

type goal_hw_expr = {
  wire: wireid;
  prop: string;
  expr: mid ast;
}
type goal_conn = {
  src: wireid;
  dst: wireid;
  expr: mid ast;
} 
type goal_ioblock = {
  wire: wireid;
  prop: string;
  expr: mid ast; 
}
(*port input goals*)
type unifiable_goal =
  | GUMathGoal of goal_math
  | GUHWInExprGoal of goal_hw_expr
  | GUHWConnPorts of goal_conn 
  | GUHWConnInBlock of goal_ioblock
  | GUHWConnOutBlock of goal_ioblock
(*
not necessarily a satisfiable goal
*)
                        
(*terminal goal
  | GPortConnGoal of goal_hw_conn
  | GInPortMapGoal of goal_hw_varmap  
  | GOutPortMapGoal of goal_hw_varmap  
*)

type goal_data =
  |GUnifiable of unifiable_goal

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
type hwvarcfg = {
  expr: unid ast;
}
type hwcompcfg = {
  mutable inps: (string,hwvarcfg) map;
  mutable outs: (string,hwvarcfg) map;
  mutable pars: (string,number) map;
  mutable mapvars: (string,float) map;
}
type ucomp = {
  d: hwvid hwcomp;
}
type ucomp_conc = {
  d: hwvid hwcomp;
  inst: int;
  mutable cfg: hwcompcfg; 
}


type usln = (string,mid) sln
type ulabel = (string,mid) label
(*Different kinds of labels*)


type sslnctx =
  | SSlnAddConn of wireconn
  | SSlnAddRoute of ulabel
  | SSlnRmRoute of ulabel
  | SSlnAddGen of ulabel
  | SSlnAddComp of hwcompinst

type sgoalctx =
  | SGAddGoal of goal
  | SGRemoveGoal of goal 
  | SGChangeGoalStatus of int*bool

type scmpctx =
  | SCMakeConcComp of ucomp_conc 
  | SCAddOutCfg of hwcompinst*string*hwvarcfg
  | SCAddInCfg of hwcompinst*string*hwvarcfg
  | SCAddParCfg of hwcompinst*string*number

type smapctx = unit
  
type sstep =
  | SModSln of sslnctx 
  | SModCompCtx of scmpctx
  | SModGoalCtx of sgoalctx
  | SModMapCtx of smapctx
  (*add a relation for a node*)


(*how much to scale and offset from math to hw*)
type hw_mapping = {
  mutable scale:float;
  mutable offset:float;
  mutable mrng:num_interval;
  mutable hrng:num_interval;
  mutable wire: wireid;
}
type uenv =  {
  hw: hwvid hwenv;
  math: mid menv;
  mutable goal_cnt:int;
}
type ucomp_ctx = {
  insts: (int,ucomp_conc) map;
  mutable cnt: int;
}
type gltbl = {
  (*solution env*)
  env: uenv;
  mutable sln_ctx: usln;
  mutable comp_ctx : (hwcompname,ucomp_ctx) map;
  mutable map_ctx : hwvid map_ctx; 
  mutable avail_comps : (hwcompname, ucomp) map;
  (*state of table*)
  mutable goals : (int,goal) map;
  mutable search: (sstep,gltbl) ssearch;
}
