open HWLib
open HWData
open GenericData
open GenericLib
open ConfigSearchGenerator
open ConfigSearchPruner

open Util

exception ConfigSearchException of string;;

type analogy  = GenericHWLib.analogy
type cgen_entryresults = ConfigSearchGenerator.cgen_entryresults
type cgen_entryresult = ConfigSearchGenerator.cgen_entryresult
type cgen_entry = ConfigSearchGenerator.cgen_entry
type cgen_result = ConfigSearchGenerator.cgen_result

module ConfigSearch : 
sig
   type gencfg = {
      analogy: analogy;
      arch: hwarch; 
      searcher: ConfigSearchGenerator.cgen_searchspace; 
      mutable config: hwconfig; 
   }
   val init : analogy -> hwarch -> gencfg
   val convert : gencfg -> genv -> hwconfig
end =
struct
   type gencfg = {
      analogy: analogy;
      arch: hwarch; 
      searcher: ConfigSearchGenerator.cgen_searchspace; 
      mutable config: hwconfig; 
   }
   let init anlgy arch : gencfg = 
      let c = HWArch.create_config() in
      let m = ConfigSearchGenerator.init() in
      let rm = ref m in 
      let rec proc_comps (e:hwelem) : unit = match e with
         | Component(c) -> ConfigSearchGenerator.add_comp rm c
         | Schematic(s) -> 
            List.iter (fun (n,x) -> (proc_comps x)) s.elems
         | _ -> raise (ConfigSearchException "unimplemented proc_comps")
      in
      proc_comps (Schematic arch.schem);
      {analogy=anlgy; arch=arch; config=c; searcher=m}


   let rec explore (c:gencfg) (rel:hwcomp) = 
      let per_assign (h:cgen_entry)  (lit,expr) : cgen_entryresults option = 
         Printf.printf "%s = %s\n" (HWUtil.hwlit2str lit) (HWUtil.hwexpr2str expr);
         None
      in
      let per_result (h:cgen_entry) (c:cgen_result) : (cgen_entryresults list) option = 
         let sols = List.map (per_assign h) c.assigns in
         OptUtils.unify_all sols

      in
      let per_comp (c:cgen_entryresult) : ((cgen_entryresults list) list) option  = 
         let results = List.map (per_result c.entry) c.results in
         OptUtils.unify_atleast_one results
      in
      let comps = ConfigSearchGenerator.find (ref (c.searcher)) rel in
      match comps with 
         | Some x -> 
            begin
               Printf.printf "%s\n" (ConfigSearchGenerator.results2str x);
               let sols = List.map per_comp x.results in
               OptUtils.unify_atleast_one sols
            end
         | None -> Printf.printf "no solution."; None

   let convert (c:gencfg) (rel:genv)= 
      let hrel = GenericHWLib.genv2hwcomp (c.analogy) rel in
      let _ = explore c hrel in 
      c.config



end