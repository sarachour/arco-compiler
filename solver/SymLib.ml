open SymCamlData
open SymCaml
open HWData
open Util
open GenericData

exception SymLibException of string;;

module SymLib:
sig
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: (int*string*(string list)) list;
      mutable exprs: symexpr list;
      ns: string
   }
   type wctype = int*string*(string list)
   val load_env : (SymCaml.symcaml option) -> symenv -> SymCaml.symcaml 
   val find_matches : SymCaml.symcaml option -> symenv -> symenv -> unit
end = 
struct
   type symenv = {
      mutable vars: string list; 
      mutable wildcards: (int*string*(string list)) list;
      mutable exprs: symexpr list;
      ns: string
   }
   type wctype = int*string*(string list)
   
   let mangle_expr ns idx =
      let delim1 = "|" in 
      let delim2 = "|" in
      ns^delim1^"expr"^delim2^(string_of_int idx)


   
   let load_env (w:SymCaml.symcaml option) (s:symenv) : SymCaml.symcaml =
      let env = match w with
         | None -> 
            let e = SymCaml.init() in
            let _ = SymCaml.clear e in
            SymCaml.define_symbol e "t";
            e
         | Some(x) -> x
      in
      List.iter (fun x -> SymCaml.define_symbol env x; ()) s.vars;
      List.iter (fun (i,x,v) -> SymCaml.define_wildcard env x v; ()) s.wildcards;
      List.iteri (
         fun idx x -> 
            let nm = mangle_expr s.ns idx in 
            SymCaml.define_expr env nm x; ()
         ) s.exprs;
      env

   let find_matches (e:SymCaml.symcaml option) (tmpl:symenv) (qry:symenv) : unit = 
      let env = match e with 
         |None -> 
            let w = load_env None tmpl in
            let e = load_env (Some w) qry in
            e
         |Some(e) -> e
      in
      SymCaml.report env;
      let proc i x j y = 
         let ni = mangle_expr qry.ns i in 
         let nj = mangle_expr tmpl.ns j in
         match SymCaml.pattern env (Symbol ni) (Symbol nj) with 
            | Some(x) -> Printf.printf "solution exists\n"
            | None -> Printf.printf "no solution\n"
      in
      List.iteri (
         fun i x ->
            List.iteri (
               fun j y ->
                  proc i x j y; ()
            ) tmpl.exprs 
      ) qry.exprs



   

end