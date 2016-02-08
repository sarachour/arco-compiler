open AST
open Util
open SymCaml
open SymCamlData
open SearchData

type rkind =
| RKDeriv
| RKFunction

type 'a fuse =
  | USAssign of 'a*('a ast)
  (*remove solved targets*)
  | USRmTarg of 'a*('a ast)
  | USAddTarg of 'a*('a ast)
  (*add partially resolved*)
  | USAddTempl of 'a*('a ast)

type 'a fusion = 'a fuse list

(*
You can use up a template rel, remove a target rel
addassign: add an assignment
banassign: ban an assignment
remove templ rel: remove a relation from the template
remove target rel: remove a relation from the target
fill in target var: fill in a target variable
fill in a templ var: fill in a template variable

*)
type unifytype = UTypTempl| UTypTarg
type 'a rstep =
  (*solution assign*)
  | RAddAssign of 'a*('a ast)
  (*ban an assignment*)
  | RBanAssign of 'a*('a ast)
  (*concretize assignment for child nodes*)
  | RConcAssign of 'a*('a ast)
  (*concretize assignment*)
  | RForceAssign of 'a*('a ast)
  (*focus on a variable*)
  | RVarFocus of 'a*unifytype
  (*Remove a relation after it's solved*)
  | RVarRemove of 'a*unifytype
  (*Fill a relation*)
  | RVarFill of 'a*unifytype


(*the variables that are filled and removed*)
type 'a rvstate = {
  fill: 'a set;
  rm: 'a set;
  mutable focus: 'a option;
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

(*the data for each variable*)
type 'a rdata = {
  rhs : 'a ast;
  kind: rkind;
}

type 'a rinfo = {
  deps: ('a,unit) graph;
  info: ('a,'a rdata) map;

}

(*the symcaml environment*)
type 'a renv = {
  s: symcaml;
  cnv: 'a->symvar;
  icnv: symvar->'a;
}

(*the tableau, which is comprised of the original statements  *)
type 'a rtbl = {
  templ: 'a rinfo;
  targ: 'a rinfo;
  (*template to rel assignments*)
  st: 'a rstate;
  env: 'a renv;
}

(*the search tree to build*)
type 'a runify = {
  search : ('a rstep, 'a rtbl) ssearch;
  tbl: 'a rtbl;
  tostr: 'a -> string;
}

(*the data necessary for *)
type 'a rarg = 'a*('a ast)*rkind
