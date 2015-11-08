open SolverRslv
open Util
open HW
open Common
open HWData
open SolverData
open SolverUtil


exception SpiceLibException of string

let error s e =
  raise (SpiceLibException (s^": "^e))

type spicest =
  | SpcComment of string
  | SpcVarComp of string*(int list)*string

module SpiceLib =
struct

  let st2str  s =
  let nodes2str (ilst:int list) : string =
    List.fold_left (fun r x -> r^"\t"^(string_of_int x)) "" ilst
  in
  match s with
  | SpcComment(s) -> "*"^s
  | SpcVarComp(name,args,kind) -> "X"^name^"\t"^(nodes2str args)^"\t"^kind

  let sts2str s =
    List.fold_left (fun r x -> r^"\n"^(st2str x)) "" s

  let sln2sts s sln =
    (*mappings for hardware model*)
    let imaps : (string*int,string*int) map= HwConnRslvr.get_sln s sln in
    let wmaps : (wireid, int) map= MAP.make () in
    let spinst (n,i) =
      if MAP.has imaps (n,i) = false then
        error "spinst" ("instance "^n^" "^(string_of_int i)^" dne")
      else
        let nn,ni = MAP.get imaps (n,i) in
        (nn,ni)
    in
    let spwire ((n,i,p):wireid) : wireid =
      let nid = UnivLib.unodeid2name n in
      let nn,ni = spinst (nid,i) in
      let nnid = UnivLib.name2unodeid nn in
      (nnid,ni,p)
    in
    let to_ident n i =
      n^"_"^(string_of_int i)
    in
    let handle_inst (name:string) (inst:int) (spspec:string*(string list))=
      let handle_port (hn:unodeid) (hi:int) (x:string) : int =
        let w : wireid = (hn,hi,x) in
        if MAP.has wmaps w then
          MAP.get wmaps w
        else
          0
      in
      let hn,hi = spinst (name,inst) in
      let hnuid : unodeid = UnivLib.name2unodeid hn in
      let kind,args = spspec in
      let args : int list = List.map (fun x -> handle_port hnuid hi x) args in
      SpcVarComp(to_ident hn hi, args, kind)
    in
    let handle_cmp cid (idents,cnt)=
      let name = UnivLib.unodeid2name cid in
      let c = HwLib.getcomp s.hw name in
      let sp = c.spice in
      match sp with
      |Some(spec) ->
        let stmts = SET.fold idents (fun q r -> (handle_inst name q spec)::r) [] in
        stmts
      | None -> error "sln2sts" "expected spice specification"
    in
    let handle_conn wid1 wid2 =
      let repl wid n =
        if MAP.has wmaps wid then
          let v = MAP.get wmaps wid in
          let _ = MAP.iter wmaps (fun cwid c -> if c = v then let _ =  MAP.put wmaps cwid n in () ) in
          ()
        else
          ()
      in
      let wid1 = spwire wid1 in
      let wid2 = spwire wid2 in 
      let n = (List.length (MAP.to_values wmaps)) + 1 in
      (*if this is a multi-port connection, then merge the wires*)
      let _ = repl wid1 n in
      let _ = repl wid2 n in
      (*If the sink already maps somewhere,*)
      let _ = MAP.put wmaps (wid1) n in
      let _ = MAP.put wmaps (wid2) n in
      ()
    in
    let header = SpcComment("Spice Implementation") in
    let _ = MAP.iter sln.conns (fun w1 ws -> SET.iter ws (fun w2 -> handle_conn w1 w2)) in
    let cdecls = MAP.fold sln.comps (fun k v r -> r @ (handle_cmp k v)) [] in
    let sts = [header] @ cdecls in
    sts

  let to_spice s sln =
    let sp = sln2sts s sln in
    let str = sts2str sp in
    str

end
