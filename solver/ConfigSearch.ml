open HwLib
open HwData
open GenericData
open GenericLib
open GoalData
open GoalLib
open HwSlnLib
open HwSlnData
open ConfigSearchGenerator
open ConfigSearchDeriver

open Util

exception ConfigSearchException of string;;


module ConfigSearch :
sig
   type analogy  = GenericHWLib.analogy
   type goaltree  = GoalData.goalnode

   type gencfg = {
      analogy: analogy;
      arch: hwarch;
      components: hwcomp list;
      mutable goals: goaltree;
      mutable config: hwconfig;
   }

   val init : analogy -> hwarch -> gencfg
   val convert : gencfg -> genv -> hwconfig
end =
struct
   type analogy  = GenericHWLib.analogy
   type goaltree  = GoalData.goalnode

   type gencfg = {
      analogy: analogy;
      arch: hwarch;
      components: hwcomp list;
      mutable goals: goaltree;
      mutable config: hwconfig;
   }


   let init anlgy arch : gencfg =
      let rec proc_comps (e:hwelem) : hwcomp list = match e with
         | Component(c) -> c::[]
         | Schematic(s) ->
            List.fold_right (fun x r -> (proc_comps x) @ r) s.elems []
         | _ -> raise (ConfigSearchException "unimplemented proc_comps")
      in
      let c = HwArch.create_config() in
      let comps = proc_comps (Schematic arch.schem) in
      let g : goaltree = GEmpty in
      {analogy=anlgy; arch=arch; config=c; components=comps; goals=g}

   let traverse (c:gencfg) =
      ConfigSearchDeriver.traverse c.goals true


   let convert (c:gencfg) (rel:genv)=
      let print_sol (sol:sln option) : unit = match sol with
      | Some(s) -> SlnUtils.sln2stdout "" s
      | None -> Printf.printf "no component configuration.\n"
      in
      let hrel = GenericHWLib.genv2hwcomp (c.analogy) rel in
      let initial_goal =  GoalUtils.make_goal None hrel in
      c.goals <- GUnsolvedNode(initial_goal);
      let slns = traverse c in
      print_sol slns;
      c.config


end
