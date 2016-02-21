open Common

open HW
open HWData
open HWCstr

open Math
open MathCstr

open AST
open Util
open Unit
open SolverData

module Shim =
struct
  let wrap_goal (v:gltbl) (u:urel) : goal =
    if v.is_trivial u then
      TrivialGoal(u)
    else
      NonTrivialGoal(u)


  let wrap_goal_fun (v:urel->bool) (u:urel) : goal =
    if v u then
      TrivialGoal(u)
    else
      NonTrivialGoal(u)

  let unwrap_goal (g:goal) : urel = match g with
  | TrivialGoal(v) -> v
  | NonTrivialGoal(v) -> v

  let unt s uid : unt =
    match uid with
    | MathId(MNVar(_,_,u)) -> u
    | MathId(MNTime(u)) -> u
    | MathId(MNParam(_,_,u)) -> u
    | HwId(HNParam(_,_,_,u)) -> u
    | HwId(HNPort(_,_,_,_,u)) -> UExpr (Term u)
    | HwId(HNTime(_,u)) -> u

  let mag s uid : range option =
    match uid with
    | HwId(HNPort(k,HCMLocal(cname),name,prop,un)) ->
      HwCstrLib.mag s.hw.cstr cname name prop
    | HwId(HNPort(k,HCMGlobal(cname,_),name,prop,un)) ->
      HwCstrLib.mag s.hw.cstr cname name prop
    | MathId(MNVar(k,v,u)) ->
      MathCstrLib.mag s.prob.cstr v
    |_ -> None

  let tc s uid : range option =
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

  let lclid2glblid iid x =
    match x with
    | HwId(HNPort(k,HCMLocal(c),p,prop,un)) ->
      HwId(HNPort(k,HCMGlobal(c,iid),p,prop,un))
    | HwId(HNParam(HCMLocal(c), name, vl, u)) ->
      HwId(HNParam(HCMGlobal(c,iid),name,vl,u))
    | HwId(HNTime(HCMLocal(c),u)) ->
      HwId(HNTime(HCMGlobal(c,iid),u))
    | _ -> x

  let glblid2lclid x =
    match x with
    | HwId(HNPort(k,HCMGlobal(c,i),p,prop,un)) ->
      HwId(HNPort(k,HCMLocal(c),p,prop,un))
    | HwId(HNParam(HCMGlobal(c,i), name, vl, u)) ->
      HwId(HNParam(HCMLocal(c),name,vl,u))
    | HwId(HNTime(HCMGlobal(c,i),u)) ->
      HwId(HNTime(HCMLocal(c),u))
    | _ -> x


  let  lcl2glbl iid (a:unid ast) : unid ast =
    let mp x = lclid2glblid iid x in
    ASTLib.map a mp

  let  glbl2lcl (a:unid ast) : unid ast =
    let mp x = glblid2lclid x in
    ASTLib.map a mp

  let rel_glbl2lcl (g:urel) : urel = match g with
  |  UFunction(l,r) -> UFunction(glblid2lclid l, glbl2lcl r)
  |  UState(l,r,ic,t) -> UState(glblid2lclid l, glbl2lcl r, glblid2lclid ic, glblid2lclid t)

  let rel_lcl2glbl  (i:int)  (g:urel): urel = match g with
  |  UFunction(l,r) -> UFunction(lclid2glblid i l, lcl2glbl i r)
  |  UState(l,r,ic,t) -> UState(lclid2glblid i l, lcl2glbl i r, lclid2glblid i ic, lclid2glblid i t)

  let rel2lhs (g:urel) : unid =  match g with
  |  UFunction(l,r) -> l
  |  UState(l,r,ic,t) -> l

  let goal2lhs (g:goal) = rel2lhs (unwrap_goal g)

  let unid2wcsym cmpname ciid uid is_templ cnv= match uid, is_templ with
  | (HwId(HNPort(k,HCMLocal(c),port,prop,u)), true) ->
    error "unid2sym" ("no non-concretized port of name "^c^"."^port^" allowed.")
  | (HwId(HNPort(k,HCMGlobal(c,i),port,prop,u)),true) ->
    if i = ciid && cmpname = c
    then WildcardVar(cnv uid,[])
    else SymbolVar(cnv uid)
  | (HwId(v),_) -> SymbolVar(cnv uid)
  | (MathId(v),_) -> SymbolVar(cnv uid)

  let unid2sym cmpname ciid uid cnv= match uid with
  | HwId(HNPort(k,HCMLocal(c),port,prop,u)) ->
    error "unid2sym" ("no non-concretized port of name "^c^"."^port^" allowed.")
  | HwId(v) -> SymbolVar(cnv uid)
  | MathId(v) -> SymbolVar(cnv uid)

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

  let wrap_goal = Shim.wrap_goal
  let wrap_goal_fun = Shim.wrap_goal_fun
  let unwrap_goal = Shim.unwrap_goal
  let lclid2glblid = Shim.lclid2glblid


  let unodeid2name unodeid = match unodeid with
  | UNoInput(x) -> HwLib.input_cid x
  | UNoOutput(x) -> HwLib.output_cid x
  | UNoCopy(x) -> HwLib.copy_cid x
  | UNoComp(x) -> x
  | UNoConcComp(x,inst) -> x

  let name2unodeid (c:string) = match HwLib.get_special c with
    | Some("copy",prop) -> UNoCopy(prop)
    | Some("input",prop) -> UNoInput(prop)
    | Some("output",prop) -> UNoOutput(prop)
    | Some(_) -> error "name2UNot" "illegal name"
    | None -> UNoComp c

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

  let label2uid x = match x with
  | LBindVar(k,mid) -> MathId(mid)
  | _ -> error "label2unid" "can only convert bind variable"

  let unid2var uid = match uid with
  | MathId(m) -> "m:"^(mid2var m)
  | HwId(h) -> "h:"^(hwid2var h)

  let hwid2prop hwid : propid = match hwid with
  | HNPort(_,_,_,p,_) -> p
  | _ -> error "hwid2wire" "no property"

  let unid2prop u : propid = match u with
  | HwId(h) -> hwid2prop h
  | _ -> error "unid2prop" "error"

  let hwid2wire hwid : wireid = match hwid with
  | HNPort(_,HCMGlobal(c,i),v,_,_) -> (name2unodeid c,i,v)
  | _ -> error "hwid2wire" "cannot convert to wire"

  let unid2wire uid = match uid with
  | HwId(h) -> hwid2wire h
  | _ -> error "unid2wire" "cannot convert mid to wire"

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

  let ast2complexity r =
    let rec calc node : float =
      let red (l:unid ast list) (fn: float -> float -> float) : float =
        List.fold_right (fun x r -> fn (calc x) r) l 0.
      in
      let cost (a:float) (rest:float) : float =
        rest +. a*.1.5
      in
      match node with
      | Op1(_,a) -> let res : float = red [a] cost in res
      | Op2(_,a,b) -> red [a;b] cost
      | OpN(_,alst) -> red alst cost
      | _ -> 1.
    in
    let xp = calc r in
    xp

  let urel2complexity u = match u with
  | UFunction(l,r) -> ast2complexity r
  | UState(l,r,i,t) -> ast2complexity r

  let goal2complexity = urel2complexity

  let urel2str uid = match uid with
  | UFunction(l,r) -> (unid2str l)^"="^(ASTLib.ast2str r unid2str)
  | UState(l,r,i,t) -> "ddt("^(unid2str l)^")="^(ASTLib.ast2str r unid2str)

  let goal2str n = match n with
  | NonTrivialGoal(g) -> ""^(urel2str g)
  | TrivialGoal(g) -> "@"^(urel2str g)

  let uast2str uast : string=
    let conv (x:unid) : string = unid2str x in
    ASTLib.ast2str uast conv

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
    | UState(l,r,i,t) -> UState(sid l,ASTLib.sub r assigns,sid i,sid t)
  in
  let nr = SET.map node.rels (fun x -> conc_rel x) in
  node



  let wire2hid he (wire:wireid) prop =
    let cmpn,cmpid,name = wire in
    let cmpname = unodeid2name cmpn in
    let knd = HwLib.getkind he cmpname name in
    let unt = HwLib.getunit he cmpname name prop in
    HNPort(knd, HCMGlobal(cmpname,cmpid), name, prop, unt)

  let wire2hwid = wire2hid

  let wire2uid he (wire:wireid) prop =
    let hid = wire2hid he wire prop in
    HwId(hid)

