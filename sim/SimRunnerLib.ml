
open Common
open Util
open SimData


type integrator =
  | Euler
  | RungaKutta4

type simprops = {
  step_size: float;
  time_end: float;
  time_start: float;
  integ: integrator;

}

type simplace =
  | PlcNode of string*int
  | PlcIface

type simident = string*int*simport*simprop

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

  (*setup integrator state*)
  let setup (pref:simprops) (g:simgraph) =
    let v = SET.make (fun x y -> x = y) in
    let st = MAP.make() in
    let order = [] in
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
      let _ = Printf.printf "iface: %s %d %s %s\n" compn compi port prop in
      let _ = MAP.put st (compn, compi, port, prop) iface.v in
      ()
    in
    let _ = GRAPH.iter_node g.g (fun n -> proc_node n) in
    let _ = SET.iter g.ins (fun n -> proc_iface n) in
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
