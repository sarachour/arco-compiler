open MetaLanguageAST
open TypeSystem
open Sys 
open DiffEqCompiler
open CircuitCompiler

(*
(Divide(
   Exp(Divide(Symbol("A"),Symbol("ka")),Symbol("n")), 
   Plus([Integer(1); Exp(Divide(Symbol("A"),Symbol("ka")),Symbol("n"))])
))

*)
let create_instance () = 
   let env = MetaLanguageAST.create() in
   let env = MetaLanguageAST.define env (Signal "gene") in
   let env = MetaLanguageAST.define env (State "null") in
   let env = MetaLanguageAST.define env (State "protein") in
   let env = MetaLanguageAST.define env (Signal "promoter") in
   let env = MetaLanguageAST.define env (State "mrna") in
   let env = MetaLanguageAST.define env (State "repressor") in
   let env = MetaLanguageAST.define env (State "activator") in
   let env = MetaLanguageAST.define env (State "smallmolecule") in
   let env = MetaLanguageAST.define env (State "tf") in
   let env = MetaLanguageAST.define env (State "env") in
   let env = MetaLanguageAST.extend env (State "tf") (State "protein") in
   let env = MetaLanguageAST.extend env (State "repressor") (State "tf") in
   let env = MetaLanguageAST.extend env (State "activator") (State "tf") in
   let env = MetaLanguageAST.extend env (Signal "promoter") (Signal "gene") in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "repressor-activator-promoter",
            [("R",(State "repressor"));("A", (State "activator")); ("V_max", Parameter)],
            Mult([
               (Divide(
                  (Symbol("A")), 
                  (Plus([Integer(1); Symbol("A")]))
               ));
               (Divide(
                  (Integer(1)), 
                  (Plus([Integer(1); Symbol("R")]))
               ));
               Symbol("V_max")
            ]),
            [
               ("A",Minus([Relation;Hole]));
               ("R",Minus([Relation;Hole]));
               ("P", Plus([Relation;Hole]))
            ],
            ("P",Signal "promoter")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "smallmolecule-inhibits-protein",
            [("I",(State "smallmolecule"));("P", (State "protein")); ("V_max", Parameter)],
            Mult([
               (Divide(
                  (Symbol("P")), 
                  (Plus([Integer(1); Symbol("P")]))
               ));
               (Divide(
                  (Symbol("I")), 
                  (Plus([Integer(1); Symbol("I")]))
               ));
               Symbol("V_max")
            ]),
            [
               ("P",Minus([Relation;Hole]));
               ("I",Minus([Relation;Hole]));
               ("E",Plus([Relation;Hole]))
            ],
            ("E",State "env")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "promotes",
            [("P",(Signal "promoter"))],
            (Symbol "P"),
            [
               ("A", Plus([Relation;Hole]))
            ],
            ("A",Signal "gene")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "degrades_mrna",
            [("A",(State "mrna"));("k_mrna_deg",Parameter)],
            Mult([Symbol("k_mrna_deg"); Symbol("A")]),
            [
               ("A", Minus([Relation;Hole]))
            ],
            ("E", State "env")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "degrades_protein",
            [("A",(State "protein"));("k_prot_deg",Parameter)],
            Mult([Symbol("k_prot_deg"); Symbol("A")]),
            [
               ("A", Minus([Relation;Hole]))
            ],
            ("E",State "env")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "transcribes",
            [("gA",(Signal "gene")); ("ktrans",Parameter)],
            Mult([Symbol("ktrans"); Symbol("gA")]),
            [
               ("mA", Plus([Relation;Hole]))
            ],
            ("mA",State "mrna")
         )
      )
   in
   let env = MetaLanguageAST.define env 
      (
         Action (
            "translates",
            [("mA",(State "mrna")); ("ktrans",Parameter)],
            Mult([Symbol("ktrans"); Symbol("mA")]),
            [
               ("pA", Plus([Relation;Hole]));
               ("mA", Minus([Relation;Hole]))
            ],
            ("pA",State "protein")
         )
      )
   in
   env 
;;

