
open HWData
open Util
open SolverData
open SolverUtil
open Z3Lib
open Z3Data


exception HwConnRslvrException of string

let error s e =
  raise (HwConnRslvrException (s^": "^e))

module HwConnRslvr =
struct

  type instinfo = {
      id: int;
      mutable cinsts: int set;
      mutable sinsts: int set;
  }



  let mkinstinfo n =
    {id=n; cinsts = SET.make (fun x y -> x =y ); sinsts = SET.make (fun x y -> x = y)}


  let to_id id = id + 1

  let from_id id = id - 1

  let fromvar mk (name:string) =
    match STRING.split name "[_v]" with
    | [nid;idx] ->
      let i = int_of_string nid in
      let name = match MAP.filter mk (fun k q -> q.id = i) with
        |[(k,v)] -> k
        | _ -> error "fromvar" "could not find the kind in the kind map."
      in
      let inst = (from_id (int_of_string idx)) in
      (name,inst)
    | h::t -> error "fromvar" ("Unexpected: "^name^"<"^h^">")

  let _tovar (kind_map:(string,instinfo) map) (name:string) (id) =
    let ifo = MAP.get kind_map name in
    (string_of_int ifo.id)^"_"^(string_of_int (to_id id))

  let tovar km name id =
    "v"^(_tovar km name id)

  let towvar km ((u,p,i):string*string*int) =
    (_tovar km u i)^"_"^p

  let toconnvar km (a) (b) =
    "v"^(towvar km a)^"_"^(towvar km b)


  let mkvar km name =
    if MAP.has km name = false then
      let v = List.length (MAP.to_values km) in
      let iifo = mkinstinfo v in
      let _ = MAP.put km name iifo in
      ()
    else
      ()




  let to_smt_prob cfg sol : bool*z3doc*((string,instinfo) map) =
    (*set up environment*)
    let declvar km (name:string) id (cstr:bool)=
      let _ = mkvar km (name) in
      let ifo = MAP.get km name in
      if cstr then
        let _ = (ifo.cinsts <- SET.add ifo.cinsts id) in
        ()
      else
        let _ = (ifo.sinsts <- SET.add ifo.sinsts id) in
        ()
    in
    let km : (string,instinfo) map= MAP.make() in
    let sol_conns : (wireid, wireid set) map = sol.conns in
    let cstr_conns : (string*string,hcconn) map = cfg.hw.cstr.conns in
    let sol_cmps : (unodeid,(int set)*int) map = sol.comps in
    let cstr_cmps : (string,hcinst) map= cfg.hw.cstr.insts in
    let _ = MAP.iter sol_cmps (fun k (v,cnt) -> SET.iter v (fun x  -> declvar km (UnivLib.unodeid2name k) x false) ) in
    let _ = MAP.iter cstr_cmps (fun k q -> List.iter (fun x -> declvar km k x true) (LIST.mkrange 0 (q)  ) ) in
    (*decl conns helper routine*)
    let decl_conns  (src:wireid) (dest:wireid) : (string list)*(z3expr list) =
      let sc,si,sp = src in
      let dc,di,dp = dest in
      let sc : string = UnivLib.unodeid2name sc in
      let dc : string = UnivLib.unodeid2name dc in
      let res = match MAP.get cstr_conns (sc,sp) with
      | HCConnLimit(dests) ->
        if MAP.has dests (dc,dp) = false
        then
          ([],[])
        else
          let ipairs = MAP.get dests (dc,dp) in
          if SET.size ipairs = 0 then ([],[]) else
          let res = SET.fold ipairs (fun (cstr_si,cstr_di) (decl_list,eqn_list)->
            let cv = toconnvar km (sc,sp,cstr_si) (dc,dp,cstr_di) in
            let src = tovar km sc (cstr_si) in
            let dest = tovar km dc (cstr_di) in
            let src_is_inst = Z3Eq(Z3Var(src),Z3Int(to_id si)) in
            let dest_is_inst = Z3Eq(Z3Var(dest), Z3Int(to_id di)) in
            let conn_is_inst = Z3And(src_is_inst,dest_is_inst) in
            let cnd = Z3IfThenElse(conn_is_inst, Z3Eq(Z3Var(cv),Z3Bool true), Z3Eq(Z3Var(cv),Z3Bool false) ) in
            (cv::decl_list, cnd::eqn_list)
          ) ([],[]) in
          res
      | HCConnNoLimit -> error "decl_conns" ("cannot handle component with underconstrained connections "^sc^" -> "^dc)
      in
      res
    in
    let tosmt () : bool*z3doc =
      let mapc fn ic = MAP.fold km (fun name iifo r -> SET.fold iifo.cinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let maps fn ic = MAP.fold km (fun name iifo r -> SET.fold iifo.sinsts (fun inst r -> fn name inst iifo r ) r) ic in
      let decls : z3st list = mapc (fun n i ifo r ->  let vname = tovar km n i in (Z3ConstDecl(vname,Z3Int))::r) [] in
      (*make the clause that forces one assignment*)
      let gdecls = decls in
      let decls : z3st list =
        mapc (fun name inst ifo r ->
          let cid = tovar km name inst in
          let eqs = SET.fold ifo.sinsts (fun j lst -> Z3Eq(Z3Var(cid),Z3Int(to_id j))::lst) [Z3Eq(Z3Var(cid),Z3Int(0))] in
            (Z3Assert (Z3Lib.or_all eqs))::r
        )
        []
      in
      let gdecls = gdecls @ decls in
      let decls : z3st list =
          maps (fun name inst ifo lst ->
            let indep: z3expr list =
              SET.fold ifo.cinsts (fun j lst ->
                let cid = tovar km name j in
                let expr = Z3IfThenElse( Z3Eq(Z3Var(cid),Z3Int(to_id inst)),Z3Int(1),Z3Int(0)) in
                expr::lst
              ) []
            in
              if List.length indep > 0 then
                let ens = Z3Eq(Z3Lib.plus_all indep, Z3Int(1)) in
                (Z3Assert ens )::lst
              else lst
          ) []
      in
      let gdecls = gdecls @ decls in
      let failed,decls = MAP.fold sol_conns (fun sln_src dests (failed,decls) ->
        if failed then (failed,decls) else
        SET.fold dests (fun sln_dest (failed,decls) ->
           if failed then (failed,decls) else
           let names,cstrs = decl_conns sln_src sln_dest in
           if List.length cstrs > 0 then
             let defines = List.fold_right (fun x r -> (Z3ConstDecl(x,Z3Bool))::r) names [] in
             let must_have_conn = Z3Lib.or_all cstrs in
             let exprs = List.map (fun d -> Z3IfThenElse(Z3Var(d),Z3Int 1,Z3Int 0) ) names in
             let exactly_one_conn = Z3Eq(Z3Lib.plus_all exprs, Z3Int(1)) in
             let asserts = [Z3Assert must_have_conn;Z3Assert exactly_one_conn] in
             let decls = decls @ defines @ asserts in
             (failed,decls)
           else
             (true,decls)
        ) (failed,decls)
      ) (false,[])
      in
      let gdecls = gdecls @ decls in
      let gdecls = gdecls@[Z3SAT;Z3DispModel] in
      (failed = false,gdecls)
    in
    let success,decls= tosmt () in
    (success,decls,km)

    let is_valid cfg sln =
      let is_succ,decls,_ = to_smt_prob cfg sln in
      if is_succ = false then
        false
      else
        let txt = Z3Lib.z3stmts2str decls in
        let z = Z3Lib.exec decls in
        z.sat


    let z32cstr km z3 =
      let sln = MAP.make() in
      let proc_const v = match v with
      | Z3SetBool(cname,true) -> ()
      | Z3SetInt(vid,inst) ->
        let sln_iid = from_id inst in
        let cstr_name,hw_iid = fromvar km vid in
        let _ = MAP.put sln (cstr_name,sln_iid) (cstr_name,hw_iid) in
        ()
      | _ -> ()
      in
      let _ = List.iter (fun x -> let _ = proc_const x in ()) z3 in
      sln

    let get_sln cfg sln =
      let is_succ,decls,km = to_smt_prob cfg sln in
      if is_succ = false then
        error "get_sln" "failed to  construct smt problem - inconsistency."
      else
        let txt = Z3Lib.z3stmts2str decls in
        let z = Z3Lib.exec decls in
        if z.sat = false then
          error "get_sln" "no solution exists. ie UNSAT."
        else
          match z.model with
          | Some(m) ->
            let z3mdl = m in
            let mapping = z32cstr km z3mdl in
            mapping
          | None -> error "get_sln" "no solution"
end


module HwErrRslvr =
struct

  let is_valid cfg sln =
    true

end
