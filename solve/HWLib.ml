open AST
open Unit
open Util
open Common
open HWData
open IntervalData
open StochData
open HWConnLib


exception HwLibError of string
let error s e = raise (HwLibError(s^":"^e))

module HwLib =
struct

  let mkenv () = {
    units=UnitLib.mkenv();
    conns=MAP.make();
    comps=MAP.make();
    props=MAP.make();
    time=None
  }

  let copy_cid prop = "copy."^prop
  let input_cid prop = "input."^prop
  let output_cid prop = "output."^prop

  let get_special nm =
  match STRING.split nm "." with
  | ["copy";q] -> Some("copy",q)
  | ["input";q] -> Some("input",q)
  | ["output";q] -> Some("output",q)
  | _ -> None

  let is_special nm = match get_special nm with
  | Some(_) -> true
  | None -> false


  let hwid2port hwid = match hwid with
  | HNPort(k,HCMGlobal(c,i),n,p) -> k,c,n,p,Some(i)
  | HNPort(k,HCMLocal(c),n,p) -> k,c,n,p,None
  | _ -> error "hwid2port" "only works for port hwids"

  let port2hwid k cname pname prop un =
    HNPort(k, HCMLocal(cname),pname,prop)

  let compid2str c = match c with
  | HCMGlobal(n,i) -> n
  | HCMLocal(n) -> n

  let tolcl x = match x with
  | HNPort(k,HCMGlobal(c,i),x,p) ->
    HNPort(k,HCMLocal(c),x,p)
  | _ -> x

  let hwid_map_comp x fn = match x with
    | HNPort(x1,c,x2,x3) -> HNPort(x1,fn c,x2,x3)
    | HNParam(c,x1) -> HNParam(fn c,x1)
    | HNTime -> HNTime

  let hwvid2str e =
    let c2str c = match c with
    | HCMLocal(n) -> n^"."
    | HCMGlobal(n,i) -> n^"["^(string_of_int i)^"]."
    in
    match e with
    | HNPort(_,c,v,prop) ->(c2str c)^prop^"{"^v^"}:"
    | HNTime -> "t"

 let kind2str v =
    match v with
    | HWKInput -> "input"
    | HWKOutput -> "output"


  let to_buf e fb =
    let os x = output_string fb x in
    let print_var prefix (x:hwvid hwportvar) = 
      os (prefix^" "^x.port^"\n")
    in 
    let print_comp c =
      let _ = os ("==> component "^c.name^" ("^(string_of_int c.insts)^" insts) \n") in
      let _ = MAP.iter c.ins (fun k v -> print_var "in" v) in
      let _ = MAP.iter c.outs (fun k v -> print_var "out" v) in
      ()
    in
    let print_prop k v =
      let print_units x r = r^" "^x in
      let units= SET.fold v print_units "" in
      os (k^" : "^units^"\n")
    in
   let print_props () =
    MAP.iter (e.props) (fun k v -> print_prop k v)
   in
   let print_time () =
    match (e.time) with
    | Some(x,v) -> print_prop x v
    | None -> os"(no time variable defined)\n"
   in
   let print_conn src srng dst drng =
     os ((HwConnLib.coll2str src srng)^"->"^(HwConnLib.coll2str dst drng)^"\n")
   in
   let _ = os "==== Units ====\n" in
   let _ = UnitLib.to_buf (e.units) fb in
   let _ = os"==== Props ====\n" in
   let _ = print_props () in
   let _ = os "==== Time =====\n" in
   let _ = print_time () in
   let _ = os "==== Components =====\n" in
   let _ = MAP.iter e.comps (fun k v -> print_comp v) in
   let _ = os "==== Schematic =====\n" in
   MAP.iter e.conns (fun src dests -> MAP.iter dests (fun dest rngs ->
       SET.iter rngs (fun (srng,drng) -> print_conn src srng dest drng)));
   ()

  let to_file e file =
    let oc = open_out file in
    let _ = to_buf e oc in
    let _ = close_out oc in
    ()

  let hastime e =
    match (e.time) with Some(_) -> true | None -> false


  let hascomp e n =
    MAP.has (e.comps) n

  let hasprop e n =
    MAP.has (e.props) n

  let mkcomp e name =
    if hascomp e name then
      error "mkcomp" ("comp with name "^name^"already defined.")
    else
      let c : hwvid hwcomp = {
        name=name;
        params=MAP.make();
        vars=[];
        insts=0;
        ins=MAP.make();
        outs=MAP.make();
        sim=None
      } in
      let _ = MAP.put e.comps name c in
      e

  let mksim (e:hwvid hwenv) (cname:string) (name:string) (args:string list) =
    if hascomp e cname = false then
      error "mkcomp" ("comp with name "^cname^"not defined.")
    else
      let c : hwvid hwcomp = MAP.get e.comps cname in
      let _ = (c.sim <- Some(name,args)) in
      e

  let gettime e =
    match e.time with
    | Some(t) -> t
    | _ -> error "gettime" "time must be defined in spec."

  let getcomp e cname =
    if hascomp e cname = false then
      error "getcomp" ("comp with name "^cname^" does not exist")
    else
        MAP.get e.comps cname

  let sim (e:hwvid hwenv) (cname:string) : (string*(string list)) option =
    let c = getcomp e cname in
    c.sim

  let hasvar e cname iname =
    let c = getcomp e cname in
    MAP.has c.ins iname || MAP.has c.outs iname

  let istime e name =
    match e.time with
    | Some(timename,_) -> name = timename
    | None -> false

  let getvar e cname iname =
    let c = getcomp e cname in
    if MAP.has c.ins iname then (MAP.get c.ins iname)
    else if MAP.has c.outs iname then (MAP.get c.outs iname)
    else
        error "getport" ("port with name "^iname^" does not exist.")

  let to_id e comp port :hwvid =
    let v = getvar e comp port in
    HNPort(v.knd,HCMLocal(v.comp),v.port,v.prop)

  let upd_bhv e fxn comp port =
    let v = getvar e comp port in
    fxn v.bhvr;
    ()

  let upd_defs e fxn comp port =
    let v = getvar e comp port in
    fxn v.defs;
    ()

  let upd_mapvars e vars comp =
    let c : hwvid hwcomp = getcomp e comp in
    c.vars <- c.vars @ vars;
    ()

  let hasparam e cname iname =
    let c = getcomp e cname in
    MAP.has c.params iname


  let getparam e cname iname =
    let c = getcomp e cname in
    if MAP.has c.params iname = false then
      error "getport" ("port with name "^iname^" does not exist.")
    else
      MAP.get c.params iname



  let getins e cname =
    let c = getcomp e cname in
    MAP.to_values c.ins

  let getouts e cname =
    let c = getcomp e cname in
    MAP.to_values c.outs

  let getvars e cname =
    ((getins e cname)) @
    ((getouts e cname)) 

  let getcomps e  =
    MAP.to_values e.comps

  let get_port_by_kind env knd comp =
    match knd with
    | HWKInput -> getins env comp 
    | HWKOutput -> getouts env comp

  let comp_port_to_hwid env compname varname hasinst =
    let comp = match hasinst with
      |Some(idx) -> HCMGlobal(compname,idx) | None -> HCMLocal(compname)
    in
    if hasvar env compname varname then
      begin
        let v = getvar env compname varname in
        HNPort(v.knd,comp,v.port,v.prop)
      end
    else if hasparam env compname varname then
      let p = getparam env compname varname in
      HNParam(comp,p.name)
    else if istime env varname then
      HNTime
    else
      error "comp_port_to_hwid" "unknown variable"



  let var2kind (id:hwvid) =
    match id with
    | HNPort(knd, _,_,_) -> knd
    | _ -> error "getunit" "param doesn't have type unit."


  let getkind e (cname:string) pname =
    let p = getvar e cname pname in
    p.knd 
  (*get the *)

  let getout e pr : string*hwvid*hwvid =
    let name = output_cid pr in
    let mkid k cname =
      let pvar = List.nth (get_port_by_kind e k cname) 0 in
      let id = port2hwid k cname pvar.port pvar.prop pvar.typ in
      id
    in
    let inport = mkid HWKInput name in
    let outport = mkid HWKOutput name in
    name,(inport),(outport)

  let getin e pr : string*hwvid*hwvid =
    let name = input_cid pr in
    let cmp = getcomp e name in
    let mkid k cname =
      let pvar = List.nth (get_port_by_kind e k cname) 0 in
      let id = port2hwid k cname pvar.port pvar.prop pvar.typ in
      id
    in
    let inport = mkid HWKInput name in
    let outport = mkid HWKOutput name in
    name,(inport),(outport)

  let mkadefs () : 'a hwadefs =
    {span=SPNNone; mapper=MAPDirect}

  let mkddefs () : 'a hwddefs =
    {repr=(1,4,7); freq=(Integer 0,"?")}


  let mkstoch () : 'a stoch =
    {shape=STCHUNIFORM; std=Integer(0)}

  let mkport e cname (hwkind:hwvkind) iname (types:(string*untid) list) =
    if hascomp e cname = false then
      error "mkport" ("comp with name "^cname^" already defined.")
    else
      if hasvar e cname iname then
        error "mkport" ("variable with name "^iname^" already exists")
      else
        let c = MAP.get e.comps cname in
        let prop,prop_unit= List.nth types 0 in
        let bhvr = if hwkind = HWKInput then HWBInput else HWBUndef in
        let defs = if prop = "D" then HWDDigital (mkddefs()) else HWDAnalog (mkadefs()) in
        let vr = {
          port=iname;
          typ=prop_unit;
          prop=prop;
          knd=hwkind;
          comp=cname;
          bhvr=bhvr;
          defs=defs
        } in
        match hwkind with
        | HWKInput -> MAP.put c.ins iname vr
        | HWKOutput -> MAP.put c.outs iname vr

  let mkparam e cname iname vl (t:unt) =
  if hascomp e cname = false then
    error "mkparam" ("comp with name "^cname^" already defined.")
  else
    if hasparam e cname iname then
      error "mkparam" ("variable with name "^iname^" already exists")
    else
      let c = MAP.get e.comps cname in
      let vr = {comp=cname;name=iname;value=vl;typ=t} in
      MAP.put c.params iname vr

  let mkrel e (cname:string) (pname:string) (rel:hwvid hwbhv) =
    let p = getvar e cname pname in
    match p.bhvr with
    | HWBUndef-> p.bhvr <- rel
    | HWBInput -> error "mkrel" ("cannot define dynamics for input port "^pname)
    | _ -> error "mkrel" ("relation already exists for port "^pname)

  let upd_inst e (cname:string) (i:int) =
    let c = getcomp e cname in
    c.insts <- i;
    ()

  let mktime e name units =
    if hastime e then
      error "mktime" "time already defined"
    else
      let s = SET.make () in
      let add_unit n =
        if UnitLib.has (e.units) n = false then
          error "mkunit" ("unit "^n^" doesn't exist")
        else
          let _ = SET.add s n in
          ()
      in
      let _ = List.iter add_unit units in
      let _ = e.time <- Some(name,s) in
      e


  let mkprop e name units =
    if hasprop e name then
      error "mkprop" ("prop "^name^" already exists")
    else
      let s = SET.make () in
      let add_unit n =
        if UnitLib.has (e.units) n = false then
          error "mkprop" ("unit "^n^" doesn't exist")
        else
          let _ = SET.add s n in
          ()
      in
      let _ = List.iter (fun x -> add_unit x) units in
      let _ = e.props <- MAP.put (e.props) name s in
      e



end
