
open HwData


type sln_action =
   | DUseComponent of compid
   | DAddWire of portid*portid
   | DSetPort of hwprop*portid*float
   | DNone

type conn_cstr =
  | AllPorts
  | PortOfComp of string*string
  | PortOfInst of portid


type elem_cstr =
   | Infinite
   | Finite of int

type comp_cstr =
{
  mutable comp: elem_cstr;
  mutable ports: (string*conn_cstr*conn_cstr);
}


type system_cstr = {
  comp : (string*(comp_cstr list)) list
}

type comp_state =
{
  mutable used: int;

}

type sln =
{
  mutable state : (string*comp_state) list;
  mutable actions: sln_action list;
}
