open Common

open HW
open HWCstr

open Math
open MathCstr

open AST
open Util
open Unit
open SolverData

module Shim =
struct
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

  let lclid2glblid sln iid x =
    match x with
    | HwId(HNPort(k,HCMLocal(c),p,prop,un)) ->
      HwId(HNPort(k,HCMGlobal(c,iid),p,prop,un))
    | HwId(HNParam(HCMLocal(c), name, vl, u)) ->
      HwId(HNParam(HCMGlobal(c,iid),name,vl,u))
    | HwId(HNTime(HCMLocal(c),u)) ->
      HwId(HNTime(HCMGlobal(c,iid),u))
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
    error "unid2sym" ("no non-concretized port of name "^c^"."^port^" allowed.")
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
  | UState(l,r,i,t) -> "ddt("^(unid2str l)^")="^(ASTLib.ast2str r unid2str)

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


  let goal2str = urel2str

end
