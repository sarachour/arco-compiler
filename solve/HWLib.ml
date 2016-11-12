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
    conns=HwConnLib.mkenv();
    comps=MAP.make();
    props=MAP.make();
    time=None
  }

  
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

  let hwcompname2str = HwCompName.hwcompname2str
  let hwcompinst2str = HwCompName.hwcompinst2str

  let str2hwcompname = HwCompName.str2hwcompname

  let wireid2str (x:wireid) =
    (hwcompinst2str x.comp)^"."^x.port

  let inst2inst_wire (x:wireid) (fn:hwcompinst->hwcompinst) : wireid=
    {comp=(fn x.comp);port=x.port}

  let hwvid2str e =
    let c2str c = match c with
    | HCMLocal(n) -> (hwcompname2str n)^"."
    | HCMGlobal(n) -> (hwcompname2str n.name)^"["^(string_of_int n.inst)^"]."
    in
    match e with
    | HNPort(_,c,v,prop) ->(c2str c)^prop^"{"^v^"}:"
    | HNParam(c,v) -> (c2str c)^v
    | HNTime -> "t"

 let kind2str v =
    match v with
    | HWKInput -> "input"
    | HWKOutput -> "output"

 let portprop2str pp =
   let port,prop = pp in 
   port^"."^prop

 let hast2str x = ASTLib.ast2str x hwvid2str

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
    " {"^st^"}->["^st^"]="^(IntervalLib.stdmapper2str v.conv)

  let astvardef2str (st:string) (v:hwastvardefs) =
    "["^st^"]="^(IntervalLib.interval2str v.ival)^
    " {"^st^"}->["^st^"]="^(IntervalLib.stdmapper2str v.conv)^
    " {"^st^"}->*["^st^"]="^(IntervalLib.mapper2str v.proxy hwvid2str)

  let def2str (v:hwdefs) = match v with
    | HWDAnalog(d) -> "<analog> "^(avardef2str "v" d)
    | HWDAnalogState(d) -> "<analog-st> "^(avardef2str "ddt v" d.deriv)^"\n"^
                           "<analog-st> "^(astvardef2str "v" d.stvar)
    | HWDDigital(d) -> "<digital>"

  let hwportvar2str (h:'a hwportvar) (f:'a -> string) =
    (kind2str h.knd)^" "^(h.port)^"."^(h.prop)^"\n"^(bhv2str h.bhvr f)^"\n"^(def2str h.defs)^"\n"

  let hwparam2str (h:hwparam)  =
    h.name^(List.fold_right (fun x s -> s^","^(string_of_number x)) h.value " ")

  let hwcomp2str c f =
      let str = "" in
      let str = MAP.fold c.params (fun k v s -> s^(hwparam2str v)^"\n") str in
      let str = MAP.fold c.ins (fun k v s-> s^(hwportvar2str v f)^"\n") str in
      let str = MAP.fold c.outs (fun k v s-> s^(hwportvar2str v f)^"\n") str in
      str

  let to_buf e fb =
    let os x = output_string fb x in
    let print_var prefix (x:hwvid hwportvar) =
      os (prefix^" "^x.port^"  bhv "^(hwvid_bhv2str x.bhvr)^"\n");
      os (prefix^"  def"^(def2str x.defs )^"\n")
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
   let _ = os "==== Units ====\n" in
   let _ = UnitLib.to_buf (e.units) fb in
   let _ = os"==== Props ====\n" in
   let _ = print_props () in
   let _ = os "==== Time =====\n" in
   let _ = print_time () in
   let _ = os "==== Components =====\n" in
   let _ = MAP.iter e.comps (fun k v -> print_comp v) in
   let _ = os "==== Schematic =====\n" in
   os (HwConnLib.env2str e.conns);
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

  let comp_getvar c iname =
    if MAP.has c.ins iname then (MAP.get c.ins iname)
    else if MAP.has c.outs iname then (MAP.get c.outs iname)
    else
        error "comp_getvar" ("port with name "^iname^" does not exist.")


  let getvar e cname iname =
    let c = getcomp e cname in
    comp_getvar  c iname

  let to_id e comp port :hwvid =
    let v = getvar e comp port in
    HNPort(v.knd,HCMLocal(v.comp),v.port,v.prop)

  let upd_bhv e fxn comp port =
    let v = getvar e comp port in
    fxn v.bhvr;
    ()

  let upd_defs e fxn comp port =
    let v = getvar e comp port in
    v.defs <- fxn v.defs;
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


  let mkinst e cname =
    let c : 'a hwcomp = getcomp e cname in
    c.insts

  let comp_isstvar comp iname =
    let v = comp_getvar comp iname in
    match v.bhvr with
    | HWBAnalogState(_) -> true
    | _ -> false

  let getins e cname =
    let c = getcomp e cname in
    MAP.to_values c.ins

  let getouts e cname =
    let c = getcomp e cname in
    MAP.to_values c.outs

  let getvars e cname =
    ((getins e cname)) @
    ((getouts e cname)) 

  let getin e cname port =
    let c = getcomp e cname in
    MAP.get c.ins port

  let getout e cname port =
    let c = getcomp e cname in
    MAP.get c.outs port


  let getvar e cname port =
    let c = getcomp e cname in
    if MAP.has c.outs port then
      MAP.get c.outs port
    else
      MAP.get c.ins port

  let getprop e (cname:hwcompname) port =
    let v = getvar e cname port in
    v.prop

  let port2wire compname inst port : wireid=
    {comp={name=compname;inst=inst};port=port}

  let wire2prop e (wire:wireid) =
    getprop e wire.comp.name wire.port

  let wire2hwvar e (wire:wireid) =
    getvar e wire.comp.name wire.port

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



  let mkcompid (x:hwcompname) (i:int option) = match i with
    | Some(inst) -> HCMGlobal({name=x;inst=inst})
    | None -> HCMLocal(x)

  let var2id (v:'a hwportvar) (inst:int option) : hwvid = match inst with
    | Some(inst) -> HNPort(v.knd,HCMGlobal({name=v.comp;inst=inst}),v.port,v.prop)
    | None -> HNPort(v.knd,HCMLocal(v.comp),v.port,v.prop)

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
      conv=MAPDirect
    }
 
  let mkastvardefs () :  hwastvardefs =
    {
      ival=IntervalLib.mkdflt_ival();
      conv=MAPDirect;
      proxy=MAPDirect
    }


  let mkastatedefs () :  hwastatedefs =
    {stvar=mkastvardefs();deriv=mkadefs()}

  let mkddefs () : hwddefs =
    {ival=IntervalLib.mkdflt_ival();repr=(1,4,7); sample=(Integer 0,"?")}


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
      List.iter add_unit units;
      e.time <- Some(name,s);
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

  let comp_fold_params (type a) (type b) (x:a hwcomp) (f:hwparam -> b -> b) (x0:b) : b =
    MAP.fold x.params (fun k v r -> f v r) x0 

  let comp_fold_vars (type a) (type b) (x:a hwcomp) (f:a hwportvar -> b -> b) (x0:b) : b =
    let x1 = comp_fold_ins x f x0 in
    comp_fold_outs x f x1

  let comp_iter_outs (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_outs x (fun x () -> f x) ()

  let comp_iter_ins (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_ins x (fun x () -> f x) ()

  let comp_iter_vars (type a) (x:a hwcomp) (f:a hwportvar -> unit) : unit =
    comp_fold_vars x (fun x () -> f x) ()

  let comp_iter_params (type a) (x:a hwcomp) (f:hwparam -> unit) : unit =
    comp_fold_params x (fun x () -> f x) ()


  let comp_getparam (type a) (x:a hwcomp) (f:string) =
    if MAP.has x.params f then
      MAP.get x.params f
    else
      error "comp_getparam" "could not find param in comp"

  let comp_getinterval (type a) (x:a hwcomp) (f:string) =
    let hwvar = comp_getvar x f in
    match hwvar.defs with
    | HWDAnalog(x) -> x.ival
    | HWDAnalogState(x) -> x.stvar.ival
    | HWDDigital(_) -> error "comp_getinterval" "unhandled"

  let comp_get_param_values (type a) (x:a hwcomp) (f:string) : number list=
    let par = comp_getparam x f in
    par.value

  let ioblock_get_in (type a) (x:a hwcomp) : a hwportvar=
    let _,port = MAP.singleton x.ins in
    port

  let ioblock_get_out (type a) (x:a hwcomp) :a hwportvar =
    let _,port = MAP.singleton x.outs in
    port


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

  let requires_infer v = match v.defs with
    | HWDAnalog(def) ->
      IntervalLib.is_undefined def.ival
    | HWDAnalogState(def) ->
      if IntervalLib.is_undefined def.stvar.ival then
        error "inference_var" "cannot leave the bounds of a state variable undefined."
      else false
    | HWDDigital(_) ->
      false
   
  let get_hwid_interval (type a) (env:a hwenv) (cnv:a -> hwvid)
      (lookup_var:a hwportvar -> interval) (x:a): interval=
    match cnv x with
    | HNPort(HWKInput,HCMLocal(cmpname),port,_) ->
      let vr : a hwportvar = getvar env (cmpname) port in
      let result = lookup_var vr in
      result

    | HNPort(HWKOutput,HCMLocal(cmpname),port,_) ->
      let vr : a hwportvar = getvar env (cmpname) port in
      let result = lookup_var vr in
      result

    | HNParam(HCMLocal(cmpname),param) -> let param = getparam env cmpname param in
      IntervalLib.floats_to_interval (List.map (fun x -> float_of_number x) param.value)

    | HNTime -> error "inference_interval" "time is unbounded"
    | _ -> error "inference_interval" "not expected global"


  let inference_var (type a) (env:a hwenv) (cmp:a hwcomp) (v:a hwportvar) (cnv:a -> hwvid) : interval =
    (*track the stack of variables being inferred*)
    let infers = STACK.make() in
    let rec _inference_var (v:a hwportvar) =
      let lookup_var (vn:a hwportvar) : interval =
        _inference_var vn
      in
      let lookup_hwvid x =
        get_hwid_interval env cnv lookup_var x
      in
      let derive_interval x rhs =
        STACK.push infers x.port;
        let ival = IntervalLib.derive_interval rhs lookup_hwvid in
        STACK.pop infers;
        ival
      in
      if(requires_infer v) && STACK.has infers v.port = false then
        match v.bhvr,v.defs with
        | HWBAnalog(bhvr),HWDAnalog(x) ->
          let ival = derive_interval v bhvr.rhs in
          debug ("-> derived "^(IntervalLib.interval2str ival)^" -> "^v.port^"\n");
          x.ival <- ival; ival
        | HWBAnalogState(bhvr),HWDAnalogState(x) ->
          let ival = derive_interval v bhvr.rhs in
          x.deriv.ival <- ival;
          x.stvar.ival

        | HWBInput,HWDAnalog(x) ->
          error "inference_var" ("cannot infer interval for input ["^
                                (hwcompname2str cmp.name)^":"^v.port^"."^v.prop^"]")
        | HWBUndef,_ ->
          error "inference_var" ("cannot infer interval with undefined behaviour: ["^
          (hwcompname2str cmp.name)^":"^v.port^"."^v.prop^"]")
        | HWBDigital(_),HWDDigital(_) ->
          error "inference_var" ("cannot infer digital value")
        | HWBAnalogState(_),_ ->
          error "inference_var" "unexpected pairing with analog state"
        | HWBDigital(_),_ ->
          error "inference_var" "unexpected pairing with digital value"
        | HWBAnalog(_),_ ->
          error "inference_var" "unexpected pairing with analog value"
        | _ ->
          error "inference_var" "requires-infer unimplemented"
      else
        match v.bhvr,v.defs with
        | HWBAnalog(bhvr),HWDAnalog(x) -> x.ival
        | HWBAnalogState(bhvr),HWDAnalogState(x) -> x.stvar.ival
        | HWBInput,HWDAnalog(x) -> x.ival
        | HWBUndef,_ ->
          error "inference_var" ("cannot get interval with undefined behaviour: ["^
          (hwcompname2str cmp.name)^":"^v.port^"."^v.prop^"]")
        | HWBAnalog(bhvr),HWDDigital(_) ->
          let ival = IntervalLib.derive_interval bhvr.rhs lookup_hwvid in
          ival
        | HWBInput,HWDDigital(dig) ->
          Interval({min=BNDInf(QDNegative);max=BNDInf(QDPositive)})
        | HWBDigital(_),HWDDigital(_) ->
          error "inference_var" ("cannot infer digital value")
        | HWBAnalogState(_),_ ->
          error "inference_var" "unexpected pairing with analog state"
        | HWBDigital(_),_ ->
          error "inference_var" "unexpected pairing with digital value"
        | _ ->
          error "inference_var" "get_ival unimplemented"
    in
    let result = _inference_var v in
    result



  let inference_comp (type a) (env:a hwenv) (x:a hwcomp) (cnv:a->hwvid)=
    debug ("=== "^(hwcompname2str x.name)^" ===\n");
    comp_iter_ins x (fun v -> noop (inference_var env x v cnv));
    comp_iter_outs x (fun v -> noop (inference_var env x v cnv));
    debug "=======\n";
    ()


  let portvar_iter_vars (type a) (type b) (x:a hwcomp) (portname:string) (f:a->unit) : unit =
    let port = comp_getvar x portname in
    match port.bhvr with
    | HWBAnalog(data) ->
      let vars : a list = ASTLib.get_vars data.rhs in
      let stvars = StochLib.get_vars data.stoch in
      List.iter (fun v ->  f v ) (vars @ stvars)
    | HWBAnalogState(data) ->
      let vars : a list = ASTLib.get_vars data.rhs in
      let stvars = StochLib.get_vars data.stoch in 
      List.iter (fun v ->  f v ) (vars @ stvars)
    | _ ->
      error "portvar_iter_vars" "can only fold over output vars"

  let portvar_fold_vars (type a) (type b) (x:a hwcomp) (portname:string) (f:a->b option) : b list =
    let port = comp_getvar x portname in
    match port.bhvr with
    | HWBAnalog(data) ->
      let vars : a list = ASTLib.get_vars data.rhs in
      let stvars = StochLib.get_vars data.stoch in
      List.fold_right (fun v lst -> match f v with
          | Some(q) -> q::lst
          | None -> lst
      ) (vars @ stvars) []
    | HWBAnalogState(data) ->
      let vars : a list = ASTLib.get_vars data.rhs in
      let stvars = StochLib.get_vars data.stoch in 
      List.fold_right (fun v lst -> match f v with
          | Some(q) -> q::lst
          | None -> lst
        ) (vars @ stvars) []
    | _ -> error "portvar_fold_vars" "can only fold over output vars"

  let inference (type a) (env:a hwenv) (cnv:a->hwvid) =
    debug "inference hw vars\n";
    iter_comps env (fun (x:a hwcomp) ->
        inference_comp env x cnv);
    ()


  let is_outblock_reachable (type a) (env:a hwenv) (wire:wireid) : bool = 
    let hwvar = getvar env wire.comp.name wire.port in
      match hwvar.knd with
      | HWKOutput ->
        debug ("checking reachability of "^(wireid2str wire)^" to output block.\n");
        let srcs = HwConnLib.get_sinks env hwvar.comp hwvar.port in
          let compat_inp_blocks = List.filter (fun (x:wireclass) ->
              match x.comp with
              | HWCmOutput(in_prop) -> in_prop = hwvar.prop
              | _ -> false
            ) srcs in
          debug ("number reachable output blocks "^
             (LIST.length2str compat_inp_blocks)^"/"^(LIST.length2str srcs)^"\n");
          (List.length compat_inp_blocks) > 0

      | HWKInput ->
        error "is_outblock_reachable" "it makes no sense to try and connect an input to an output block"


  let is_inblock_reachable (type a) (env:a hwenv) (wire:wireid) : bool =
    let hwvar = getvar env wire.comp.name wire.port in
    match hwvar.knd with
    | HWKInput ->
      debug ("checking reachability of "^(wireid2str wire)^" to an input block.\n");
      let srcs = HwConnLib.get_sources env hwvar.comp hwvar.port in
      debug (LIST.length2str srcs);
      let compat_inp_blocks = List.filter (fun (x:wireclass) ->
          match x.comp with
          | HWCmInput(in_prop) -> in_prop = hwvar.prop
          | _ -> false
        ) srcs in
      debug ("number reachable input blocks "^
             (LIST.length2str compat_inp_blocks)^"/"^(LIST.length2str srcs)^"\n");
      (List.length compat_inp_blocks) > 0
    | HWKOutput ->
      error "is_inblock_reachable" "it makes no sense to try and connect an output to an input block"

  let is_connectable (type a) (env:a hwenv)
      (srccmp:hwcompname) (srcport) (destcmp:hwcompname) (destport) : bool =
    HwConnLib.is_connectable env srccmp srcport destcmp destport

  let has_dest_connections (type a) (env:a hwenv) (srccmp:hwcompname) (srcport) =
    HwConnLib.has_dest_connections env srccmp srcport

  let connection_distance (type a) (env:a hwenv)
      (srccmp:hwcompname) (srcport) (destcmp:hwcompname) maxhops : int =
    HwConnLib.connection_distance env srccmp srcport destcmp maxhops

  let wires_are_connectable (type a) (env:a hwenv) (src:wireid) (dest:wireid) : bool =
    is_connectable env src.comp.name src.port dest.comp.name dest.port

end
