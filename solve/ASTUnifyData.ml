type relkind =
| RKDeriv
| RKFunction

(*whether you can flatten or preserve the variable*)
type reltype =
| RTFlatten
| RTPreserve

(*
You can use up a template rel, remove a target rel
*)
type 'a rstep =
  | RAddAssign of 'a*('a ast)
  | RBanAssign of 'a*('a ast)
  | RRemoveTemplRel of 'a
  | RRemoveTargetRel of 'a
  | RFillInTargetVar of 'a
  | RFillInTemplVar of 'a

(*the data for each variable*)
type 'a rdata = {
  rhs : 'a ast;
  kind: rkind;
  typ: rtype;
}
(*the variables that are filled and removed*)
type 'a rvstate = {
  fill: a set;
  rm: a set;
}
(*the stateful part of teh tableau*)
type 'a rstate = {
  (*templ to targ assigns *)
  assigns: ('a, 'a ast) map;
  (*targ bans for templ*)
  bans: ('a, ('a ast) set) map;
  (*fill in target and templ*)
  templ: 'a vstate;
  fill: 'a vstate;
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
(*an empty stats thing*)
type 'a stats = {
  empty: unit
}
(*the symcaml environment*)
type 'a renv = {
  s: symenv;
  cnv: 'a->symvar;
  icnv: symvar->'a;
}
(*the search tree to build*)
type 'a rsearch = {
  s : ('a rtbl, a rstep) search;
  tbl: 'a rtableau;
  env: renv;
}

(*the data necessary for *)
type 'a relinfo = 'a*('a ast)*reltype*relkind
