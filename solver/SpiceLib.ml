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

type spcstype = SpcDC | SpcAC | SpcTrans

type spcval =
  | SpcFlatValue of float

type spicest =
  | SpcComment of string
  | SpcVarComp of string*(int list)*string
  | SpcVoltageSource of string*int*int*spcstype*spcval
  | SpcCurrentSource of string*int*int*spcstype*spcval

(* Investigate Digital Output Interface Eleement and Port element*)
(* Voltage Controlled Voltage Source*)
(* Current Controlled Voltage Source*)
module SpiceLib =
struct

  let st2str  s =
  let typ2str t =
    match t with
    | SpcDC -> "DC"
    | SpcAC -> "AC"
    | SpcTrans -> "TRANS"
  in
  let val2str t = match t with
    | SpcFlatValue(f) -> string_of_float f
  in
  let nodes2str (ilst:int list) : string =
    List.fold_left (fun r x -> r^"\t"^(string_of_int x)) "" ilst
  in
  match s with
  | SpcComment(s) -> "*"^s
  | SpcVarComp(name,args,kind) -> "X"^name^"\t"^(nodes2str args)^"\t"^kind
  | SpcVoltageSource(n,pos,neg,typ,v) ->
    "V"^n^"\t"^(nodes2str [pos;neg])^"\t"^(typ2str typ)^"\t"^(val2str v)
  | SpcCurrentSource(n,pos,neg,typ,v) ->
    "I"^n^"\t"^(nodes2str [pos;neg])^"\t"^(typ2str typ)^"\t"^(val2str v)

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
      (*handle odd copy names*)
      let hn = match hn with UNoCopy(p) -> "copy"^p | _ -> hn in
      let kind,args = spspec in
      let args : int list = List.map (fun x -> handle_port hnuid hi x) args in
      SpcVarComp(to_ident hn hi, args, kind)
    in
    let handle_io_inst cid inst :spicest list=
      let cmpname = UnivLib.unodeid2name cid in
      let cmpname,inst = spinst (cmpname,inst) in
      let varname = to_ident "inp" inst in
      match cid with
      | UNoInput(p) ->
        let port = HwLib.get_port_by_kind s.hw HNOutput cmpname in
        let wire : wireid = (cid,inst,port.name) in
        let connto = if MAP.has wmaps wire then MAP.get wmaps wire else 0 in
        if p = "V" then
          let vs = SpcVoltageSource(varname,connto,0,SpcDC,SpcFlatValue(4.)) in
          [vs]
        else if p = "I" then
          let cs = SpcCurrentSource(varname,connto,0,SpcDC,SpcFlatValue(1.)) in
          [cs]
        else
          error "handle_io" "unknown property"
      | UNoOutput(p) ->
        let cmt = SpcComment("this is where output processing would go.") in
        [cmt]
    in
    let handle_io cid insts =
      let stmts = SET.fold insts (fun q r -> (handle_io_inst cid q)@r) [] in
      stmts
    in
    let handle_cmp cid (idents,cnt)=
      match cid with
      | UNoInput(c) -> handle_io cid idents
      | UNoOutput(c) -> handle_io cid idents
      | _ ->
        let name = UnivLib.unodeid2name cid in
        let c = HwLib.getcomp s.hw name in
        let sp = c.spice in
        let res = match sp with
          |Some(spec) ->
            let stmts = SET.fold idents (fun q r -> (handle_inst name q spec)::r) [] in
            stmts
          | None -> error "sln2sts" "expected spice specification"
        in
        res
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
