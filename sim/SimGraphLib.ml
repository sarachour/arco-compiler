open AST
open Util
open SolverData
open HWData
open Common
open HW
open SolverUtil
open SimData



exception SimGraphException of string*string;;

let error s s2 =
  raise (SimGraphException (s,s2))

module SimGraphLib =
struct



  let simident2str (i:simident) =
    let cn,ci,p,pr = i in
    cn^"("^(string_of_int ci)^")"^":"^p^"."^pr

    let mkdeps (g:simgraph) : (simident,unit) graph=
      let deps : (simident,unit) graph =
        GRAPH.make (fun x y -> x = y) (fun id -> simident2str id) (fun x -> "()")
      in
      let mkif id = if GRAPH.hasnode deps id = false then
        let _ = GRAPH.mknode deps id in () else ()
      in
      let queue_node (id:simident) (beh:simbhv) =
        let _ = mkif id in
        let queue_in x =
          match x with
          | SVVar(q) ->
            let _ = mkif q in
            let _ = GRAPH.mkedge deps q id () in
            ()
          | SVThis -> ()
          | SVUnset -> ()
        in
        let ins = ASTLib.get_vars beh.rel in
        let _ = LIST.iter (fun x -> queue_in x) ins in
        ()
      in
      let _ = MAP.iter g.g queue_node in
      deps


  let simvar2str b : string  = match b with
  | SVVar(ident) -> simident2str ident
  | SVThis -> "$"
  | SVUnset -> "?"

  let simbhv2str (b: simbhv) : string =
    let relstr : string = ASTLib.ast2str b.rel simvar2str in
    relstr

  let simgraph2str (e:simgraph) : string =
    let res = MAP.str e.g simident2str simbhv2str in
    res

  let make () : simgraph =
    let g = MAP.make () in
    let ins = MAP.make () in
    let outs = MAP.make () in
    let props = SET.make (fun a b -> a = b) in
    {g=g; ins=ins; outs=outs; props=props}


  let mkinput g ident vl =
    let rknd = SimFunction in
    let rel = Term(SVUnset) in
    let min = None in
    let max = None in
    let err = None in
    let ic = vl in
    let beh = {kind=rknd;rel=rel;min=min;max=max;err=err;ic=ic} in
    let _ = MAP.put g.ins ident vl in
    let _ = MAP.put g.g ident beh in 
    ()

  let mkoutput g ident vl =
    let _ = MAP.put g.outs ident vl in
    ()

    (*adds components*)
  let init (g:simgraph) (h:hwenv) (s:sln) =
    let is_kind (t:hwtype) (v:hwvkind) = match t with
      | HPortType(k,_) -> k = v
      | _ -> false
    in
    let newstate () =
      MAP.make ()
    in
    let conv_map : ((string*int*string, string*int*string) map) = MAP.make () in
    let hwvar2simvar thisident x =
      let thisc,thisi,thisn,thisp = thisident in
      match x with
      | HNPort(k,HCMGlobal(c,i),n,p,u) ->
        (*if (c,i,n,p) = thisident then SVThis else
          SVVar(c,i,n,p)*)
        error "hwvar2simvar"
        ("global components not supported: "^(simident2str (c,i,n,p))^" in "^(simident2str thisident))
      | HNPort(k, HCMLocal(c),n,p,u) ->
        (*this if self-referential*)
        let ret :simvar= if c = thisc && n = thisn && p = thisp then SVThis else
          begin
          let nident  = (c,thisi,n) in
          if MAP.has conv_map nident then
            let vc,vi,vn = MAP.get conv_map nident in
            SVVar(vc,vi,vn,p)
          else
            (*if not connected to anything, connect to ground*)
            let _ = Printf.printf "warning: there is no mapping for %s\n" (simident2str (c,thisi,n,p)) in
            SVUnset
          end
        in
          ret
      | HNParam(_) -> error "hwvar2simvar ""cannot handle param"
      | HNTime (_) ->  error "hwvar2simvar ""cannot handle time"
    in
    let hwast2simast (x:hwvid ast) (ths:simident) : simvar ast =
      let x = ASTLib.trans x (fun x -> match x with
        | Term(HNParam(_,_,Decimal(v),_)) -> Some (Decimal(v))
        | Term(HNParam(_,_,Integer(v),_)) -> Some (Integer(v))
        | _ -> None
        )
      in
      let xp = ASTLib.map x (hwvar2simvar ths) in
      xp
    in
    let tocompident unid inst : string*int =
      let ident = (UnivLib.unodeid2name unid, inst) in
      ident
    in
    let wire2mapid (w:wireid) : string*int*string =
      let unid, inst, port = w in
      let cn,ci = tocompident unid inst in
      (cn,ci,port)
    in
    let cmprel2simrel (id:string*int) (rel:hwrel): simrelkind*simident*(simvar ast)*simval =
      let hwvar2val th v = match hwvar2simvar th v with
        | SVVar(x) -> SLVar x
        | SVThis -> SLVar th
        | SVUnset -> SLUnset
      in
      let lhwvar2ident v = let cn,ci = id in match v with
        | HNPort(k,_,port,prop,_) -> (cn,ci,port,prop)
        | _ -> error "cmprel2simrel.hwvar2portprop" "not a var"
      in
      match rel with
      | HRFunction(lhs,rhs) ->
        let knd = SimFunction  in
        let thisid : simident = lhwvar2ident lhs in
        let svexpr : simrel = hwast2simast rhs thisid in
        (SimFunction,thisid,svexpr,SLVal(0.))
      | HRState(lhs,rhs,icvar) ->
        let knd = SimState in
        let thisid : simident = lhwvar2ident lhs in
        let svexpr : simrel = hwast2simast rhs thisid in
        let icvar : simval = hwvar2val thisid icvar in
        (SimState,thisid,svexpr,icvar)
      | HRNone -> error "cmprel2simrel" ("did not have an ast.")
    in
    let cmp2simnode (id:unodeid) (inst:int) =
      let hwcmp = HwLib.getcomp h (UnivLib.unodeid2name id) in
      let outs : simport list = MAP.fold hwcmp.vars (fun k v r -> if is_kind v.typ HNOutput then k::r else r) [] in
      let _ = List.iter (fun x ->
          let vr : hwvar = MAP.get hwcmp.vars x in
          let rknd,ident,rel,ic = cmprel2simrel (tocompident id inst) vr.rel in
          let err : simrel option = None in
          let min = None in
          let max = None in
          let bhv : simbhv = {kind=rknd;rel=rel;min=min;max=max;err=err;ic=ic} in
          let _ = MAP.put g.g ident bhv in
          ()
        ) outs
      in
      ()
    in
    let conn2simconn (src:wireid) (snk:wireid) =
      let insert_mapping srcid destid =
        let knd v = match v.typ with
          | HPortType(k,_) -> k
          | _ -> error "conn2simconn.knd" "only ports may be connected"
        in
        let srccn,_,srcp = srcid in
        let dstn,_,dstp = destid in
        let srcv = MAP.get (HwLib.getcomp h srccn).vars srcp in
        let dstv = MAP.get (HwLib.getcomp h dstn).vars dstp in
        (*insert self-referential mapping for output.*)
        if knd srcv = HNInput && knd dstv = HNOutput then
          let _ = MAP.put conv_map srcid destid in
          let _ = MAP.put conv_map destid destid in ()
        else if knd srcv = HNOutput && knd dstv = HNInput then
          let _ = MAP.put conv_map destid srcid in
          let _ = MAP.put conv_map srcid srcid in ()
        else
          error "rslvorder" "cannot connect input to input or output to output"
      in
      let ident2str (a,b) = a^"."^(string_of_int b) in
      let srcid = wire2mapid src in
      let dstid = wire2mapid snk in
      let _ = insert_mapping srcid dstid in
      (*create mapping table*)
      ()
    in
    let lbl2simlbl (wire:wireid) (prop:string) (lbl:label) =
      let sc,si,sp = wire2mapid wire in
      let ident = (sc,si,sp,prop) in
      let sident = (sc,si,sp) in
      let _ = match lbl with
        | LBindValue(f) ->
          let _ = mkinput g ident (SLVal f) in
          let _ = MAP.put conv_map sident sident in
          ()
        | LBindVar(HNInput,MNVar(_,name,_)) ->
          let _ = mkinput g ident (SLExtern name) in
          let _ = MAP.put conv_map sident sident in
          ()
        | LBindVar(HNOutput,MNVar(_,name,_)) ->
          let _ = mkoutput g ident (SLExtern name) in
          let _ = MAP.put conv_map sident sident in
          ()
      in
      ()
    in
    let prop2simprop (prop: string) =
      let _ = g.props <- SET.add g.props prop in
      ()
    in
    (*make mappings from conns*)
    let _ = MAP.iter s.conns (fun src (snks) -> SET.iter snks (fun snk -> conn2simconn src snk)) in
    let _ = MAP.iter s.labels (fun wire prlbls -> MAP.iter prlbls
      (fun prop lbls -> SET.iter lbls (fun lbl -> lbl2simlbl wire prop lbl))
      )
    in
    let _ = MAP.iter s.comps (fun k (is,n) -> SET.iter is (fun i -> cmp2simnode k i)) in
    let _ = MAP.iter h.props (fun prop units -> prop2simprop prop) in
    let gstr : string = simgraph2str g in
    let _ = Printf.printf "### Resulting Graph\n%s" gstr in
    g

end
