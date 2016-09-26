open Common
open Unit
open AST
open Util




type hcconn =
  | HCCAll
  | HCCRange of irange
  | HCCIndiv of int

(*port to port*)
type connid = string*string

type hw_mag_cstr =
  | CMAGRange of number*number*untid
  | CMAGNone

type hw_sample_cstr =
  | CSAMPFreq of number*untid
  | CSAMPNone

type hw_float_cstr =
  | CFLTRepr of int*int*int
  | CFLTNone

(*General Data*)
type hwvid =
  | HNPort of hwvkind*compid*string*string
  | HNParam of compid*string
  | HNTime 

(*support multiple parameters*)
type hwparam = {
  value : number list;
  typ: unt;
  name:string;
  comp:string;
}

type 'a hwdvar = {
  rhs : 'a ast;
  mutable mag_cstr: hw_mag_cstr;
  mutable sample_cstr: hw_sample_cstr;
  mutable fltrepr_cstr:hw_float_cstr;
}
type 'a hwavar = {
  rhs : 'a ast;
  mutable mag_cstr: hw_mag_cstr;
}
type 'a hwaderiv = {
  rhs : 'a ast;
  ic:string*string;
  mutable mag_cstr: hw_mag_cstr;
}
type 'a hwbhv =
  | HWBhvDigital of 'a hwaderiv
  | HWBhvAnalogVar of 'a hwavar
  | HWBhvAnalogStateVar of 'a hwaderiv
  | HWBhvUndef

type 'a hwportvar = {
   mutable bhvr: 'a hwbhv;
   typ:untid;
   knd:hwvkind;
   port:string;
   prop:string;
   comp:string;
   
}

type 'a hwcomp = {
  vars: (string,'a hwportvar) map;
  params: (string,hwparam) map;
  insts: int;
  name:string;
  mutable sim: (string*(string list)) option;
}


type 'a hwenv = {
  mutable units : unt_env;
  mutable props : (string, untid set) map;
  conns: (connid, (connid,(hcconn*hcconn) set) map) map;
  mutable comps : (string,'a hwcomp) map;
  mutable time : (string*(untid set)) option;
}



