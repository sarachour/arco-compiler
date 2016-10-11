open SolverData
open Util
open SearchData
open HWData

(*the variable you're targetting*)
type part_id = {
  mvr:string;
  inst:int;
}

(*the global ordering*)
type glbl_id = {
  gid:string;
  inst:int;
}
type mutbl = {
  (*subtrees*)
  env: uenv;
  partials: (part_id,(sstep,gltbl) ssearch) map;
  globals: (glbl_id, (sstep,gltbl) ssearch) map;

  (*partial solutions that are applied*)
  local: (part_id) set;
  mutable global: (glbl_id) option;

  (*the set of variables that are already solved*)
  mutable solved: string set;
}
type mustep =
  | MSPartialApp of part_id 
  | MSSolveVar of string
  | MSGlobalApp of glbl_id

type musearch = {
  (*determine which solution of which variable to apply,
  solutions modify*)
  search: (mustep,mutbl) ssearch;
  state: mutbl;
  (*the order to process the expressions*)
  mutable order: string queue;
  mutable avail_comps : (hwcompname, ucomp) map;
  mutable goals : goal set;
}
