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

module ConfigSearchGenerator : 
sig
   type cgen_entry = {
      sym : symenv;
      comp: hwcomp;
   }
   type cgen_result = {
      assigns: (hwliteral*(hwexpr)) list;
   }
   type cgen_entryresult = {
      results: cgen_result list;
      entry: cgen_entry;
   }
   type cgen_entryresults = {
      results: cgen_entryresult list
   }

   type cgen_searchspace = {
      mutable comps : cgen_entry list;
   }
   val init : unit -> cgen_searchspace 
   val add_comp : cgen_searchspace ref -> hwcomp -> unit
   val find : cgen_searchspace ref -> hwcomp -> cgen_entryresults option 
end = 
struct 

   type cgen_entry = {
      sym : symenv;
      comp: hwcomp;
   }

   type cgen_result = {
      assigns: (hwliteral*(hwexpr)) list;
   }
   type cgen_entryresult = {
      results: cgen_result list;
      entry: cgen_entry;
   }
   type cgen_entryresults = {
      results: cgen_entryresult list
   }

   type cgen_searchspace = {
      mutable comps : cgen_entry list;
   }
   
   let init () : cgen_searchspace= 
      let s = {comps=[]} in 
      s

   let results2str (r:cgen_entryresults) : string= 
      let spacing = "  " in
      let assign2str pfx (r:hwliteral*hwexpr):string = 
         let (lit,expr) = r in 
         pfx^(HWUtil.hwlit2str lit)^" = "^(HWUtil.hwexpr2str expr)
      in
      let result2str pfx idx (r:cgen_result) =
         let npfx = pfx^spacing in
         let wrap (x:hwliteral*hwexpr) (r:string) = 
            let s = assign2str npfx x in r^s^"\n" 
         in
         let results = List.fold_right wrap r.assigns "" in 
         pfx^"result "^(string_of_int idx)^":\n"^results
      in
      let comp2str pfx (c:cgen_entryresult) = 
         let npfx = pfx^spacing in
         let wrap (x:cgen_result) (v:int*string) =
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

   let add_comp (h:cgen_searchspace ref) (comp:hwcomp) : unit = 
      let se = HWSymLib.hwcomp2symenv comp "tmpl" true in 
      let cmp = {sym=se;comp=comp} in
      let cmps = cmp::((!h).comps) in 
      (!h).comps <- cmps;
      ()

   let match_elem (tmpl:symenv) (expr:symenv) : (((string*symexpr) list) list) option =
      let handle_wcs (v:wctype) (conc:symenv) : wctype = 
         let (id,name,excepts) = v in 
         let typ = HWSymLib.symvar2hwliteral name in 
         let filti x = match HWSymLib.symvar2hwliteral x with Current(x) -> true | _ -> false in 
         let filtv x = match HWSymLib.symvar2hwliteral x with Voltage(x) -> true | _ -> false in 
         let vvars = List.filter filtv conc.vars in
         let ivars = List.filter filti conc.vars in
         match typ with 
         | Current(x) -> (id,name,excepts@vvars)
         | Voltage(x) -> (id,name,excepts@ivars)
         | Parameter(x) -> (id,name,excepts@conc.vars)
      in
      let nwc = List.map (fun x -> handle_wcs x expr) tmpl.wildcards  in 
      let ntmpl : symenv={
         ns=tmpl.ns;
         wildcards=nwc; 
         vars=tmpl.vars; 
         exprs=tmpl.exprs
      } in
      let env = SymLib.load_env None expr in
      let env = SymLib.load_env (Some env) ntmpl in
      SymCaml.report env;
      let result = SymLib.find_matches (Some env) ntmpl expr in
      result
      
   let match_all (x:cgen_entry) qsym : cgen_entryresult option = 
      let rec conv_assign (x:(string*symexpr) list) : (hwliteral*hwexpr) list = 
         match x with 
         | (n,e)::t -> 
            let name = HWSymLib.symvar2hwliteral n in
            let expr = HWSymLib.symexpr2hwexpr e in
            (name,expr)::(conv_assign t)
         | [] -> []
      in
      let conv_assign2res (x:(string*symexpr) list) : cgen_result =
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
   

   let find (h:cgen_searchspace ref) (query:hwcomp) : cgen_entryresults option = 
      let qsym : symenv = HWSymLib.hwcomp2symenv query "qry" false in
      let comps : cgen_entry list = (!h).comps in
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
