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
      let lits = lbl::(HWUtil.hwexpr2literals expr) in
      let get_vtype_from_one (x:hwliteral) (y:hwcomp) : (string*hwid) option = 
         let check_lst (fn:'a -> string) (name:string) (lst:'a list) : 'a option =
            let proc x r = 
               let cnm = fn x in 
               let isnm = (name = cnm) in
               if isnm then Some(x) else r
            in
            List.fold_right proc lst None
         in 
         let check_both x : (string*hwid) option = 
            let inp : ((string*hwid) option) = 
               check_lst (fun (a,b) -> a) x y.inputs in
            let outp : ((string*hwid) option) = 
               check_lst (fun (a,b) -> a) x y.outputs in
            match (inp,outp) with 
            |(Some(_,x),None) -> Some ("input",x)
            |(None,Some(_,x)) -> Some ("output",x)
            |(Some(_),Some(_)) -> raise (HWLibException "duplicate variable name.")
            |(None,None) -> None
         in
         match x with
         |Voltage(x) -> check_both x
         |Current(x) -> check_both x
         |Parameter(x) -> None
      in
      let get_vtype (lb:hwliteral) : (string*hwid) option = 
         let proc cmp r = match get_vtype_from_one lb cmp with 
         | Some x -> x::r 
         | None -> r
         in
         match List.fold_right proc tmpls [] with
            |[h] -> Some(h) 
            |[] -> 
               begin
               match lb with 
               | Parameter(x) -> None 
               | _ -> raise (HWLibException "not defined anywhere...")
               end 
            |h1::h2::t -> raise (HWLibException "too many declarations...")
      in 
      let t_lits = List.map (fun lb -> let ty = get_vtype lb in (lb,ty)) lits in 
      let t_ins = List.filter (fun (lb,d) -> match d with Some(t,h) -> t = "output" | _ -> false ) t_lits in
      let t_outs = List.filter (fun (lb,d) -> match d with Some(t,h) -> t = "input" | _ -> false ) t_lits in
      let t_params = List.filter (fun (lb,d) -> match lb with Parameter(x) -> true | _ -> false) t_lits in 
      let f_ins : (string*hwid) list= 
         List.map (fun (lb,d) -> match d with Some(x) -> x | _ -> raise (HWLibException "must have id.")) t_ins 
      in
      let f_outs : (string*hwid) list = 
         List.map (fun (lb,d) -> match d with Some(x) -> x | _ -> raise (HWLibException "must have id.")) t_outs
      in
      let f_params : hwparam list = 
         List.map (fun (lb,d) -> match lb with Parameter(x) -> (x,None) | _ -> raise (HWLibException "must be param.")) t_params
      in
      {
         inputs=f_ins;
         outputs=f_outs;
         params=f_params;
         constraints=[(Eq(Literal(lbl),expr))];
         id=("none",nullid)
      }

   (*
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
   *)
   let find_one (t:hwcomp) (g:goal) : goalnode =
      let tmpl = HWSymLib.hwcomp2symenv t "tmpl" true in 
      let expr = HWSymLib.hwcomp2symenv (g.value) "expr" false in 
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
      (*SymCaml.report env;*)
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
   (*
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
      let abslist = List.map (fun x -> match_all x qsym) comps in 
      let conclist = OptUtils.conc abslist in
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
   *)
end
