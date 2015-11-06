open Common
open Z3Test

open HW
open HWCstr
open HWRslv

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

let menu (s:slvr) (handle:string->unit) (menu:string) =
let fxn s =
  let _ = Printf.printf "select an action (%s):" menu in
  let _ = flush_all() in
  let inp = input_line stdin in
  let _ = Printf.printf "\n" in
  let _ = flush_all() in
  let _ = handle(inp) in
  let _ = flush_all() in
  if STRING.startswith inp "q" then
    let _ = exit 0 in
    ()
  else
    ()
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
  | UNoConcComp of string*int

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
    | UNoConcComp(x,inst) -> 1
    | UNoCopy(x) -> ginst (HwLib.copy_cid x)
    | UNoInput(x) -> ginst (HwLib.input_cid x)
    | UNoOutput(x) -> ginst (HwLib.output_cid x)

end

module UnivLib =
struct

  let unodeid2name unodeid = match unodeid with
  | UNoInput(x) -> HwLib.input_cid x
  | UNoOutput(x) -> HwLib.output_cid x
  | UNoCopy(x) -> HwLib.copy_cid x
  | UNoComp(x) -> x
  | UNoConcComp(x,inst) -> x

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

(*
A solution is a set of connections  and components. A solution
may additionally contain any pertinent error and magnitude mappings
*)
type wireid = unodeid*int*string

type label =
  | LMagnitude of range*untid*range*unt
  | LTime of range*untid*range*untid
  | LError
  | LBindValue of float
  | LBindVar of mid

type sln = {
  (*how many of each component is used *)
  mutable comps: (unodeid,(int set)*int) map;
  mutable conns: (wireid, wireid set) map;
  mutable labels: (wireid, (string, label set) map) map;
}


type step =
  | SSolUseNode of unodeid*int
  | SSolAddConn of wireid*wireid
  | SSolAddLabel of wireid*propid*label
  | SRemoveGoal of goal
  | SAddGoal of goal
  | SAddNode of unodeid*(urel list)
  | SRemoveNode of unodeid


type steps = {
  mutable s :step list;
  id : int;
}
type score = float

