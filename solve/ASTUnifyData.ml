open AST
open Util
open SymCaml
open SymCamlData
open SearchData

type rkind =
| RKDeriv
| RKFunction

(*whether you can flatten or preserve the variable*)
type rtype =
| RTFlatten
| RTPreserve

(*
You can use up a template rel, remove a target rel
addassign: add an assignment
banassign: ban an assignment
remove templ rel: remove a relation from the template
remove target rel: remove a relation from the target
fill in target var: fill in a target variable
fill in a templ var: fill in a template variable

*)
type 'a rstep =
  | RAddAssign of 'a*('a ast)
  | RBanAssign of 'a*('a ast)
  | RFocusTemplVar of 'a
  | RFocusTargetVar of 'a
  | RRemoveTemplRel of 'a
  | RRemoveTargetRel of 'a
  (*plug in any instances of a particular variable*)
  | RFillInTargetVar of 'a
  (*plug in any instances of a particular variable*)
  | RFillInTemplVar of 'a

(*the data for each variable*)
type 'a rdata = {
  rhs : 'a ast;
  kind: rkind;
  typ: rtype;
}
(*the variables that are filled and removed*)
type 'a rvstate = {
  fill: 'a set;
  rm: 'a set;
  focus: 'a;
}
(*the stateful part of teh tableau*)
type 'a rstate = {
  (*templ to targ assigns *)
  assigns: ('a, 'a ast) map;
  (*targ bans for templ*)
  bans: ('a, ('a ast) set) map;
  (*fill in target and templ*)
  templ: 'a rvstate;
  targ: 'a rvstate;
}
(*the tableau, which is comprised of the original statements  *)
type 'a rtbl = {
  templs: ('a,'a rdata) map;
  rels: ('a,'a rdata) map;
  (*dependency*)
  templ_deps: ('a,unit) graph;
  targ_deps: ('a, unit) graph;
  (*template to rel assignments*)
  st: 'a rstate;
}

(*the symcaml environment*)
type 'a renv = {
  s: symcaml;
  cnv: 'a->symvar;
  icnv: symvar->'a;
}
(*the search tree to build*)
type 'a runify = {
  search : ('a rtbl, 'a rstep) ssearch;
  tbl: 'a rtbl;
  env: 'a renv;
}

(*the data necessary for *)
type 'a relinfo = 'a*('a ast)*rtype*rkind
