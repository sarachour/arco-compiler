open Util


(*
the status of the node.
If the node is a dead end, there is no solution
If the node

*)
type 'a snode = {
  mutable s :'a list;
  id : int;
}

type sstat =
  (*A node that's a dead end. *)
  | SStatDeadEnd
  | SStatVisited
  | SStatSolution
  (*A node that's blocking on some other node*)
  (*| Active of int*)

type sstats= {
  (*stalled, waiting for another subtree to finish*)
  mutable tbl: (int,sstat) map;
  (*store variable bindings *)
}

type sscore = {
  (*the score of the steps*)
  mutable delta: float;
  (*the score of the state*)
  mutable state: float;
}
type ('a,'b) ssearch = {
  (*search tree*)
  tree: ('a snode, sscore) tree;
  mutable scratch: ('a snode) option;
  (*the total number of step bundles*)
  mutable curs: ('a snode,sscore) cursor option;
  mutable st: sstats;
  mutable cnt: int;
  apply: 'b -> 'a ->  'b;
  unapply: 'b -> 'a -> 'b;
  order: 'a -> 'a -> int;
  score: 'b -> 'a list -> sscore;
  tostr: 'a -> string;
}