let create_topology env =
   let env = MetaLanguageAST.add_parameter env "mrna_deg" 0.025 in 
   let env = MetaLanguageAST.add_parameter env "prot_deg" 0.0100 in 
   let env = MetaLanguageAST.add_parameter env "translate_rate" 0.0125 in 
   let env = MetaLanguageAST.add_parameter env "transcribe_rate" 0.000125 in 
   let env = MetaLanguageAST.add_parameter env "inh_rate" 0.55 in  
   let env = MetaLanguageAST.add_parameter env "rep_act_rate" 0.0125 in
   let env = MetaLanguageAST.add_state env ("promoter") "TetR-ETR-VP16" in
   let env = MetaLanguageAST.add_state env ("promoter") "PSV40" in
   let env = MetaLanguageAST.add_state env ("gene") "TetR-VP16" in
   let env = MetaLanguageAST.add_state env ("mrna") "mTetR-VP16" in
   let env = MetaLanguageAST.add_state env ("protein") "pTetR-VP16" in
   let env = MetaLanguageAST.add_state env ("gene") "SEAP" in
   let env = MetaLanguageAST.add_state env ("gene") "EKRAB" in
   let env = MetaLanguageAST.add_state env ("mrna") "mEKRAB" in
   let env = MetaLanguageAST.add_state env ("repressor") "pEKRAB" in
   let env = MetaLanguageAST.add_state env ("env") "Environment" in
   let env = MetaLanguageAST.add_state env ("smallmolecule") "Erythromycin" in
   let env = MetaLanguageAST.add_action env 
      "erith_inhibits_prot_EKRAB" "smallmolecule-inhibits-protein" 
         [("pEKRAB","P");("Erythromycin","I");("inh_rate","V_max")]
         [("Environment","E")]
   in
   let env = MetaLanguageAST.add_action env 
      "tetr_and_ekrab_interact_with_TEP" "repressor-activator-promoter" 
         [("pEKRAB","R");("pTetR-VP16","A");("rep_act_rate","V_max")]
         [("TetR-ETR-VP16","P")]
   in
   let env = MetaLanguageAST.add_action env 
      "tep_promotes_seap" "promotes" 
         [("PSV40","P")]
         [("EKRAB","A")]
   in
   let env = MetaLanguageAST.add_action env 
      "psv_promotes_ekrab" "promotes" 
         [("TetR-ETR-VP16","P")]
         [("TetR-VP16","A")]
   in
   let env = MetaLanguageAST.add_action env 
      "tetr_transcribe" "transcribes" 
         [("TetR-VP16","gA");("transcribe_rate","ktrans")]
         [("mTetR-VP16","mA")]
   in
   let env = MetaLanguageAST.add_action env 
      "tetr_translate" "translates" 
         [("mTetR-VP16","mA");("translate_rate","ktrans")]
         [("pTetR-VP16","pA")]
   in
   let env = MetaLanguageAST.add_action env 
      "tetr_mrna_degrade" "degrades_mrna" 
         [("mTetR-VP16","A");("mrna_deg","k_mrna_deg")]
         [("Environment","E")]
   in
   let env = MetaLanguageAST.add_action env 
      "tetr_prot_degrade" "degrades_protein" 
         [("pTetR-VP16","A");("prot_deg","k_prot_deg")]
         [("Environment","E")]
   in
   let env = MetaLanguageAST.add_action env 
      "ekrab_transcribe" "transcribes" 
         [("EKRAB","gA");("transcribe_rate","ktrans")]
         [("mEKRAB","mA")]
   in
   let env = MetaLanguageAST.add_action env 
      "ekrab_translate" "translates" 
         [("mEKRAB","mA");("translate_rate","ktrans")]
         [("pEKRAB","pA")]
   in
   let env = MetaLanguageAST.add_action env 
      "ekrab_mrna_degrade" "degrades_mrna" 
         [("mEKRAB","A");("mrna_deg","k_mrna_deg")]
         [("Environment","E")]
   in
   let env = MetaLanguageAST.add_action env 
      "ekrab_prog_degrade" "degrades_protein" 
         [("pEKRAB","A");("prot_deg","k_prot_deg")]
         [("Environment","E")]
   in
   env

let main () =
   if Array.length Sys.argv <> 1 then begin
      Format.printf "Usage: biology\n";
   end else begin
      let tenv = create_instance() in
      
      let env = create_topology tenv in 
      let env_str = MetaLanguageAST.to_string env in

      let diffeq_tbl = DiffEqCompiler.visit_env env in
      let diffeq_str = DiffEqTable.to_tex diffeq_tbl in
      let analog_tbl = CircuitCompiler.visit_env env in
      let analog_str = CircuitTable.to_string analog_tbl in
      let analog_json = CircuitTable.to_json analog_tbl in
         Format.printf "%s\n" analog_str
   end
;;


if !Sys.interactive then () else main ();;