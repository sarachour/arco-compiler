type compoundInfo = 
{
   name: string
}
type compound = 
   Gene of compoundInfo 
   | PrePeptide of compoundInfo
   | Protein of compoundInfo
   | Metabolite of compoundInfo
   | PreMRNA of compoundInfo
   | MRNA of compoundInfo
   | Promoter of compoundInfo
;;


type action = 
  (* A inhibits B using the following relation*)
  Inhibits of compound*compound
  | Excites of compound*compound
  | Generates of compound*compound
  | Promotes of compound*compound
;;
(*
type system = 
{
   elements: element list;
   actions: action list;
};;
*)