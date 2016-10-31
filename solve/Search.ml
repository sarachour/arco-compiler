open SearchData


open Util
open SolverData
open SolverUtil
open SlnLib
open SolverData

open Interactive


exception SearchException of (string)
let error n msg = raise (SearchException(n^": "^msg))


let _print_debug = print_debug 5 "search"
let debug = print_debug 5 "search"
let _menu = menu 5
let _print_inter = print_inter 5


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

  let num_solutions (b:sstats) : int =
    MAP.fold b.tbl (fun x v c -> if v = SStatSolution then c+1 else c) 0

  let has_solution (b:sstats) =
    num_solutions b > 0

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

  let is_visited (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    SStatLib.is_visited sr.st n

  let steps2str (type a) (type b) (indent: int) (sr:(a,b)ssearch) (lst:a list) : string =
    let spcs = STRING.repeat "  " indent  in
    let sort_steps = List.sort (sr.order) lst in
    (*move from beginning to end of list*)
    List.fold_left (fun r x -> r^spcs^" "^(sr.tostr x)^"\n") "" sort_steps

  let _stepnode2str (type a) (type b) (indent: int) (sr:(a,b) ssearch) (n:a snode) =
    let spcs = STRING.repeat "  " indent  in
    let id = (
      if is_deadend sr n then "[XX]"
      else if is_solution sr n then "[SL]"
      else if is_visited sr n then "[V]"
      else "[  ]")^(string_of_int n.id) in
    let prefix = match sr.curs with
    | Some(c) -> if c = n then "{{C}}"^id else id
    | None -> id
    in
    spcs^prefix^":\n"^(steps2str indent sr n.s)

  let stepnode2str (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    _stepnode2str 0 sr n

  let score2str (e:sscore) =
    "state="^(string_of_float e.state )^",delta="^(string_of_float e.delta)

  let search2str (type a) (type b) (sr:(a,b) ssearch) : string  =
    let _score2str indent v =
      let spcs = STRING.repeat "  " indent in
      spcs^"<score>:"^(score2str v)
    in
    TREE.tostr sr.tree (fun i x -> (_stepnode2str i sr x)) (fun i y -> _score2str i y)

  let print_frontier sr =
    let prefix = "Frnt "^(string_of_int( ORDSET.length sr.frontier))^":"  in 
    let front_str =
      ORDSET.ord2str sr.frontier (fun _x -> let x = REF.dr _x in (string_of_int x.id)^":"^(string_of_float x.score))
    in 
    ()

  let mknode (type a) (type b) (sr:(a,b) ssearch)=
    let _ = (sr.cnt <- sr.cnt + 1) in
    Some {s=[]; id=sr.cnt; score=0.}

  let mkscore state delta : sscore =
    {state=state; delta=delta}

  let filter_nodes (type a) (type b) (sr:(a,b) ssearch) (fxn:a list -> bool) : (a snode) list=
    TREE.filter_nodes sr.tree (fun (n:a snode) -> fxn n.s)


  let fold_path (type a) (type b) (type r) (sr:(a,b) ssearch) (n:a snode) (fxn: a -> r -> r) (ic:r): r =
    if TREE.hasnode sr.tree n = false then
      error "fold_path" ("node not in search tree.")
    else
    let apply_fxn (n:a snode) (r:r) =
      List.fold_right (fun x r -> fxn x r) n.s r
    in
     let els : r = List.fold_right apply_fxn (TREE.get_path sr.tree n) ic in
     els

  let get_steps (type a) (type b) (sr:(a,b) ssearch) (n:a snode) : a list =
    n.s

  let get_path (type a) (type b) (sr:(a,b) ssearch) (n:a snode) : a list =
     fold_path sr n (fun x r -> x::r) []

  let depth (type a) (type b) (sr:(a,b) ssearch) (c) =
    List.length (TREE.get_path sr.tree c)

  let start (type a) (type b) (sr:(a,b) ssearch) =
    sr.scratch <- mknode sr

  let id2node (type a) (type b) (sr:(a,b) ssearch) (x:int) =
    match TREE.filter_nodes sr.tree (fun q -> q.id = x) with
    | [x] -> x
    | [] -> error "id2node" ("no node id "^(string_of_int x)^" exists")
    | _ -> error "id2node" ("more than one node with id "^(string_of_int x)^" exists.")

  let add_step (type a) (type b) (sr:(a,b) ssearch) (s:a) =
    match sr.scratch with
    | Some(b) -> b.s <- s::b.s
    | None -> error "add_step" "cannot add step to node"

  let add_steps (type a) (type b) (sr:(a,b) ssearch) (st:a list) =
    let _ = List.iter (fun x -> add_step sr x) st in
    ()

  let apply_steps (type a) (type b) (sr:(a,b) ssearch) (env:b) (st:a list) =
    let steps = List.sort (sr.order) st in
    (*move from beginning to end of list*)
    let _ = List.fold_left (fun () x -> let _ = sr.apply env x in ()) () steps in
    ()

  let unapply_steps (type a) (type b) (sr:(a,b) ssearch) (env:b) (st:a list) =
    let steps = List.sort (sr.order) st in
    (*move from end to beginning of list*)
    let _ = List.fold_right (fun x ()  -> let _ = sr.unapply env x in ()) steps () in
    ()

  let has_child (type a) (type b) (sr:(a,b) ssearch) (s:a snode) =
    TREE.has_child sr.tree s

  let rm (type a) (type b) (sr:(a,b) ssearch) (n:a snode) =
    let _ = match sr.curs with
    | Some(v) -> if v = n then () else ()
    | None -> ()
    in
    let _ = ORDSET.rm sr.frontier (REF.mk n) in 
    let _ = TREE.rmnode sr.tree n in
    let _ = SStatLib.rm sr.st n in
    sr

  let apply_node (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
    debug ("== apply node "^(string_of_int node.id)^" ===\n"^(steps2str 1 sr node.s)^"\n");
    let nenv = List.fold_left (fun b x -> let nb = sr.apply b x in nb) env node.s in
    (*let _ = upd_score sr env node in*)
    (*recompute score*)
    nenv


  let wrap_node (type a) (s:a list) : a snode =
    {id=(-1); s=s; score=0.}

  let unapply_node (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
    (*let _ = upd_score sr env node in*)
    debug ("== unapply node "^(string_of_int node.id)^" ===\n"^(steps2str 1 sr (LIST.rev node.s))^"\n");
    let nenv = List.fold_right (fun x b -> let nb = sr.unapply b x in nb) node.s env in
    nenv


  let clear_cursor (type a) (type b) (sr:(a,b) ssearch) : unit =
      (sr.curs <- None);
      ()

  let move_cursor (type a) (type b) (sr:(a,b) ssearch) (env:b) (next:a snode)  =
    if TREE.hasnode sr.tree next = false then
      error "move_cursor" ("the node of id "^(string_of_int next.id)^" to move to does not exist.")
    else
    let nenv = match sr.curs with
    | Some(old) ->
      if TREE.hasnode sr.tree old = false then
        error "move_cursor" ("the cursor of id "^(string_of_int next.id)^" is not found.") 
      else
          let anc = TREE.ancestor sr.tree next old in
          debug ("move cursor: "^(string_of_int old.id)^"->"^(string_of_int anc.id)^"->"^(string_of_int next.id));
          (*from leaf to root list*)
          let to_anc = LIST.rm_after (TREE.get_path sr.tree old) (fun n -> anc.id = n.id) in
          (*from leaf to root list*)
          let from_anc = LIST.rm_after (TREE.get_path sr.tree next) (fun n -> anc.id = n.id) in
          debug "== move information ==";
          debug ("<- steps: "^(LIST.length2str to_anc)^"/"^(LIST.length2str (TREE.get_path sr.tree old)));
          debug (LIST.tostr (fun (n:a snode) -> string_of_int n.id) " " (TREE.get_path sr.tree old));
          debug (LIST.tostr (fun (n:a snode) -> string_of_int n.id) " " to_anc);
          debug ("-> steps: "^(LIST.length2str from_anc) ^"/"^(LIST.length2str (TREE.get_path sr.tree next)));
          debug (LIST.tostr (fun (n:a snode) -> string_of_int n.id) " " (TREE.get_path sr.tree next));
          debug (LIST.tostr (fun (n:a snode) -> string_of_int n.id) " " from_anc);
          List.iter (fun x -> noop (unapply_node sr env x))  to_anc;
          List.iter (fun x -> noop (apply_node sr env x )) (LIST.rev from_anc);
          (sr.curs <- Some next);
          env
    | None ->
        let to_node = TREE.get_path sr.tree next in
        List.iter (fun x -> noop (apply_node sr env x)) to_node;
        (sr.curs <- Some next);
        env
    in
    env


  let get_node_by_id (type a) (type b) (sr:(a,b) ssearch) (id:int) : a snode option=
    let nodes : a snode list = TREE.filter_nodes sr.tree (fun q -> q.id = id) in
          if List.length nodes = 1 then
            Some (List.nth nodes 0)
          else if List.length nodes = 0 then
            None
          else
            error "cleanup" "more than one nodes with the same id."
 
  (*cleaning*)
  let cleanup (type a) (type b) (sr:(a,b) ssearch) (env:b)=
    let new_env = match sr.curs,sr.tree.root with
    | Some(cursor),Some(root_id) ->
      if is_deadend sr cursor then
        begin match get_node_by_id sr root_id with
          | Some(root) -> begin move_cursor sr env root end
          | None -> error "cleanup" "root node does not exist."
        end
      else env
    | None,_ -> env
    in
    _print_debug "== CLEANUP ROUTINE ==";
    let deadends : int list = SStatLib.get_deadends sr.st in
    List.iter (fun (xid:int) ->
        begin match get_node_by_id sr xid with
          |Some(node) -> begin _print_debug ("<cleanup> removing node "^(string_of_int xid)); rm sr node; () end
          |None -> ()
        end
      ) deadends;
    SStatLib.clear_deadends sr.st;
    new_env


  let parent (type a) (type b) (sr:(a,b) ssearch) (node:a snode) =
    match TREE.parent sr.tree node with
    | Some(par) -> par
    | None -> error "parent" "this node doesn't have a parent"

  let murder_branch (type a) (type b) (sr:(a,b) ssearch) (leaf:a snode) : unit =
    let rec _kill_branch n =
      match TREE.parent sr.tree n with
      | Some(par) ->
        let siblings : a snode list = (TREE.children sr.tree par) in
        let live_siblings = LIST.filter (fun node ->
            is_visited sr node = false && is_deadend sr node = false && is_solution sr node = false) siblings in
        (*the children are fully explored*)
        if List.length live_siblings = 0 then
          let sln_siblings = LIST.filter (fun node -> is_visited sr node || is_solution sr node) siblings in
          ORDSET.rm sr.frontier (REF.mk par);
          begin
          if List.length sln_siblings > 0 then SStatLib.visited sr.st par 
          else SStatLib.deadend sr.st par;
          end;
           _kill_branch par
        else
          ()
      | None -> ()
    in
    _kill_branch leaf;
    ()
   

  let solution (type a) (type b) (sr:(a,b) ssearch) (n:a snode)  : unit =
    SStatLib.solution sr.st n;
    ORDSET.rm sr.frontier (REF.mk n);
    murder_branch sr n;
    ()


  let visited (type a) (type b) (sr:(a,b) ssearch) (n:a snode):unit =
    SStatLib.visited sr.st n;
    ORDSET.rm sr.frontier (REF.mk n);
    murder_branch sr n;
    ()

  let deadend (type a) (type b) (sr:(a,b) ssearch) (node_to_kill:a snode) (env:b): b =
    SStatLib.deadend sr.st node_to_kill;
    ORDSET.rm sr.frontier (REF.mk node_to_kill);
    murder_branch sr node_to_kill;
    cleanup sr env
 

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

  let num_solutions (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) : int =
    (List.length (get_solutions sr root))

  let has_solution (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) : bool =
    (num_solutions sr root) > 0



  let cursor b =
    match b.curs with
    | Some(c) -> c
    | None -> error "cursor" "expected cursor."

  let score_path (type a) (type b) (sr:(a,b) ssearch) (endnode:a snode) : float=
      (*pass through node*)
      let score_node (e:a snode) (r:sscore) : sscore = r in
      (*pass through edge*)
      let combine x y = mkscore (y.state) (x.delta +. y.delta) in
      let score_edge src snk (n:sscore) (old:sscore) : sscore = combine old n in
      let init_score : sscore = mkscore 0. 0. in
      let score = TREE.fold_to_node score_node score_edge sr.tree endnode init_score in
      let total = score.state +. score.delta in
      total

  let upd_score (type a) (type b) (sr:(a,b) ssearch) (env:b) (node:a snode) =
    if TREE.hasnode sr.tree node = false then 
      error "upd_score" "node doesn't exist in tree"   
    else
    let score : sscore = sr.score env node.s in
    let par : (a snode) option = TREE.parent sr.tree node in
    let _ = 
      if par <> None then
        let par = OPTION.force_conc par in
        let _ = TREE.updedge sr.tree par node score in
        let cum_score = score_path sr node in
        let _ = (node.score <- cum_score) in 
        () 
      else ()
    in
    ()


  let commit (type a) (type b) (sr:(a,b) ssearch) (state:b) : a snode=
    match sr.scratch, sr.curs with
    (*add the scratch node, and then apply the thing*)
    | Some(node), Some(cursor) ->
      TREE.mknode sr.tree node;
      TREE.mkedge sr.tree cursor node (mkscore 0. 0.);
      sr.scratch <- None;
      (*move the cursor to the created node*)
      move_cursor sr state node;
      upd_score sr state node;
      (*move back*)
      move_cursor sr state cursor;
      ORDSET.add sr.frontier (REF.mk node);
      node
    | Some(_), None ->
      error "commit" "cannot commit new step with no parent."
    | _,_ -> error "commit" "cannot commit empty node."

  let mknode_child_from_steps (type a) (type b) (sr:(a,b) ssearch) (env:b) (sts:a list) : a snode=
    let steps = List.sort (sr.order) sts in
    let c : a snode = cursor sr in
    start sr;
    add_steps sr steps;
    debug ("==== commit ===");
    let node = commit sr env in
    debug ("==== done ===");
    move_cursor sr env c;
    node

  let mknode_from_steps (type a) (type b) (sr:(a,b) ssearch) (env:b) (sts:a list) : a snode=
    let steps = List.sort (sr.order) sts in
    start sr;
    add_steps sr steps;
    commit sr env

  let setroot (type a) (type b) (sr:(a,b) ssearch) (env:b) (sts:a list) =
    let steps = List.sort (sr.order) sts in
    start sr;
    add_steps sr steps;
    match sr.scratch with
    |Some(sb) ->
      begin
      TREE.setroot sr.tree (sb);
      sr.scratch <- None;
      let tbl = move_cursor sr env sb in
      sb,sr
      end
    |None -> error "mkbuf" "impossible to not have initial step"

  let root (type a) (type b) (sr:(a,b) ssearch ) =
    let n = TREE.root sr.tree in
    n
 
  let mksearch (type a) (type b) (apply:b->a->b) (unapply:b->a->b) (order:a->a->int) (score:b->a list->sscore) (tostr:a->string) =
    let g : (a snode, sscore) tree = TREE.make (fun (x:a snode) -> x.id) (fun x y -> x = y) in
    let frontier_order (_curr:a snode ref) (_next:a snode ref): ord_dir =
      let curr = REF.dr _curr in 
      let next = REF.dr _next in 
      if curr.id == next.id then SameAs else
      if curr.score >= next.score then 
        Before 
      else 
        After
    in
    let srch = {
        tree=g;
        frontier=ORDSET.make(frontier_order);
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
    let currnode = cursor sr in
    let leaves = get_paths sr root in
    (*let leaves = LIST.filter (fun x -> x <> currnode) leaves in*)
    if List.length leaves == 0 then
      true
    else
      false

  (*select best node, given a criteria*)
  let select_best_node (type a) (type b) (sr:(a,b) ssearch) (root:(a snode) option) : (a snode) option =
    match ORDSET.front sr.frontier with
    | Some(q) -> 
        let dq = REF.dr q in 
        Some(dq)
    | None -> None
    
end
