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
  mutable comps : (string,hwcomp) map;


}
module HwLib =
struct

  let mkenv () = {units=UnitLib.mkenv(); comps=MAP.make() }
  let print e =
   Printf.printf "==== Units ====\n";
   UnitLib.print (e.units);

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
