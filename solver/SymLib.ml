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
   val find_matches : SymCaml.symcaml option -> symenv -> symenv -> (((string*symexpr) list) list) option
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
            let _ = SymCaml.define_symbol e "t" in
            e
         | Some(x) -> x
      in
      let _ = List.iter (fun x -> let _ = SymCaml.define_symbol env x in ()) s.vars in
      let _ = List.iter (fun (i,x,v) -> let _ =  SymCaml.define_wildcard env x v in ()) s.wildcards in
      let _ = List.iteri (
         fun idx x -> 
            let nm = mangle_expr s.ns idx in 
            SymCaml.define_expr env nm x; ()
         ) s.exprs 
      in
      env

   let find_matches (e:SymCaml.symcaml option) (tmpl:symenv) (qry:symenv) : (((string*symexpr) list) list) option = 
      let env = match e with 
         |None -> 
            let w = load_env None tmpl in
            let e = load_env (Some w) qry in
            e
         |Some(e) -> e
      in
      let rec matches2str (lst:(string*symexpr) list): string =
         match lst with 
         | (name,e)::t ->name^" = "^(SymCaml.expr2py env e)^"\n"^(matches2str t)
         | [] -> ""
      in
      let proc i x j y = 
         let ni = mangle_expr qry.ns i in 
         let nj = mangle_expr tmpl.ns j in
         SymCaml.pattern env (Symbol ni) (Symbol nj)
      in
      let unify lst = 
         let rec _unify (lst: ('a option) list) : ('a list) option =
            match lst with 
            |Some(x)::t -> 
               begin
               match _unify t with 
                  | Some(l) -> Some(x::l)
                  | None -> None 
               end
            | None::t -> None
            |[] -> Some([])
         in 
         _unify lst 
      in
      let rec conc lst = 
         match lst with 
         |Some(x)::t -> x::(conc t)
         |None::t -> conc t
         | [] -> []
      in
      let twodlist = 
         (*TODO - find multiple arg use case*)
         conc (List.mapi (
         fun i x -> unify (List.mapi ( fun j y -> proc i x j y ) qry.exprs)
         ) tmpl.exprs)
      in
      let onedlist = List.fold_right (fun x r -> x @ r) twodlist [] in
      match onedlist with 
         | h::t -> Some(h::t)
         | [] -> None



   

end