
open HwData
open GoalData

type sln_action =
   | SUseComponent of compid
   | SAddWire of portid*portid
   | SSetPort of hwprop*portid*float

type port_cstr =
  | CPortOfComp of string*string
  | CPortOfInst of portid
  | CAllPorts

type elem_cstr =
  | CAllElems
  | CElem of int

type conn_cstr =
  | CFanoutCstr of port_cstr*int
  | CSinkCstr of port_cstr*port_cstr
  | CPropValCstr of port_cstr*hwprop*float*float


type system_cstr =
{
  mutable comp: elem_cstr list;
  mutable ports: conn_cstr list;
}

type sln_state =
  | SUsedComponent of string
  | SUsedConnection of portid*portid
  | SNoStateChange

type sln =
  | SSolutionNode of sln_state*sln_action
  | SSolutionBranch of sln list
  | SAggregateSolution of sln list
  | SSolutionLink of goal
  | SDeadEnd
