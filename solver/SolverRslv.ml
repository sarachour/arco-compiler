
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
  type conninfo = {
    id: int;
  }

  type sateqn =
    |And of sateqn*sateqn
    |Or of sateqn*sateqn
    |Var of string
    |Int of int
    | Not of sateqn
    |Eq of sateqn*sateqn

  let sateqn2str x =
    let rec _s x = match x with
    | And(a,b) -> "(and "^(_s a)^" "^(_s b)^")"
    | Or(a,b) -> "(or "^(_s a)^" "^(_s b)^")"
    | Eq(a,b) -> "(= "^(_s a)^" "^(_s b)^")"
    | Not(a) -> "(not "^(_s a)^")"
    | Var(v) -> v
    | Int(i) -> string_of_int i
    | _ -> ""
    in
    _s x

  let and_all (x:sateqn list) =
      match x with
      | h::h2::t -> List.fold_right (fun x r -> And(x,r)) (h2::t) h
      | [h] -> h
      | [] -> error "and_all" "failure"

  let or_all (x:sateqn list) =
      match x with
      | h::h2::t -> List.fold_right (fun x r -> Or(x,r)) (h2::t) h
      | [h] -> h
      | [] -> error "and_all" "failure"

  let mkinstinfo n =
    {id=n; cinsts = SET.make (fun x y -> x =y ); sinsts = SET.make (fun x y -> x = y)}

  let is_valid cfg sol =
    let kind_map : (string,instinfo) map= MAP.make() in
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
      "x"^(string_of_int ifo.id)^"x"^(string_of_int (id))
    in
    let towvar ((u,i,p):wireid) =
      (tovar (UnivLib.unodeid2name u) i)^"x"^p
    in
    let toconnvar (a:wireid) (b:wireid) =
      (towvar a)^"_"^(towvar b)
    in
    let tosmt () =
      let mapc fn ic = MAP.fold kind_map (fun name iifo r -> SET.fold iifo.cinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let maps fn ic = MAP.fold kind_map (fun name iifo r -> SET.fold iifo.sinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let decls = mapc (fun n i ifo r -> r^"(declare-const "^(tovar n i)^" Int)\n") "" in
      (*make the clause that forces one assignment*)
      let slntocstr_asserts : sateqn list = mapc (fun name inst ifo r ->
          let cid = tovar name inst in
          let eqs = SET.fold ifo.sinsts (fun j lst -> Eq(Var(cid),Int(j))::lst) [Eq(Var(cid),Int(0))] in
            (or_all eqs)::r) []
      in
      (*
      let onlyonesln_asserts : sateqn list = mapc (fun name inst ifo r ->
          let c1id = tovar name inst in
          let eqs : sateqn list = SET.fold ifo.cinsts (fun j lst ->
            let c2id = tovar name j in
            Or( Eq(Var(c1id),Int(0)), Not(Eq(Var(c1id),Var(c2id))) )::lst
          ) r in
          eqs @ r
      ) []
      *)
      let at_least_one_sln : sateqn list = maps (fun name inst ifo lst ->
        let indep: sateqn list = SET.fold ifo.cinsts (fun j lst ->
          let cid = tovar name j in
          Eq(Var(cid),Int(inst))::lst
        ) [] in
        (or_all indep)::lst
      ) []
      in
      let _ = Printf.printf "%s\n" decls in
      let _ = List.iter (fun q -> Printf.printf "(assert %s)\n" (sateqn2str q)) slntocstr_asserts in
      let _ = List.iter (fun (q:sateqn) -> Printf.printf "(assert %s)\n" (sateqn2str q)) at_least_one_sln in
      ()
    in

    let sol_cmps : (unodeid,(int set)*int) map = sol.comps in
    let sol_conns : (wireid, wireid set) map = sol.conns in
    let cstr_cmps : (string,hcinst) map= cfg.hw.cstr.insts in
    let cstr_conns : (string*string,hcconn) map = cfg.hw.cstr.conns in
    let _ = MAP.iter sol_cmps (fun k (v,cnt) -> SET.iter v (fun x  -> declvar (UnivLib.unodeid2name k) x false) ) in
    let _ = MAP.iter cstr_cmps (fun k q -> List.iter (fun x -> declvar k x true) (LIST.mkrange 1 q) ) in
    let _ = tosmt () in
    true

end


module HwErrRslvr =
struct

  let is_valid cfg sln =
    true

end
