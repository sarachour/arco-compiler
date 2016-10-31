open SolverData
open Util
open SearchData
open HWData

(*the variable you're targetting*)
type part_id = {
  mvr:string;
  ident:int;
}

(*the global ordering*)
type glbl_id = {
  mvr_seq:string;
  ident:int;
}

(*a partial search*)
type psearch = (sstep,gltbl) ssearch
(*a map of partial searches*)
type psearches = (int,psearch) map

type mutbl = {
  (*subtrees*)
  env: uenv;
  partials: (string,psearch) map;
  globals: (string,psearch) map;

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
  mutable goals : (int,goal) map;
}
