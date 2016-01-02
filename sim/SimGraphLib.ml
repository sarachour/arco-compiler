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
  let simnode2str (n:simnode) =
    let cname,cid = n.id in
    cname^"."^(string_of_int cid)


  let simwire2str (e:simwire) =
    let tostr src snk =
      src^":"^snk^", "
    in
    MAP.fold e (fun src snks r -> SET.fold snks (fun snk r -> r^(tostr src snk)) r) ""


  let ident2node g v =
    let n = GRAPH.getnodes g.g (fun x -> x.id = v) in
    match n with
    | [h] -> h
    | [] -> error "ident2node" "no ident"
    | _ -> error "ident2node" "multiple nodes"

  let simgraph2str (e:simgraph) =
    let res = GRAPH.tostr e.g in
    res

  let make () : simgraph =
    let g = GRAPH.make (fun (x:simwire) y -> false) simnode2str simwire2str in
    let ins = SET.make (fun a b -> a = b) in
    let outs = SET.make (fun a b -> a = b) in
    let props = SET.make (fun a b -> a = b) in
    {g=g; ins=ins; outs=outs; props=props}

  let _mkiface g cmp port prop vl =
    let v = {comp=cmp; port=port;prop=prop; v=vl} in
    v

  let mkinput g cmp port prop vl =
    let v = _mkiface g cmp port prop vl in
    SET.add g.ins v

  let mkoutput g cmp port prop vl =
    let v = _mkiface g cmp port prop vl in
    SET.add g.outs v

    (*adds components*)
  let init (g:simgraph) (h:hwenv) (s:sln) =
    let is_kind (t:hwtype) (v:hwvkind) = match t with
      | HPortType(k,_) -> k = v
      | _ -> false
    in
    let newstate () =
      MAP.make ()
    in
    let hwvar2simvar x = match x with
    | HNPort(k,c,n,p,u) -> (n,p)
    | HNParam(_) -> error "hwvar2simvar ""cannot handle param"
    | HNTime (_) ->  error "hwvar2simvar ""cannot handle time"
    in
    let hwast2simast (x:hwvid ast) : simvar ast =
      let x = ASTLib.trans x (fun x -> match x with
        | Term(HNParam(_,_,Decimal(v),_)) -> Some (Decimal(v))
        | Term(HNParam(_,_,Integer(v),_)) -> Some (Integer(v))
        | _ -> None
        )
      in
      let xp = ASTLib.map x hwvar2simvar in
      xp
    in
    let toident unid inst =
      let ident = (UnivLib.unodeid2name unid, inst) in
      ident
    in
    let wire2node (w:wireid) =
      let unid, inst, port = w in
      let ident = toident unid inst in
      let matches = GRAPH.getnodes g.g (fun n -> n.id = ident) in
      let onematch = match matches with
      | [h] -> h
      | [] -> error "wire2node" "no matches"
      | _ -> error "wire2node" "too many matches"
      in
      (onematch,port)
    in
    let cmprel2simrel (rel:hwrel): simvar*simrel =
      let (sv:simvar), (kind), (rel : simvar ast), ic = match rel with
      | HRFunction(lhs,rhs) ->
        let knd = SimFunction in
        let sv = hwvar2simvar lhs in
        let svexpr = hwast2simast rhs in
        let ic = 0. in
        (sv,knd,svexpr, ic)
      | HRState(lhs,rhs,icvar) ->
        let knd = SimState in
        let sv = hwvar2simvar lhs in
        let svexpr = hwast2simast rhs in
        let ic = 0. in
        (sv,knd,svexpr, ic)
      | HRNone -> error "cmprel2simrel" ("did not have an ast.")
      in
      let err : simvar ast = Integer(0) in
      let min = 0. in
      let max = 0. in
      let relnode = {kind=kind; rel=rel; err=err; min=min; max=max; value=ic} in
      (sv,relnode)
    in
    let cmp2simnode (id:unodeid) (inst:int) =
      let hwcmp = HwLib.getcomp h (UnivLib.unodeid2name id) in
      let ident = toident id inst in
      let rels = MAP.make () in
      let _ = Printf.printf ("-> component %s\n") (UnivLib.unodeid2name id) in
      let inps : simport list = MAP.fold hwcmp.vars (fun k v r -> if is_kind v.typ HNInput then k::r else r) [] in
      let outs : simport list = MAP.fold hwcmp.vars (fun k v r -> if is_kind v.typ HNOutput then k::r else r) [] in
      let _ = List.iter (fun x ->
          let vr : hwvar = MAP.get hwcmp.vars x in
          let rn,rr = cmprel2simrel vr.rel in
          let _ = MAP.put rels rn rr in
          ()
        ) outs
      in
      let simnode = {inputs=inps; outputs=outs; rels=rels; id=ident} in
      let _ = GRAPH.mknode g.g simnode in
      ()
    in
    let conn2simconn (src:wireid) (snk:wireid) =
      let rslvorder s sp d dp =
        if LIST.has s.inputs sp && LIST.has d.outputs dp then
          d,dp,s,sp
        else if LIST.has s.outputs sp && LIST.has d.inputs dp then
          s,sp,d,dp
        else
          error "rslvorder" "cannot connect input to input or output to output"
      in
      let ident2str (a,b) = a^"."^(string_of_int b) in
      let src, srcport = wire2node src in
      let dst, dstport = wire2node snk in
      let src, srcport, dst, dstport = rslvorder src srcport dst dstport in
      let prs = match GRAPH.getedge g.g src dst with
        | Some(prs) ->
          prs
        | None ->
          let prs = MAP.make () in
          let _ = GRAPH.mkedge g.g src dst prs in
          prs
      in
      let _  = Printf.printf "%s %s -> %s %s\n" (ident2str src.id) srcport (ident2str dst.id) dstport in
      let dests = if MAP.has prs srcport then MAP.get prs srcport else SET.make (fun x y -> x = y) in
      let _ = SET.add dests dstport in
      let _ = MAP.put prs srcport dests in
      ()
    in
    let lbl2simlbl (wire:wireid) (prop:string) (lbl:label) =
      let src,srcport = wire2node wire in
      let _ = match lbl with
        | LBindValue(f) -> mkinput g src.id srcport prop (SimVal f)
        | LBindVar(HNInput,MNVar(_,name,_)) -> mkinput g src.id srcport prop (SimVar name)
        | LBindVar(HNOutput,MNVar(_,name,_)) -> mkoutput g src.id srcport prop (SimVar name)
      in
      ()
    in
    let prop2simprop (prop: string) =
      let _ = g.props <- SET.add g.props prop in
      ()
    in
    (*make nodes*)
    let _ = MAP.iter s.comps (fun k (is,n) -> SET.iter is (fun i -> cmp2simnode k i)) in
    let _ = MAP.iter s.conns (fun src (snks) -> SET.iter snks (fun snk -> conn2simconn src snk)) in
    let _ = MAP.iter s.labels (fun wire prlbls -> MAP.iter prlbls
      (fun prop lbls -> SET.iter lbls (fun lbl -> lbl2simlbl wire prop lbl))
      ) in
    let _ = MAP.iter h.props (fun prop units -> prop2simprop prop) in
    let gstr = simgraph2str g in
    let _ = Printf.printf "### Resulting Graph\n%s" gstr in
    g

end
