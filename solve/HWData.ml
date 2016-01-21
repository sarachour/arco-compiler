open Common
open Unit
open AST
open Util


type propid = string

(* CSTR DATA*)
type hevid =
  | HENPort of hwvkind*compid*string*propid*untid
  | HENPortErr of hwvkind*compid*string*propid*untid
  | HENParam of string*number*unt
  | HENTime of untid

type herel =
  | HERFunction of hevid ast
  | HERState of hevid ast
  | HERNoError

type hcinst = int


type hcmag =
  | HCMagRange of range
  | HCNoMag

type hcconn =
  | HCCAll
  | HCCRange of irange
  | HCCIndiv of int

type hcdigital =
  | HCDigSample of string*string*float*untid

(*port to port*)
type connid = string*string

type hwcstrs = {
  conns: (connid, (connid,(hcconn*hcconn) set) map) map;
  mags: (string*string*string,hcmag) map;
  tcs: (string,hcmag) map;
  errs: (string*string*string, herel) map;
  digs: (string, hcdigital list) map;
  insts: (string,hcinst) map;
}

(*General Data*)
type hwvid =
  | HNPort of hwvkind*compid*string*propid*untid
  | HNParam of compid*string*number*unt
  | HNTime of compid*unt

type hwrel =
  | HRFunction of hwvid*(hwvid ast)
  | HRState of hwvid*(hwvid ast)*(hwvid)
  | HRNone


type hwtype =
  | HPortType of hwvkind*((propid,untid) map)
  | HParamType of number*unt

type hwvar = {
  name: string;
  mutable rel : hwrel;
  typ: hwtype;
}


type hwcomp = {
  name : string;
  mutable vars: (string,hwvar) map;
  mutable time: unt;
  mutable spice: (string*(string list)) option;
}

type hwenv = {
  mutable units : unt_env;
  mutable props : (string, untid set) map;
  mutable comps : (string,hwcomp) map;
  mutable time : (string*(untid set)) option;
  mutable cstr : hwcstrs
}
