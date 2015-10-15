open AST
open Unit
open Util

type propid = string


type compid =
  | LocalCompId of string
  | GlobalCompId of string* int

type hwkind = HWInput | HwOutput | HwParam of float

type hwvid =
  | HwInput of compid*string*propid
  | HwOutput of compid*string*propid
  | HwParam of string*float

type hwrel =
  | HwFunction of hwvid ast
  | HwState of hwvid ast
  | HwNothing

type hwcnskind =
  | PropRange of string
  | PropError of string

type hwcns =
  | GlobalPropRange of propid*range
  | LocalPropRange of string*propid*range
  | PropError of string*propid*string


type hwtype = hwkind*unt

type hwvar = {
  name: string;
  rel : hwrel;
  typ: hwtype;
}

type hwcstr =
  | HCPropRange of propid*range*untid

type hwcstrs = {
  mutable glbl : hwcstr set;
  mutable local : (string,hwcstr set) map
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
   ()

  let hastime e =
    match (e.time) with Some(_) -> true | None -> false

  let hascomp e n =
    MAP.has (e.comps) n

  let mkcomp e name =
    if hascomp e name then
      error "mkcomp" ("comp with name "^name^"already defined.")
    else
      let c : hwcomp = {name=name;vars=MAP.make(); cstrs=HwCstrLib.mkcstrs()} in
      let _ = MAP.put e.comps name c in
      e

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

  let hasprop e name =
    MAP.has (e.props) name

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
