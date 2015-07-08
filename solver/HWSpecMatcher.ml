open Sys
open Core

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

   let results2str (r:hmentryresults) : string= 
      let spacing = "  " in
      let assign2str pfx (r:hwliteral*hwexpr):string = 
         let (lit,expr) = r in 
         pfx^(HWUtil.hwlit2str lit)^" = "^(HWUtil.hwexpr2str expr)
      in
      let result2str pfx idx (r:hmresult) =
         let npfx = pfx^spacing in
         let wrap (x:hwliteral*hwexpr) (r:string) = 
            let s = assign2str npfx x in r^s^"\n" 
         in
         let results = List.fold_right wrap r.assigns "" in 
         pfx^"result "^(string_of_int idx)^":\n"^results
      in
      let comp2str pfx (c:hmentryresult) = 
         let npfx = pfx^spacing in
         let wrap (x:hmresult) (v:int*string) =
            let (i,r) = v in 
            let s = result2str npfx i x in (i+1,r^s)
         in
         let (_,results) = List.fold_right wrap c.results (0,"") in
         let (n,id) = c.entry.comp.id in
         pfx^"comp "^n^" ("^(HWUtil.hwid2str id)^"):\n"^results^"\n"
      in
      let wrap x r = 
         let s = comp2str "" x in 
         r^s 
      in
      List.fold_right wrap r.results ""

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
      let nwc = List.map handle_param_vars tmpl.wildcards  in 
      let ntmpl : symenv={
         ns=tmpl.ns;
         wildcards=nwc; 
         vars=tmpl.vars; 
         exprs=tmpl.exprs
      } in
      let env = SymLib.load_env None expr in
      let env = SymLib.load_env (Some env) ntmpl in
      SymLib.find_matches (Some env) ntmpl expr 
      
   let match_all (x:hmentry) qsym : hmentryresult option = 
      let rec conv_assign (x:(string*symexpr) list) : (hwliteral*hwexpr) list = 
         match x with 
         | (n,e)::t -> 
            let name = HWSymLib.symvar2hwliteral n in
            let expr = HWSymLib.symexpr2hwexpr e in
            (name,expr)::(conv_assign t)
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
            let all_assigns = List.map conv_assign2res res in 
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
      let abslist = List.map (fun x -> match_all x qsym) comps in 
      let conclist = conc abslist in
      match conclist with
         |h::t ->
            begin
            let res = {results=h::t} in
            Printf.printf "%s\n" (results2str res);
            Some(res)
            end
         |[] -> 
            begin
            Printf.printf "No Results..\n";
            None 
            end
   
end
