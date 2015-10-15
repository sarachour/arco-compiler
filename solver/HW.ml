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

type hwensure = string
type hwassume = string

type hwtype = hwkind*unt

type hwvar = {
  name: string;
  rel : hwrel;
  mutable ens : hwensure set;
  mutable asm : hwassume set;
  typ: hwtype;
}
type hwcomp = {
  name : string;
  vars: (string,hwvar) map;
  mutable ens : hwensure set;
  mutable asm : hwassume set;
}

type hwenv = {
  mutable units : unt_env;
  mutable props : (string, untid set) map;
  mutable comps : (string,hwcomp) map;


}
module HwLib =
struct

  let mkenv () = {units=UnitLib.mkenv(); comps=MAP.make(); props=MAP.make()}

  let print e =
   let print_props () =
    let print_prop k v =
      let print_units x r = r^" "^x in
      let units= SET.fold v print_units "" in
      Printf.printf "%s : %s\n" k units
    in
    MAP.iter (e.props) (fun k v -> print_prop k v)
   in
   let _ = Printf.printf "==== Units ====\n" in
   let _ = UnitLib.print (e.units) in
   let _ = Printf.printf "==== Props ====\n" in
   let _ = print_props () in
   ()

  let hasprop e name =
    MAP.has (e.props) name

  let mkprop e name =
    if hasprop e name then
      error "mkprop" ("prop "^name^" already exists")
    else
      let _ = e.props <- MAP.put (e.props) name (SET.make (fun x y -> x = y)) in
      e

  let mkunit4prop e name uname =
    if hasprop e name = false then
      error "mkunit4prop" ("property "^name^" does not exist")
    else if UnitLib.has (e.units) uname = false then
      error "mkunit4prop" ("unit "^uname^" does not exist")
    else
      let st = MAP.get (e.props) name in
      let _ = SET.add st uname in
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
