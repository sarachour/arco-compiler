open Util
open SolverData

open Common
open HWData
open HW
open Math
open SolverUtil
open Unit
open SolverRslv

module SlnLib =
struct
  let hwport2wire cm port =
    match cm with
    | HCMLocal(c) -> error "hwport2wire" ("underspecified identifier "^c^".")
    | HCMGlobal(q,i) ->
      let nid = UnivLib.name2unodeid q in
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
    | LBindVar(k,v) -> "bind "^(MathLib.mid2str v)

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
    let res = HwConnRslvr.is_valid v s in
    res

  let mklbl_cons (v:slvr) (s:sln) =
    let res = HwErrRslvr.is_valid v s in
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

  let wires_of_label (sln:sln) (prop:propid) (v:label) : wireid list option=
    let matches = MAP.fold sln.labels (fun k props r ->
      if MAP.has props prop = false then r else
      let lset = MAP.get props prop in
      if SET.has lset v then
      k::r else r ) []
    in
    match matches with
    | h::t -> Some(matches)
    | [] -> None

  let conns_with_dest (sln:sln) (targ:wireid) : wireid list =
    let connected = MAP.fold sln.conns (fun src children r ->
      if src = targ then SET.to_list children else r
    ) []
    in
    connected

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
    if MAP.has sln.comps id = false then error "usecomp" ("the following doesn't exist:"^UnivLib.unodeid2name id) else
    let l,n = MAP.get sln.comps id in
    let _ = sln.comps <- MAP.put sln.comps id (SET.add l n,n+1) in
    n

  let usecomp_cons (s:slvr) (sln:sln) : bool =
    let prop id (lst,n) (r:bool) : bool =
      let nuses = SET.size lst in
      let maxuses = Shim.max4unodeid s id in
      if maxuses >= nuses then
        r
      else
        let _ = Printf.printf "# over limit: %s: %d %d\n"(UnivLib.unodeid2name id) nuses maxuses in
        let _ = flush_all() in
        false
    in
    let res = MAP.fold (sln.comps) prop true in
    res

  let usecomp_valid (s:slvr) (sln:sln) id : bool =
    if MAP.has sln.comps id = false
      then error "usecomp_valid" ("does not exist in solution: "^(UnivLib.unodeid2name id))
      else
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
    let n = if i >= n then i+1 else n in
    let _ = SET.rm lst i in
    s.comps <- MAP.put s.comps id (lst,n)


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
