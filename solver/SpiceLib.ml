open SolverRslv
open Util
open HW
open Common
open HWData
open Math
open SolverData
open SolverUtil
open SolverSln


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

type spicedoc = spicest list
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

  let to_spice s sln =
    (*mappings for hardware model*)
    let imaps : (string*int,string*int) map= HwConnRslvr.get_sln s sln in
    let _ = Printf.printf "===== SMT SOLUTION ====" in
    let _ = MAP.iter imaps (fun (s,i) (d,di) -> Printf.printf "%s.%d => %s.%d\n" s i d di)  in
    let wmaps : (wireid, int) map = MAP.make () in
    let spinst (n,i) =
      if MAP.has imaps (n,i) = false then
        error "spinst" ("instance "^n^" "^(string_of_int i)^" does not have a spice spec.")
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
    (*handle instance*)
    let handle_inst (name:string) (inst:int) (spspec:string*(string list))=
      (* get the id of the particular port *)
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
      let hn = match hnuid with
        |UNoCopy(p) -> "copy"^p
        |UNoInput(p) -> "input"^p
        |UNoOutput(p) -> "output"^p
        | _ -> hn
      in
      let kind,args = spspec in
      let args : int list = List.map (fun x -> handle_port hnuid hi x) args in
      SpcVarComp(to_ident hn hi, args, kind)
    in
    let handle_cmp cid (idents,cnt)=
      let name = UnivLib.unodeid2name cid in
      let c = HwLib.getcomp s.hw name in
      let sp = c.spice in
      let res = match sp with
        |Some(spec) ->
          let stmts = SET.fold idents (fun q r -> (handle_inst name q spec)::r) [] in
          stmts
        | None -> error "sln2sts" ("expected spice specification for "^name)
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
    let const_count = REF.mk 0 in
    let get_const_id () =
      let q = REF.dr const_count in
      let _ = (const_count := q + 1) in
      q
    in
    let handle_lbl (w:wireid) (pr:string) lbl =
      let w =  spwire w in
      let nm,inst,port = w in
      let id = if MAP.has wmaps w then MAP.get wmaps w else 0 in
      let indx = string_of_int (get_const_id ())  in
      let cmtsp = SpcComment("") in
      let mksrc varname vl =
          (*make a new connection between the input component and the source*)
          let vout = (List.length (MAP.to_values wmaps)) + 1 in
          (*get the port that feeds into this component and connect to voltage source*)
          let nport = HwLib.get_port_by_kind s.hw HNInput (UnivLib.unodeid2name nm) in
          let inpcompwire = (nm, inst, nport.name) in
          let _ = MAP.put wmaps inpcompwire vout in
          let res =
            if pr = "V" || pr = "v" then
              SpcVoltageSource(varname,vout,0,SpcDC,vl)
            else if pr = "I" || pr = "i" then
              SpcCurrentSource(varname,vout,0,SpcDC,vl)
            else
              error "handle_lbl" "unknown property"
          in
          res
      in
      let mksnk varname  =
        let vout = List.length (MAP.to_values wmaps) + 1 in
        let nport = HwLib.get_port_by_kind s.hw HNOutput (UnivLib.unodeid2name nm) in
        let outcompwire  = (nm,inst,nport.name) in
        let _ = MAP.put wmaps outcompwire vout in
        if pr = "V" || pr = "v" then
          SpcComment("@args "^(string_of_int vout)^","^"V")
        else if pr = "I" || pr = "i" then
          SpcComment("@args "^(string_of_int vout)^","^"I")
        else
          error "handle_lbl" "unknown property"
      in
      match lbl with
      | LBindValue(vl) ->
        let cmt = SpcComment("constant value "^(string_of_float vl)) in
        let vs = mksrc ("cst"^indx) (SpcFlatValue(vl)) in
        [cmt;vs;cmtsp]
      | LBindVar(HNInput,q) ->
          let cmt = SpcComment("@input "^(MathLib.mid2str q)) in
          let vs = mksrc ("in_"^(MathLib.mid2str q)^"_"^indx) (SpcFlatValue(1.)) in
          [cmt;vs;cmtsp]
      | LBindVar(HNOutput,q) ->
          let cmt = SpcComment("@output "^(MathLib.mid2str q)) in
          let vs = mksnk ("out_"^(MathLib.mid2str q)^"_"^indx)  in
          [cmt;vs;cmtsp]
      | _ -> []
    in
    let _ = MAP.iter sln.conns (fun w1 ws -> SET.iter ws (fun w2 -> handle_conn w1 w2)) in
    let lbldecls =
      MAP.fold sln.labels (fun w prs r ->
        MAP.fold prs (fun p lbls r ->
          SET.fold lbls (fun lb r -> (handle_lbl w p lb) @ r) r
        ) r
      ) []
    in
    let cdecls = MAP.fold sln.comps (fun k v r -> r @ (handle_cmp k v)) [] in
    let cmtsp = SpcComment("") in
    let sts = lbldecls @ [cmtsp;cmtsp;SpcComment(" === Connectivity Schem ==== ")] @ cdecls in
    sts

  let to_str sp =
    let str = sts2str sp in
    str

end
