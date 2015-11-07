open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData


module SearchLib =
struct
  let step2str n = match n with
  | SAddGoal(v) -> "add "^(UnivLib.urel2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.urel2str v)
  | SAddNode(id,rels) -> "add "^(UnivLib.unodeid2name id)
  | SRemoveNode(id) -> "rm"^(UnivLib.unodeid2name id)
  | SSolUseNode(id,i) -> "SLN use "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
  | SSolAddConn(src,snk) -> "SLN mkconn "^(SlnLib.wire2str src)^" <-> "^(SlnLib.wire2str snk)
  | _ -> "?"

  let visited b n =
    SET.has b.visited n.id

  let visit b n =
    let _ = b.visited <- SET.add b.visited n.id in
    ()

  let steps2str (b:buffer) (n:steps) =
    let id = (if visited b n then "." else "?")^(string_of_int n.id) in
    let prefix = match b.curr with
    | Some(c) -> if c = n then "["^id^"]" else id
    | None -> id
    in
    prefix^": "^(List.fold_right (fun x r -> r^" "^(step2str x)^";") n.s "")

  let score2str e = "score"

  let mksteps b =
    let _ = (b.cnt <- b.cnt + 1) in
    Some {s=[]; id=b.cnt}

  let mkscore () =
    1.

  let start b =
    b.step_buf <- mksteps b

  let id2node b x =
    match TREE.filter_nodes b.paths (fun q -> q.id = x) with
    | [x] -> x
    | _ -> error "id2node" "no node with that id exists."

  let add_step b s =
    match b.step_buf with
    | Some(b) -> b.s <- s::b.s
    | None -> ()

  let commit b =
    match b.step_buf, b.curr with
    | Some(q), Some(c) ->
      let _ = TREE.mknode b.paths q in
      let _ = TREE.mkedge b.paths c q (mkscore()) in
      let _ = b.step_buf <- None in
      q
    | Some(q), None ->
      error "commit" "cannot commit new step with no parent."
    | _,_ -> error "commit" "cannot commit empty node."


  let rm b n =
    let _ = match b.curr with
    | Some(v) -> if v = n then error "rm" "cannot remove current node." else ()
    | None -> ()
    in
    let _ = TREE.rmnode b.paths n in
    let _ = SET.rm b.visited n.id in
    b



  let buf2str b =
    TREE.tostr b.paths (fun x -> (steps2str b x))


  let cursor b =
    match b.curr with
    | Some(c) -> c
    | None -> error "cursor" "expected cursor."


  let apply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
    (*let _ = Printf.printf "> do step %s\n" (step2str s) in*)
    match s with
    | SAddGoal(g) -> let _ = SET.add tbl.goals g in ()
    | SRemoveGoal(g) -> let _ = SET.rm tbl.goals g in ()
    | SAddNode(id,u) -> let _ = MAP.put tbl.nodes id {name=(UnivLib.unodeid2name id);rels=SET.to_set u (fun x y -> x = y)} in ()
    | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_mark tbl.sln id i in ()
    | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn tbl.sln src snk in ()
    | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel tbl.sln wid prop lbl in ()

  let apply_steps (slvenv:slvr) (tbl:gltbl) (s:steps) =
    List.iter (fun x -> apply_step slvenv tbl x) s.s

  let unapply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
  (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
  match s with
  | SAddGoal(g) -> let _ = SET.rm tbl.goals g in ()
  | SRemoveGoal(g) -> let _ = SET.add tbl.goals g in ()
  | SAddNode(id,rels) -> let _ = MAP.rm tbl.nodes id in ()
  | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_unmark tbl.sln id i in ()
  | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn_undo tbl.sln src snk in ()
  | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel_undo tbl.sln wid prop lbl in ()

  let unapply_steps (slvenv) (tbl:gltbl) (s:steps) =
    List.iter (fun x -> unapply_step slvenv tbl x) s.s

  let move_cursor (s:slvr) (tbl:gltbl) (next:steps) =
    let b = tbl.search in
    match b.curr with
    | Some(old) ->
      let anc = TREE.ancestor b.paths next old in
      let to_anc = LIST.sublist (LIST.rev (TREE.get_path b.paths old)) old anc in
      let from_anc = LIST.sublist (TREE.get_path b.paths next) anc next in
      let _ = List.iter (fun x -> let _ = unapply_steps s tbl x in ()) to_anc in
      let _ = List.iter (fun x -> let _ = apply_steps s tbl x in ()) from_anc in
      let _ = (b.curr <- Some next) in
      tbl
    | None -> let to_node = TREE.get_path b.paths next in
      let _ = List.iter (fun x -> let _ = apply_steps s tbl x in ()) to_node in
      let _ = (b.curr <- Some next) in
      tbl

  let get_paths (b:buffer) =
    let p = TREE.leaves b.paths in
    let p = List.filter (fun x -> visited b x = false) p in
    p

  let random_path (b:buffer) =
    let choices = get_paths b in
    if List.length choices > 0 then
      Some (LIST.rand choices)
    else
      None

  let mkbuf goals =
    let g = TREE.make (fun x y -> x.id=y.id) (fun x y -> x = y) in
    let buf = {paths=g; step_buf=None; cnt=0; curr=None; visited=SET.make (fun x y -> x = y)} in
    let _ = start buf in
    let _ = List.iter (fun x -> add_step buf (SAddGoal x)) goals in
    match buf.step_buf with
    |Some(sb) ->
      let _ = TREE.mknode buf.paths (sb) in
      let _ = TREE.setroot buf.paths (sb) in
      let _ = (buf.step_buf <- None) in
      sb,buf
    |None -> error "mkbuf" "impossible to not have initial step"
end
