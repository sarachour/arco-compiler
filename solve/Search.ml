open SearchData


open Util
open SolverData
open SolverUtil
open SolverSln
open SolverData


exception SearchException of (string)
let error n msg = raise (SearchException(n^": "^msg))


module SStatLib =
struct
  let mk () =
    {tbl=MAP.make()}

  let is_deadend (type a) (b:sstats) (n:a snode) =
    if MAP.has b.tbl n.id = false then
      false
    else
      match MAP.get b.tbl n.id with
      | SStatDeadEnd -> true
      | _ -> false

  let is_solution (type a) (b:sstats) (n:a snode) =
    if MAP.has b.tbl n.id = false then
      false
    else
      match MAP.get b.tbl n.id with
      | SStatSolution -> true
      | _ -> false

  let is_visited (type a) (b:sstats) (n:a snode) =
    if MAP.has b.tbl n.id = false then
      false
    else
      match MAP.get b.tbl n.id with
        | SStatVisited -> true
        | _ -> false

  let get_deadends (type a) (b:sstats) =
    let flt = MAP.fold b.tbl (fun k v r -> if v = SStatDeadEnd then k::r else r ) [] in
    flt

  let clear_deadends (b:sstats) =
    let _ = MAP.iter b.tbl (fun k v -> if v = SStatDeadEnd then let _ = MAP.rm b.tbl k in () ) in
    ()

  let is_visited (type a) (b:sstats) (n:a snode) =
    if MAP.has b.tbl n.id = false then
      false
    else
      match MAP.get b.tbl n.id with
      | SStatVisited -> true
      | _ -> false

  let deadend (type a) (b:sstats) (n:a snode) =
    let _ = MAP.put b.tbl n.id SStatDeadEnd in
    ()

  let solution (type a) (b:sstats) (n:a snode) =
    let _ = MAP.put b.tbl n.id SStatSolution in
    ()


  let visited (type a) (b:sstats) (n:a snode) =
    let _ = MAP.put b.tbl n.id SStatVisited in
    ()

  let rm (type a) (b:sstats) (n:a snode) =
    let _ = MAP.rm b.tbl n.id in
    ()

  let has_solution (b:sstats) =
    MAP.fold b.tbl (fun x v c -> if v = SStatSolution then true else c) true

  let get_solutions (b:sstats) : int list =
    let res = MAP.fold b.tbl (fun x v c -> if v = SStatSolution then x::c else c) [] in
    res

  let get_visited (b:sstats) : int list =
    let res = MAP.fold b.tbl (fun x v c -> if v = SStatVisited then x::c else c) [] in
    res

end

