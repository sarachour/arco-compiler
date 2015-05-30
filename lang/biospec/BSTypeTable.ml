open BSTypes

(* Stores all declared modules *)
module TypeTable :
sig
   type elements = {
      mutable gene : Gene.impl list;
      mutable protein : Protein.impl list;
      mutable mrna : MRNA.impl list;
      mutable premrna : PreMRNA.impl list;
      mutable polypeptide : PolyPeptide.impl list;
      mutable smallmolecule : SmallMolecule.impl list;
      mutable metabolite : Metabolite.impl list;
   }
   val add : elements -> string list -> elements
end =
struct
   type elements = {
      mutable gene : Gene.impl list;
      mutable protein : Protein.impl list;
      mutable mrna : MRNA.impl list;
      mutable premrna : PreMRNA.impl list;
      mutable polypeptide : PolyPeptide.impl list;
      mutable smallmolecule : SmallMolecule.impl list;
      mutable metabolite : Metabolite.impl list;
   }
   let add e s = 
      match (Gene.parse s, 
            Protein.parse s, 
            MRNA.parse s, 
            PreMRNA.parse s,
            PolyPeptide.parse s,
            SmallMolecule.parse s,
            Metabolite.parse s)
      with
         (Some(a), None, None, None, None, None, None) ->
            e.gene <- a::e.gene; e
         |(None, Some(a), None, None, None, None, None) ->
            e.protein <- a::e.protein; e
         |(None, None, Some(a), None, None, None, None) ->
            e.mrna <- a::e.mrna; e
         |(None, None, None, Some(a), None, None, None) ->
            e.premrna <- a::e.premrna; e
         |(None, None, None, None, Some(a), None, None) ->
            e.polypeptide <- a::e.polypeptide; e
         |(None, None, None, None, None, Some(a), None) ->
            e.smallmolecule <- a::e.smallmolecule; e
         |(None, None, None, None, None, None, Some(a)) ->
            e.metabolite <- a::e.metabolite; e
         | _ -> e
         
end