open Hardware
open Util

let mid x = (x, None)

let i_integrator: hwcomp = {
	inputs  = [(mid 0)];
	output = [(mid 1)];
	params = [];
	relations = [
		Eq(Deriv(Literal(OCurrent(mid 1))),Literal(ICurrent(mid 0)))
	]; 
	id= (0,Some("current_integrator"));
}

let i_multiplier: hwcomp = {
	inputs  = [(0,None); (1,None)];
	output = [(2,None)];
	params = [];
	relations = [
		Eq(
			Literal(OCurrent(mid(2))), 
			Mult([Deriv(Literal(ICurrent(mid(0)))); Literal(ICurrent(mid(1)))])
		);
		Eq(Literal(OVoltage(mid(2))), Wildcard)
	];
	id= (0,Some("current_multiplier"));
}

let i_exponential: hwcomp = {
	inputs  = [(mid 0)];
	output = [(mid 1)];
	params = [];
	relations = [
		Eq(
			Literal(OCurrent(mid 1)), 
			NatExp(Literal(ICurrent(mid 0)))
		);
		Eq(Literal(OVoltage(mid(1))), Wildcard)
	];
	id= (0,Some("current_multiplier"));
}


let simpleFPAAChip = Chip.create()
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_integrator 80
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_multiplier 80
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_exponential 16