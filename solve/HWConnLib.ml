open HWData
open Util



exception HwConnLibError of string

let error n m = raise (HwConnLibError (n^":"^m))
let debug = print_string 

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
    let add_to_map map keyv v : unit=
      let key =  keyv in
      if MAP.has map key then
        let st=  MAP.get map key in
        noop (MAP.put map key (v::st))
      else
        noop (MAP.put map key ([v]))
    in
    let add_to_deep_map map (key1v:wireclass) (key2:wireclass) (v:hwinst_conn) =
      let key1 =  key1v in
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
    add_to_map e.conns.dest2src dstcls srccls;
    add_to_deep_map e.conns.inst_conns srccls dstcls inst_coll;
    ()
    


  let get_sinks (e: 'a hwenv) (srccomp:hwcompname) (srcport:string) : wireclass list=
   let srccls =  {comp=srccomp;port=srcport} in
    if MAP.has e.conns.src2dest srccls then
      begin
        MAP.get e.conns.src2dest srccls
      end
   else
     []


  let get_sources (e:'a hwenv) (destcomp:hwcompname) (destport:string) : wireclass list =
    let dstcls =  {comp=destcomp;port=destport} in
    if MAP.has e.conns.dest2src dstcls then
      begin
        MAP.get e.conns.dest2src dstcls
      end
    else
      []

  let get_inst_conns e (srccomp:hwcompname) (srcport:string)
      (destcomp:hwcompname) (destport:string) : hwinst_conn list =
    let srccls =  {comp=srccomp;port=srcport}
    and dstcls =  {comp=destcomp;port=destport} in
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
    let srccls =  {comp=srccomp;port=srcport}
    and dstcls = {comp=destcomp;port=destport} in
    if MAP.has e.conns.src2dest srccls then
      let dests = MAP.get e.conns.src2dest srccls in
      if LIST.has dests dstcls then
        true
      else
        false
    else
      false

  let has_dest_connections e srccomp srcport =
    let srccls =  {comp=srccomp;port=srcport} in
        if MAP.has e.conns.src2dest srccls then
          let dests = MAP.get e.conns.src2dest srccls in
          List.length dests > 0
        else
          false

  let get_dest_connections e srccomp srcport =
    let srccls =  {comp=srccomp;port=srcport} in
        if MAP.has e.conns.src2dest srccls then
          let dests = MAP.get e.conns.src2dest srccls in
          dests 
        else
         [] 

  let get_src_connections e srccomp : wireclass list=
    MAP.fold e.conns.src2dest (fun (k:wireclass) (v:wireclass list) r ->
        if k.comp = srccomp then
          k::r else
          r
      ) []

  (*determine*)
  let connection_distance e srcc srcp destc max =
    let srccls =  {comp=srcc;port=srcp} in
    let wirestk : wireclass stack = STACK.make () in
    let push x = noop (STACK.push wirestk x) in
    let pop () = noop (STACK.pop wirestk) in
    
    let rec _conn_dist (scls:wireclass) hop =
      let compute_hops_from_dest dest=
          begin
            let src_conns : wireclass list = get_src_connections e dest in
            let min = List.fold_left (fun (local_min:int option) (src:wireclass) ->
                if STACK.has wirestk src then local_min else
                  begin
                    push src;
                    let indent = STRING.repeat "  " (hop+1) in
                    let nhops = _conn_dist scls (hop+1) in
                    pop ();
                    match local_min with
                    | Some(m) ->
                      if nhops < m then Some(nhops) else Some(m)
                    | None -> Some(nhops)
                  end
              ) None src_conns
            in
            min
          end
      in
      let dests = get_dest_connections e scls.comp scls.port in
      let destcomps = LIST.uniq (List.map (fun (x:wireclass) -> x.comp) dests) in
      if LIST.has destcomps destc || hop >= max then
        hop
      else
        List.fold_left (fun min (dest:hwcompname) ->
            match compute_hops_from_dest dest with
            | Some(d) -> if d < min then d else min
            | None -> min
          ) (99999999) destcomps
    in
    push srccls;
    let min = _conn_dist srccls 0 in
    pop ();
    min

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

end
