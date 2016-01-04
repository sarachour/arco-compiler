
open Common
open Util
open SimData
open AST


type integrator =
  | Euler
  | RungaKutta4

type simprops = {
  step_size: float;
  time_end: float;
  time_start: float;
  integ: integrator;

}


type simident = string*int*simport*simprop


type simplace =
  | PlcNode of simident
  | PlcIface of simident

(*the current state, the props that have been visited*)
type simstate = {
  mutable state: (simident, simval) map;
  mutable v: simident set;
  mutable order: simplace list;
}

module SimRunner =
struct

  let mkcfg () =
    {
      step_size = 0.001;
      integ = Euler;
      time_start = 0.0;
      time_end = 1.0;
    }

  let mkdeps (g:simgraph) =
    let dep_graph : (simident,unit) graph =
      GRAPH.make (fun x y -> x = y) (fun (cn,ci,p,pr) -> cn^"["^(string_of_int ci)^"]."^p^"."^pr) (fun x -> "()") in
    let queue_node (node:simnode) =
      let compn,compi = node.id in
      let get_inps (iport,iprop) : simident =
        (*get all the originating edges*)
        let srcs : (simnode*simwire) list = GRAPH.srcs g.g node in
        let find_edge srcnode srcedj : simident option =
          match MAP.filter srcedj (fun s dests -> SET.has dests iport) with
          | [(srcport,destports)] ->
          if SET.has destports iport then
            let act_name, act_inst = srcnode.id in
            let act_port = force_conc (SET.get destports iport) in
            Some (act_name,act_inst,act_port, iprop)
          else
            None
          | _ -> error "mkdeps.find_edge" "unsupported."
        in
        let filter_edges (srcnode,srcedj) r : simident option =
          let res = find_edge srcnode srcedj in
          if r != None && res != None then
            error "mkdeps.filter_edges" "cannot have two edges to the same port."
          else if res != None then
            res
          else
            r
        in
        match LIST.fold srcs (fun x r -> filter_edges x r) None with
        | Some(ident) -> ident
        | _ -> error "mkdeps.get_inps" "impossible. There are no originating edges for port."
      in
      let queue_var oident (iport,iprop) =
        let iident : simident = get_inps (iport,iprop) in
        let _ = GRAPH.mknode dep_graph iident in
        let _ = GRAPH.mknode dep_graph oident in
        let _ = GRAPH.mkedge dep_graph iident oident () in
        ()
      in
      let queue_rel (port,prop) rel =
        let ident :simident = (compn, compi, port, prop) in
        let ins = ASTLib.get_vars rel in
        let _ = LIST.iter (fun x -> queue_var ident x) ins in
        ()
      in
      let _ = MAP.iter node.rels (fun id x -> queue_rel id x.rel) in
      ()
    in
    let _ = GRAPH.iter_node g.g (fun n -> queue_node n) in
    dep_graph

  (*setup integrator state*)
  let setup (pref:simprops) (g:simgraph) =
    let setup_valvector () =
      let st = MAP.make() in
      let proc_qty (compn:string) (compi:int) (port:simport) (prop:simprop) =
        let _ = Printf.printf "qty: %s %d %s %s\n" compn compi port prop in
        let _ = MAP.put st (compn, compi, port, prop) (SimVal 0.0) in
        ()
      in
      let proc_port (compn:string) (compi:int) (port:simport) =
        SET.iter g.props (fun pr -> proc_qty compn compi port pr)
      in
      let proc_node (node:simnode) =
        let n,i = node.id in
        let _ = List.iter (fun x -> proc_port n i x) node.outputs in
        ()
      in
      let proc_iface (iface:simiface) =
        let compn, compi = iface.comp in
        let port = iface.port in
        let prop = iface.prop in
        let _ = MAP.put st (compn, compi, port, prop) iface.v in
        ()
      in
      let _ = GRAPH.iter_node g.g (fun n -> proc_node n) in
      let _ = SET.iter g.ins (fun n -> proc_iface n) in
      st
    in
    (*first make interfaces*)
    let setup_order () =
      (* global ordering list *)
      let ord : simplace list = [] in
      let oref = REF.mk ord in
      (*generate a dependency graph*)
      let deps = mkdeps g in
      let depstr = GRAPH.tostr deps in
      let _ = Printf.printf "#### Dependency Graph..\n" in
      let _ = Printf.printf "%s\n" depstr in
      (* *)

      let proc_iface (iface:simiface) =
        let compn,compi = iface.comp in
        let port = iface.port in
        let prop = iface.prop in
        let pl = PlcIface (compn, compi, port, prop) in
        let _ = Printf.printf "iface: %s %d %s %s\n" compn compi port prop in
        let _ = REF.upd oref (fun ord -> pl::ord) in
        ()
      in
      let _ = SET.iter g.ins (fun n -> proc_iface n) in
      ord
    in
    let v = SET.make (fun x y -> x = y) in
    let st = setup_valvector () in
    let order = setup_order () in
    {v=v; state=st; order=order}

  (*initialize integrator state*)
  let init (pref:simprops) (g:simgraph) (st:simstate) =
    ()

  let visit (pref:simprops) (g:simgraph) (st:simstate) (place:simplace) (time:float) =
    ()

  let step (pref:simprops) (g:simgraph) (st:simstate) (time:float) =
    (*initialize visited nodes*)
    let _ = init pref g st in
    (*visit each node in order*)
    let _ = List.iter (fun plc -> visit pref g st plc time) st.order in
    (st, time+.pref.step_size)

  let run (pref:simprops) (g:simgraph) =
    let st = setup pref g in
    let rec foreach_step time st =
      if time < pref.time_end then
        let newst, ntime = step pref g st time in
        foreach_step ntime newst
      else
        ()
    in
    foreach_step 0.0 st



end
