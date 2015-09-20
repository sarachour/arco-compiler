


type comp_id = string*int
type port_id = string*comp_id

type sln_action =
   | DUseComponent of comp_id
   | DAddWire of port_id*port_id
   | DSetPort of port_id*float
   | DNone

type conn_cstr =
  | AllPorts
  | PortOfComp of string*string
  | PortOfInst of port_id


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
