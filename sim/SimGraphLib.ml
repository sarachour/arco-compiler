open AST
open Util
open SolverData
open HWData
open Common
open HW
open SolverUtil

type simport = string
type simprop = string
type simrelkind = SimState | SimFunction

type simvar = simport*simprop

type simrel = {
    kind: simrelkind;
    rel: simvar ast;
    err: simvar ast;
    min: float;
    max: float;
    value: float;
}


type simnode = {
  inputs : simport list;
  outputs : simport list;
  rels : (simvar, simrel) map;
  id: string*int;
}

type simstate = (simvar,float) map



type simgraph = (simnode,simstate) graph



exception SimGraphException of string*string;;

let error s s2 =
  raise (SimGraphException (s,s2))

module SimGraphLib =
struct
  let simnode2str (n:simnode) =
    ""

  let simstate2str (e:simstate) =
    ""

  let make () : simgraph =
    let g = GRAPH.make (fun (x:simstate) y -> false) simnode2str simstate2str in
    g

    (*adds components*)
  let init (g:simgraph) (h:hwenv) (s:sln) =
    let is_kind (t:hwtype) (v:hwvkind) = match t with
      | HPortType(k,_) -> k = v
      | _ -> false
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
      let ident = (UnivLib.unodeid2name id, inst) in
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
      let _ = GRAPH.mknode g simnode in
      ()
    in
    let _ = MAP.iter s.comps (fun k (is,n) -> SET.iter is (fun i -> cmp2simnode k i)) in
    g

end
