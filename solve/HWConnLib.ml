open HWData
open Util



exception HwConnLibError of string

let error n m = raise (HwConnLibError (n^":"^m))


module HwConnLib = struct

  let hwcompname2str = HwCompName.hwcompname2str

  let hwinstcoll2str (c:hwinst_coll) = match c with
    | HCCAll -> "*"
    | HCCIndiv(i) -> string_of_int i
    | HCCRange((s,e)) -> (string_of_int s)^":"^(string_of_int e)

  let wireclass2str (c:wireclass):string =
      (hwcompname2str c.comp)^"."^c.port

  let hwinstconn2str (c:hwinst_conn) =
    (hwinstcoll2str c.src)^"->"^(hwinstcoll2str c.dst
                                )
  let mkconn (e:'a hwenv) (srccomp:hwcompname) (srcport:string)
      (destcomp:hwcompname) (destport:string) (srcconn:hwinst_coll) (destconn:hwinst_coll) =
    let add_to_map map key v =
      if MAP.has map key then
        let st=  MAP.get map key in
        noop (MAP.put map key (v::st))
      else
        noop (MAP.put map key ([v]))
    in
    let add_to_deep_map map (key1:wireclass) (key2:wireclass) (v:hwinst_conn) =
      if MAP.has map key1 then
        let st = MAP.get map key1 in
        add_to_map st key2 v
      else
        let st = MAP.make () in
        add_to_map st key2 v;
        noop (MAP.put map key1 st)
    in
    let srccls = {comp=srccomp;port=srcport} and dstcls = {comp=destcomp;port=destport} in
    let inst_coll :hwinst_conn = {src=srcconn;dst=destconn} in
    add_to_map e.conns.src2dest srccls dstcls;
    add_to_map e.conns.dest2src srccls dstcls;
    add_to_deep_map e.conns.inst_conns srccls dstcls inst_coll;
    ()
    



  let get_sources (e) (destcomp:hwcompname) (destport:string) =
   let dstcls = {comp=destcomp;port=destport} in
   if MAP.has e.conns.dest2src dstcls then
     MAP.get e.conns.dest2src dstcls
   else
     []

  let get_inst_conns e (srccomp:hwcompname) (srcport:string)
      (destcomp:hwcompname) (destport:string) =
    let srccls = {comp=srccomp;port=srcport} and dstcls = {comp=destcomp;port=destport} in
    let dests =
      if MAP.has e.conns.inst_conns srccls
      then MAP.get e.conns.inst_conns srccls
      else
        error "get_inst_conns" ("no source wire class in connection matrix: "^(wireclass2str srccls))
    in
    let insts =
      if MAP.has dests dstcls
      then MAP.get dests dstcls
      else
        error "get_inst_conns" ("no dest wire class in connection matrix: "^(wireclass2str dstcls))
    in
    insts

  (*determine if the source dest combo is connectable*)
  let is_connectable e (srccomp:hwcompname) (srcport:string)
      (destcomp:hwcompname) (destport:string) =
    let srccls = {comp=srccomp;port=srcport} and dstcls = {comp=destcomp;port=destport} in
    if MAP.has e.conns.src2dest srccls then
      let dests = MAP.get e.conns.src2dest srccls in
      if LIST.has dests dstcls then
        true
      else
        false
    else
      false

  let env2str e : string =
    let ic2str src snk insts =
      List.fold_right (fun inst str ->
                       str^"\n"^
                       (wireclass2str src)^"->"^(wireclass2str snk)
                       ^" : "^(hwinstconn2str inst)) insts ""
    in
    MAP.fold e.inst_conns(fun x ymap s1 ->
        MAP.fold ymap (fun y insts s2 ->
            s2^(ic2str x y insts)) s1)  ""

  let mkenv () :avail_conn_env =
    {src2dest = MAP.make();dest2src=MAP.make();inst_conns=MAP.make()}

  let mk  e cname pname prop =
    ()


(*
  let mkconn (e:'a hwenv) srccomp srcport destcomp destport srcconn destconn =
    let ksrc = (srccomp,srcport) and ksnk = (destcomp,destport) in
    let _ = if MAP.has e.conns ksrc = false then
      let _ = MAP.put e.conns ksrc (MAP.make()) in ()
    in
    let _ = if MAP.has e.conns ksnk = false  then
      let _ = MAP.put e.conns ksnk (MAP.make()) in ()
    in
    let mapsrc = MAP.get e.conns ksrc in
    let mapsnk = MAP.get e.conns ksnk in
    let _ = if MAP.has mapsrc ksnk = false
      then MAP.put mapsrc ksnk (SET.make_dflt ()) else mapsrc in
    let _ = if MAP.has mapsnk ksrc = false
      then MAP.put mapsnk ksrc (SET.make_dflt ()) else mapsnk in
    let setsrc = MAP.get mapsrc ksnk in
    let setsnk = MAP.get mapsnk ksrc in
    let _ = SET.add setsrc (srcconn,destconn) in
    let _ = SET.add setsnk (destconn,srcconn) in
    e

  let mk  e cname pname prop =
    let _ = if MAP.has e.conns (cname,pname) = false then
      MAP.put e.conns (cname,pname) (MAP.make ())
      else e.conns
    in
    ()

  let _valid_conn hcs src_comp src_port dest_comp dest_port =
    if MAP.has hcs.conns (src_comp,src_port)= false then
      false
    else
      let dests = MAP.get hcs.conns (src_comp,src_port) in
      if MAP.has dests (dest_comp,dest_port) = false then
        false
      else
        let ids = MAP.get dests (dest_comp,dest_port) in
        SET.size ids > 0
  
  let valid_conn hcs src_comp src_port dest_comp dest_port =
     (_valid_conn hcs src_comp src_port dest_comp dest_port) ||  
     (_valid_conn hcs dest_comp dest_port src_comp src_port ) 
  

    let to_buf e fb =
    let oc x = output_string fb x in
    let pr_conns (c,p) v =
      let pr_conn sc sp dc dp is id =
        "conn "^sc^"["^(hcconn2str is)^"]."^sp^" <-> "^
        "conn "^dc^"["^(hcconn2str id)^"]."^dp^"\n"
      in
      let pr_dests sc sp smap r =
        MAP.fold smap (fun (dc,dp) (idx:(hcconn*hcconn) set) r ->
          SET.fold idx (fun (is,id) r -> r^(pr_conn sc sp dc dp is id)) r) r
      in
      MAP.fold e.conns (fun (sc,sp) dests r -> pr_dests sc sp dests r) ""
    in
    let apply f k x r = r^"\n"^(f k x) in
    let cnstr = MAP.fold e.conns (apply pr_conns) "" in
    let _ = oc (cnstr^"\n") in
    ()
*)
end
