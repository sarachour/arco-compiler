open Sys
open Core
open Core.Std

open SymCaml
open SymLib
open GenericData
open HWData
open HWLib
(*
Given a set of components, it finds all possible combinations of assignments
that yields equivalent 
*)
module HWSpecMatcher : 
sig
   type hsentry = {
      sym : SymLib.symenv;
      comp: hwcomp;
   }
   type hsmatcher = {
      mutable comps : hsentry list;
   }
   val init : unit -> hsmatcher 
   val add_comp : hsmatcher ref -> hwcomp -> unit
   val find : hsmatcher ref -> hwcomp -> unit 
end = 
struct 
   type hsentry = {
      sym : SymLib.symenv;
      comp: hwcomp;
   }
   type hsmatcher = {
      mutable comps : hsentry list;
   }
   
   let init () : hsmatcher= 
      let s = {comps=[]} in 
      s


   let add_comp (h:hsmatcher ref) (comp:hwcomp) : unit = 
      let se = HWSymLib.hwcomp2symenv comp "tmpl" true in 
      let cmp = {sym=se;comp=comp} in
      let cmps = cmp::((!h).comps) in 
      (!h).comps <- cmps;
      ()

   let match_elem (tmpl:SymLib.symenv) (expr:SymLib.symenv) : unit =
      let handle_param_vars (v:SymLib.wctype) : SymLib.wctype = 
         let (id,name,excepts) = v in
         if (HWSymLib.wildtype_of_int id) = HWSymLib.Param then
            let nexcepts = excepts @ expr.vars in 
            (id,name,nexcepts)
         else
            (id,name,excepts)
      in
      let nwc = List.map tmpl.wildcards handle_param_vars in 
      let ntmpl : SymLib.symenv={
         ns=tmpl.ns;
         wildcards=nwc; 
         vars=tmpl.vars; 
         exprs=tmpl.exprs
      } in
      let env = SymLib.load_env None expr in
      SymCaml.set_debug env true;
      let env = SymLib.load_env (Some env) ntmpl in
      SymCaml.set_debug env false;
      SymLib.find_matches (Some env) ntmpl expr;
      ()

   let find (h:hsmatcher ref) (query:hwcomp) : unit = 
      let qsym : SymLib.symenv = HWSymLib.hwcomp2symenv query "qry" false in
      let match_all x = 
         let (name, _) = x.comp.id in
         Printf.printf "matching: %s\n" name; 
         match_elem x.sym qsym 
      in 
      let comps : hsentry list = (!h).comps in
      Printf.printf "%d elems\n" (List.length comps);
      List.iter comps match_all;
      Printf.printf "Finished: %d elems\n" (List.length comps);
      ()

   
end
