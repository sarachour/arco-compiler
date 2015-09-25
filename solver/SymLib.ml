open SymCamlData
open SymCaml
open HwData
open Util
open GenericData

exception SymLibException of string;;

module SymLib:
sig
   type symenv = {
      mutable vars: string list;
      mutable wildcards: (string*(symexpr list)) list;
      mutable exprs: symexpr list;
      ns: string
   }
   type wctype = string*(symexpr list)
   val create_env : unit -> symenv
   val load_env : (SymCaml.symcaml option) -> symenv -> SymCaml.symcaml
   val add_wildcard_ban : symenv -> string -> symexpr -> symenv
   val has_wildcard : symenv -> string -> bool
   val has_var : symenv -> string -> bool
   val find_matches : SymCaml.symcaml option -> symenv -> symenv -> (symexpr -> bool) -> (((string*symexpr) list) list) option
end =
struct
   type symenv = {
      mutable vars: string list;
      mutable wildcards: (string*(symexpr list)) list;
      mutable exprs: symexpr list;
      ns: string
   }
   type wctype = string*(symexpr list)
   let mangle_expr ns idx =
      let delim1 = "$" in
      let delim2 = "|" in
      ns^delim1^"expr"^delim2^(string_of_int idx)

   let add_wildcard_ban (s:symenv) (name:string) (exp:symexpr) =
      let rec _add_ban (wcs: wctype list)  : wctype list=
         match wcs with
            | (s,e)::t ->
               if s = name
               then (s,exp::e)::t
               else (s,e)::(_add_ban t)
            | [] -> []
      in
         let wcs = _add_ban s.wildcards in
         (*List.iter (fun (s,e) -> Printf.printf "%s=%d\n" s (List.length e) ) s.wildcards;*)
         {vars=s.vars; wildcards=wcs; exprs=s.exprs; ns=s.ns}

   let has_wildcard (s:symenv) (n:string) =
      match List.filter (fun (x,z) -> x = n) s.wildcards with
      | h::t -> true
      | [] -> false

   let has_var (s:symenv) (n:string) =
      match List.filter (fun x -> x = n) s.vars with
      | h::t -> true
      | [] -> false


   let create_env () = raise (SymLibException "create_env : Unimplemented")

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
      let _ = List.iter (fun (x,v) -> let _ =  SymCaml.define_wildcard env x v in ()) s.wildcards in
      let _ = List.iteri (
         fun idx x ->
            let nm = mangle_expr s.ns idx in
            SymCaml.define_expr env nm x; ()
         ) s.exprs
      in
      env

   let find_matches (e:SymCaml.symcaml option) (tmpl:symenv) (qry:symenv) (is_trivial:symexpr->bool)
   : (((string*symexpr) list) list) option =
      let env = match e with
         |None ->
            let e = load_env None qry in
            let e = load_env (Some e) tmpl in
            e
         |Some(e) -> e
      in
      let proc i x j y : ((string*symexpr) list) option =
         let ni = mangle_expr qry.ns i in
         let nj = mangle_expr tmpl.ns j in
         match SymCaml.pattern env (Symbol ni) (Symbol nj) with
         | Some(sols) ->
			begin
            let sb (idx:int) ((a,b):string*symexpr)  : symexpr*symexpr =
				match b with
				| Decimal(v) -> ((Symbol a),b)
				| Integer(v) -> ((Symbol a),b)
				| _ -> (Symbol a, Symbol a)
            in
            let simpl ((a,b):string*symexpr) : string*symexpr =
				let sb = SymCaml.simpl env b in
				(a,sb)
			in
			let sols =  List.map simpl sols in
            let sbs :(symexpr*symexpr) list = List.mapi sb sols in
            (* substitute *)
            let sexpr = SymCaml.subs env (Symbol nj) sbs in
			let simpl_expr = SymCaml.simpl env sexpr in
			if is_trivial simpl_expr then
				None
			else
				Some sols
            end
         | None -> None
      in
      let twodlist =
         let unify_exprs i x =
			let ures = List.mapi ( fun j y -> proc i x j y ) tmpl.exprs in
			let res = OptUtils.unify_all ures in
			res
		 in
		 let ures = List.mapi unify_exprs qry.exprs in
		 let res = OptUtils.conc ures in
		 res
      in
      let onedlist = List.fold_right (fun x r -> x @ r) twodlist [] in
      match onedlist with
         | h::t -> Some(h::t)
         | [] -> None





end
