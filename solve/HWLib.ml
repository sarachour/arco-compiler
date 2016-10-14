open AST
open Unit
open Util

open HWData
open IntervalData
open StochData


open HWConnLib
open StochLib
open IntervalLib

exception HwLibError of string
let error s e = raise (HwLibError(s^":"^e))
let print s = print_string s
let debug = print


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

  let hwcompname2str (id:hwcompname) = match id with
  | HWCmInput(x) -> input_cid x
  | HWCmOutput(x) -> output_cid x
  | HWCmCopy(x) -> copy_cid x
  | HWCmComp(x) -> x

  let str2hwcompname (c:string) : hwcompname = match get_special c with
    | Some("copy",prop) -> HWCmCopy(prop)
    | Some("input",prop) -> HWCmInput(prop)
    | Some("output",prop) -> HWCmOutput(prop)
    | Some(_) -> error "name2HWCmt" "illegal name"
    | None -> HWCmComp c


  let is_special nm = match get_special nm with
  | Some(_) -> true
  | None -> false


  let hwid2port hwid = match hwid with
  | HNPort(k,HCMGlobal(c),n,p) -> k,c.name,n,p,Some(c.inst)
  | HNPort(k,HCMLocal(c),n,p) -> k,c,n,p,None
  | _ -> error "hwid2port" "only works for port hwids"

  let port2hwid k cname pname prop un =
    HNPort(k, HCMLocal(cname),pname,prop)

  let compid2str c = match c with
  | HCMGlobal(n) -> n.name
  | HCMLocal(n) -> n

  let tolcl x = match x with
  | HNPort(k,HCMGlobal(c),x,p) ->
    HNPort(k,HCMLocal(c.name),x,p)
  | _ -> x

  let hwid_map_comp x fn = match x with
    | HNPort(x1,c,x2,x3) -> HNPort(x1,fn c,x2,x3)
    | HNParam(c,x1) -> HNParam(fn c,x1)
    | HNTime -> HNTime

  let hwvid2str e =
    let c2str c = match c with
    | HCMLocal(n) -> (hwcompname2str n)^"."
    | HCMGlobal(n) -> (hwcompname2str n.name)^"["^(string_of_int n.inst)^"]."
    in
    match e with
    | HNPort(_,c,v,prop) ->(c2str c)^prop^"{"^v^"}:"
    | HNTime -> "t"

 let kind2str v =
    match v with
    | HWKInput -> "input"
    | HWKOutput -> "output"

 let portprop2str pp =
   let port,prop = pp in 
   port^"."^prop

 let bhv2str (v:'a hwbhv) (tostr:'a->string): string = match v with
      |HWBUndef -> "<undefined>"
      |HWBInput -> "<input>"
      |HWBDigital(d) -> "<digital>:"^(ASTLib.ast2str d.rhs tostr)
      |HWBAnalog(a) -> "<analog>:"^(ASTLib.ast2str a.rhs tostr)^" / "^
                       "std="^(StochLib.stoch2str a.stoch tostr)
      |HWBAnalogState(st) -> "<analog-st> "^(ASTLib.ast2str st.rhs tostr)^
                             " ic="^(portprop2str st.ic)^" / "^
                             "std="^(StochLib.stoch2str st.stoch tostr)
      

  let hwvid_bhv2str (v:hwvid hwbhv) = bhv2str v hwvid2str 

  let avardef2str (st:string) (v:hwadefs) =
    "["^st^"]="^(IntervalLib.interval2str v.ival)^
    " {"^st^"}->["^st^"]="^(IntervalLib.mapper2str v.conv)^
    " ["^st^"]->{"^st^"}="^(IntervalLib.mapper2str v.iconv)

  let def2str (v:hwdefs) = match v with
    | HWDAnalog(d) -> "<analog> "^(avardef2str "v" d)
    | HWDAnalogState(d) -> "<analog-st> "^(avardef2str "ddt v" d.deriv)^"\n"^
                           "<analog-st> "^(avardef2str "v" d.stvar)
    | HWDDigital(d) -> "<digital>"

  let hwportvar2str (h:'a hwportvar) (f:'a -> string) =
    (kind2str h.knd)^" "^(h.port)^"."^(h.prop)^"\n"^(bhv2str h.bhvr f)^"\n"^(def2str h.defs)^"\n"

  let to_buf e fb =
    let os x = output_string fb x in
    let print_var prefix (x:hwvid hwportvar) =
      os (prefix^" "^x.port^"\n");
      os (prefix^"  bhv "^(hwvid_bhv2str x.bhvr)^"\n")
    in 
    let print_comp c =
      let _ = os ("==> component "^(hwcompname2str c.name)^" ("^(string_of_int c.insts)^" insts) \n") in
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
    MAP.has e.comps (hwcompname2str n) 

  let hasprop e n =
    MAP.has (e.props) n

  let mkcomp e (name:hwcompname) =
    if hascomp e name then
      error "mkcomp" ("comp with name "^(hwcompname2str name)^"already defined.")
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
      MAP.put e.comps (hwcompname2str name) c;
      e

    let gettime e =
    match e.time with
    | Some(t) -> t
    | _ -> error "gettime" "time must be defined in spec."

  let getcomp e (cname:hwcompname) =
    if hascomp e cname = false then
      error "getcomp" ("comp with name <"^(hwcompname2str cname)^"> does not exist")
    else
        MAP.get e.comps (hwcompname2str cname) 

  let mksim (e:hwvid hwenv) (cname:hwcompname) (name:string) (args:string list) =
      let c : hwvid hwcomp = getcomp e (cname) in
      c.sim <- Some(name,args);
      e


  let sim (e:hwvid hwenv) (cname:hwcompname) : (string*(string list)) option =
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
      |Some(idx) -> HCMGlobal({name=compname;inst=idx})
      | None -> HCMLocal(compname)
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


  let getkind e (cname:hwcompname) pname =
    let p = getvar e cname pname in
    p.knd 
  (*get the *)

  let getout e pr : string*hwvid*hwvid =
    let name = HWCmOutput(pr) in
    let mkid k cname =
      let pvar = List.nth (get_port_by_kind e k cname) 0 in
      let id = port2hwid k cname pvar.port pvar.prop pvar.typ in
      id
    in
    let inport = mkid HWKInput name in
    let outport = mkid HWKOutput name in
    hwcompname2str name,(inport),(outport)

  let getin e pr : string*hwvid*hwvid =
    let name = HWCmInput(pr) in
    let cmp = getcomp e name in
    let mkid k cname =
      let pvar = List.nth (get_port_by_kind e k cname) 0 in
      let id = port2hwid k cname pvar.port pvar.prop pvar.typ in
      id
    in
    let inport = mkid HWKInput name in
    let outport = mkid HWKOutput name in
    hwcompname2str name,(inport),(outport)

  let mkadefs () :  hwadefs =
    {
      ival=IntervalLib.mkdflt_ival();
      conv=MAPDirect;
      iconv=MAPDirect
    }

  let mkastatedefs () :  hwastatedefs =
    {stvar=mkadefs();deriv=mkadefs()}

  let mkddefs () : hwddefs =
    {repr=(1,4,7); freq=(Integer 0,"?")}


  let mkstoch () : 'a stoch = StochLib.mkstoch()

  let mkport e (cname:hwcompname) (hwkind:hwvkind) iname (types:(string*untid) list) =
      if hasvar e cname iname then
        error "mkport" ("variable with name "^iname^" already exists")
      else
        let c = getcomp e cname in
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

  let mkparam e (cname:hwcompname) iname vl (t:unt) =
    if hascomp e cname = false then
      error "mkparam" ("comp with name "^(hwcompname2str cname)^" already defined.")
    else
      if hasparam e cname iname then
        error "mkparam" ("variable with name "^iname^" already exists")
      else
        let c = getcomp e cname in
        let vr = {comp=cname;name=iname;value=vl;typ=t} in
        MAP.put c.params iname vr

  let mkrel e (cname:hwcompname) (pname:string) (rel:hwvid hwbhv) =
    let p = getvar e cname pname in
    match p.bhvr with
    | HWBUndef-> p.bhvr <- rel;
      begin
        match p.bhvr with
        | HWBAnalogState(_) -> p.defs <- HWDAnalogState(mkastatedefs()); ()
        | _ -> ()
      end
    | HWBInput -> error "mkrel" ("cannot define dynamics for input port "^pname)
    | _ -> error "mkrel" ("relation already exists for port "^pname)

  let upd_inst e (cname:hwcompname) (i:int) =
    let c = getcomp e cname in
    c.insts <- i;
    ()

  let mkhwinst (c:'a hwcomp) (u:int) =
    {name=c.name;inst=u}

  let mkid (c:'a hwcomp) (i:int) (v:'a hwportvar) =
    HNPort(v.knd,HCMGlobal(mkhwinst c i),v.port,v.prop)

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


  let map_bhvr (type a) (type b) (x:a hwbhv) (f:a->b) : b hwbhv =
    let map_expr (e:a ast): b ast= ASTLib.map e f in
    match x with
    | HWBAnalog(b) ->
      let nrhs = map_expr b.rhs and nvar = StochLib.map_stoch b.stoch f in 
      HWBAnalog({rhs=nrhs;stoch=nvar})
    | HWBDigital(b) ->
      let nrhs = map_expr b.rhs in
      HWBDigital({rhs=nrhs})
    | HWBAnalogState(b)->
      let nrhs = map_expr b.rhs and nvar = StochLib.map_stoch b.stoch f in 
      HWBAnalogState({rhs=nrhs;ic=b.ic;stoch=nvar})
    | HWBInput -> HWBInput
    | HWBUndef -> HWBUndef 
   

  let comp_fold_outs (type a) (type b) (x:a hwcomp) (f:a hwportvar -> b -> b) (x0:b) : b =
    MAP.fold x.outs (fun k v r -> f v r) x0 

  let comp_fold_ins (type a) (type b) (x:a hwcomp) (f:a hwportvar -> b -> b) (x0:b) : b =
    MAP.fold x.ins (fun k v r -> f v r) x0 

  let comp_fold_vars (type a) (type b) (x:a hwcomp) (f:a hwportvar -> b -> b) (x0:b) : b =
    let x1 = comp_fold_ins x f x0 in
    comp_fold_outs x f x1

  let comp_iter_outs (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_outs x (fun x () -> f x) ()

  let comp_iter_ins (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_ins x (fun x () -> f x) ()

  let comp_iter_vars (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_vars x (fun x () -> f x) ()


  let map_var (type a) (type b) (x:a hwportvar) (f:a->b) : b hwportvar =
    {
      port=x.port;prop=x.prop;typ=x.typ;knd=x.knd;comp=x.comp;
      bhvr=map_bhvr x.bhvr f;
      defs = x.defs 
    }

  let map_comp (type a) (type b) (x:a hwcomp) (f:a->b) : b hwcomp =
    let nins = MAP.map_vals x.ins (fun k v -> map_var v f)   in
    let nouts = MAP.map_vals x.outs (fun k v -> map_var v f)  in
    {name=x.name;vars=x.vars;outs=nouts;ins=nins;params=x.params;insts=x.insts;sim=x.sim}

  let fold_comps (type a) (type b) (env:a hwenv) (f:a hwcomp->b->b) (x0:b) : b =
    MAP.fold env.comps (fun k v x -> f v x) x0

  let iter_comps (type a) (env:a hwenv) (f:a hwcomp->unit) : unit =
    fold_comps env (fun x () -> f x) ()

  let inference_var (type a) (env:a hwenv) (cmp:a hwcomp) (v:a hwportvar) (cnv:a -> hwvid) : unit =
    let lookup (x:a) : interval = match cnv x with
      | HNPort(HWKInput,_,port,_) ->
        let vr : a hwportvar = getvar env (cmp.name) port in
        begin
          match vr.defs with
          | HWDAnalogState(def) -> def.stvar.ival
          | HWDAnalog(def) -> def.ival
          | HWDDigital(def) -> error "lookup" "cannot do interval analysis on digital values"
        end
      | HNParam(_,param) -> let param = getparam env cmp.name param in
        IntervalLib.floats_to_interval (List.map (fun x -> float_of_number x) param.value)
      | HNTime -> error "inference_var" "time is unbounded"
    in
    error "inference_var" "unimplemented"

  let inference_comp (type a) (env:a hwenv) (x:a hwcomp) (cnv:a->hwvid)=
    comp_iter_ins x (fun v -> inference_var env x v cnv);
    comp_iter_outs x (fun v -> inference_var env x v cnv);
    ()

  let inference (type a) (env:a hwenv) (cnv:a->hwvid) =
    debug "inference hw vars\n";
    iter_comps env (fun (x:a hwcomp) ->
        inference_comp env x cnv);
    ()

end
