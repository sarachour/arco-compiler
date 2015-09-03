open Sys
open Core

open Util
open SymCamlData
open SymCaml
open SymLib
open GenericData
open HWData
open HWLib
open ConfigSearchDeriver 

type symcaml = SymCaml.symcaml

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
   type hwexpr = HWData.hwexpr 
   type symenv = SymLib.symenv
   type wctype = SymLib.wctype

   

   let rec hwexpr2comp (tmpls:hwcomp list) (lbl:hwliteral) (expr:hwexpr) =
      let is_comp (nm:string) = 
         match List.filter (fun (x:hwcomp) -> x.ns = nm) tmpls with 
         | [] -> false 
         | _ -> true
      in
      let rec flip_sym (x:hwsymbol) (doflip:bool): hwsymbol = match x with 
         | Input(v) -> if doflip then Output(v) else x 
         | Output(v) -> if doflip then Input(v) else x
         | Param(v) -> Param(v)
         | FixedParam(v,n) -> FixedParam(v,n)
         | Namespace(ns,v) -> let iscmp = is_comp ns in
            Namespace(ns,flip_sym v iscmp)
      in
      let flip_expr (x:hwexpr) : hwexpr option = match x with 
         | Literal(Voltage(x)) -> Some (Literal(Voltage(flip_sym x false)))
         | Literal(Current(x)) -> Some (Literal(Current(flip_sym x false)))
         | _ -> None
      in
      let lhs = Literal lbl in 
      let rhs = expr in 
      let nexpr = Eq(HWUtil.map2expr lhs flip_expr,HWUtil.map2expr rhs flip_expr) in 
      let nports = HWUtil.hwrel2symbols nexpr in 
      let nm = List.fold_right (fun (x:hwcomp) r-> r^"."^(x.ns)) tmpls "interim" in 
      let c = {
         ports=nports;
         constraints=[nexpr];
         ns=nm
      } 
      in 
      c


   let get_trivial_solution (h:hwrel) : delta option =
	match h with
		|Eq(Literal(Voltage(x)), Literal(Voltage(v))) -> Some (DSetPort(Voltage(x), Literal(Voltage(v))))
		|Eq(Literal(Current(x)), Literal(Current(v))) -> Some (DSetPort(Current(x), Literal(Current(v))))
		|Eq(Integer(v), Literal(x)) -> Some (DSetPort(x, Integer(v)))
		|Eq(Literal(x),Integer(v)) -> Some (DSetPort(x, Integer(v)))
		|Eq(Decimal(v), Literal(x)) -> Some (DSetPort(x, Decimal(v)))
		|Eq(Literal(x),Decimal(v)) -> Some (DSetPort(x, Decimal(v)))
		|Eq(_,_) -> None
		
   let is_trivial (g:goal) : goalnode option = 
      let n = List.nth (g.value.constraints) 0 in
      match get_trivial_solution n with
		|Some(sol) -> Some (GTrivialNode(g,sol))
		|None -> None
     

   let get_solution (tmpl:symenv) (expr:symenv) : (((string*symexpr) list) list) option = 
	  let is_symexpr_trivial (s:symexpr) : bool = 
		let hw = HWSymLib.symexpr2hwrel s in 
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
         let tmpl = HWSymLib.hwcomp2symenv t true in 
         let expr = HWSymLib.hwcomp2symenv (g.value) false in 
	     let _ = Printf.printf "-> find_one %s\n" (t.ns) in
         (*
            ban currents for voltages and voltages for currents. Constrain
            variables to follow analogy defined. Ban parameters from being assigned variables
         *)
         let handle_wcs (v:wctype) (conc:symenv) : wctype = 
            let (name,excepts) = v in 
            let typ = HWSymLib.symvar2hwliteral name in 
            let filti x = 
               match HWSymLib.symvar2hwliteral x with 
                  Current(x) -> true 
                  | _ -> false 
            in 
            let filtv x = 
               match HWSymLib.symvar2hwliteral x with 
                  Voltage(x) -> true 
                  | _ -> false 
            in 
            let filtvar x = 
               match HWSymLib.symvar2hwliteral x with 
               | Voltage(Param(_)) -> false 
               | Current(Param(_)) -> false 
               | Voltage(FixedParam(_,_)) -> false 
               | Current(FixedParam(_,_)) -> false 
               | _ -> true 
            in
            let rec is_param x = match x with 
               | Param(_) -> true 
               | FixedParam(_) -> true
               | Namespace(v,x) -> is_param x 
               | _ -> false 
            in
            let str2var (x:string) : symexpr = Symbol(x) in
            let vvars :symexpr list = List.map str2var (List.filter filtv conc.vars) in
            let ivars :symexpr list = List.map str2var (List.filter filti conc.vars) in
            let wcvars = List.map str2var (List.filter filtvar conc.vars) in
            match typ with 
            | Current(x) -> 
               if is_param x 
               then (name,excepts@vvars@wcvars)
               else (name,excepts@vvars)
            | Voltage(x) -> 
               if is_param x 
               then (name,excepts@ivars@wcvars)
               else (name,excepts@ivars)
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
                  let name = HWSymLib.symvar2hwliteral n in
                  let expr = HWSymLib.symexpr2hwexpr e in
                  let comp = hwexpr2comp [t] name expr in
                  let gl = GoalData.make_goal (Some name) comp in
                  GUnsolvedNode(gl) 
               in
               let goals2nodelist lst  : goalnode= 
                  let nlst = List.map subgoals2nodelist lst in 
                  let dlt : delta = DUseComponent(t) in
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
