
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
  mutable order: simident queue;
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
      let proc_pair (x:simident) (v:simbhv) =
        match v.ic with
        | SLVal(f) -> let _ = MAP.put st x f in ()
        | _ -> let _ = MAP.put st x 0. in ()
      in
      let _ = MAP.iter g.g (fun x y -> proc_pair x y) in
      st
    in
    (*first make interfaces*)
    let setup_order () : simident list =
      (* global ordering list *)
      let order : simident queue = QUEUE.make () in
      let ord = REF.mk order in
      (*generate a dependency graph*)
      let deps = SimGraphLib.mkdeps g in
      (*update the queue to include the identifier if all the inputs are already enqueued*)
      let upd_q (id:simident) (b:simbhv) ndefer =
        if QUEUE.has order id then ndefer else
          let is_queued v =
            match v with
            | SVVar(v) ->
              if QUEUE.has order v then
                let _ = Printf.printf "%s true: %s\n" (SimGraphLib.simident2str id) (SimGraphLib.simident2str v) in
                true
              else
                let _ = Printf.printf "%s false: %s\n" (SimGraphLib.simident2str id) (SimGraphLib.simident2str v) in
                false
            | SVThis -> true
            | SVUnset -> true
          in
          let vars = ASTLib.get_vars b.rel in
          let allvars = LIST.fold vars (fun x r -> (is_queued x) && r) true in
          let _ = Printf.printf "%s all vars? %b\n" (SimGraphLib.simident2str id) allvars in
          if allvars then
            let _ = REF.upd ord (fun m -> QUEUE.enq m id) in
            ndefer
          else
            ndefer+1
      in
      let rec cycle () : unit =
        let ndefer = MAP.fold g.g (fun id bhv ndefer -> upd_q id bhv ndefer) 0 in
        if ndefer > 0 then
          let _ = Printf.printf "num deferred: %d / %d\n" ndefer (QUEUE.length order) in
          cycle ()
        else
          ()
      in
      let _ = cycle () in
      let depstr = GRAPH.tostr deps in
      let _ = Printf.printf "#### Dependency Graph..\n" in
      let _ = Printf.printf "%s\n" depstr in
      let _ = Printf.printf "------------\n" in
      let _ = Printf.printf "#### Queue\n" in
      let str = QUEUE.tostr order (fun x -> SimGraphLib.simident2str x) in
      let _ = Printf.printf "%s\n--------\n" str in
      (* *)
      order
    in
    let st = setup_valvector () in
    let order : simident queue = setup_order () in
    {state=st; order=order}

  (*initialize integrator state*)
  let init (pref:simprops) (g:simgraph) (st:simstate) =
    ()

  let visit (pref:simprops) (g:simgraph) (st:simstate) (place:simident) (time:float) =
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
