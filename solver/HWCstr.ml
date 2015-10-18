open Util
open Unit
open AST

exception HwCstrError of string

type compid =
  | HCCMLocal of string

type propid = string
type hcvid =
  | HCNInput of compid*string*propid*untid
  | HCNOutput of compid*string*propid*untid
  | HCNParam of string*float*unt
  | HCNInputErr of compid*string*propid*untid
  | HCNOutputErr of compid*string*propid*untid
  | HCNTime

type hcrel =
  | HCRFun of hcvid ast
  | HCRState of hcvid ast

type hcconn =
  | HCInstConn of int*string*string

type hwcstrs = {
  conns: (string*string*int, hcconn set) map;
  mags: (string*string,range) map;
  errs: (string*string, hcrel) map;
  insts: (string,int) map;
}

let error s n =
  raise (HwCstrError (s^": "^n))

module HwCstrLib =
struct
  let mkcstrs ()  : hwcstrs=
    {
      conns= MAP.make();
      mags= MAP.make();
      errs = MAP.make();
      insts = MAP.make()
    }

end