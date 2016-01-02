
open Common
open Util
open SimData


type integrator =
  | Euler
  | RungaKutta4

type sim_props = {
  step_size: float;
  time_end: float;
  time_start: float;
  integ: integrator;

}

type place =
  | PlcNode of string*int
  | PlcIface

type simident = string*int*simport*simprop


(*the current state, the props that have been visited*)
type simstate = {
  mutable state: (simident, float) map;
  mutable v: simident set;
  mutable order: place list;
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
  let setup (pref:sim_props) (g:simgraph) =
    let proc_qty (compn:string) (compi:int) (port:simport) (prop:simprop) =
      ()
    in
    let proc_port (compn:string) (compi:int) (port:simport) =
      SET.iter g.props (fun pr -> proc_qty compn compi port pr)
    in
    let proc_node (node:simnode) =
      let n,i = node.id in
      let _ = SET.iter node.outs (fun x -> proc_port n i x) in
      ()
    in
    let v = SET.make (fun x y -> x = y) in
    let st = MAP.make() in
    let order = [] in
    {v=v; state=st; order=order}

  (*initialize integrator state*)
  let init (pref:sim_props) (g:simgraph) (st:simstate) =
    ()

  let step (pref:sim_props) (g:simgraph) (st:simstate) (time:float) =
    (*initialize visited nodes*)
    let _ = init pref g st in
    (*visit each node in order*)
    let _ = List.iter (fun plc -> visit pref g st plc) st.order time in
    (st, time+pref.step_size)

  let run (pref:sim_props) (g:simgraph) =
    let st = setup pref g in
    let while_step t st =
      if t < pref.time_end then
        let newst, ntime = step pref g st time in
        while_step ntime newst
      else
        ()
    in
    while_step 0.0 st



end
