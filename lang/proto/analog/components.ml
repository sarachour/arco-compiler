
(* any arbitrary symbolic formula *)
type formula = {
   inputs : symbol list;
   outputs: symbol list;
   parameters: symbol list;
   equation: relation;
}

type compound = {
   name: string
}
type interaction = {
   name: string
   source : string
   sink : string
}

type system = {
   compartments : compound list
   interactions: interaction list
}



(* Analog *)



let ps p = 
   let lexbuf = Lexing.from_string p in
      DEQParser.main DEQLexer.main lexbuf 


let rxn = {
   compartments = [
      {name="A"};
      {name="B"};
      {name="C"};
      {name="D"}
   ];
   interactions = [
      {name="A-to-C",source="A",sink="C"};
      {name="B-to-C",source="B",sink="C"};
      {name="C-to-B",source="C",sink="B"};
      {name="C-to-D",source="C",sink="D"};
   ]
   
}