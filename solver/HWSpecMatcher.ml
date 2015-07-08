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
type symexpr = SymCamlData.symexpr
type hwexpr = HWData.hwexpr 
type symenv = SymLib.symenv
type wctype = SymLib.wctype

module HWSpecMatcher : 
sig
   type hmentry = {
      sym : symenv;
      comp: hwcomp;
   }
   type hmresult = {
      assigns: (hwliteral*(hwexpr)) list;
   }
   type hmentryresult = {
      results: hmresult list;
      entry: hmentry;
   }
   type hmentryresults = {
      results: hmentryresult list
   }

   type hsmatcher = {
      mutable comps : hmentry list;
   }
   val init : unit -> hsmatcher 
   val add_comp : hsmatcher ref -> hwcomp -> unit
   val find : hsmatcher ref -> hwcomp -> hmentryresults option 
end = 
struct 

   type hmentry = {
      sym : symenv;
      comp: hwcomp;
   }

   type hmresult = {
      assigns: (hwliteral*(hwexpr)) list;
   }
   type hmentryresult = {
      results: hmresult list;
      entry: hmentry;
   }
   type hmentryresults = {
      results: hmentryresult list
   }

   type hsmatcher = {
      mutable comps : hmentry list;
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

   let match_elem (tmpl:symenv) (expr:symenv) : (((string*symexpr) list) list) option =
      let handle_param_vars (v:wctype) : wctype = 
         let (id,name,excepts) = v in
         if (HWSymLib.wildtype_of_int id) = HWSymLib.Param then
            let nexcepts = excepts @ expr.vars in 
            (id,name,nexcepts)
         else
            (id,name,excepts)
      in
      let nwc = List.map tmpl.wildcards handle_param_vars in 
      let ntmpl : symenv={
         ns=tmpl.ns;
         wildcards=nwc; 
         vars=tmpl.vars; 
         exprs=tmpl.exprs
      } in
      let env = SymLib.load_env None expr in
      SymCaml.set_debug env true;
      let env = SymLib.load_env (Some env) ntmpl in
      SymCaml.set_debug env false;
      SymLib.find_matches (Some env) ntmpl expr 
      
   let match_all (x:hmentry) qsym : hmentryresult option = 
      let rec conv_assign (x:(string*symexpr) list) : (hwliteral*hwexpr) list = 
         match x with 
         | h::t -> conv_assign t 
         | [] -> []
      in
      let conv_assign2res (x:(string*symexpr) list) : hmresult =
         let l = conv_assign x in 
         {assigns=l} 
      in
      let (name, _) = x.comp.id in
      Printf.printf "matching: %s\n" name; 
      match match_elem x.sym qsym with
         | Some(res) -> 
            let all_assigns = List.map res conv_assign2res  in 
            Some({entry=x; results=all_assigns})
         | None -> None
   

   let find (h:hsmatcher ref) (query:hwcomp) : hmentryresults option = 
      let qsym : symenv = HWSymLib.hwcomp2symenv query "qry" false in
      let comps : hmentry list = (!h).comps in
      let rec conc l = match l with 
         |Some(x)::t -> x::(conc t) 
         |None::t -> (conc t)
         |[] -> [] 
      in
      let abslist = List.map comps (fun x -> match_all x qsym) in 
      let conclist = conc abslist in
      match conclist with
         |h::t -> Some({results=h::t})
         |[] -> None 

   
end
