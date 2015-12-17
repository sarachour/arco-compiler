open AST
open Util
open SolverData
open HWData

type simvar = string
type simprop = string
type simrelkind = SimState | SimFunction

type simrel = {
    kind: simrelkind;
    rel: simvar ast;
    err: simvar ast;
    min: float;
    max: float;
    value: float;
}

type simstate = (simprop,float) map

type simnode = {
  inputs : simvar list;
  outputs : simvar list;
  rels : (string*string, simrel) map;
  state: simstate;
  id: string*int;
}


type simgraph = (simnode,simstate) graph

module SimGraphLib =
struct
  let simnode2str (n:simnode) =
    ""

  let simstate2str (e:simstate) =
    ""

  let make () : simgraph =
    let g = GRAPH.make (fun (x:simstate) y -> false) simnode2str simstate2str in
    g

  let init (g:simgraph) (h:hwenv) (s:sln) =
    g

end
