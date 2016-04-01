open AST
open Util
open SymCaml
open SymCamlData
open SearchData

type rkind =
| RKDeriv
| RKFunction

type unifytype = UTypTempl| UTypTarg

type 'a fuse =
  | USAssign of 'a*('a ast)
  (*remove solved targets*)
  | USRmGoal of 'a
  (*add partially resolved goal*)
  | USAddRel of 'a*('a ast)

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

type 'a asgn_state  = {
        mutable assigns: ('a, 'a ast) map;
        mutable solved: 'a list;
        mutable unused: ('a*('a ast)) list;
}

type 'a rstep =
        (*solution assign*)
       | RSetState of 'a asgn_state 
        (*ban an assignment*)
        | RBanAssign of 'a*('a ast)
        | RTemplSubgraph of 'a set

type 'a rvstats = {
  nconflicts: ('a*('a ast), int) map
}
(*the stateful part of teh tableau*)
type 'a rstate = {
  (*templ to targ assigns *)
  mutable state : 'a asgn_state option;
  (*targ bans for templ*)
  bans: ('a, ('a ast) set) map;
  mutable subset: 'a set;
}

(*the data for each variable*)
type 'a rdata = {
  rhs : 'a ast;
  kind: rkind;
}

type 'a rinfo = {
  (*the info*)
  info: ('a,'a rdata) map;
  (*the data with no dependences*)
  mutable nodep: ('a,'a rdata) map;
  (*replacements to break cycles*)
  mutable repls: ('a, 'a set) map;
  (*subtrees to apply*)
  mutable subtrees: ('a set) list;
}

(*the symcaml environment*)
type 'a renv = {
  s: symcaml;
  cnv: 'a->symvar;
  icnv: symvar->'a;
  freshvar: int -> unifytype -> 'a;
  is_wc: 'a -> bool
}

(*the tableau, which is comprised of the original statements  *)
type 'a rtbl = {
  templ: 'a rinfo;
  targ: 'a rinfo;
  (*template to rel assignments*)
  st: 'a rstate;
  env: 'a renv;
  tostr: 'a -> string;
}

(*the search tree to build*)
type 'a runify = {
  search : ('a rstep, 'a rtbl) ssearch;
  tbl: 'a rtbl;
}

(*the data necessary for the unification*)
type 'a rarg = 'a*('a ast)*rkind
