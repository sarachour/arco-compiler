open Sys
open Core

open Util
open HwSlnData
open SymCamlData
open SymCaml
open SymLib
open GenericData
open HwData
open HwLib
open ConfigSearchDeriver

type symcaml = SymCaml.symcaml

exception GenerationException of string;;
(*
Given a set of components, it finds all possible combinations of assignments
that yields equivalent
*)

module ConfigSearchGenerator :
sig

   val find_one : hwcomp -> goal -> goalnode
   val find : hwcomp list -> goal -> goalnode
   val is_trivial :  goal -> goalnode option
   val hwexpr2comp : hwcomp list -> hwliteral -> hwexpr -> hwcomp
end =
struct
   type symexpr = SymCamlData.symexpr
   type hwexpr = HwData.hwexpr
   type symenv = SymLib.symenv
   type wctype = SymLib.wctype



   let rec hwexpr2comp (tmpls:hwcomp list) (lbl:hwliteral) (expr:hwexpr) =
      let is_comp (nm:string) =
         match List.filter (fun (x:hwcomp) -> x.name = nm) tmpls with
         | [] -> false
         | _ -> true
      in
      let rec flip_sym (x:hwsymbol) (doflip:bool): hwsymbol = match x with
         | Input(v) -> if doflip then Output(v) else x
         | Output(v) -> if doflip then Input(v) else x
      in
      let flip_expr (x:hwexpr) : hwexpr option = match x with
         | Literal(Var(p,x)) -> Some (Literal(Var(p,flip_sym x false)))
         | _ -> None
      in
      let lhs = Literal lbl in
      let rhs = expr in
      let nexpr = Eq(HwUtil.map2expr lhs flip_expr,HwUtil.map2expr rhs flip_expr) in
      let nports = HwUtil.hwrel2symbols nexpr in
      let nm = List.fold_right (fun (x:hwcomp) r-> r^"."^(x.name)) tmpls "interim" in
      let c = HwLib.HwComp.create nm in
        c.ports <- nports;
        c.relations <- [nexpr];
        c


   let get_trivial_solution (h:hwrel) : sln_action option =
      let rec gpd x =
        match x with Input(v) -> v | Output(v) -> v
      in
      match h with
      |Eq(Literal(Var(p1,x)), Literal(Var(p2,v))) ->
        if p1 == p2 then
          Some (DAddWire(x,v))
        else
          None
      (*Some (DSetPort(Current(x), Literal(Current(v))))*)
      |Eq(Integer(v), Literal(Var(p,x))) -> Some (DSetPort(p,gpd x, (float_of_int v)))
      |Eq(Literal(Var(p,x)),Integer(v)) -> Some (DSetPort(p,gpd x, (float_of_int v)))
      |Eq(Decimal(v),  Literal(Var(p,x))) -> Some (DSetPort(p,gpd x, (v)))
      |Eq(Literal(Var(p,x)),Decimal(v)) -> Some (DSetPort(p,gpd x, (v)))
      |Eq(_,_) -> None

   let is_trivial (g:goal) : goalnode option =
      let n = List.nth (g.value.relations) 0 in
      match get_trivial_solution n with
    		|Some(sol) -> Some (GTrivialNode(g,sol))
    		|None -> None


   let get_solution (tmpl:symenv) (expr:symenv) : (((string*symexpr) list) list) option =
	  let is_symexpr_trivial (s:symexpr) : bool =
		let hw = HwSymLib.symexpr2hwrel s in
		match get_trivial_solution hw with
		| Some(v) -> true
		| _ -> false
	  in
	  let max_depth = 3 in
      let rec _get_solution (depth:int) (tmpl:symenv) (expr:symenv) : (((string*symexpr) list) list) option=
		 if max_depth = depth then None else
         let matches : (((string*symexpr) list) list) option = SymLib.find_matches None tmpl expr is_symexpr_trivial in
         match matches with
            | Some(sol) ->
				let solve_one ((nm,assign):(string*symexpr)) : ((string*symexpr) list) list =
                  let new_tmpl = SymLib.add_wildcard_ban tmpl nm assign in
                  let s = _get_solution (depth+1) new_tmpl expr in
                  match s with
                  | Some(x) -> x
                  | None -> []
               in
               let solve_set  (lst:(string*symexpr) list) : ((string*symexpr) list) list=
                  List.fold_right (fun x r -> let arr = solve_one x in OptUtils.uniq (arr @ r)) lst []
               in
               let solve_sets (lst:((string*symexpr) list) list) =
                  List.fold_right (fun x r -> let sols = solve_set x in OptUtils.uniq (sols @ r)) lst []
               in
               let children = solve_sets sol in
                  begin
                  match (children,sol) with
                  |([],[]) -> None
                  |(a,b) -> Some (OptUtils.uniq (a @ b))
                  end
            | None ->
				None
      in
         let res = _get_solution 0 tmpl expr in
         res

   let find_one (t:hwcomp) (g:goal) : goalnode =
      match is_trivial g with
      | Some(x) -> x
      | None ->
         begin
         let tmpl = HwSymLib.hwcomp2symenv t true in
         let expr = HwSymLib.hwcomp2symenv (g.value) false in
	     let _ = Printf.printf "-> find_one %s\n" (t.name) in
         (*
            ban currents for voltages and voltages for currents. Constrain
            variables to follow analogy defined. Ban parameters from being assigned variables
         *)
         let handle_wcs (v:wctype) (conc:symenv) : wctype =
            let get_prop x = match x with Var(p,x) -> p in
            let str2var (x:string) : symexpr = Symbol(x) in
            let (name,excepts) = v in
            match HwSymLib.symvar2hwliteral name with
            | Var(p,x) ->
              let mismatch = List.filter (fun x -> let vx = HwSymLib.symvar2hwliteral x in (get_prop vx) != p) conc.vars in
              let bans = List.map str2var mismatch in
              (name, excepts@bans)
           | Param(p) ->
              raise (GenerationException "Parameter cannot be wildcard.")
         in
         let nwc = List.map (fun x -> handle_wcs x expr) tmpl.wildcards  in
         let ntmpl : symenv={
            ns=tmpl.ns;
            wildcards=nwc;
            vars=tmpl.vars;
            exprs=tmpl.exprs
         } in
         (*SymCaml.set_debug env true;*)
         let result : (((string*symexpr) list) list) option = get_solution ntmpl expr in
         match result with
            | Some(sol) ->
               let subgoals2nodelist (n,e) : goalnode=
                  let name = HwSymLib.symvar2hwliteral n in
                  let expr = HwSymLib.symexpr2hwexpr e in
                  let comp = hwexpr2comp [t] name expr in
                  let gl = GoalData.make_goal (Some name) comp in
                  GUnsolvedNode(gl)
               in
               let goals2nodelist lst  : goalnode=
                  let nlst = List.map subgoals2nodelist lst in
                  let dlt : sln_action = DUseComponent(HwUtil.mkcompid (t.name) None) in
                  GSolutionNode(g,dlt,nlst)
               in
               let nlst : goalnode list = List.map goals2nodelist sol in
               begin
               match nlst with
               | [h] -> h
               | h::t -> GMultipleSolutionNode(g,h::t)
               | [] -> GNoSolutionNode(g)
               end
            | None -> GNoSolutionNode(g)
         end


   let find (t:hwcomp list) (g:goal) : goalnode =
      let clump_goals (c:hwcomp) (y:goalnode) : goalnode =
         let x : goalnode = find_one c g in

         match (x,y) with
         | (GMultipleSolutionNode(_,lst1),GMultipleSolutionNode(_,lst2)) ->
            GMultipleSolutionNode(g,lst1 @ lst2)
         | (x, GNoSolutionNode(_)) -> x
         | (GNoSolutionNode(_),x) -> x
         | (GNoSolutionNode(_),GNoSolutionNode(_)) -> GNoSolutionNode(g)
         | (x, GMultipleSolutionNode(_,lst)) -> GMultipleSolutionNode(g,x::lst)
         | (GMultipleSolutionNode(_,lst),x)  -> GMultipleSolutionNode(g,x::lst)
         | (x,y) -> GMultipleSolutionNode(g,[x;y])
      in
      let search_sol = List.fold_right clump_goals t (GNoSolutionNode g) in
      search_sol

end
