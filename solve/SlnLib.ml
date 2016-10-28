open Util
open SolverData

open HWData
open HWLib
open MathLib
open Unit

open MathData

open AST

exception SolverSlnError of string

let error n m = raise (SolverSlnError (n^":"^m))

module SlnLib =
struct

  let mklabels () :('a,'b) labels = {
    ins=MAP.make();
    outs=MAP.make();
    locals=MAP.make();
    vals=MAP.make();
    exprs=MAP.make();
  }
  let mkconns () : conn_env =
    {src2dest=MAP.make(); dest2src=MAP.make()}

  let mksln () : ('a,'b) sln =
    {comps=SET.make_dflt();conns=mkconns(); route=mklabels(); generate=mklabels()}


  let mkwire (c:hwcompname) (i:int) (p:string) : wireid =
    {comp={name=c;inst=i};port=p}

  let mkwireconn (src:wireid) (snk:wireid) : wireconn =
    {src=src;dst=snk}

  let wireid2str (x:wireid) =
    (HwLib.hwcompinst2str x.comp)^"."^x.port

  let wireconn2str (x:wireconn) : string =
    (wireid2str x.src)^"->"^(wireid2str x.dst)

  let label2str (type a) (type b) (x:(a,b) label)
      (f:a->string) (g:b->string) : string =
    match x with
    | MInLabel(lbl) -> (wireid2str lbl.wire)^" > "^(f lbl.var)
    | MOutLabel(lbl) -> (wireid2str lbl.wire)^" > "^(f lbl.var)
    | MLocalLabel(lbl) -> (wireid2str lbl.wire)^" > "^(f lbl.var)
    | MExprLabel(lbl) -> (wireid2str lbl.wire)^" > "^(ASTLib.ast2str lbl.expr g)
    | ValueLabel(lbl) -> (wireid2str lbl.wire)^" > "^(string_of_number lbl.value)

  let add_conn (sln:usln) (conn:wireconn) =
    let get_set (map:(wireid,wireid set) map) (key:wireid) : wireid set =
      if MAP.has map key then
        MAP.get map key
      else
        begin
          let s = SET.make_dflt () in
          MAP.put map key s; 
          s
        end
    in
    SET.add (get_set sln.conns.src2dest conn.src) conn.dst;
    SET.add (get_set sln.conns.dest2src conn.dst) conn.src;
    ()

  let rm_conn (sln:usln) (conn:wireconn) =
    match MAP.has sln.conns.src2dest conn.src, MAP.has sln.conns.dest2src conn.dst with
    | true,true ->
      begin
        SET.rm (MAP.get sln.conns.src2dest conn.src) conn.dst;
        SET.rm (MAP.get sln.conns.dest2src conn.dst) conn.src;
        ()
      end
    | false,false -> error "rm_conn"
                       ("cannot remove connection that doesn't exist "^(wireconn2str conn))
    | _ -> error "rm_conn" "only part of conn exists"

  let add_comp (sln:usln) compinst =
    SET.add sln.comps compinst;
    ()

  let rm_comp (sln:usln) compinst =
    SET.rm sln.comps compinst;
    ()

  let _get_mapped_wires (type a) (type b) (lbls:(a,b) labels) (name:a) =
    if MAP.has lbls.ins name then
      Some (MAP.get lbls.ins name)
    else if MAP.has lbls.outs name then
      Some (MAP.get lbls.outs name)
    else if MAP.has lbls.locals name then
      Some (MAP.get lbls.locals name)
    else
      None

  let get_generating_wires (type a) (type b) (sln:(a,b) sln) (name:a) =
    _get_mapped_wires sln.generate name

  let getsrcs (type a) (type b) (sln:(a,b) sln) (dest:wireid) =
    WCollEmpty 

  let getdests (type a) (type b) (sln:(a,b) sln) (dest:wireid) =
    WCollEmpty

  let _add_wire_to_label (type c) (m:(c,wire_coll) map) (key:c) (wire:wireid) =
    if MAP.has m key then
      let ncoll = match MAP.get m key with
      | WCollEmpty -> WCollOne(wire)
      | WCollOne(wire2) -> WCollMany([wire2;wire])
      | WCollMany(wires) -> WCollMany(wire::wires)
      in
      noop (MAP.put m key ncoll)
    else
      noop (MAP.put m key (WCollOne(wire)))

  let _rm_wire_from_label (type c) (m:(c,wire_coll) map) (key:c) (wire:wireid) =
    if MAP.has m key then
      let ncoll = match MAP.get m key with
      | WCollEmpty -> WCollEmpty
      | WCollOne(cwire) -> if cwire = wire then  WCollEmpty
          else error "rm_wire_from_label" "this wire is not assigned to the variable"
      | WCollMany(h::t) -> if LIST.has (h::t) wire
        then
          match List.filter (fun x -> x != wire) (h::t) with
          | [] -> WCollEmpty
          | [h] -> WCollOne(h)
          | h::t -> WCollMany(h::t)
        else error "rm_wire_From_label" "this wire is not assigned"
      | WCollMany([]) -> error "rm_wire_from_label" "cannot have no elements in many cllection"
      in
      if WCollEmpty = ncoll then
        noop (MAP.rm m key)
      else
        noop (MAP.put m key ncoll)
    else
      noop (MAP.put m key (WCollOne(wire)))


  let add_route (type a) (type b) (sln:(a,b)sln) (lbl:(a,b)label) =
    begin
      match lbl with
      | MInLabel(lbl) ->
        _add_wire_to_label sln.route.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _add_wire_to_label sln.route.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _add_wire_to_label sln.route.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _add_wire_to_label sln.route.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _add_wire_to_label sln.route.exprs lbl.expr lbl.wire
    end;
    ()

  let add_generate (type a) (type b) (sln:(a,b) sln) (lbl: (a,b) label) =
    begin
      match lbl with
      | MInLabel(lbl) ->
        _add_wire_to_label sln.generate.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _add_wire_to_label sln.generate.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _add_wire_to_label sln.generate.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _add_wire_to_label sln.generate.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _add_wire_to_label sln.generate.exprs lbl.expr lbl.wire
    end;
    ()

  let rm_generate (type a) (type b) (sln:(a,b) sln) (lbl: (a,b) label)  = 
    begin
      match lbl with
      | MInLabel(lbl) ->
        _rm_wire_from_label sln.generate.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _rm_wire_from_label sln.generate.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _rm_wire_from_label sln.generate.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _rm_wire_from_label sln.generate.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _rm_wire_from_label sln.generate.exprs lbl.expr lbl.wire
    end;
    ()

  let rm_route (type a) (type b) (sln:(a,b) sln) (lbl: (a,b) label)  = 
    begin
      match lbl with
      | MInLabel(lbl) ->
        _rm_wire_from_label sln.route.ins lbl.var lbl.wire
      | MOutLabel(lbl) ->
        _rm_wire_from_label sln.route.outs lbl.var lbl.wire
      | MLocalLabel(lbl) ->
        _rm_wire_from_label sln.route.locals lbl.var lbl.wire
      | ValueLabel(lbl) ->      
        _rm_wire_from_label sln.route.vals lbl.value lbl.wire
      | MExprLabel(lbl) ->
        _rm_wire_from_label sln.route.exprs lbl.expr lbl.wire
    end;
    ()

  
  let iter_conns (sln:usln) fn : unit =
    MAP.iter sln.conns.src2dest (fun src dests ->
        MAP.iter dests (fun dest  ->
            fn src dest
          )
    )
