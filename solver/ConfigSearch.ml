open HWLib
open HWData
open GenericData
open GenericLib
open ConfigSearchGenerator
open ConfigSearchPruner

exception ConfigSearchException of string;;

type analogy  = GenericHWLib.analogy

module ConfigSearch : 
sig
   type gencfg = {
      analogy: analogy;
      arch: hwarch; 
      matcher: ConfigSearchGenerator.cgen_searchspace; 
      mutable config: hwconfig; 
   }
   val init : analogy -> hwarch -> gencfg
   val convert : gencfg -> genv -> hwconfig
end =
struct
   type gencfg = {
      analogy: analogy;
      arch: hwarch; 
      matcher: ConfigSearchGenerator.cgen_searchspace; 
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
      {analogy=anlgy; arch=arch; config=c; matcher=m}

   
   let convert (c:gencfg) (rel:genv)= 
      let hrel = GenericHWLib.genv2hwcomp (c.analogy) rel in
      let _ = ConfigSearchGenerator.find (ref (c.matcher)) hrel in 
      c.config



end