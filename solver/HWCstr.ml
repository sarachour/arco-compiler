open Util
open Unit
open AST
open Common

exception HwCstrError of string


type propid = string

type hcvid =
  | HCNPort of hwvkind*compid*string*propid*untid
  | HCNPortErr of hwvkind*compid*string*propid*untid
  | HCNParam of string*float*unt
  | HCNTime of untid

type hcrel =
  | HCRFun of hcvid ast
  | HCRState of hcvid ast

type hcinst =
  | HCFinite of int
  | HCInfinite

type hcconn =
 | HCConnInstPort of (string*string*int)
 | HCConnCompPort of (string*string)

type hwcstrs = {
  conns: (string*string*int,hcconn set) map;
  mags: (string*string,range) map;
  errs: (string*string, hcrel) map;
  insts: (string,hcinst) map;
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