type buffer = {
  paths: (steps, score) tree;
  mutable step_buf: steps option;
  (*the total number of step bundles*)
  mutable visited: int set;
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
  let hwport2wire cm port =
    match cm with
    | HCMLocal(c) -> error "hwport2wire" "underspecified identifier."
    | HCMGlobal(q,i) ->
      let nid = Shim.name2unodeid q in
      let inst = i in
      (nid,inst,port)

  let wire2str wire =
    let n,i,p = wire in
    (UnivLib.unodeid2name n)^"["^(string_of_int i)^"]."^p

  let label2str pr =
    match pr with
    | LMagnitude(hwrng,hwp,mrng,mp) ->
      let hwr = (RANGE.tostr hwrng)^" "^(hwp) in
      let mr = (RANGE.tostr mrng)^" "^(UnitLib.unit2str mp) in
      "mag "^hwr^" => "^mr
    | LTime(hwrng,hwp,mrng,mp) ->
      let hwr = (RANGE.tostr hwrng)^" "^(hwp) in
      let mr = (RANGE.tostr mrng)^" "^(mp) in
      "time "^hwr^" => "^mr
    | LError -> "error prop"
    | LBindValue(v) -> "bind "^(string_of_float v)
    | LBindVar(v) -> "bind "^(MathLib.mid2str v)

  let mksln () : sln =
    {comps=MAP.make();conns=MAP.make(); labels=MAP.make()}

  let mkcomp (sln:sln) (id:unodeid) =
    MAP.put sln.comps id (SET.make (fun x y -> x = y),0)

  (*
  let mkconn_valid (v:slvr) (s:sln) (src:wireid) (snk:wireid) =
    let res = ConnResolver.is_valid v.cstr.conns s.conns in
    res
  *)

  let mkconn_cons (v:slvr) (s:sln) =
    let res = HwConnRslvr.is_valid v.cstr.conns s.conns in
    res



  let mkconn (sln:sln) (src:wireid) (snk:wireid) =
    let sinks = if MAP.has sln.conns src = false then
        let s = (SET.make (fun x y -> x = y) ) in
        let _ = MAP.put sln.conns src s in
        s
      else
        MAP.get sln.conns src
    in
      let _ = SET.add sinks snk in
      let _ = MAP.put sln.conns src sinks in
      ()

  let mkconn_undo (sln:sln) (src:wireid) (snk:wireid) =
    if MAP.has sln.conns src then
      let s = MAP.get sln.conns src in
      let _ = SET.rm s snk in
      let _ = MAP.put sln.conns src s in
      ()
    else
      error "mkconn_undo" "cannot undo connection that doesn't exist."

  let mklabel (sln:sln) (id:wireid) (prop:propid) (v:label) =
    let prps = if MAP.has sln.labels id = false then
        let pmap = MAP.make () in
        let _ = MAP.put sln.labels id pmap in
        pmap
      else
        MAP.get sln.labels id
    in
    let pset = if MAP.has prps prop = false then
      let pset = SET.make (fun x y -> x = y) in
      let _ = MAP.put prps prop pset in
      pset
      else
        MAP.get prps prop
    in
    let _ = SET.add pset v in
    ()

  let mklabel_undo (sln:sln) (id:wireid) (prop:propid) (v:label) =
    if MAP.has sln.labels id then
      let props = MAP.get sln.labels id in
      if MAP.has props prop then
        let lbls = MAP.get props prop in
        let _ = SET.rm lbls v in
        ()
    else
      ()

  let usecomp (sln:sln) id =
    let l,n = MAP.get sln.comps id in
    let _ = sln.comps <- MAP.put sln.comps id (SET.add l n,n+1) in
    n


  let usecomp_conserve (s:slvr) (sln:sln) id : bool =
    let lst,_ = (MAP.get sln.comps id)  in
    let nuses = SET.size lst in
    let maxuses = Shim.max4unodeid s id in
    if maxuses >= nuses then true else false

  let usecomp_valid (s:slvr) (sln:sln) id : bool =
    let lst,_ = (MAP.get sln.comps id)  in
    let nuses = SET.size lst in
    let maxuses = Shim.max4unodeid s id in
    if maxuses > nuses then true else false

  let usecomp_mark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let lst = SET.add lst i in
    s.comps <- MAP.put s.comps id (lst,n)

  let usecomp_unmark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let _ = SET.rm lst i in
    s.comps <- MAP.put s.comps id (lst,n)

  (*determine if the connection schema is possible*)
  let conn_conserve (v:slvr) (s:sln) =
    true

  (*determine if the assignment,conneciton schema violates error constraints on output*)
  let err_conserve (v:slvr) (s:sln) =
    true

  let conserve (v:slvr) (s:sln) =
    if conn_conserve v s && err_conserve v s
    then true
    else false

  let tostr (s:sln) : string=
    let comp2str cname clist id =
      let instlist2str lst =
        SET.tostr clist (fun x -> string_of_int x) ","
      in
      (UnivLib.unodeid2name cname)^" | "^(string_of_int id)^" = ["^(instlist2str clist)^"]"
    in
    let comps2str c =
      let res : string = MAP.fold c (fun k (l,n) r -> r^"\n"^(comp2str k l n)) "" in
      res
    in
    let conns2str c =
      let itersnks src sset = SET.fold sset (fun snk r -> r^"\n"^(wire2str src)^"->"^(wire2str snk) ) "" in
      let res : string = MAP.fold c (fun src snkset r -> (itersnks src snkset)^r) "" in
      res
    in
    let labels2str c =
      let props2str cmps prp labels =
        if SET.size labels > 0 then
          (SET.tostr labels (fun x -> prp^"("^cmps^"): "^(label2str x)) "\n")^"\n"
        else
          ""
      in
      let lbls2str k props =
        let cmpstr = wire2str k in
        (MAP.fold props (fun prp v r -> r^(props2str cmpstr prp v) ) "")
      in
      MAP.fold c (fun k v r -> r^(lbls2str k v)) ""
    in
    let cstr = comps2str s.comps in
    let cnstr = conns2str s.conns in
    let lstr = labels2str s.labels in
    "Comps:\n"^cstr^"\n\nConns:"^cnstr^"\n\nLabels:\n"^lstr

end

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




module SolveLib =
struct

  let mkslv h p i = {interactive=i; hw=h; prob=p; max_depth=10; cnt=0;}

  let mktbl s : gltbl =
    (* add all relations to the tableau of goals. *)
    let rm_pars x : unid ast option =
      match x with
      | Term(HwId(HNParam(c,n,v,p))) -> Some (Decimal (v))
      | Term(MathId(MNParam(n,v,u))) ->Some (Decimal(v))
      | _ -> None
    in
    let math2goal (x:mvar) =
      let m2u = UnivLib.mid2unid in
      let tf x = ASTLib.trans (ASTLib.map x m2u) rm_pars in
      match x.rel with
      | MRFunction(l,r) -> UFunction(m2u l, tf r)
      | MRState(l,r,x) -> UState(m2u l, tf r, m2u x)
      | MRNone -> error "math2goal" "impossible."
    in
    let fltmath x = x.rel <> MRNone in
    let comp2node (c:hwcomp) =
      let nvars = List.filter (fun (x:hwvar) -> x.rel <> HRNone) (MAP.to_values (c.vars)) in
      let var2urel (x:hwvar) =
      let h2u = UnivLib.hwid2unid in
      let tf x = ASTLib.trans (ASTLib.map x h2u) rm_pars in
      match x.rel with
      | HRFunction(l,r) -> UFunction(h2u l, tf r)
      | HRState(l,r,i) -> UState(h2u l, tf r, h2u i)
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

  let conc_node nid nd rl (assigns:(unid,unid ast) map) iid =
    let sub_el x = match x with
      | Term(id) -> if MAP.has assigns id then Some (MAP.get assigns id) else None
      | _ -> None
    in
    let sub_ast x = ASTLib.trans x sub_el in
    let sub_rel x = match x with
    | UFunction(l,r) ->
      if MAP.has assigns l then error "conc_node" "cannot sub lhs" else
      UFunction(l,sub_ast r)
    | UState(l,r,ic) ->
      if MAP.has assigns l then error "conc_node" "cannot sub lhs" else
      if MAP.has assigns ic then error "conc_node" "cannot sub ic" else
      UState(l,sub_ast r, ic)
    in
    let nid_name = match nid with UNoComp(n) -> n | _ -> error "conc_node" "unexpected" in
    let new_nid = UNoConcComp(nid_name,iid) in
    let nrels : urel list= SET.filter nd.rels (fun x -> x <> rl) in
    if List.length nrels = 0 then None else
    let nrels : urel list = List.map (fun x -> sub_rel x) nrels in
    Some (nid,nrels)


  let apply_node (s:slvr) (gtbl:gltbl) (g:goal) (node_id:unodeid) (node:unode) : unit =
    (*see if it's possible to use the component. If it iscontinue on. If not, do not apply node*)
    if (SlnLib.usecomp_valid s gtbl.sln node_id) = false then () else
    (*let comp = HwLib.getcomp s.hw node.name in*)
    let inst_id = SlnLib.usecomp gtbl.sln node_id in
    (*update search algorithm to include the usage*)
    let _ = SearchLib.start gtbl.search in
    let _ = SearchLib.add_step gtbl.search (SSolUseNode(node_id,inst_id)) in
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
    let unify_rels (v:urel) slns : (urel*(unid,unid ast) map) list =
      match g,v with
      | (UFunction(gl,gr), UFunction(nl,nr))->
        let nl = Shim.lclid2glblid s inst_id nl in
        let nr = Shim.lcl2glbl s inst_id nr in
        let res = unify_node_with_goal gl gr nl nr in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        let res = List.map (fun x -> (v,x)) res in
        slns @ res
      | (UState(gl,gr,gic), UState(nl,nr,ic))->
        let res = unify_node_with_goal gl gr nl nr in
        let _ = List.iter (fun mp -> let _ = MAP.put mp nl (Term gl) in () ) res in
        let _ = List.iter (fun mp -> let _ = MAP.put mp gic (Term ic) in () ) res in
        let res = List.map (fun x -> (v,x)) res in
        slns @ res
      | _ -> slns
    in
    let add_sln_to_search (gl:goal) ((rl,assigns):(urel*(unid,unid ast) map)) =
      let _ = SearchLib.start gtbl.search in
      let _ = SearchLib.add_step gtbl.search (SRemoveGoal gl) in
      let _ = MAP.iter assigns (fun k v -> SearchLib.add_step gtbl.search (SAddGoal (UFunction(k,v)))) in
      (*concretize other goals in this particular node.*)
      let _ = match conc_node node_id node rl assigns inst_id with
        | Some(cnid,crels) -> let _ = SearchLib.add_step gtbl.search (SAddNode (cnid,crels)) in ()
        | None -> ()
      in
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
        let _ = SlnLib.usecomp_unmark gtbl.sln node_id inst_id in
        ()
      else
        let _ = SearchLib.visit gtbl.search comp_cursor in
        ()

  let mkmag (s:slvr) (port:unid) (qty:unid) =
    let mq = Shim.unt s qty in
    let mrng = Shim.mag s qty in
    let hwq = Shim.unt s port in
    let hwrng = Shim.mag s port in
    match hwq,hwrng,mrng with
    | (UExpr(Term(id)),Some(hr),Some(mr)) ->   (LMagnitude (hr, id, mr, mq))
    | (_,None,_) -> error "mkmag" ("quantity "^(UnivLib.unid2str port)^" must have range")
    | (_,_,None) -> error "mkmag" ("quantity "^(UnivLib.unid2str qty)^" must have range")
    | _ -> error "mkmag" "the hardware quantity has to be flat."

  let resolve_trivial s t goals =
    let is_trivial g =
      match g with
      | UFunction(id,Decimal(_)) -> true
      | UFunction(id,Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> true
      | UFunction(HwId(v),Term(MathId(_))) -> true
      | _ -> false
    in
    let get_trivial_step g : step list =
      match g with
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then
          [SSolAddConn (SlnLib.hwport2wire c1 v1,SlnLib.hwport2wire c2 v2)]
          else []
      | UFunction(HwId(HNPort(k,c,v,prop,u)),Decimal(q)) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindValue q in
          [SSolAddLabel(wire,prop,lbl)]
      | UFunction(HwId(HNPort(k,c,v,prop,u)),Integer(q)) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindValue (float_of_int q) in
          [SSolAddLabel(wire,prop,lbl)]
      | UFunction(HwId(HNPort(k,c,v,prop,u)), Term(MathId(q)) ) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindVar q in
          let mg = mkmag s (HwId(HNPort(k,c,v,prop,u))) (MathId q) in
          [SSolAddLabel(wire,prop,lbl);SSolAddLabel(wire,prop,mg)]
      | UFunction(MathId(q), Term(HwId(HNPort(k,c,v,prop,u))) ) ->
          let wire = SlnLib.hwport2wire c v in
          let lbl = LBindVar q in
          let mg = mkmag s (HwId(HNPort(k,c,v,prop,u))) (MathId q) in
          [SSolAddLabel(wire,prop,lbl);SSolAddLabel(wire,prop,mg)]
      | _ -> []
    in
    let handle_goal g =
      if is_trivial g then
        let _ = SearchLib.add_step t.search (SRemoveGoal g) in
        let steps = get_trivial_step g  in
        let _ = List.iter (fun x -> let _ = SearchLib.add_step t.search x in ()) steps in
        ()
    in
    let goal_cursor = SearchLib.cursor t.search in
    if (SET.fold goals (fun x r -> if is_trivial x then r+1 else r) 0) > 0 then
      let _ = SearchLib.start t.search in
      let _ = SET.iter goals handle_goal in
      let trivial_cursor = SearchLib.commit t.search in
      let _ = SearchLib.visit t.search goal_cursor in
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
    (*mark goal as explored.*)
    let goal_cursor = SearchLib.cursor tbl.search in
    let _ = SearchLib.visit tbl.search goal_cursor in
    ()

  let goals2str (g:goal set) =
    let goal2str g v =
      v^"\n"^(UnivLib.goal2str g)
    in
    SET.fold g goal2str ""

  let rec get_next_path s v =
    match SearchLib.random_path v.search with
    | Some(p) ->
      let depth =  List.length (TREE.get_path v.search.paths p) in
      if depth >= s.max_depth
        then
          let _ = SearchLib.visit v.search p in
          get_next_path s v
        else
          Some (p)
    | None -> None

  let mkmenu (s:slvr) (v:gltbl) (g:goal) =
    let menu_desc = "t=search-tree, s=sol, g=goals, any-key=continue, q=quit" in
    let rec menu_handle inp on_finished=
      if STRING.startswith inp "t" then
        let _ = Printf.printf "\n%s\n\n" (SearchLib.buf2str v.search) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "s" then
        let _ = Printf.printf "\n%s\n\n" (SlnLib.tostr v.sln) in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "goto" then
        let _ = match STRING.split inp " " with
        | [_;id] ->
          let nid = int_of_string id in
          let _ = SearchLib.move_cursor s v (SearchLib.id2node v.search nid) in
          ()
        | _ -> ()
        in
        let _ = on_finished() in
        ()
      else if STRING.startswith inp "g" then
        let _ = Printf.printf "==== Goals ===" in
        let _ = Printf.printf "%s\n" (goals2str v.goals) in
        let _ = Printf.printf "============\n\n" in
        ()
      else if STRING.startswith inp "c" then
        let _ = Printf.printf ">>> target goal: %s\n\n" (UnivLib.goal2str g) in
        ()
      else
        ()
    in
    let internal_menu_handle x = menu_handle x (fun () -> ()) in
    let rec user_menu_handle () = menu s (fun x -> menu_handle x user_menu_handle) menu_desc in
    internal_menu_handle,user_menu_handle

  let rec solve (_s:slvr ref) (v:gltbl) =
    let s = REF.dr _s in
    (*find a goal to focus on*)
    if SET.size v.goals = 0 then
      let _ = Printf.printf "SOLVER: Attained all goals. Finished\n" in
      let _ = exit 0 in
      ()
    else
      let g = SET.rand v.goals in
      (*menu handling methods*)
      let mint,musr = mkmenu s v g in

      (*apply the current step in the search algorithm*)
      (*let _ = apply_steps s v (SearchLib.cursor v.search) in*)
      (*choose a goal in the table*)

      let solve_goal () =
        let goal_cursor = SearchLib.cursor v.search in
        let _ = resolve_trivial s v v.goals in
        if SlnLib.conserve s v.sln = false then
          let _ = SearchLib.rm v.search goal_cursor in
          ()
        else
          (*show goals and current solution*)
          let _ = mint "g" in
          let _ = mint "s" in
          let _ = apply_nodes s v g in
          let _ = musr () in
          ()
      in
      let _  = solve_goal () in
      match get_next_path s v with
        | Some(p) ->
          let _ = SearchLib.move_cursor s v p in
          let _ = solve _s v in
          ()
        | None ->
          let _ = Printf.printf "SOLVER: exhausted search.\n" in
          exit 0


end



let solve (hw:hwenv) (prob:menv) (interactive:bool) =
  let _ = init_utils() in
  let sl = SolveLib.mkslv  hw prob interactive in
  let tbl = SolveLib.mktbl sl in
  let _ = pr sl "===== Beginning Interactive Solver ======" in
  let _ = SolveLib.solve (REF.mk sl) (tbl) in
  ()
