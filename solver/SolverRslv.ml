
open HWCstr
open Util
open SolverData
open SolverUtil

module HwConnRslvr =
struct

  type instinfo = {
      id: int;
      mutable cinsts: int set;
      mutable sinsts: int set;
  }


  type sateqn =
    |And of sateqn*sateqn
    |Or of sateqn*sateqn
    |Var of string
    |Int of int
    |Not of sateqn
    |Plus of sateqn*sateqn
    |IfThenElse of sateqn*sateqn*sateqn
    |Eq of sateqn*sateqn

  let sateqn2str x =
    let rec _s x = match x with
    | And(a,b) -> "(and "^(_s a)^" "^(_s b)^")"
    | Or(a,b) -> "(or "^(_s a)^" "^(_s b)^")"
    | Eq(a,b) -> "(= "^(_s a)^" "^(_s b)^")"
    | Not(a) -> "(not "^(_s a)^")"
    | Plus(a,b) -> "(+ "^(_s a)^" "^(_s b)^")"
    | IfThenElse(a,b,c) -> "(ite "^(_s a)^" "^(_s b)^" "^(_s c)^")"
    | Var(v) -> "v"^v
    | Int(i) -> string_of_int i
    | _ -> ""
    in
    _s x

  let fn_all (x:sateqn list) (fxn)=
      match x with
      | h::h2::t -> List.fold_right fxn (h2::t) h
      | [h] -> h
      | [] -> error "and_all" "failure"

  let add_all (x) =
    fn_all x (fun x r -> And(x,r))

  let or_all (x:sateqn list) =
    fn_all x (fun x r -> Or(x,r))

  let plus_all (x:sateqn list) =
    fn_all x (fun x r -> Plus(x,r))


  let mkinstinfo n =
    {id=n; cinsts = SET.make (fun x y -> x =y ); sinsts = SET.make (fun x y -> x = y)}


  let is_valid cfg sol =
    let kind_map : (string,instinfo) map= MAP.make() in
    let sol_conns : (wireid, wireid set) map = sol.conns in
    let cstr_conns : (string*string,hcconn) map = cfg.hw.cstr.conns in
    let mkvar name =
      if MAP.has kind_map name = false then
        let v = List.length (MAP.to_values kind_map) in
        let iifo = mkinstinfo v in
        let _ = MAP.put kind_map name iifo in
        ()
      else
        ()
    in
    let toid id = id + 1 in
    let declvar (name:string) id (cstr:bool)=
      let _ = mkvar (name) in
      let ifo = MAP.get kind_map name in
      if cstr then
        let _ = (ifo.cinsts <- SET.add ifo.cinsts (toid id)) in
        ()
      else
        let _ = (ifo.sinsts <- SET.add ifo.sinsts (toid id)) in
        ()
    in
    let tovar (name:string) (id) =
      let ifo = MAP.get kind_map name in
      (string_of_int ifo.id)^"_"^(string_of_int (id))
    in
    let towvar ((u,p,i):string*string*int) =
      (tovar (u) i)^"_"^p
    in
    let toconnvar (a) (b) =
      (towvar a)^"_"^(towvar b)
    in
    let decl_conns  (src:wireid) (dest:wireid) : (string list)*(sateqn list) =
      let sc,si,sp = src in
      let dc,di,dp = dest in
      let sc : string = UnivLib.unodeid2name sc in
      let dc : string = UnivLib.unodeid2name dc in
      let res = match MAP.get cstr_conns (sc,sp) with
      | HCConnLimit(dests) ->
        if MAP.has dests (dc,dp) = false
        then
          let _ = Printf.printf "impossible connection\n" in
          ([],[])
        else
          let ipairs = MAP.get dests (dc,dp) in
          if SET.size ipairs = 0 then ([],[]) else
          let res = SET.fold ipairs (fun (cstr_si,cstr_di) (decl_list,eqn_list)->
            let cv = toconnvar (sc,sp,toid cstr_si) (dc,dp,toid cstr_di) in
            let src = tovar sc (toid cstr_si) in
            let dest = tovar dc (toid cstr_di) in
            let lim_eqn = IfThenElse(And(Var(cv), And( Eq(Var(src),Int(toid si)), Eq(Var(dest), Int(toid di)) ) ), Int(1),Int(0)) in
            (cv::decl_list, lim_eqn::eqn_list)
          ) ([],[]) in
          res
      | HCConnNoLimit -> error "decl_conns" "cannot handle limitless component"
      in
      res
    in

    let tosmt () =
      let mapc fn ic = MAP.fold kind_map (fun name iifo r -> SET.fold iifo.cinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let maps fn ic = MAP.fold kind_map (fun name iifo r -> SET.fold iifo.sinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let decls = mapc (fun n i ifo r -> r^"(declare-const "^(sateqn2str (Var (tovar n i)))^" Int)\n") "" in
      (*make the clause that forces one assignment*)
      let cstr_mustmaptosln : sateqn list = mapc (fun name inst ifo r ->
          let cid = tovar name inst in
          let eqs = SET.fold ifo.sinsts (fun j lst -> Eq(Var(cid),Int(j))::lst) [Eq(Var(cid),Int(0))] in
            (or_all eqs)::r) []
      in
      let exactly_one_sln : sateqn list = maps (fun name inst ifo lst ->
        let indep: sateqn list = SET.fold ifo.cinsts (fun j lst ->
          let cid = tovar name j in
          IfThenElse( Eq(Var(cid),Int(inst)),Int(1),Int(0))::lst
        ) [] in
        Eq(plus_all indep, Int(1))::lst
      ) []
      in
      let _ = Printf.printf "%s\n" decls in
      let _ = List.iter (fun q -> Printf.printf "(assert %s)\n" (sateqn2str q)) cstr_mustmaptosln in
      let _ = List.iter (fun (q:sateqn) -> Printf.printf "(assert %s)\n" (sateqn2str q)) exactly_one_sln in
      let _ = MAP.iter sol_conns (fun sln_src dests ->
        let _ = SET.iter dests (
           fun sln_dest ->
           let decls,cstrs = decl_conns sln_src sln_dest in
           if List.length cstrs > 0 then
             let _ = List.iter (fun q -> let _ =  Printf.printf "(declare-const %s Bool)\n" (sateqn2str (Var q)) in ()) decls in
             let ncstr = Eq(plus_all cstrs, Int 1) in 
             let _ = Printf.printf "(assert %s)\n" (sateqn2str ncstr) in
             ()
           else
             let _ = Printf.printf "(assert false)\n" in
             ()
        ) in
        ()
      ) in
      ()
    in
    let sol_cmps : (unodeid,(int set)*int) map = sol.comps in
    let cstr_cmps : (string,hcinst) map= cfg.hw.cstr.insts in
    let _ = MAP.iter sol_cmps (fun k (v,cnt) -> SET.iter v (fun x  -> declvar (UnivLib.unodeid2name k) x false) ) in
    let _ = MAP.iter cstr_cmps (fun k q -> List.iter (fun x -> declvar k x true) (LIST.mkrange 0 (q)) ) in
    let _ = tosmt () in
    true

end


module HwErrRslvr =
struct

  let is_valid cfg sln =
    true

end
