use Meta;
use Data;

State("Compound")
State("Gene")
State("MRNA")
State("Protein")
inherits(State("Gene"),State("Compound"))
inherits(State("MRNA"),State("Compound"))
inherits(State("Protein"),State("Compound"))

Action("transcription", ["Gene"], "MRNA")
Action("translation", ["Gene"], "Protein")
Action("bind",["Protein","Protein"],"Protein")
Action("use","Compound","Compound")

