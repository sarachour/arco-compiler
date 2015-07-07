open Sys
open Core
open Core.Std

open SymCaml
open SymLib
open GenericData
open HWData

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
      let se = SymLib.hwcomp2symenv comp true in 
      let cmp = {sym=se;comp=comp} in
      let cmps = cmp::((!h).comps) in 
      h := {comps=cmps};
      ()

   let find (h:hsmatcher ref) (query:hwcomp) : unit = 
      ()
end
