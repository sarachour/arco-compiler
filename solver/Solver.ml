open Common

open HW
open HWCstr

open Math
open MathCstr

open AST
open Util
open Unit
open SymCamlData

type slvr =  {
  interactive: bool;
  hw: hwenv;
  prob: menv;
  max_depth: int;
  cnt: int;
}
let _if_interactive (s:slvr) (f:slvr->'a) =
  if s.interactive then
    let _ = f s in
    ()
  else ()

let pr (s:slvr) (v:string) =
  let fxn s =
    let _ = Printf.printf "%s\n" v  in
    flush_all()
  in
  _if_interactive s fxn

let prf (s:slvr) (v:unit->unit) =
    let fxn s =
      let _ = v ()  in
      flush_all()
    in
    _if_interactive s fxn

let wait (s:slvr)  =
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
  | UNoInput of string
  | UNoOutput of string
  | UNoCopy of string
  | UNoComp of string
  | UNoConcComp of string

type unode = {
  mutable rels : urel set;
  name : string;
}

(*A particular goal to strive for*)
type goal = urel


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

  let comp s name =
    let c = HwLib.getcomp s.hw name in
    c

  let lclid2glblid sln iid x =
    match x with
    | HwId(HNPort(k,HCMLocal(c),p,prop,un)) ->
      HwId(HNPort(k,HCMGlobal(c,iid),p,prop,un))
    | _ -> x


  let  lcl2glbl sln iid a =
    let mp x = lclid2glblid sln iid x in
    ASTLib.map a mp

  let name2unodeid (c:string) = match HwLib.get_special c with
    | Some("copy",prop) -> UNoCopy(prop)
    | Some("input",prop) -> UNoInput(prop)
    | Some("output",prop) -> UNoOutput(prop)
    | Some(_) -> error "name2UNot" "illegal name"
    | None -> UNoComp c

  let unid2sym cmpname ciid uid is_templ cnv= match uid, is_templ with
  | (HwId(HNPort(k,HCMLocal(c),port,prop,u)), true) ->
    error "unid2sym" "no non-concretized ports allowed."
  | (HwId(HNPort(k,HCMGlobal(c,i),port,prop,u)),true) -> if i = ciid && cmpname = c
    then WildcardVar(cnv uid,[])
    else SymbolVar(cnv uid)
  | (HwId(v),_) -> SymbolVar(cnv uid)
  | (MathId(v),_) -> SymbolVar(cnv uid)

  let max4unodeid s id =
    let ginst x = HwCstrLib.getinsts s.hw.cstr x in
    match id with
    | UNoComp(x) -> ginst x
    | UNoConcComp(x) -> 1
    | UNoCopy(x) -> ginst (HwLib.copy_cid x)
    | UNoInput(x) -> ginst (HwLib.input_cid x)
    | UNoOutput(x) -> ginst (HwLib.output_cid x)

end

module UnivLib =
struct

  let unodeid2name unodeid = match unodeid with
  | UNoInput(x) -> "input."^x
  | UNoOutput(x) -> "output."^x
  | UNoCopy(x) -> "copy."^x
  | UNoComp(x) -> "comp."^x
  | UNoConcComp(x) -> "rel-of-comp."^x

  let hwid2var hwid =
  let proccmp (x:compid) = match x with
    | HCMLocal(v) -> "l:"^v
    | HCMGlobal(v,i) -> "g:"^v^":"^(string_of_int i)
  in
  match hwid with
  | HNPort(knd,cmp,name,prop,_) -> (proccmp cmp)^":"^name^":"^prop
  | HNPort(knd,cmp,name,prop,_) -> (proccmp cmp)^":"^name^":"^prop
  | HNParam(cmp,name,vl,_) -> (proccmp cmp)^":"^name
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

  let _var2hwid ((s):slvr) rst = match rst with
   | ["l";cn;v;p] ->
     let comp = Shim.comp s cn in
     let vv = HwLib.getvar s.hw cn v in
     HwLib.cv2hwid comp vv (Some p) (None)
   | ["g";cn;istr;v;p] ->
     let comp = Shim.comp s cn in
     let i = int_of_string istr in
     let vv = HwLib.getvar s.hw cn v in
     HwLib.cv2hwid comp vv (Some p) (Some i)
   | ["l";cn;"t"] ->
     let comp = Shim.comp s cn in
     HNTime(HCMLocal(cn),comp.time)
   | ["g";cn;istr;"t"] ->
     let comp = Shim.comp s cn in
     let i = int_of_string istr in
     HNTime(HCMGlobal(cn,i),comp.time)
   | ["l";cn;v] ->
     let comp = Shim.comp s cn in
     let vv = HwLib.getvar s.hw cn v in
     HwLib.cv2hwid comp vv None None
   | ["g";cn;istr;v] ->
     let comp = Shim.comp s cn in
     let i = int_of_string istr in
     let vv = HwLib.getvar s.hw cn v in
     HwLib.cv2hwid comp vv None (Some i)
   | _ -> error "apply_comp" "iconvhwid encountered unexpected hwid"

  let var2mid s mid = _var2mid (s) (STRING.split mid ":")

  let var2hwid (s) hwid = _var2hwid (s) (STRING.split hwid ":")

  let unid2hwid uid = match uid with
  | HwId(h) -> h
  | _ -> error "unid2hwid" "cannot cast unid to hwid."

  let var2unid (s) uid =
   match STRING.split uid ":" with
    | "m"::r -> MathId(_var2mid (s) r)
    | "h"::r -> HwId(_var2hwid (s) r)
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
  | SUseNode of unodeid*int
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

(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
type sln = {
  (*how many of each component is used *)
  mutable comps: (unodeid,(int list)*int) map;
  mutable conns: (unodeid*string*int,(unodeid*string*int) set) map;
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
  mutable sln: sln;
}


module SlnLib =
struct
  let mksln () : sln =
    {comps=MAP.make();conns=MAP.make()}

  let mkcomp (sln:sln) (id:unodeid) =
    MAP.put sln.comps id ([],0)

  let usecomp (sln:sln) id =
    let l,n = MAP.get sln.comps id in
    let _ = MAP.put sln.comps id (n::l,n+1) in
    n

  let compiid (sln:sln) id =
    let l,n = MAP.get sln.comps id in
    if List.length l  > 0 then List.nth l 0 else
    error "compiid" "no components in use"

  let usecomp_conserve (s:slvr) (sln:sln) id : bool =
    let lst,_ = (MAP.get sln.comps id)  in
    let nuses = List.length lst in
    let maxuses = Shim.max4unodeid s id in
    if maxuses >= nuses then true else false

  let usecomp_valid (s:slvr) (sln:sln) id : bool =
    let lst,_ = (MAP.get sln.comps id)  in
    let nuses = List.length lst in
    let maxuses = Shim.max4unodeid s id in
    let _ = flush_all() in
    if maxuses > nuses then true else false

  let usecomp_mark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let lst = i::lst in
    MAP.put s.comps id (lst,n)

  let usecomp_unmark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let lst = LIST.rm i lst in
    MAP.put s.comps id (lst,n)

end

module SearchLib =
struct
  let step2str n = match n with
  | SAddGoal(v) -> "add "^(UnivLib.urel2str v)
  | SRemoveGoal(v) -> "rm "^(UnivLib.urel2str v)
  | SAddNode(id,v) -> "add "^(UnivLib.unodeid2name id)
  | SRemoveNode(id,v) -> "rm"^(UnivLib.unodeid2name id)
  | SUseNode(id,i) -> "use "^(UnivLib.unodeid2name id)^"."^(string_of_int i)
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


  let apply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
    (*let _ = Printf.printf "> do step %s\n" (step2str s) in*)
    match s with
    | SAddGoal(g) -> let _ = SET.add tbl.goals g in ()
    | SRemoveGoal(g) -> let _ = SET.rm tbl.goals g in ()
    | SAddNode(id,u) -> let _ = MAP.put tbl.nodes id u in ()
    | SRemoveNode(id,u) -> let _ = MAP.rm tbl.nodes id in ()
    | SUseNode(id,i) -> let _ = SlnLib.usecomp_mark tbl.sln id i in ()
    | _ -> ()

  let apply_steps (slvenv:slvr) (tbl:gltbl) (s:steps) =
    List.iter (fun x -> apply_step slvenv tbl x) s.s

  let unapply_step (slvenv:slvr) (tbl:gltbl) (s:step) =
  (*let _ = Printf.printf "> undo step %s\n" (step2str s) in*)
  match s with
  | SAddGoal(g) -> let _ = SET.rm tbl.goals g in ()
  | SRemoveGoal(g) -> let _ = SET.add tbl.goals g in ()
  | SAddNode(id,u) -> let _ = MAP.rm tbl.nodes id in ()
  | SRemoveNode(id,u) -> let _ = MAP.put tbl.nodes id u in ()
  | SUseNode(id,i) -> let _ = SlnLib.usecomp_unmark tbl.sln id i in ()
  | _ -> ()

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
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let sln = SlnLib.mksln () in
    let rels : urel list = List.map math2goal (List.filter fltmath (MAP.to_values s.prob.vars)) in
    let nodes : unode list = List.map comp2node (MAP.to_values s.hw.comps) in
    let handle_node (x) =
       let nid = Shim.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_node x) nodes in
    let init_cursor,search= SearchLib.mkbuf (rels) in
    let tbl = {goals=SET.make (fun x y -> x = y); nodes=nodetbl; sln=sln; search=search} in
    let tbl = SearchLib.move_cursor s tbl init_cursor in
    tbl


  let goal2str g = UnivLib.urel2str g

  let mag_analysis (s:slvr) (port:unid) (qty:unid) =
    let uq = Shim.unt s qty in
    let urng = Shim.mag s qty in
    let up = Shim.unt s port in
    let urng = Shim.mag s port in
    ()

  let apply_node (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : unit =
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then () else
    (*let comp = HwLib.getcomp s.hw node.name in*)
    let inst_id = SlnLib.usecomp gtbl.sln node_id in
    (*update search algorithm to include the usage*)
    let _ = SearchLib.start gtbl.search in
    let _ = SearchLib.add_step gtbl.search (SUseNode(node_id,inst_id)) in
    let goal_cursor = SearchLib.cursor gtbl.search in
    let comp_cursor = SearchLib.commit gtbl.search in
    (*use node*)
    let _ = SearchLib.move_cursor s gtbl comp_cursor in
    let declunid = Shim.unid2sym node.name inst_id in
    (*
      this tries to find a set of solutions for the particular node. Each of these solutions is a branch.
    *)
    let unify_node_with_goal (gl:unid) (gr:unid ast) (nl:unid) (nr:unid ast) : ((unid,unid ast) map) list =
      let res = ASTLib.pattern nr gr UnivLib.unid2var (UnivLib.var2unid (s)) declunid 5 in
      match res with
      | Some(res) -> res
      | None ->  []
    in
    let unify_rels (v:urel) slns  =
      match g,v with
      | (UFunction(gl,gr), UFunction(nl,nr))->
        let nl = Shim.lclid2glblid s inst_id nl in
        let nr = Shim.lcl2glbl s inst_id nr in
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
      (*let _ = SearchLib.add_step gtbl.search (SAddNode (UNoConcComp "?", nnodes))  in*)
      let _ = SearchLib.commit gtbl.search in
      ()
    in
    let res = SET.fold node.rels unify_rels [] in
    let _ = List.iter (add_sln_to_search g) res in
    let _ = SearchLib.move_cursor s gtbl goal_cursor in
    if List.length res = 0
      then
        let _ = SearchLib.rm gtbl.search comp_cursor in
        ()
      else ()

  let resolve_trivial s t goals =
    let is_trivial g =
      match g with
      | (UFunction(id,Decimal(_))) -> true
      | (UFunction(id,Integer(_))) -> true
      | _ -> false
    in
    let handle_goal g =
      if is_trivial g then
      let _ = SearchLib.add_step t.search (SRemoveGoal g) in
      ()
    in
    if (SET.fold goals (fun x r -> if is_trivial x then r+1 else r) 0) > 0 then
      let _ = SearchLib.start t.search in
      let _ = SET.iter goals handle_goal in
      let trivial_cursor = SearchLib.commit t.search in
      let _ = SearchLib.move_cursor s t trivial_cursor in
      ()
    else
    ()


  let apply_nodes (slvenv:slvr) (tbl:gltbl) (g:goal) : unit =
    let comps = MAP.filter tbl.nodes (fun k v -> match k with UNoComp(_) -> true | _ -> false)  in
    let rels = MAP.filter tbl.nodes (fun k v -> match k with UNoConcComp(_) -> true | _ -> false)  in
    let handle_node (id,x) =
      let _ = apply_node slvenv tbl g id x in
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

  let rec solve (_s:slvr ref) (v:gltbl) =
    let s = REF.dr _s in
    (*apply the current step in the search algorithm*)
    (*let _ = apply_steps s v (SearchLib.cursor v.search) in*)
    (*choose a goal in the table*)
    if SET.size v.goals > 0 then
      let _ = Printf.printf "==== Goals ===" in
      let _ = Printf.printf "%s\n" (goals2str v.goals) in
      let _ = Printf.printf "============\n\n" in

      let _ = resolve_trivial s v v.goals in

      let _ = Printf.printf "==== Goals ===" in
      let _ = Printf.printf "%s\n" (goals2str v.goals) in
      let _ = Printf.printf "============\n\n" in

      let g = SET.rand v.goals in
      let _ = Printf.printf "SOLVE GOAL: %s\n\n" (UnivLib.goal2str g) in
      let _ = apply_nodes s v g in
      let _ = Printf.printf "TREE:\n%s\n" (SearchLib.buf2str v.search) in
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
