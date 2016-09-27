open Common

open HWLib
open HWData
open HWCstrLib
open HWInstLib

open MathData
open MathLib
open MathCstr

open AST
open Util
open Unit
open SolverData

module UnivLib =
struct
  let wrap_goal (v:gltbl) (u:uvar) : goal =
    if v.is_trivial u then
      TrivialGoal(u)
    else
      NonTrivialGoal(u)


  let wrap_goal_fun (v:uvar->bool) (u:uvar) : goal =
    if v u then
      TrivialGoal(u)
    else
      NonTrivialGoal(u)

  let unwrap_goal (g:goal) : uvar = match g with
  | TrivialGoal(v) -> v
  | NonTrivialGoal(v) -> v

  let comp s name =
    let c = HwLib.getcomp s.hw name in
    c

  let lclid2glblid iid x =
    match x with
    | HwId(hvar) -> HwId (HwLib.hwid_map_comp hvar (fun q -> match q with
        | HCMLocal(c) -> HCMGlobal(c,iid))) 
    | _ -> x

  let glblid2lclid x =
    match x with
    | HwId(hvar) -> HwId (HwLib.hwid_map_comp hvar (fun q -> match q with
        | HCMGlobal(c,_) -> HCMLocal(c))) 
    | _ -> x

  
  let map_ic (g: unid init_cond) (fxn: unid -> unid) =
    match g with
    | ICVar(h) -> ICVar(fxn h)
    | _ -> g

  let upd_uvar (g:uvar) (fxn:unid -> unid) : uvar =
    begin match g.bhvr with
      | UBhvVar(bhvr) ->
        bhvr.rhs <- ASTLib.map bhvr.rhs fxn;
        ()
      | UBhvState(bhvr) ->
        bhvr.rhs <- ASTLib.map bhvr.rhs fxn;
        bhvr.ic <- map_ic bhvr.ic fxn;
        ()
    end;
    g.lhs <- fxn g.lhs;
    g

  let get_rhs (g:uvar): unid ast =
    begin match g.bhvr with
      | UBhvVar(bhvr) -> bhvr.rhs
      | UBhvState(bhvr) -> bhvr.rhs
    end


 let rel_glbl2lcl (g:uvar) : uvar = upd_uvar g glblid2lclid

 let rel_lcl2glbl  (i:int)  (g:uvar): uvar = upd_uvar g (lclid2glblid i)

  
 let rel2lhs (g:uvar) : unid = g.lhs

  let goal2lhs (g:goal) = rel2lhs (unwrap_goal g)

  let unid2wcsym cmpname ciid uid is_templ cnv= match uid, is_templ with
  | (HwId(HNPort(k,HCMLocal(c),port,prop)), true) ->
    error "unid2sym" ("no non-concretized port of name "^c^"."^port^" allowed.")
  | (HwId(HNPort(k,HCMGlobal(c,i),port,prop)),true) ->
    if i = ciid && cmpname = c
    then WildcardVar(cnv uid,[])
    else SymbolVar(cnv uid)
  | (HwId(v),_) -> SymbolVar(cnv uid)
  | (MathId(v),_) -> SymbolVar(cnv uid)

  let unid2sym cmpname ciid uid cnv= match uid with
  | HwId(HNPort(k,HCMLocal(c),port,prop)) ->
    error "unid2sym" ("no non-concretized port of name "^c^"."^port^" allowed.")
  | HwId(v) -> SymbolVar(cnv uid)
  | MathId(v) -> SymbolVar(cnv uid)

  let max4unodeid s id : int =
    let ginst x = HwInstLib.getinsts s.hw x in
    match id with
    | UNoComp(x) -> ginst x
    | UNoCopy(x) -> ginst (HwLib.copy_cid x)
    | UNoInput(x) -> ginst (HwLib.input_cid x)
    | UNoOutput(x) -> ginst (HwLib.output_cid x)




  let unodeid2name unodeid = match unodeid with
  | UNoInput(x) -> HwLib.input_cid x
  | UNoOutput(x) -> HwLib.output_cid x
  | UNoCopy(x) -> HwLib.copy_cid x
  | UNoComp(x) -> x

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
  | HNPort(knd,cmp,name,prop) -> (proccmp cmp)^":"^name^":"^prop
  | HNPort(knd,cmp,name,prop) -> (proccmp cmp)^":"^name^":"^prop
  | HNParam(cmp,name) -> (proccmp cmp)^":"^name
  | HNTime(_) -> "t'"

  let mid2var (mid:mid) : string = match mid with
  | MNVar(k,n) -> n
  | MNParam(name,v) -> name
  | MNTime -> "t"

  let label2uid x = match x with
  | LBindVar(k,mid) -> MathId(mid)
  | _ -> error "label2unid" "can only convert bind variable"

  let unid2var uid = match uid with
  | MathId(m) -> "m:"^(mid2var m)
  | HwId(h) -> "h:"^(hwid2var h)

  let icond2str (type a) (ic:a init_cond) (a2str:a->string) : string = match ic with
    | ICVar(q) -> a2str q
    | ICVal(q) -> string_of_number q

  let unid_icond2str (ic:unid init_cond) =
    icond2str ic unid2var

  let hwid2prop hwid : string = match hwid with
  | HNPort(_,_,_,p) -> p
  | _ -> error "hwid2wire" "no property"

  let unid2prop u : string = match u with
  | HwId(h) -> hwid2prop h
  | _ -> error "unid2prop" "error"

  let hwvar2wire (v:hwvid hwportvar) : wireid =
      (name2unodeid v.comp,-1,v.port)

  let hwid2wire hwid : wireid = match hwid with
  | HNPort(_,HCMGlobal(c,i),v,_) -> (name2unodeid c,i,v)
  | _ -> error "hwid2wire" "cannot convert to wire"

  let unid2wire uid = match uid with
  | HwId(h) -> hwid2wire h
  | _ -> error "unid2wire" "cannot convert mid to wire"

  let _var2mid s (rst:string list) : mid =  match rst with
  | [v] -> MathLib.var_to_mid s.prob v 
  | _ -> error "apply_comp" "iconvmid encountered unexpected string"

  let _var2hwid ((s):slvr) (rst:string list) = match rst with
    | ["l";cn;v;p] ->
      HwLib.comp_port_to_hwid s.hw cn v (None)
   | ["g";cn;i;v;p] ->
     let comp = comp s cn in
     HwLib.comp_port_to_hwid s.hw cn v (Some (int_of_string i))
   | ["l";cn;"t"] ->
     HNTime
   | ["g";cn;istr;"t"] ->
     HNTime
   | ["l";cn;v] ->
     HwLib.comp_port_to_hwid s.hw cn v (None)
   | ["g";cn;i;v] ->
     HwLib.comp_port_to_hwid s.hw cn v (Some (int_of_string i))
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

  let uvar2complexity u = ast2complexity (get_rhs u)

  let goal2complexity = uvar2complexity

  let uvar2str uid : string = match uid.bhvr with
  | UBhvVar(b) -> (unid2str uid.lhs)^"="^(ASTLib.ast2str b.rhs unid2str)
  | UBhvState(b) -> "ddt("^(unid2str uid.lhs)^")="^(ASTLib.ast2str b.rhs unid2str)
  | UBhvUndef -> (unid2str uid.lhs)^" = *"

  let goal2str n = match n with
  | NonTrivialGoal(g) -> ""^(uvar2str g)
  | TrivialGoal(g) -> "@"^(uvar2str g)

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
    let sub_ic ic : unid init_cond = match ic with 
      | ICVar(v) -> ICVar(sid v)
      | ICVal(v) -> ICVal(v)
    in
    let conc_rel data  : uvar=
      data.lhs <- sid data.lhs;
      match data.bhvr with
      | UBhvVar(bhv) -> bhv.rhs <- ASTLib.sub bhv.rhs assigns; data
      | UBhvState(bhv) ->
        bhv.rhs <- ASTLib.sub bhv.rhs assigns;
        bhv.ic <- sub_ic bhv.ic;
        data
    in
    MAP.upd_all node.vars (fun data -> List.map (fun el -> conc_rel el) data);
    node



  let wire2hid he (wire:wireid) prop =
    let cmpn,cmpid,name = wire in
    let cmpname = unodeid2name cmpn in
    let knd = HwLib.getkind he cmpname name in
    HNPort(knd, HCMGlobal(cmpname,cmpid), name, prop)

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
    MAP.put t.used_nodes (id,i) cmp


  let mk_partial_comp (t:gltbl) (id:unodeid) (i:int)=
    let cnode : unode= MAP.get t.nodes id in
    let cname : string = cnode.name in
    let cmp : unode = {
      name=cname;
      vars=MAP.make();
      params=MAP.make();
      id=id;
    } in
    MAP.put t.used_nodes (id,i) cmp;
    ()

  let has_partial_comp (t:gltbl) (id:unodeid) (i:int) =
    MAP.has t.used_nodes (id,i)

  let add_rel_to_partial_comp (t:gltbl) (id:unodeid) (i:int) (rr:uvar) =
    let _ = if has_partial_comp t id i = false
      then mk_partial_comp t id i
      else ()
    in
    let node = MAP.get t.used_nodes (id,i) in
    if MAP.has node.vars rr.lhs = false then begin
      MAP.put node.vars rr.lhs [];()
   end else begin
     let rels = MAP.get node.vars rr.lhs  in
     MAP.put node.vars rr.lhs (rr::rels);
     ()
     end

  let rm_rel_from_partial_comp (t:gltbl) (id:unodeid) (i:int) (rr:uvar) =
    if has_partial_comp t id i then
      let cmp = MAP.get t.used_nodes (id,i) in
      let _ = MAP.rm cmp.vars rr.lhs in
      ()
    else
      ()

  let get_partial_comp (t:gltbl) (id:unodeid) (i:int) =
    MAP.get t.used_nodes (id,i)

  let rm_partial_comp (t:gltbl) (id:unodeid) (i:int)  =
    if has_partial_comp t id i then
      let _ = MAP.rm t.used_nodes (id,i) in
      ()
    else
      ()

  let remove_partial_comp (t:gltbl) (id:unodeid) (i:int)  =
    MAP.rm t.used_nodes (id,i)

  let is_trivial (t:gltbl) (r:uvar) =
    t.is_trivial r

  let wrap_goal = UnivLib.wrap_goal
  let unwrap_goal = UnivLib.unwrap_goal
end
