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
        | RAddInAssign of string*hwvarcfg
        | RAddOutAssign of string*hwvarcfg
        | RAddParAssign of string*number
        (*ban an assignment*)
        | RDisableAssign of string*(unid ast)
        




type hwcomp_state = {
  env: hwvid hwenv;
  comp: hwvid hwcomp;
  cfg: hwcompcfg;
  target: string;
  inst: int option;
  (*disable*)
  mutable disabled: (string,hwvarcfg list) map;
  (* the state *)
}

type math_state = {
  env: mid menv;
  mutable solved: mid list;
}

type unify_targ =
  | TRGMathVar of string
  | TRGHWVar of (unid ast)
  | TRGNone

(*the dynamics must match*)

type entanglement  =
  | ENTMathHwEntang of mid*string
  | ENTHwHwEntang of hwvid*string

type symcaml_env = {
  s: symcaml;
  cnv: unid->symvar;
  icnv:math_state-> hwcomp_state->symvar->unid;
  is_wildcard:unid->bool;
}
(*the search tree to build*)
type rtbl = {
  hwstate:hwcomp_state;
  mstate:math_state;
  (*template to rel assignments*)
  symenv: symcaml_env;
  mutable target:unify_targ;
}

type runify = {
  search : (rstep, rtbl) ssearch;
  tbl: rtbl;
}

(*the data necessary for the unification*)