end

module GoalStubLib =
struct

  let add_goal (t:gltbl) (g:goal) =
    SET.add t.goals g

  let remove_goal (t:gltbl) (g:goal) =
    SET.rm t.goals g

  let deactivate_goal (t:gltbl) (g:goal) =
    SET.add t.blacklist g

  let activate_goal (t:gltbl) (g:goal) =
    SET.rm t.blacklist g


  let add_partial_comp (t:gltbl) (id:unodeid) (i:int) (cmp:unode) =
    MAP.put t.dngl (id,i) cmp


  let mk_partial_comp (t:gltbl) (id:unodeid) (i:int)=
    let cnode : unode= MAP.get t.nodes id in
    let cname : string = cnode.name in
    let rels : urel set = SET.make_dflt() in
    let cmp : unode = {name=cname;rels=rels} in
    let _ = MAP.put t.dngl (id,i) cmp in
    ()

  let has_partial_comp (t:gltbl) (id:unodeid) (i:int) =
    MAP.has t.dngl (id,i)

  let add_rel_to_partial_comp (t:gltbl) (id:unodeid) (i:int) (rr:urel) =
    let _ = if has_partial_comp t id i = false
      then mk_partial_comp t id i
      else ()
    in
    let node = MAP.get t.dngl (id,i) in
    let _ = SET.add node.rels rr in
    ()

  let rm_rel_from_partial_comp (t:gltbl) (id:unodeid) (i:int) (rr:urel) =
    if has_partial_comp t id i then
      let cmp = MAP.get t.dngl (id,i) in
      let _ = SET.rm cmp.rels rr in
      ()
    else
      ()

  let get_partial_comp (t:gltbl) (id:unodeid) (i:int) =
    MAP.get t.dngl (id,i)

  let rm_partial_comp (t:gltbl) (id:unodeid) (i:int)  =
    if has_partial_comp t id i then
      let _ = MAP.rm t.dngl (id,i) in
      ()
    else
      ()

  let remove_partial_comp (t:gltbl) (id:unodeid) (i:int)  =
    MAP.rm t.dngl (id,i)

  let is_trivial (t:gltbl) (r:urel) =
    t.is_trivial r

  let wrap_goal = Shim.wrap_goal
  let unwrap_goal = Shim.unwrap_goal

end
