open HWData
open Util

module HwConnLib = struct

  let hwcompname2str = HwCompName.hwcompname2str

  let hcconn2str (c:hcconn) = match c with
    | HCCAll -> "*"
    | HCCIndiv(i) -> string_of_int i
    | HCCRange((s,e)) -> (string_of_int s)^":"^(string_of_int e)

  let connid2str (c:connid):string =
      let comp,port = c in
      (hwcompname2str comp)^"."^port

  let conncstr2str (c:connid) (r:hcconn) =
      (connid2str c)^"["^(hcconn2str r)^"]"

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
