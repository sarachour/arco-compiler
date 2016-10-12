open Unit
open AST
open Util
open IntervalData
open StochData

type hwcompname =
  | HWCmInput of string
  | HWCmOutput of string
  | HWCmCopy of string
  | HWCmComp of string

type hwcompinst = {
  name : hwcompname;
  inst : int;
}

type hwvkind = HWKInput | HWKOutput

type compid =
  | HCMLocal of hwcompname 
  | HCMGlobal of hwcompinst

type hcconn =
  | HCCAll
  | HCCRange of irange
  | HCCIndiv of int

(*port to port*)
type connid = string*string

type wireid = {
    comp:hwcompname;
    inst:int;
    port:string;
}

type wireconn = {
  src: wireid;
  dst: wireid;
}

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
  comp:hwcompname;
}

type port_prop = string*string

type hwadefs = {
  mutable span: span;
  mutable conv:  mapper;
  mutable iconv:  mapper;
}

type hwastatedefs = {
  mutable deriv : hwadefs;
  mutable stvar : hwadefs;
}

type hwddefs = {
  mutable freq: number*untid;
  mutable repr: int*int*int;
}

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

type  hwdefs =
  | HWDAnalog of hwadefs
  | HWDDigital of hwddefs
  | HWDAnalogState of hwastatedefs
  
type 'a hwportvar = {
   mutable bhvr: 'a hwbhv;
   mutable defs: hwdefs;
   typ:untid;
   knd:hwvkind;
   port:string;
   prop:string;
   comp:hwcompname;
   
}

type 'a hwcomp = {
  mutable vars: mapvar list;
  outs: (string,'a hwportvar) map;
  ins: (string,'a hwportvar) map;
  params: (string,hwparam) map;
  mutable insts: int;
  name:hwcompname;
  mutable sim: (string*(string list)) option;
}


type 'a hwenv = {
  mutable units : unt_env;
  mutable props : (string, untid set) map;
  conns: (connid, (connid,(hcconn*hcconn) set) map) map;
  mutable comps : (hwcompname,'a hwcomp) map;
  mutable time : (string*(untid set)) option;
}



