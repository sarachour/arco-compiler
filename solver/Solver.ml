open HW
open HWCstr

open Math
open MathCstr

open AST
open Util
open Unit
open SymCamlData

type slenv =  {
  interactive: bool;
  hw: hwenv;
  prob: menv;
  max_depth: int;
  cnt: int;
}
let _if_interactive (s:slenv) (f:slenv->'a) =
  if s.interactive then
    let _ = f s in
    ()
  else ()

let pr (s:slenv) (v:string) =
  let fxn s =
    let _ = Printf.printf "%s\n" v  in
    flush_all()
  in
  _if_interactive s fxn

let prf (s:slenv) (v:unit->unit) =
    let fxn s =
      let _ = v ()  in
      flush_all()
    in
    _if_interactive s fxn

let wait (s:slenv)  =
  let fxn s =
    let _ = Printf.printf "<please press key to continue. 'q' to quit>:"  in
    let _ = flush_all() in
    let inp = input_line stdin in
    let _ = Printf.printf "\n" in
    let _ = flush_all() in
    if STRING.startswith inp "q" then
      let _ = exit 0 in
      ()
    else
      ()
  in
  _if_interactive s fxn

type unid =
  |MathId of mid
  |HwId of hwvid

type urel =
  | UFunction of unid*(unid ast)
  | UState of unid*(unid ast)*(unid)


type unodeid =
  | SprInput of string
  | SprOutput of string
  | SprCopy of string
  | SprComp of string
  | SprConcComp of string

type unode = {
  mutable rels : urel set;
  name : string;
}

(*A particular goal to strive for*)
type goal = urel


module UnivLib =
struct

  let unodeid2name unodeid = match unodeid with
  | SprInput(x) -> "input."^x
  | SprOutput(x) -> "output."^x
  | SprCopy(x) -> "copy."^x
  | SprComp(x) -> "comp."^x
  | SprConcComp(x) -> "rel-of-comp."^x

  let hwid2var hwid = match hwid with
  | HNPort(knd,cid,name,prop,_) -> name^":"^prop
  | HNParam(name,vl,_) -> name
  | HNTime(_) -> "t'"

  let mid2var mid = match mid with
  | MNVar(k,n,u) -> n
  | MNParam(name,v,u) -> name
  | MNTime(_) -> "t'"

  let unid2var uid = match uid with
  | MathId(m) -> "m:"^(mid2var m)
  | HwId(h) -> "h:"^(hwid2var h)


  let _var2mid s rst =  match rst with
  | [v] -> let vv = MathLib.getvar s.prob v in vv.typ
  | _ -> error "apply_comp" "iconvmid encountered unexpected string"

  let _var2hwid ((s,c):slenv*hwcomp) rst = match rst with
   | [v;p] -> let vv = HwLib.getvar s.hw c.name v in
     HwLib.cv2hwid c vv (Some p)
   | ["t"] -> HNTime(c.time)
   | [v] -> let vv = HwLib.getvar s.hw c.name v in
     HwLib.cv2hwid c vv None
   | _ -> error "apply_comp" "iconvhwid encountered unexpected hwid"

  let var2mid s mid = _var2mid (s) (STRING.split mid ":")

  let var2hwid (s,c) hwid = _var2hwid (s,c) (STRING.split hwid ":")

  let unid2hwid uid = match uid with
  | HwId(h) -> h
  | _ -> error "unid2hwid" "cannot cast unid to hwid."

  let var2unid (s,c) uid =
   match STRING.split uid ":" with
    | "m"::r -> MathId(_var2mid (s) r)
    | "h"::r -> HwId(_var2hwid (s,c) r)
    | h::r -> error "iconvunid" ("unexpected prefix "^h)
    | _ -> error "" ""

  let mid2unid mid = MathId(mid)
  let hwid2unid hwid = HwId(hwid)

  let unid2str uid = match uid with
  | HwId(v) -> HwLib.hwvid2str v
  | MathId(v) -> MathLib.mid2str v

  let urel2str uid = match uid with
  | UFunction(l,r) -> (unid2str l)^"="^(ASTLib.ast2str r unid2str)
  | UState(l,r,i) -> "ddt("^(unid2str l)^")="^(ASTLib.ast2str r unid2str)

  let conc_node node assigns =
  let sid id : unid=
    if MAP.has assigns id then
      match MAP.get assigns id with
      | Term(v) -> v
      | _ -> error "conc node" "was expecting simple assignment to var"
    else
      id
  in
  let conc_rel x =
    match x with
    | UFunction(l,r) -> UFunction(sid l,ASTLib.sub r assigns)
    | UState(l,r,i) -> UState(sid l,ASTLib.sub r assigns,sid i)
  in
  let nr = SET.map node.rels (fun x -> conc_rel x) in
  node


  let goal2str = urel2str

end



type step =
  | SUseNode of unodeid
  | SRemoveGoal of goal
  | SAddGoal of goal
  | SAddNode of unodeid*unode
  | SRemoveNode of unodeid*unode

type stepid =
  | SIUseNode
  | SIConnectPorts
  | SIRemoveGoal
  | SIAddGoal
  | SIAddNode
  | SIRemoveNode

type sln = {
  (*how many of each component is used *)
  cmps: (unodeid,int) map;
  conns: (unodeid*int,(unodeid*int) set) map;
}
type steps = {
  mutable s :step list;
  id : int;
}
type score = float

type buffer = {
  paths: (steps, score) tree;
  mutable step_buf: steps option;
  (*the total number of step bundles*)
  mutable cnt: int;
  mutable curr: (steps,score) cursor option;
}


type gltbl = {
  mutable goals : urel set;
  mutable nodes : (unodeid, unode) map;
  mutable search: buffer;
}


module SearchLib =
struct
  let step2str n = match n with
  | SAddGoal(v) -> "add "^(UnivLib.urel2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.urel2str v)
  | SAddNode(id,v) -> "add "^(UnivLib.unodeid2name id)
  | SRemoveNode(id,v) -> "rm"^(UnivLib.unodeid2name id)
  | SUseNode(id) -> "use "^(UnivLib.unodeid2name id)
  | _ -> "?"

  let steps2str (b:buffer) (n:steps) =
    let id = (string_of_int n.id) in
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
    | Some(v) -> if v = n then let _ = b.curr <- None in ()
    | None -> ()
    in
    let _ = TREE.rmnode b.paths n in
    b



  let buf2str b =
    TREE.tostr b.paths (fun x -> (steps2str b x))

  let cursor b =
    match b.curr with
    | Some(c) -> c
    | None -> error "cursor" "expected cursor."


  let apply_step (slnenv:slenv) (tbl:gltbl) (s:step) =
    (*let _ = Printf.printf "> do step %s\n" (step2str s) in*)
    match s with
    | SAddGoal(g) -> let _ = SET.add tbl.goals g in ()
    | SRemoveGoal(g) -> let _ = SET.rm tbl.goals g in ()
    | SAddNode(id,u) -> let _ = MAP.put tbl.nodes id u in ()
    | SRemoveNode(id,u) -> let _ = MAP.rm tbl.nodes id in ()
    | _ -> ()

  let apply_steps (slnenv:slenv) (tbl:gltbl) (s:steps) =
    List.iter (fun x -> apply_step slnenv tbl x) s.s

  let unapply_step (slnenv:slenv) (tbl:gltbl) (s:step) =
  (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
  match s with
  | SAddGoal(g) -> let _ = SET.rm tbl.goals g in ()
  | SRemoveGoal(g) -> let _ = SET.add tbl.goals g in ()
  | SAddNode(id,u) -> let _ = MAP.rm tbl.nodes id in ()
  | SRemoveNode(id,u) -> let _ = MAP.put tbl.nodes id u in ()
  | _ -> ()

  let unapply_steps (slnenv) (tbl:gltbl) (s:steps) =
    List.iter (fun x -> unapply_step slnenv tbl x) s.s

  let move_cursor (s:slenv) (tbl:gltbl) (next:steps) =
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
    TREE.leaves b.paths

  let random_path (b:buffer) =
    let choices = get_paths b in
    LIST.rand choices

  let mkbuf goals =
    let g = TREE.make (fun x y -> x=y) (fun x y -> x = y) in
    let buf = {paths=g; step_buf=None; cnt=0; curr=None} in
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

module Shim =
struct
  let unt s uid : unt =
    match uid with
    | HwId(HNPort(_,_,_,_,u)) -> UExpr (Term u)
    | MathId(MNVar(_,_,u)) -> u

  let mag s uid : range option =
    match uid with
    | HwId(HNPort(k,HCMLocal(cname),name,prop,un)) ->
      HwCstrLib.mag s.hw.cstr cname name prop
    | HwId(HNPort(k,HCMGlobal(cname,_),name,prop,un)) ->
      HwCstrLib.mag s.hw.cstr cname name prop
    | MathId(MNVar(k,v,u)) ->
      MathCstrLib.mag s.prob.cstr v
    |_ -> None


end

module SolveLib =
struct

  let mkslv h p i = {interactive=i; hw=h; prob=p; max_depth=5; cnt=0;}

  let mktbl s : gltbl =
    (* add all relations to the tableau of goals. *)
    let math2goal (x:mvar) =
      let m2u = UnivLib.mid2unid in
      match x.rel with
      | MRFunction(l,r) -> UFunction(m2u l, ASTLib.map r m2u)
      | MRState(l,r,x) -> UState(m2u l, ASTLib.map r m2u, m2u x)
      | MRNone -> error "math2goal" "impossible."
    in
    let fltmath x = x.rel <> MRNone in
    let comp2node (c:hwcomp) =
      let nvars = List.filter (fun (x:hwvar) -> x.rel <> HRNone) (MAP.to_values (c.vars)) in
      let var2urel (x:hwvar) = let h2u = UnivLib.hwid2unid in
      match x.rel with
      | HRFunction(l,r) -> UFunction(h2u l, ASTLib.map r h2u)
      | HRState(l,r,i) -> UState(h2u l, ASTLib.map r h2u, h2u i)
      | _ -> error "comp2node" "impossible"
      in
      let nrels = List.map var2urel nvars in
      let n = {rels=SET.from_list nrels; name=c.name} in
      n
    in
    let name2sprt (c:string) = match HwLib.get_special c with
    | Some("copy",prop) -> SprCopy(prop)
    | Some("input",prop) -> SprInput(prop)
    | Some("output",prop) -> SprOutput(prop)
    | Some(_) -> error "name2sprt" "illegal name"
    | None -> SprComp c
    in
    let nodes : (unodeid,unode) map = MAP.make () in
    let rels : urel list = List.map math2goal (List.filter fltmath (MAP.to_values s.prob.vars)) in
    let nodelst : unode list = List.map comp2node (MAP.to_values s.hw.comps) in
    let _ = List.iter (fun x -> let _ = MAP.put nodes (name2sprt x.name) x in ()) nodelst in
    let v,search= SearchLib.mkbuf (rels) in
    let tbl = {goals=SET.make (fun x y -> x = y); nodes=nodes; search=search} in
    let tbl = SearchLib.move_cursor s tbl v in
    tbl


  let goal2str g = UnivLib.urel2str g

  let mag_analysis (s:slenv) (port:unid) (qty:unid) =
    let uq = Shim.unt s qty in
    let urng = Shim.mag s qty in
    let up = Shim.unt s port in
    let urng = Shim.mag s port in
    ()

  let apply_node (s:slenv) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : unit =
    let c = HwLib.getcomp s.hw node.name in
    let _ = SearchLib.start gtbl.search in
    let _ = SearchLib.add_step gtbl.search (SUseNode node_id) in
    let old = SearchLib.cursor gtbl.search in
    let cmp = SearchLib.commit gtbl.search in
    let _ = SearchLib.move_cursor s gtbl cmp in
    (*
      this tries to find a set of solutions for the particular node. Each of these solutions is a branch.
    *)
    let sln2str m r =
      let mk k = UnivLib.unid2str k and mv v = ASTLib.ast2str v UnivLib.unid2str  in
      r^"\n"^(MAP.str m mk mv)
    in
    let unify_node_with_goal (gl:unid) (gr:unid ast) (nl:unid) (nr:unid ast) : ((unid,unid ast) map) list =
      let declunid uid is_templ cnv = match uid,is_templ with
      | (MathId(v),_) -> SymbolVar(cnv (MathId v))
      | (HwId(v),true)-> WildcardVar(cnv (HwId v),[])
      | (HwId(v),false) -> SymbolVar(cnv (HwId v))
      in
      let res = ASTLib.pattern nr gr UnivLib.unid2var (UnivLib.var2unid (s,c)) declunid 5 in
      match res with
      | Some(res) -> res
      | None ->  []
    in
    let unify_rels (v:urel) slns  =
      match g,v with
      | (UFunction(gl,gr), UFunction(nl,nr))->
        let res = unify_node_with_goal gl gr nl nr in
        let _ = mag_analysis s nl gl in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        slns @ res
      | (UState(gl,gr,gic), UState(nl,nr,ic))->
        let res = unify_node_with_goal gl gr nl nr in
        let _ = mag_analysis s nl gl in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        let _ = List.iter (fun mp -> let _ = MAP.put mp gic (Term ic) in () ) res in
        slns @ res
      | _ -> slns
    in
    let add_sln_to_search (gl:goal) (assigns:(unid,unid ast) map) =
      let _ = SearchLib.start gtbl.search in
      let _ = SearchLib.add_step gtbl.search (SRemoveGoal gl) in
      let _ = MAP.iter assigns (fun k v -> SearchLib.add_step gtbl.search (SAddGoal (UFunction(k,v)))) in
      (*add special component.*)
      let nnodes = UnivLib.conc_node node assigns in
      (*let _ = SearchLib.add_step gtbl.search (SAddNode (SprConcComp "?", nnodes))  in*)
      let _ = SearchLib.commit gtbl.search in
      ()
    in
    let res = SET.fold node.rels unify_rels [] in
    let _ = List.iter (add_sln_to_search g) res in
    let _ = SearchLib.move_cursor s gtbl old in
    if List.length res = 0
      then
        let _ = SearchLib.rm gtbl.search cmp in
        ()
      else ()

  let resolve_trivial s t g =
    match g with
    | (UFunction(id,Decimal(_))) -> true
    | (UFunction(id,Integer(_))) -> true
    | _ -> false
    
  let apply_nodes (slnenv:slenv) (tbl:gltbl) (g:goal) : unit =
    if resolve_trivial slnenv tbl g then () else
    let comps = MAP.filter tbl.nodes (fun k v -> match k with SprComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with SprConcComp(_) -> true | _ -> false)  in
    let n = SearchLib.cursor tbl.search in
    let handle_node (id,x) =
      let _ = apply_node slnenv tbl g id x in
      ()
    in
    let _ = List.iter handle_node rels  in
    let _ = List.iter handle_node comps  in
    ()

  let goals2str (g:goal set) =
    let goal2str g v =
      v^"\n"^(UnivLib.goal2str g)
    in
    SET.fold g goal2str ""

  let rec solve (_s:slenv ref) (v:gltbl) =
    let s = REF.dr _s in
    (*apply the current step in the search algorithm*)
    (*let _ = apply_steps s v (SearchLib.cursor v.search) in*)
    (*choose a goal in the table*)
    if SET.size v.goals > 0 then
      let _ = Printf.printf "==== Goals ===" in
      let _ = Printf.printf "%s\n" (goals2str v.goals) in
        let _ = Printf.printf "============\n\n" in
      let g = SET.rand v.goals in
      let _ = Printf.printf "SOLVE GOAL: %s\n\n" (UnivLib.goal2str g) in
      let _ = apply_nodes s v g in
      let _ = Printf.printf "%s\n" (SearchLib.buf2str v.search) in
      let _ = wait s in
      let p = SearchLib.random_path v.search in
      let _ = SearchLib.move_cursor s v p in
      let _ = solve _s v in
      ()
    else
      let _ = Printf.printf "no goals left.. done\n" in
      ()

end



let solve (hw:hwenv) (prob:menv) (interactive:bool) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv  hw prob interactive in
  let tbl = SolveLib.mktbl sl in
  let _ = pr sl "===== Beginning Interactive Solver ======" in
  let _ = SolveLib.solve (REF.mk sl) (tbl) in
  ()