module SearchLib =
struct

  let is_deadend (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    SStatLib.is_deadend sr.st n

  let is_solution (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    SStatLib.is_solution sr.st n

  let visited (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    SStatLib.visited sr.st n

  let _steps2str (type a) (type b) (indent: int) (sr:(a,b) ssearch) (n:a snode) =
    let spcs = STRING.repeat "  " indent  in
    let id = (if is_deadend sr n then "[x]" else "[?]")^(string_of_int n.id) in
    let prefix = match sr.curs with
    | Some(c) -> if c = n then "{{C}}"^id else id
    | None -> id
    in
    spcs^prefix^":\n"^(List.fold_right (fun x r -> r^spcs^" "^(sr.tostr x)^"\n") n.s "")

  let steps2str (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    _steps2str 0 sr n

  let score2str (e:sscore) =
    "state="^(string_of_float e.state )^",delta="^(string_of_float e.delta)

  let search2str (type a) (type b) (sr:(a,b) ssearch) : string  =
    let _score2str indent v =
      let spcs = STRING.repeat "  " indent in
      spcs^"<score>:"^(score2str v)
    in
    TREE.tostr sr.tree (fun i x -> (_steps2str i sr x)) (fun i y -> _score2str i y)


  let mknode (type a) (type b) (sr:(a,b) ssearch)=
    let _ = (sr.cnt <- sr.cnt + 1) in
    Some {s=[]; id=sr.cnt}

  let mkscore state delta : sscore =
    {state=state; delta=delta}



  let fold_path (type a) (type b) (type r) (sr:(a,b) ssearch) (n:a snode) (fxn: a -> r -> r) (ic:r): r =
    if TREE.hasnode sr.tree n = false then
      error "fold_path" ("node not in search tree.")
    else
    let apply_fxn (n:a snode) (r:r) =
      List.fold_right (fun x r -> fxn x r) n.s r
    in
     let els : r = List.fold_right apply_fxn (TREE.get_path sr.tree n) ic in
     els

  let get_path (type a) (type b) (sr:(a,b) ssearch) (n:a snode) : a list =
     fold_path sr n (fun x r -> x::r) []

  let start (type a) (type b) (sr:(a,b) ssearch) =
    sr.scratch <- mknode sr

  let id2node (type a) (type b) (sr:(a,b) ssearch) (x:int) =
    match TREE.filter_nodes sr.tree (fun q -> q.id = x) with
    | [x] -> x
    | _ -> error "id2node" "no node with that id exists."

  let add_step (type a) (type b) (sr:(a,b) ssearch) (s:a) =
    match sr.scratch with
    | Some(b) -> b.s <- s::b.s
    | None -> error "add_step" "cannot add step to no node"

  let add_steps (type a) (type b) (sr:(a,b) ssearch) (st:a list) =
    let _ = List.iter (fun x -> add_step sr x) st in
    ()

  let commit (type a) (type b) (sr:(a,b) ssearch) (state:b) : a snode=
    match sr.scratch, sr.curs with
    | Some(node), Some(cursor) ->
      let _ = TREE.mknode sr.tree node in
      let score : sscore = sr.score state node.s in
      let _ = TREE.mkedge sr.tree cursor node score in
      let _ = sr.scratch <- None in
      node
    | Some(_), None ->
      error "commit" "cannot commit new step with no parent."
    | _,_ -> error "commit" "cannot commit empty node."


  let rm (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    let _ = match sr.curs with
    | Some(v) -> if v = n then () else ()
    | None -> ()
    in
    let _ = TREE.rmnode sr.tree n in
    let _ = SStatLib.rm sr.st n in
    sr

  let cleanup (type a) (type b) (sr:(a,b) ssearch)=
    let deadends : int list = SStatLib.get_deadends sr.st in
    let id2node (x:int) : a snode = List.nth (TREE.filter_nodes sr.tree (fun q -> q.id = x)) 0 in
    let _ = List.iter (fun (xid:int) -> let _ = rm sr (id2node xid) in ()) deadends in
    let _ = SStatLib.clear_deadends sr.st in
    ()

  let deadend (type a) (type b) (sr:(a,b) ssearch) (n:a snode) : unit =
    let _ : unit = SStatLib.deadend sr.st n in
    ()

  let solution (type a) (type b) (sr:(a,b) ssearch) (n:a snode)  : unit =
    let _ : unit = SStatLib.solution sr.st n in
    ()

  let get_solutions  (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) : (a snode) list=
    let test_sln (x:int) =
      let nd : a snode = id2node sr x in
      match root with
      | Some(anc) ->
        let in_subtree : bool = TREE.has_ancestor sr.tree nd anc in
        in_subtree
      | None -> true
    in
    let slns = SStatLib.get_solutions sr.st in
    let fslns = List.filter (fun x -> test_sln x) slns in
    let stslns : (a snode) list = List.map (fun x -> id2node sr x) fslns in
    stslns

  let has_solution (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) =
    (List.length (get_solutions sr root)) > 0


  let cursor b =
    match b.curs with
    | Some(c) -> c
    | None -> error "cursor" "expected cursor."

  let upd_score (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
    if TREE.hasnode sr.tree node = false then () else
    let score : sscore = sr.score env node.s in
    let par : (a snode) option = TREE.parent sr.tree node in
    let _ = if par <> None then
      let par = OPTION.force_conc par in
      let _ = TREE.updedge sr.tree par node score in ()
      else ()
    in
    ()

  let apply_node (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
    let steps = List.sort (sr.order) node.s in
    let nenv = List.fold_right (fun x b -> let nb = sr.apply b x in nb) steps env in
    let _ = upd_score sr env node in
    (*recompute score*)
    nenv


  let wrap_node (type a) (s:a list) : a snode =
    {id=(-1); s=s}

  let unapply_node (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
      let _ = upd_score sr env node in
      let steps = List.sort (sr.order) node.s in
      let nenv = List.fold_right (fun x b -> let nb = sr.unapply b x in nb) steps env in
      nenv

  let move_cursor (type a) (type b) (sr:(a,b) ssearch) (env:b) (next:a snode)  =
    let nenv = match sr.curs with
    | Some(old) ->
      let anc = TREE.ancestor sr.tree next old in
      let to_anc = LIST.sublist (LIST.rev (TREE.get_path sr.tree old)) old anc in
      let from_anc = LIST.sublist (TREE.get_path sr.tree next) anc next in
      let env = List.fold_right (fun x nenv -> let nenv = unapply_node sr env x in nenv) to_anc env in
      let env = List.fold_right (fun x nenv -> let nenv= apply_node sr nenv x in nenv) from_anc env in
      let _ = (sr.curs <- Some next) in
      env
    | None -> let to_node = TREE.get_path sr.tree next in
      let env = List.fold_right (fun x nenv -> let nenv = apply_node sr nenv x in nenv) to_node env in
      let _ = (sr.curs <- Some next) in
      env
    in

    env

  let setroot (type a) (type b) (sr:(a,b) ssearch) (env:b) (sts:a list) =
    let _ = start sr in
    let _ = add_steps sr sts in
    match sr.scratch with
    |Some(sb) ->
      let _ = TREE.mknode sr.tree (sb) in
      let _ = TREE.setroot sr.tree (sb) in
      let _ = (sr.scratch <- None) in
      let tbl = move_cursor sr env sb in
      sb,sr
    |None -> error "mkbuf" "impossible to not have initial step"


  let mksearch (type a) (type b) (apply:b->a->b) (unapply:b->a->b) (order:a->a->int) (score:b->a list->sscore) (tostr:a->string) =
    let g = TREE.make (fun x y -> x.id=y.id) (fun x y -> x = y) in
    let srch = {
        tree=g;
        scratch=None;
        cnt=0;
        curs=None;
        st=SStatLib.mk();
        apply=apply;
        unapply=unapply;
        order=order;
        tostr=tostr;
        score=score;
    } in
    srch



  let get_paths  (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) : (a snode) list=
    let p = TREE.leaves sr.tree in
    let test_path x =
      let in_subtree = match root with
        | Some(r) -> TREE.has_ancestor sr.tree x r
        | None -> true
      in
        in_subtree && (is_deadend sr x = false) && (is_solution sr x = false)
    in
    let p = List.filter (fun x -> test_path x) p in
    p

  let random_path (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) =
    let choices = get_paths sr root in
    if List.length choices > 0 then
      Some (List.nth choices 0 )
    else
      None

  let is_exhausted  (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) =
    if List.length (get_paths sr root) == 0 then
      true
    else
      false


  (*select best node, given a criteria*)
  let select_best_node (type a) (type b) (sr:(a,b) ssearch) (conv:float->sscore->float) (root:(a snode) option) : (a snode) option =
    let currnode = cursor sr in
    let score_path (endnode:a snode) : float =
      let score_node (e:a snode) (r:float) : float = r in
      let score_edge src snk (v:sscore) (r:float) : float =  conv r v in
      let init_score : float = 0. in
      let score = TREE.fold_path score_node score_edge sr.tree endnode init_score in
      score
    in
    (*get all the paths for teh root node*)
    let leaves = if root = None
      then get_paths sr None
      else get_paths sr (root)
    in
    match leaves with
    | [] -> None
    | h::t ->
      (*look at everything but the current node*)
      let leaves = LIST.filter (fun x -> x <> currnode) leaves in
      let _,best = LIST.max (fun x -> score_path x) leaves in
      Some(best)

end
