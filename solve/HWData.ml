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
    comp:hwcompinst;
    port:string;
}

type wireconn = {
  src: wireid;
  dst: wireid;
}

(*a collection of wires*)
type wire_coll =
  | WCollEmpty
  | WCollOne of wireid
  | WCollMany of wireid list

(*
these hardware ids generate variables and values.
these wires are all outputs fyi
*)

(*
this hardware ids require values and variables be routed
to them.
*)

type ('a,'b) labels = {
  outs: ('a,wire_coll) map;
  ins: ('a,wire_coll) map;
  locals: ('a,wire_coll) map;
  exprs: ('b ast,wire_coll) map;
  vals: (number,wire_coll) map;
}

type 'a label_var = {
  var: 'a;
  wire:wireid;
}
type label_val = {
  value: number;
  wire:wireid;
}
type 'a label_expr = {
  expr: 'a ast;
  wire: wireid;
}
type ('a,'b) label =
  | MInLabel of 'a label_var
  | MOutLabel of 'a label_var
  | MLocalLabel of 'a label_var
  | ValueLabel of label_val
  | MExprLabel of 'b label_expr

(*
A solution is comprised of a set of generators and route points.
A finalized solution is comprised of connections and generators,
where the generators are exclusively on input and output ports
(or local wires)
*)
type conn_env = {
  src2dest: (wireid, wireid set) map;
  dest2src: (wireid, wireid set) map;

}
type ('a,'b) sln = {
  (*how many of each component is used *)
  mutable conns: conn_env;
  generate: ('a,'b) labels;
  route: ('a,'b) labels;
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
  mutable ival: interval;
  mutable conv:  std_mapper;
}

type hwastvardefs = {
  mutable ival: interval;
  mutable conv:  std_mapper;
  mutable proxy:  hwvid mapper;
}


type hwastatedefs = {
  mutable deriv : hwadefs;
  mutable stvar : hwastvardefs;
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
  mutable comps : (string,'a hwcomp) map;
  mutable time : (string*(untid set)) option;
}



