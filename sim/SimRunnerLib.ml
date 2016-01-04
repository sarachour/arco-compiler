
open Common
open Util
open SimData
open AST
open SimGraphLib

type integrator =
  | Euler
  | RungaKutta4

type simprops = {
  step_size: float;
  time_end: float;
  time_start: float;
  integ: integrator;

}


(*the current state, the props that have been visited*)
type simstate = {
  mutable state: (simident, float) map;
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
    let setup_valvector () =
      let st = MAP.make() in
      st
    in
    (*first make interfaces*)
    let setup_order () : simplace list =
      (* global ordering list *)
      let ord : simplace list = [] in
      let oref = REF.mk ord in
      (*generate a dependency graph*)
      let deps = SimGraphLib.mkdeps g in
      let depstr = GRAPH.tostr deps in
      let _ = Printf.printf "#### Dependency Graph..\n" in
      let _ = Printf.printf "%s\n" depstr in
      let _ = Printf.printf "------------\n" in
      (* *)
      ord
    in
    let v = SET.make (fun x y -> x = y) in
    let st = setup_valvector () in
    let order : simplace list = setup_order () in
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
