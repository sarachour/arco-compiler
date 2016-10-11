open Common
open Unit
open AST
open Util
open IntervalData
open StochData

type hcconn =
  | HCCAll
  | HCCRange of irange
  | HCCIndiv of int

(*port to port*)
type connid = string*string


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

type port_prop = string*string

type 'a hwadefs = {
  mutable span: span;
  mutable conv:  mapper;
  mutable iconv:  mapper;
}

type 'a hwastatedefs = {
  mutable deriv : 'a hwadefs;
  mutable stvar : 'a hwadefs;
}

type 'a hwddefs = {
  mutable freq: number*untid;
  mutable repr: int*int*int;
}
type 'a hwdinp = 'a hwddefs 
type 'a hwainp = 'a hwadefs

type 'a hwdout = {
  rhs : 'a ast;
}
type 'a hwaout = {
  rhs : 'a ast;
  mutable stoch : 'a stoch;
}
type 'a hwaderiv = {
  rhs : 'a ast;
  mutable stoch: 'a stoch;
  ic: port_prop;
}

type 'a hwbhv =
  | HWBDigital of 'a hwdout  
  | HWBAnalog of 'a hwaout
  | HWBAnalogState of 'a hwaderiv
  | HWBInput
  | HWBUndef

type 'a hwdefs =
  | HWDAnalog of 'a hwadefs
  | HWDDigital of 'a hwddefs
  | HWDAnalogState of 'a hwastatedefs
  
type 'a hwportvar = {
   mutable bhvr: 'a hwbhv;
   mutable defs: 'a hwdefs;
   typ:untid;
   knd:hwvkind;
   port:string;
   prop:string;
   comp:string;
   
}

type 'a hwcomp = {
  mutable vars: mapvar list;
  outs: (string,'a hwportvar) map;
  ins: (string,'a hwportvar) map;
  params: (string,hwparam) map;
  mutable insts: int;
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



