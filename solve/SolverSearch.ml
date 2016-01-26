open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData


module StatusTableLib =
struct
let mk () =
  {tbl=MAP.make()}

let is_deadend b n =
  if MAP.has b.tbl n.id = false then
    false
  else
    match MAP.get b.tbl n.id with
    | DeadEnd -> true
    | _ -> false

let get_deadends b =
  let flt = MAP.fold b.tbl (fun k v r -> if v = DeadEnd then k::r else r ) [] in
  flt

let clear_deadends b =
  let _ = MAP.iter b.tbl (fun k v -> if v = DeadEnd then let _ = MAP.rm b.tbl k in () ) in
  ()

let is_visited b n =
  if MAP.has b.tbl n.id = false then
    false
  else
    match MAP.get b.tbl n.id with
    | Visited -> true
    | _ -> false

let deadend b n =
  let _ = MAP.put b.tbl n.id DeadEnd in
  ()


let visited b n =
  let _ = MAP.put b.tbl n.id Visited in
  ()

let rm b n =
  let _ = MAP.rm b.tbl n.id in
  ()


end

module SearchLib =
struct

  let step2str n = match n with
  | SAddGoal(v) -> "add "^(UnivLib.goal2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.goal2str v)
  | SAddNode(id,i,rels) -> "SLN ADDNODE "^(UnivLib.unodeid2name id)^"."^(string_of_int i)^(List.fold_right (fun x r -> r^"; "^(UnivLib.urel2str x)) rels "")
  | SSolUseNode(id,i) -> "SLN use "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
  | SSolAddConn(src,snk) -> "SLN mkconn "^(SlnLib.wire2str src)^" <-> "^(SlnLib.wire2str snk)
  | SSolAddLabel(w,p,l) -> "SLN mklbl "^(SlnLib.wire2str w)^"."^p^(SlnLib.label2str l)
  | _ -> "?"


  let is_deadend b n =
    StatusTableLib.is_deadend b.st n


  let visited b n =
    ()

  let _steps2str (indent: int) (b:buffer) (n:steps) =
    let spcs = STRING.repeat "  " indent  in
    let id = (if is_deadend b n then "[x]" else "[?]")^(string_of_int n.id) in
    let prefix = match b.curs with
    | Some(c) -> if c = n then "||[C]"^id else id
    | None -> id
    in
    spcs^prefix^":\n"^(List.fold_right (fun x r -> r^spcs^" "^(step2str x)^"\n") n.s "")

  let steps2str (b:buffer) (n:steps) =
    _steps2str 0 b n

  let score2str e = "()"

  let mksteps b =
    let _ = (b.cnt <- b.cnt + 1) in
    Some {s=[]; id=b.cnt}

  let mkscore () = ()



  let fold_path (type a) (b:buffer) (n:steps) (fxn: step -> a -> a) (ic:a): a =
    if TREE.hasnode b.paths n = false then
      error "fold_path" ("node not in search tree.")
    else
    let apply_fxn n r =
      List.fold_right (fun x r -> fxn x r) n.s r
    in
     let els : a = List.fold_right apply_fxn (TREE.get_path b.paths n) ic in
     els

   let get_path (type a) (b:buffer) (n:steps) : step list =
     fold_path b n (fun x r -> x::r) []

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

  let commit b : steps=
    match b.step_buf, b.curs with
    | Some(q), Some(c) ->
      let _ = TREE.mknode b.paths q in
      let _ = TREE.mkedge b.paths c q (mkscore()) in
      let _ = b.step_buf <- None in
      q
    | Some(q), None ->
      error "commit" "cannot commit new step with no parent."
    | _,_ -> error "commit" "cannot commit empty node."


  let rm b (n:steps) =
    let _ = match b.curs with
    | Some(v) -> if v = n then () else ()
    | None -> ()
    in
    let _ = TREE.rmnode b.paths n in
    let _ = StatusTableLib.rm b.st n in
    b

  let cleanup b =
    let deadends : int list = StatusTableLib.get_deadends b.st in
    let id2node (x:int) : steps = List.nth (TREE.filter_nodes b.paths (fun q -> q.id = x)) 0 in
    let _ = List.iter (fun (xid:int) -> let _ = rm b (id2node xid) in ()) deadends in
    let _ = StatusTableLib.clear_deadends b.st in
    ()

  let deadend b n =
    let _ = StatusTableLib.deadend b.st n in
    ()


  let buf2str b =
    TREE.tostr b.paths (fun i x -> (_steps2str i b x))


  let cursor b =
    match b.curs with
    | Some(c) -> c
    | None -> error "cursor" "expected cursor."


  let apply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
    (*let _ = Printf.printf "> do step %s\n" (step2str s) in*)
    match s with
    | SAddGoal(g) ->
      let _ = SET.add tbl.goals g in ()
    | SRemoveGoal(g) ->
      let _ = SET.rm tbl.goals g in ()
    | SAddNode(id,i,u) -> let _ = MAP.put tbl.dngl (id,i) {name=(UnivLib.unodeid2name id);rels=SET.to_set u (fun x y -> x = y)} in ()
    | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_mark tbl.sln id i in ()
    | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn tbl.sln src snk in ()
    | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel tbl.sln wid prop lbl in ()
    | SSolRemoveLabel(wid,prop,lbl) -> let _ = SlnLib.mklabel_undo tbl.sln wid prop lbl in ()

  let apply_steps (slvenv:slvr) (tbl:gltbl) (s:steps) =
    let sort_steps x y = match (x,y) with
    | (SAddGoal(_),SRemoveGoal(_)) -> -1
    | (SRemoveGoal(_),SAddGoal(_)) -> 1
    | (_,SRemoveGoal(_)) -> 1
    | (_,SAddGoal(_)) -> 1
    | _ -> 0
    in
    let steps = List.sort sort_steps s.s in
    List.iter (fun x -> apply_step slvenv tbl x) steps

  let unapply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
  (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
  match s with
  | SAddGoal(g) ->
    let _ = SET.rm tbl.goals g in ()
  | SRemoveGoal(g) ->
    let _ = SET.add tbl.goals g in ()
  | SAddNode(id,i,rels) -> let _ = MAP.rm tbl.dngl (id,i) in ()
  | SSolUseNode(id,i) -> let _ = SlnLib.usecomp_unmark tbl.sln id i in ()
  | SSolAddConn(src,snk) -> let _ = SlnLib.mkconn_undo tbl.sln src snk in ()
  | SSolAddLabel(wid, prop, lbl) -> let _ = SlnLib.mklabel_undo tbl.sln wid prop lbl in ()
  | SSolRemoveLabel(wid,prop,lbl) -> let _ = SlnLib.mklabel tbl.sln wid prop lbl in ()

  let unapply_steps (slvenv) (tbl:gltbl) (s:steps) =
      let sort_steps x y = match (x,y) with
      | (SAddGoal(_),SRemoveGoal(_)) -> 1
      | (SRemoveGoal(_),SAddGoal(_)) -> -1
      | (_,SRemoveGoal(_)) -> -1
      | (_,SAddGoal(_)) -> -1
      | _ -> 0
      in
      let steps = List.sort sort_steps s.s in
      List.iter (fun x -> unapply_step slvenv tbl x) steps

  let move_cursor (s:slvr) (tbl:gltbl) (next:steps) =
    let b = tbl.search in
    match b.curs with
    | Some(old) ->
      let anc = TREE.ancestor b.paths next old in
      let to_anc = LIST.sublist (LIST.rev (TREE.get_path b.paths old)) old anc in
      let from_anc = LIST.sublist (TREE.get_path b.paths next) anc next in
      let _ = List.iter (fun x -> let _ = unapply_steps s tbl x in ()) to_anc in
      let _ = List.iter (fun x -> let _ = apply_steps s tbl x in ()) from_anc in
      let _ = (b.curs <- Some next) in
      tbl
    | None -> let to_node = TREE.get_path b.paths next in
      let _ = List.iter (fun x -> let _ = apply_steps s tbl x in ()) to_node in
      let _ = (b.curs <- Some next) in
      tbl


  let mkbuf goals =
    let g = TREE.make (fun x y -> x.id=y.id) (fun x y -> x = y) in
    let buf = {
        paths=g;
        step_buf=None;
        cnt=0;
        curs=None;
        st=StatusTableLib.mk();
    } in
    let _ = start buf in
    let _ = List.iter (fun x -> add_step buf (SAddGoal x)) goals in
    match buf.step_buf with
    |Some(sb) ->
      let _ = TREE.mknode buf.paths (sb) in
      let _ = TREE.setroot buf.paths (sb) in
      let _ = (buf.step_buf <- None) in
      sb,buf
    |None -> error "mkbuf" "impossible to not have initial step"






  (*determine if any of the paths of interest has a duplicate
  let is_dup (b:buffer) (a:steps): bool =
    let ids = RefTableLib.ids b.refs "" in
    if SET.has ids a.id then
      true
    else
      false
  *)

  let get_paths (b:buffer) =
    let p = TREE.leaves b.paths in
    let p = List.filter (fun x -> is_deadend b x = false) p in
    p

  let random_path (b:buffer) =
    let choices = get_paths b in
    if List.length choices > 0 then
      Some (List.nth choices 0 )
    else
      None
end
