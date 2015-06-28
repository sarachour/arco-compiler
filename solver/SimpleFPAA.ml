open Hardware
open Util

let mid x = (x, None)

let i_integrator: component = {
	inputs  = [(mid 0)];
	output = [(mid 0)];
	relations = [
		Eq(Deriv(OCurrent(mid 0)),Literal(ICurrent(mid 0)))
	]; 
	id= (0,Some("current_integrator"));
}

let i_multiplier: component = {
	inputs  = [(0,None); (1,None)];
	output = [(0,None)];
	relations = [
		Eq(
			Literal(OCurrent(mid(0))), 
			Mult(Literal(ICurrent(mid(0))), Literal(ICurrent(mid(1))))
		);
		Eq(Literal(OVoltage(mid(0))), Wildcard)
	];
	id= (0,Some("current_multiplier"));
}

let i_exponential: component = {
	inputs  = [(mid 0)];
	output = [(mid 0)];
	relations = [
		Eq(
			Literal(OCurrent(mid 0)), 
			NatExp(Literal(ICurrent(mid 0)))
		);
		Eq(Literal(OVoltage(mid(0))), Wildcard)
	];
	id= (0,Some("current_multiplier"));
}


let ch = Chip.create()
let ch = Chip.add_component ch i_integrator 80
let ch = Chip.add_component ch i_multiplier 80
let ch = Chip.add_component ch i_exponential 16