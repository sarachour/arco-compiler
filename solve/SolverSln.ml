open Util
open SolverData

open Common
open HWData
open HW
open Math
open SolverUtil
open Unit
open SolverRslv

exception SolverSlnError of string

let error n m = raise (SolverSlnError (n^":"^m))

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

  let wire2hwid = UnivLib.wire2hid
  let wire2hid = UnivLib.wire2hid
  let wire2uid = UnivLib.wire2uid

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
    | LBindValue(k,v) -> "bind "^(string_of_number v)^" : "^(HwLib.kind2str k)
    | LBindVar(k,v) -> "bind "^(MathLib.mid2str v)^" : "^(HwLib.kind2str k)

  let mksln () : sln =
    {comps=MAP.make();conns=MAP.make(); labels=MAP.make()}


  let mkcomp (sln:sln) (id:unodeid) =
    MAP.put sln.comps id (SET.make (),0)

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
        let s = (SET.make () ) in
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
      error "mkconn_undo" ("cannot undo connection that doesn't exist: "^(wire2str src)^"->"^(wire2str snk))

  let mklabel (sln:sln) (id:wireid) (prop:propid) (v:label) =
    let prps = if MAP.has sln.labels id = false then
        let pmap = MAP.make () in
        let _ = MAP.put sln.labels id pmap in
        pmap
      else
        MAP.get sln.labels id
    in
    let pset = if MAP.has prps prop = false then
      let pset = SET.make () in
      let _ = MAP.put prps prop pset in
      pset
      else
        MAP.get prps prop
    in
    let _ = SET.add pset v in
    ()

  let get_labels (sln:sln) (fxn:(wireid->propid->label->bool)) =
    let lbls = MAP.fold sln.labels (fun w pl lst1 ->
      MAP.fold pl (fun pr lbls lst2 ->
        SET.fold lbls (fun lb lst3 -> if fxn w pr lb then
          (w,pr,lb)::lst3 else lst3) lst2
      ) lst1
    ) [] in
    lbls

  let wires_of_label (sln:sln) (prop:propid) (v:label -> bool) : wireid list option=
    let check_label cwire cproplabels =
      if MAP.has cproplabels prop then
        let lbls = MAP.get cproplabels prop in
        let haslbl = SET.fold lbls (fun x r -> r || (v x)) true in
        haslbl
      else false
    in
    let matches = MAP.fold sln.labels (fun wire proplbls r ->
      if check_label wire proplbls then
        wire::r
      else
        r
      ) []
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
    let _ = if MAP.has s.comps id = false then
      let _ = mkcomp s id in () else () in
    let lst,n = MAP.get s.comps id in
    let lst = SET.add lst i in
    s.comps <- MAP.put s.comps id (lst,n)

  let usecomp_unmark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let n = if i >= n then i+1 else n in
    let _ = SET.rm lst i in
    s.comps <- MAP.put s.comps id (lst,n)

  let repr2buf fb (s:sln) : unit =
    let os x = let _ = output_string fb x in () in
    let inst2repr (cname:unodeid) (inst:int) =
      os ("comp "^(UnivLib.unodeid2name cname)^" "^(string_of_int inst)^"\n")
    in
    let comp2repr (cname:unodeid) (insts:int set) : unit =
      SET.iter insts (fun i  -> (inst2repr cname i))
    in
    let comps2repr c : unit =
      let _ = MAP.iter c (fun k (l,n) -> comp2repr k l) in
      ()
    in
    let conns2repr c =
      let conn2repr src snk =
        let sname,sid,sport = src in
        let dname,did,dport = snk in
        let snn = (UnivLib.unodeid2name sname)^" "^(string_of_int sid)^" "^sport in
        let dnn = (UnivLib.unodeid2name dname)^" "^(string_of_int did)^" "^dport in
        os ("conn "^snn^" :: "^dnn^"\n")
      in
      let forsnks src sset = SET.iter sset (fun snk -> (conn2repr src snk) ) in
      let _ = MAP.iter c (fun src snkset -> (forsnks src snkset)) in
      ()
    in
    let labels2repr c =
      let prplbl2repr wire (prp:string) lbl =
        let sname,sid,sport = wire in
        let handle = prp^" of "^(UnivLib.unodeid2name sname)^" "^(string_of_int sid)^" "^sport in
        let cmd = match lbl with
        | LBindValue(k,f) -> "bind value "^handle^" :: "^(string_of_number f)
        | LBindVar(HNInput,MNVar(_,n,_)) -> "bind var "^handle^" :: "^"var "^n
        | LBindVar(HNOutput,MNVar(_,n,_)) -> "bind var "^handle^" :: "^"var "^n
        | LBindVar(HNInput,MNTime(_)) -> "bind time "^handle
        | LBindVar(HNInput,MNParam(n,p,u)) -> "bind value "^handle^" :: "^(string_of_number p)
        | _ -> "%unsupported label"
        in
        os (cmd^"\n")
      in
      let prplbls2repr wire prp labels =
        if SET.size labels > 0 then
          (SET.iter labels (fun x -> prplbl2repr wire prp x))
        else
          ()
      in
      let lbls2repr k props =
        let _ = MAP.iter props (fun prp v -> prplbls2repr k prp v ) in
        ()
      in
      MAP.iter c (fun k v -> lbls2repr k v)
    in
    let () = comps2repr s.comps in
    let () = conns2repr s.conns in
    let () = labels2repr s.labels in
    ()

  let repr2file fn (s:sln) :unit =
    let fname = fn in
    let oc = open_out fname in
    let _ = repr2buf oc s in
    let _ = close_out oc in
    ()

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
