open Sys
open Core

open Util
open SymCaml
open SymLib
open GenericData
open HWData
open HWLib
open ConfigSearchDeriver 

(*
Given a set of components, it finds all possible combinations of assignments
that yields equivalent 
*)

module ConfigSearchGenerator : 
sig
   type goal = ConfigSearchDeriver.goal
   type goalnode = ConfigSearchDeriver.goalnode

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
   type goal = ConfigSearchDeriver.goal
   type goalnode = ConfigSearchDeriver.goalnode
   type delta = ConfigSearchDeriver.delta

   

   let rec hwexpr2comp (tmpls:hwcomp list) (lbl:hwliteral) (expr:hwexpr) =
      let rec flip_sym (x:hwsymbol): hwsymbol = match x with 
         | Input(v) -> Output(v)
         | Output(v) -> Input(v)
         | Param(v) -> Param(v)
         | FixedParam(v,n) -> FixedParam(v,n)
         | Namespace(ns,v) -> Namespace(ns,flip_sym v)
      in
      let flip_expr (x:hwexpr) : hwexpr option = match x with 
         | Literal(Voltage(x)) -> Some (Literal(Voltage(flip_sym x)))
         | Literal(Current(x)) -> Some (Literal(Current(flip_sym x)))
         | _ -> None
      in
      let lhs = Literal lbl in 
      let rhs = expr in 
      let nexpr = Eq(HWUtil.map2expr lhs flip_expr,rhs) in 
      let nports = HWUtil.hwrel2symbols nexpr in 
      let nm = List.fold_right (fun (x:hwcomp) r-> r^"."^(x.ns)) tmpls "interim" in 
      let c = {
         ports=nports;
         constraints=[nexpr];
         ns=nm
      } 
      in 
      c
   (*
      let lits = lbl::(HWUtil.hwexpr2literals expr) in
      let get_vtype_from_one (x:hwliteral) (ns:string) (y:hwcomp) : (string*(string*hwid)) option = 
         let check_lst (fn:'a -> string) (name:string) (lst:'a list) : 'a option =
            let proc x r = 
               let cnm = fn x in 
               let isnm = (name = cnm) in
               if isnm then Some(x) else r
            in
            List.fold_right proc lst None
         in 
         let check_both name : (string*(string*hwid)) option = 
            let inp : ((string*hwid) option) = 
               check_lst (fun (tag,b) -> HWSymLib.symbolname2ns ns tag) name y.inputs in
            let outp : ((string*hwid) option) = 
               check_lst (fun (tag,b) -> HWSymLib.symbolname2ns ns tag) name y.outputs in
            match (inp,outp) with 
            |(Some(x),None) -> Some ("input",x)
            |(None,Some(x)) -> Some ("output",x)
            |(Some(_),Some(_)) -> raise (HWLibException "duplicate variable name.")
            |(None,None) -> None
         in
         match x with
         |Voltage(x) -> check_both x
         |Current(x) -> check_both x
         |Parameter(x) -> None
      in
      let get_vtype (lb:hwliteral) : (string*(string*hwid)) option = 
         let proc c = let (ns,cmp) = c in get_vtype_from_one lb ns cmp in 
         match OptUtils.conc (List.map proc tmpls) with
            |[h] -> Some(h) 
            |[] -> 
               begin
               match lb with 
               | Parameter(x) -> None 
               | _ -> raise (HWLibException "not defined anywhere...")
               end 
            |h1::h2::t -> raise (HWLibException (
               "too many declarations: "^
               (List.fold_right (fun (t,(name,id)) r -> r^","^name ) (h1::h2::t) ""))
            )
      in 
      Printf.printf "--- COMPS ---\n%s\n--------\n"  
         (List.fold_right ( fun (v,x) r -> r^v^":"^(HWComp.comp2str x) ) tmpls "" );
      let t_lits : (hwliteral*((string*(string*hwid))) option) list = 
         List.map (fun lb -> let ty = get_vtype lb in (lb,ty)) lits in 
      let t_ins = 
         List.filter (fun (lb,d) -> match d with Some(t,h) -> t = "output" | _ -> false ) t_lits 
      in
      let t_outs = 
         List.filter (fun (lb,d) -> match d with Some(t,h) -> t = "input" | _ -> false ) t_lits 
      in
      let t_params = 
         List.filter (fun (lb,d) -> match lb with Parameter(x) -> true | _ -> false) t_lits 
      in 
      let f_ins : (string*hwid) list= 
         List.map (
            fun (lb,d) -> 
            match d with Some(ty,(lbl,id)) -> (lbl,id) 
            | _ -> raise (HWLibException "must have id.")
         ) t_ins 
      in
      let f_outs : (string*hwid) list = 
         List.map (
            fun (lb,d) -> 
            match d with Some(ty,(lbl,id)) -> (lbl,id) 
            | _ -> raise (HWLibException "must have id.")
         ) t_outs 
      in
      let f_params : hwparam list = 
         List.map (fun (lb,d) -> match lb with Parameter(x) -> (x,None) | _ -> raise (HWLibException "must be param.")) t_params
      in
      let c = {
         inputs=f_ins;
         outputs=f_outs;
         params=f_params;
         constraints=[HWSymLib.rmns4rel (Eq(Literal(lbl),expr))];
         id=("none",nullid)
      } 
      in 
      Printf.printf  "%s\n" (HWComp.comp2str c);
      c
   *)

   let is_trivial (g:goal) : goalnode option = 
      match List.nth (g.value.constraints) 0 with 
         |Eq(Literal(x),Literal(v)) -> Some GTrivialNode 
         |Eq(Literal(x),Integer(v)) -> Some GTrivialNode 
         |Eq(Literal(x),Decimal(v)) -> Some GTrivialNode 
         | _ -> None

   let find_one (t:hwcomp) (g:goal) : goalnode =
      match is_trivial g with
      | Some(x) -> x 
      | None -> 
         begin
         let tmpl = HWSymLib.hwcomp2symenv t true in 
         let expr = HWSymLib.hwcomp2symenv (g.value) false in 
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
         let result : (((string*symexpr) list) list) option= SymLib.find_matches (Some env) ntmpl expr in
         match result with
            | Some(sol) ->
               let subgoals2nodelist (n,e) : goalnode= 
                  let name = HWSymLib.symvar2hwliteral n in
                  let expr = HWSymLib.symexpr2hwexpr e in
                  let comp = hwexpr2comp [t;g.value] name expr in
                  let gl = ConfigSearchDeriver.make_goal (Some name) comp in
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
               | h::t -> GMultipleSolutionNode(h::t)
               | [] -> GNoSolutionNode
               end
            | None -> GNoSolutionNode
         end


   let find (t:hwcomp list) (g:goal) : goalnode =
      let clump_goals (c:hwcomp) (y:goalnode) : goalnode = 
         let x : goalnode = find_one c g in 
         match (x,y) with
         | (GMultipleSolutionNode(lst1),GMultipleSolutionNode(lst2)) ->
            GMultipleSolutionNode(lst1 @ lst2)
         | (x, GNoSolutionNode) -> x
         | (GNoSolutionNode,x) -> x 
         | (GNoSolutionNode,GNoSolutionNode) -> GNoSolutionNode
         | (x, GMultipleSolutionNode(lst)) -> GMultipleSolutionNode(x::lst)
         | (GMultipleSolutionNode(lst),x)  -> GMultipleSolutionNode(x::lst)
         | (x,y) -> GMultipleSolutionNode([x;y])
      in
      let search_sol = List.fold_right clump_goals t GNoSolutionNode in 
      search_sol
   
end
