open AST
open Util
open SymCaml
open SymCamlData
open SearchData
open SolverData

open HWData
open MathData

(* the hardware state. includes unused strings,
assignments. we will add interval information *)


type rstep =
        | RAddInAssign of string*hwvar_config
        | RAddOutAssign of string*hwvar_config
        | RAddParAssign of string*number
        (*ban an assignment*)
        | RDisableAssign of string*(unid ast)
        


type symcaml_env = {
  s: symcaml;
  cnv: unid->symvar;
  icnv: symvar->unid;
}


type hwcomp_state = {
  hwenv: hwvid hwenv;
  comp: hwvid hwcomp;
  cfg: hwcomp_config;
  targ: string;
  (*disable*)
  mutable disabled: (string,hwvar_config list) map;
  (* the state *)
}

type math_state = {
  menv: mid menv;
  targ: mid mvar;
  mutable solved: mid list;
}

(*the dynamics must match*)
type entanglement  =
  | ENTMathHwEntang of mid*string
  | ENTHwHwEntang of hwvid*string

(*the search tree to build*)
type rtbl = {
  hwstate:hwcomp_state;
  mstate:math_state;
  (*template to rel assignments*)
  symenv: symcaml_env;
}

type 'a runify = {
  search : (rstep, rtbl) ssearch;
  tbl: rtbl;
}

(*the data necessary for the unification*)