(*
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

  let mkconn_cons_shallow (v:slvr) (s:sln) : bool =
    let sln = SlnLib.mksln () in
    let res = HwConnRslvr.is_valid_shallow v s in
    res


  let mkconn_cons (v:slvr) (s:sln) : bool =
    let res = HwConnRslvr.is_valid v s in
    res

  let mklbl_cons (v:slvr) (s:sln) : bool =
    let res = HwErrRslvr.is_valid v s in
    res
  
  let usecomp_cons (s:slvr) (sln:sln) : bool =
    let prop id (lst,n) (r:bool) : bool =
      let nuses = SET.size lst in
      let maxuses : int = UnivLib.max4unodeid s id in
      if maxuses >= nuses then
        r
      else
        let _ = Printf.printf "# over limit: %s: %d %d\n"(UnivLib.unodeid2name id) nuses maxuses in
        let _ = flush_all() in
        false
    in
    let res = MAP.fold (sln.comps) prop true in
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

  let mklabel (sln:sln) (id:wireid) (prop:string) (v:label) =
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

  let get_labels (sln:sln) (fxn:(wireid->string->label->bool)) =
    let lbls = MAP.fold sln.labels (fun w pl lst1 ->
      MAP.fold pl (fun pr lbls lst2 ->
        SET.fold lbls (fun lb lst3 -> if fxn w pr lb then
          (w,pr,lb)::lst3 else lst3) lst2
      ) lst1
    ) [] in
    lbls

  let wires_of_label (sln:sln) (prop:string) (v:label -> bool) : wireid list option=
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

  let mklabel_undo (sln:sln) (id:wireid) (prop:string) (v:label) =
    if MAP.has sln.labels id then
      let props = MAP.get sln.labels id in
      if MAP.has props prop then
        let lbls = MAP.get props prop in
        let _ = SET.rm lbls v in
        ()
    else
      ()
 
  let n_used (sln:sln) = 
          let x : int = MAP.fold sln.comps (fun k (cset,n) r -> r + (SET.size cset)  ) 0 in
          x

  let usecomp (sln:sln) id =
    if MAP.has sln.comps id = false then error "usecomp" ("the following doesn't exist:"^UnivLib.unodeid2name id) else
    let l,n = MAP.get sln.comps id in
    let _ = sln.comps <- MAP.put sln.comps id (SET.add l n,n+1) in
    n

  
  let usecomp_valid (s:slvr) (sln:sln) id : bool =
    if MAP.has sln.comps id = false
      then error "usecomp_valid" ("does not exist in solution: "^(UnivLib.unodeid2name id))
      else
        let lst,_ = (MAP.get sln.comps id)  in
        let nuses = SET.size lst in
        let maxuses = UnivLib.max4unodeid s id in
        if maxuses > nuses then true else false


  let usecomp_mark (s:sln) id (i:int) =
    let _ = if MAP.has s.comps id = false 
      then let _ = mkcomp s id in () 
      else () 
    in
    let lst,n = MAP.get s.comps id in
    let lst = SET.add lst i in
    let new_n = MATH.max (i+1) n in 
    s.comps <- MAP.put s.comps id (lst,new_n)

  let usecomp_unmark (s:sln) id (i:int) =
    let lst,n = MAP.get s.comps id in
    let n = if i >= n then i+1 else n in
    let _ = SET.rm lst i in
    s.comps <- MAP.put s.comps id (lst,n)

  let conc_sln (v:slvr) (s:sln) : sln =
    let mappings : (string*int,string*int) map = HwConnRslvr.get_sln v s in
    let comp_map : (unodeid,(int set)*int) map = MAP.make() in 
    let label_map : (wireid, (string,label set) map) map = MAP.make() in 
    let conn_map : (wireid,wireid set) map= MAP.make () in 
    let u2str u = UnivLib.unodeid2name u in
    let conc_wire (w:wireid) :wireid = 
        let c,i,p = w in
        let _,ni = MAP.get mappings (u2str c, i) in
       (c,ni,p)
    in 
    (*used concretized versions of comps*)
    let _ = MAP.iter s.comps (fun (comp) (insts,maxval) ->
        let inst_set : int set= SET.make_dflt () in 
        let _ = SET.iter insts (fun (inst:int) -> 
                let _,ninst = MAP.get mappings (u2str comp,inst) in 
                let _ = SET.add inst_set ninst in
                ()
        ) in
        let _ = MAP.put comp_map comp (inst_set,maxval) in 
        ()
    ) in
    let _ = MAP.iter s.labels (fun wire props ->
        let nwire = conc_wire wire in
        let _ = MAP.put label_map nwire props in 
        ()
    ) in  
    let _ = MAP.iter s.conns (fun src snks ->
        let nsrc = conc_wire src in
        let nsnks = SET.from_list (SET.map snks (fun snk -> conc_wire snk)) in 
        let _ = MAP.put conn_map nsrc nsnks in
        ()
    ) in
    {comps=comp_map;labels=label_map;conns=conn_map}


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
        | LBindVar(HWKInput,MNVar(_,n)) -> "bind var "^handle^" :: "^"var "^n
        | LBindVar(HWKOutput,MNVar(_,n)) -> "bind var "^handle^" :: "^"var "^n
        | LBindVar(HWKInput,MNTime(_)) -> "bind time "^handle
        | LBindVar(HWKInput,MNParam(n,p)) -> "bind value "^handle^" :: "^(string_of_number p)
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

   *)

  let wirecoll2str (a:wire_coll) = match a with
    | WCollEmpty -> "{}"
    | WCollOne(wire) -> wireid2str wire
    | WCollMany(h::t) -> "["^
                         (List.fold_right (fun wire str->
                              str^","^(wireid2str wire)) t (wireid2str h))^"]"
    | WCollMany([]) -> "[]"

  let labels2str (type a) (type b) (labels:(a,b) labels) (f:a->string) (g:b->string)= 
    let str = "" in
    let str = MAP.fold labels.ins
        (fun v coll str -> str^"in "^(f v)^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.locals
        (fun v coll str -> str^"lc "^(f v)^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.outs
        (fun v coll str -> str^"out "^(f v) ^" -> "^(wirecoll2str coll)^"\n") str in
    let str = MAP.fold labels.vals
        (fun v coll str -> str^"val "^(string_of_number v)^" -> "^(wirecoll2str coll)^"\n") (str^"\n") in
    let str = MAP.fold labels.exprs
        (fun v coll str -> str^"ast "^(ASTLib.ast2str v g) ^" -> "^(wirecoll2str coll)^"\n") (str^"\n") in
    str

  let conns2str (s: ('a,'b) sln) =
    MAP.fold s.conns.src2dest (fun src dests str ->
        let srcstr = (wireid2str src)^" -> " in
        let deststr = SET.fold dests (fun dest dstr->
            dstr^" "^(wireid2str dest)) "" 
        in
        if SET.size dests > 0 then
          str^srcstr^deststr^"\n"
        else
          str
      ) ""

  let sln2str (s:('a,'b) sln) (f:'a -> string) (g:'b->string) : string=
    let str = "\n=== Route ===\n"^
              (labels2str s.route f g)^
              "\n=== Generate ===\n"^
              (labels2str s.generate f g)^
              "\n=== Connect ===\n"^
              (conns2str s)
    in
    str
   (*
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
    *)
end
