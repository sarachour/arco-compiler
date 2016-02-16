open Util

open Interactive
open Globals

open SolverData
open SolverGoalTable
open SolverSln

open Common
open HWData
open Math

module TrivialLib =
struct

  let is_trivial g =
      match g with
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Decimal(_)) -> true
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Integer(_)) -> true
      | UFunction(MathId(_),Decimal(_)) -> true
      | UFunction(MathId(_),Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> true
      | UFunction(HwId(v),Term(MathId(_))) -> true
      | _ -> false

  let if_nontrivial_possible g =
      match g with
      | UFunction(MathId(MNTime(_)),Term(HwId(HNTime(_)))) -> false
      | UFunction(HwId(HNTime(_)),Term(MathId(MNTime(_)))) -> false
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Decimal(_)) -> true
      | UFunction(HwId(HNPort(HNInput,_,_,_,_)),Integer(_)) -> true
      | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
          if prop1 = prop2 then true else false
      | UFunction(MathId(v),Term(HwId(_))) -> false
      | UFunction(HwId(v),Term(MathId(_))) -> false
      | _ -> false


  let mkconn s t sw dw pr =
    if sw = dw then [] else
    [SSolAddConn(sw,dw)]

  let rslv_value (slvr:slvr) (sln:sln) (wire:wireid) (prop:propid) (valu:number) knd =
    let nlbl = LBindValue(knd,valu) in
    match knd with
    (*impossible to map an output to a value*)
    | HNOutput ->
      let assign = (SlnLib.wire2str wire)^":"^prop^" = "^(string_of_number valu) in
      error "rslv_value" ("impossible assignment: "^assign)
    (*impossible to map an input to a value*)
    | HNInput ->
      let stps = [SSolAddLabel(wire,prop,nlbl)] in
      stps

  let rslv_label (slvr:slvr) (sln:sln) (wire:wireid) (prop:propid) (q:mid) (knd:hwvkind) =
    let nlbl = LBindVar(knd,q) in
    let mknd = MathLib.getkind slvr.prob (MathLib.mid2name q) in
    match knd,(OPTION.force_conc mknd) with
    (*impossible to map an output to a value*)
    | (HNOutput,MOutput) ->
      let stps = [SSolAddLabel(wire,prop,nlbl)] in
      stps
    | (HNInput,MLocal) ->
      let stps = [SSolAddLabel(wire,prop,nlbl)] in
      stps
    | (HNOutput,MLocal) ->
      let stps = [SSolAddLabel(wire,prop,nlbl)] in
      stps
    (*impossible to map an input to a value*)
    | (HNInput,MInput) ->
      let stps = [SSolAddLabel(wire,prop,nlbl)] in
      stps
    | _ -> error "rslv_lbl" "impossible label."

  let resolve_trivial_step (s:slvr) (t:gltbl) g : sstep list =
    match GoalTableLib.unwrap_goal g with
      (*check for duplicates*)
    | UFunction(HwId(HNPort(k1,c1,v1,prop1,u1)),Term (HwId(HNPort(k2,c2,v2,prop2,u2))) )  ->
        if prop1 = prop2 then
          let src = SlnLib.hwport2wire c1 v1 in
          let snk = SlnLib.hwport2wire c2 v2 in
          let conn = mkconn s t src snk prop1 in
          conn
        else error "get_trivial_step" "is nontrivial."
    | UFunction(HwId(HNPort(k,c,v,prop,u)),Decimal(q)) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_value s t.sln wire prop (Decimal q) k in
        stps

    | UFunction(HwId(HNPort(k,c,v,prop,u)),Integer(q)) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_value s t.sln wire prop (Integer q) k in
        stps

    | UFunction(HwId(HNPort(k,c,v,prop,u)), Term(MathId(q)) ) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_label (s) t.sln wire prop q k in
        stps

    | UFunction(MathId(q), Term(HwId(HNPort(k,c,v,prop,u))) ) ->
        let wire = SlnLib.hwport2wire c v in
        let stps = rslv_label (s) (t.sln) wire prop q k in
        stps

    | UFunction(MathId(MNTime(um)), Term (HwId(HNTime(cmp,uh))) ) ->
        let tc = () in
        []

    | UFunction(HwId(HNTime(cmp,uh)), Term (MathId(MNTime(um))) ) ->
        let tc = () in
        []

    | _ -> []


end
