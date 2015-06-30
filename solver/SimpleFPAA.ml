open HWLib
open Util

let _A = HWArch.create()

let simpleFPAAChip = _A
(*
let mid x = (x, None)

let simpleFPAAChip = Chip.create()


let i_integrator = let 
	inp1 = SymbolTable.make simpleFPAAChip.st and
	inp2 = SymbolTable.make simpleFPAAChip.st and
	outp1 = SymbolTable.make simpleFPAAChip.st and
	outp2 = SymbolTable.make simpleFPAAChip.st 
	in
	{
		inputs  = [inp1,inp2];
		output = [outp1,outp2];
		params = [];
		relations = [
			Eq(Deriv(Literal(OCurrent(outp))),Literal(ICurrent(inp)))
		]; 
		id= (0,Some("current_integrator"));
	}

let i_multiplier: hwcomp = let
	a = SymbolTable.make simpleFPAAChip.st and
	b = SymbolTable.make simpleFPAAChip.st and
	o = SymbolTable.make simpleFPAAChip.st 
	in
{
	inputs  = [a;b];
	output = [o];
	params = [];
	relations = [
		Eq(
			Literal(OCurrent o), 
			Mult([Deriv(Literal(ICurrent a)); Literal(ICurrent b)])
		);
		Eq(Literal(OVoltage(o)), Wildcard)
	];
	id= (0,Some("current_multiplier"));
}

let i_exponential: hwcomp = let 
	inp = SymbolTable.make simpleFPAAChip.st and
	outp = SymbolTable.make simpleFPAAChip.st 
	in
	{
		inputs  = [inp];
		output = [outp];
		params = [];
		relations = [
		Eq(
			Literal(OCurrent outp), 
			NatExp(Literal(ICurrent inp))
		);
		Eq(Literal(OVoltage outp), Wildcard)
	];
	id= (0,Some("current_exp_e"));
}
(**)
let i_fanout: hwcomp = 
	let
	cn1 = SymbolTable.make simpleFPAAChip.st and
	cn2 = SymbolTable.make simpleFPAAChip.st and
	cn3 = SymbolTable.make simpleFPAAChip.st and
	cn4 = SymbolTable.make simpleFPAAChip.st and
{
	inputs  =[cn4];
	output = [cn1,cn2,cn3];
	params = [];
	relations = [
		Set(
			Literal(OCurrent cn1), 
			Literal(OCurrent cn4)
		);
		Set(
			Literal(OCurrent cn2), 
			Literal(OCurrent cn4)
		);
		Set(
			Literal(OCurrent cn3), 
			Literal(OCurrent cn4)
		);
		Eq(Literal(OVoltage(mid(1))), Wildcard)
	];
	id= (0,Some("current_fanout"));
}



let simpleFPAAChip = Chip.create()
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_integrator 80
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_multiplier 80
let simpleFPAAChip = Chip.add_component simpleFPAAChip i_exponential 16

*)