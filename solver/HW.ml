open AST
open Unit
open Util

type propid = string


type compid =
  | LocalCompId of string
  | GlobalCompId of string* int

type pkind = HKInput | HKOutput

type hwvid =
  | HNInput of compid*string*propid
  | HNOutput of compid*string*propid
  | HNParam of string*float

type hwrel =
  | HRFunction of hwvid ast
  | HRState of hwvid ast
  | HRNothing

type hwcnskind =
  | HCKPropRange of string
  | HCKPropError of string

type hwcns =
  | HCGlobalPropRange of propid*range
  | HCLocalPropRange of string*propid*range
  | HCPropError of string*propid*string


type hwtype =
  | HPortType of pkind*((propid,untid) map)
  | HParamType of unt

type hwcstr =
  | HCPropRange of propid*range*untid

type hwcstrs = {
  mutable glbl : hwcstr set;
  mutable local : (string,hwcstr set) map
}

type hwvar = {
  name: string;
  rel : hwrel;
  typ: hwtype;
}


type hwcomp = {
  name : string;
  mutable vars: (string,hwvar) map;
  mutable cstrs : hwcstrs;
}

type hwenv = {
  mutable units : unt_env;
  mutable props : (string, untid set) map;
  mutable comps : (string,hwcomp) map;
  mutable time : (string*(untid set)) option;

}


exception HwCstrError of string
exception HwLibError of string

let cstr_error s n =
  raise (HwCstrError (s^": "^n))

module HwCstrLib =
struct
  let _cmpcstrs x y = match (x,y) with
    | (HCPropRange(a,_,_),HCPropRange(b,_,_)) -> a = b
    | _ -> false

  let mkcstrs () = {glbl=SET.make _cmpcstrs; local=MAP.make()}

  let hascstr e cstr port =
    match port with
    | Some(pname) ->
      if MAP.has e.local pname then
        let st = MAP.get e.local pname in
        SET.has st cstr
      else
        false
    | None -> SET.has e.glbl cstr

  let hasrange e prop port =
    let dummyrange = HCPropRange (prop,(0.,0.),"") in
    hascstr e dummyrange port

  let mkrange e prop min max unt (port:string option) =
    if hasrange e prop port then
      cstr_error "mkrangee" ("range for prop "^prop^" already exists")
    else
    let newrange = HCPropRange(prop,(min,max),unt) in
    match port with
    | Some(pname) ->
      if MAP.has e.local pname  = false then
          let s = SET.make _cmpcstrs in
          let _ = SET.add s newrange in
          let _ = MAP.put e.local pname s in
          e
      else
          let s = MAP.get e.local pname in
          let _ = SET.add s newrange in
          e
    | None ->
      let _ = SET.add e.glbl newrange in
      e

end

module HwLib =
struct

  let mkenv () = {units=UnitLib.mkenv(); comps=MAP.make(); props=MAP.make(); time=None}

  let print e =
    let pkind2str v =
      match v with
      | HKInput -> "input"
      | HKOutput -> "output"
    in
    let type2str v =
      match v with
      | HPortType(knd,tps) -> "port "^(pkind2str knd)
      | HParamType(t) -> "param"
    in
    let print_var (x:hwvar) =
      Printf.printf "   %s of %s\n" x.name (type2str x.typ)
    in
    let print_comp c =
      let _ = Printf.printf "==> component %s \n" c.name in
      let _ = MAP.iter c.vars  (fun k v -> print_var v) in
      ()
    in
    let print_prop k v =
      let print_units x r = r^" "^x in
      let units= SET.fold v print_units "" in
      Printf.printf "%s : %s\n" k units
    in
   let print_props () =
    MAP.iter (e.props) (fun k v -> print_prop k v)
   in
   let print_time () =
    match (e.time) with
    | Some(x,v) -> print_prop x v
    | None -> Printf.printf "(no time variable defined)"
  in
   let _ = Printf.printf "==== Units ====\n" in
   let _ = UnitLib.print (e.units) in
   let _ = Printf.printf "==== Props ====\n" in
   let _ = print_props () in
   let _ = Printf.printf "==== Time =====\n" in
   let _ = print_time () in
   let _ = Printf.printf "==== Components =====\n" in
   let _ = MAP.iter e.comps (fun k v -> print_comp v) in
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
      let c : hwcomp = {name=name;vars=MAP.make(); cstrs=HwCstrLib.mkcstrs()} in
      let _ = MAP.put e.comps name c in
      e

  let mkport e cname (hwkind:pkind) iname (types:(propid*untid) list) =
    if hascomp e cname = false then
      error "mkport" ("comp with name "^cname^" already defined.")
    else
      let c = MAP.get e.comps cname in
      if MAP.has c.vars iname then
        error "mkport" ("variable with name "^iname^" already exists")
      else
        let prps : (propid,untid) map = MAP.make () in
        let add_propunit ((p,x):propid*untid) =
          if hasprop e p = false then
            error "mkport" "prop doesn't exist"
          else if UnitLib.has e.units x = false then
            error "mkport" "unit doesn't exist"
          else
            let _ = MAP.put prps p x in
            ()
        in
        let _ = List.iter add_propunit types in
        let vrt = HPortType(hwkind,prps) in
        let vr = {name=iname; rel=HRNothing; typ=vrt} in
        MAP.put c.vars iname vr

  let mkparam e cname iname vl (t:unt) =
  if hascomp e cname = false then
    error "mkparam" ("comp with name "^cname^" already defined.")
  else
    let c = MAP.get e.comps cname in
    if MAP.has c.vars iname then
      error "mkparam" ("variable with name "^iname^" already exists")
    else
    let vr = {name=iname; rel=HRNothing; typ=HParamType(t)} in
    MAP.put c.vars iname vr

  let mktime e name units =
    if hastime e then
      error "mktime" "time already defined"
    else
      let s = SET.make (fun x y -> x = y) in
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
      let s = SET.make (fun x y -> x = y) in
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


(*
type hid =
  | HInput of hprop*string
  | HOutput of hprop*string
  | HParam of string*float

type hvc_cstr =
  | HMagCstr of hid*float*float
  | HErrCstr of hid*(hid ast)
  | HTimeCstr of hid*float
  | HSampleCstr of hid*int

type hvar =
  | HInputSpec of string
  | HOutputSpec of string
  | HParamSpec of string

type hrel =
  | StateRel of (hid ast_term)*(hid ast)*float
  | FxnRel of (hid ast_term)*(hid ast)

type hcomp = {
  rels : hrel list;
  vars : hvar list;
  cstrs: hv_cstr list;

}
*)
