open SolverData
open Util
open SearchData

type mutbl = {
  (*subtrees*)
  slvr: slvr;
  partials: (unid,(sstep,slvr*gltbl) ssearch) map;
  globals: (string, (sstep,slvr*gltbl) ssearch) map;
  (*partial solutions that are applied*)
  local: (unid*int) set;
  (*the set of variables that are already solved*)
  mutable solved: unid set;
}
type mustep =
  | MSPartialApp of unid*int
  | MSSolveVar of unid

type musearch = {
  (*determine which solution of which variable to apply,
  solutions modify*)
  search: (mustep,mutbl) ssearch;
  state: mutbl;
  (*the order to process the expressions*)
  mutable order: unid queue;
  mutable nodes : (unodeid, unode) map;
  mutable goals : goal set;
  is_trivial: urel -> bool;
}
