


type delta =
   | DUseComponent of hwcomp*int
   | DAddWire of hwexpr*string*(string option)
   | DAggregate of delta list
   | DSetPort of hwliteral*hwexpr
   | DNone

type conn_lim =
  | AllPorts
  | PortOfComp of string*string
  | PortOfInst of string*string*int
  | Mixed of conn_src_type list


type elem_lim =
   | Infinite
   | Finite of int

type comp_lim =
{
  mutable comp: scarcity_type;
  mutable ports: (string*conn_type*conn_type);
}

type comp_state =
{
  mutable used: int;

}
type comp_sln =
{
  mutable lims: comp_lim list;
  mutable state : comp_state list;
  mutable sln: delta;
}
