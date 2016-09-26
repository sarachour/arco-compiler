
open Common
open Globals

open HWLib
open HWData

open MathLib
open MathCstr

open AST
open Util
open Unit

open SymCamlData

open SearchData
open Search

open SolverData
open SolverUtil
open SolverSln
open SolverSearch


exception GoalTableError of string

let error n m = raise (GoalTableError (n^":"^m))


module GoalTableLib =
struct

  let wrap_goal = GoalStubLib.wrap_goal
  let unwrap_goal = GoalStubLib.unwrap_goal
  let add_goal = GoalStubLib.add_goal
  let deactivate_goal = GoalStubLib.deactivate_goal
  let activate_goal = GoalStubLib.activate_goal
  let has_partial_comp = GoalStubLib.has_partial_comp
  let get_partial_comp = GoalStubLib.get_partial_comp

  let get_goal_from_rel (t:gltbl) (clhs:unid) (crhs:unid ast): goal option =
    let is_var (x:goal) =
      let vr = unwrap_goal x in 
      match vr.bhvr with
      |UBhvVar(bhv) -> vr.lhs = clhs && crhs = bhv.rhs 
      |UBhvState(bhv) -> vr.lhs = clhs && crhs =bhv.rhs 
    in
    match SET.filter t.goals (fun x -> is_var x ) with
    | [h] -> Some(h)
    | [] -> None
    | lst -> 
        let goal_str = LIST.fold lst (fun el str -> str^"\n "^(UnivLib.goal2str el) ) "" in 
        error "get_goal_from_var" ("multiple goals with the same identifier: "^goal_str)


  let get_goal_from_var (t:gltbl) (vr:unid) : goal option =
    let is_var (x:goal) (v:unid) = (unwrap_goal x).lhs =v  in
    match SET.filter t.goals (fun x -> is_var x vr) with
    | [h] -> Some(h)
    | [] -> None
    | lst -> 
        let goal_str = LIST.fold lst (fun el str -> str^"\n "^(UnivLib.goal2str el) ) "" in 
        error "get_goal_from_var" ("multiple goals with the same identifier: "^goal_str)

  let get_actionable_goals (t:gltbl) =
    let act = SET.filter t.goals (fun x -> SET.has t.blacklist x = false) in
    act

  let num_actionable_goals (t:gltbl) =
    List.length (get_actionable_goals t)

  let is_actionable (t:gltbl) (x:goal) =
    (SET.has t.blacklist x) = false

  let goal2str g = UnivLib.goal2str g

  let goals2str (tbl:gltbl) (gset:goal set) =
    let proc_goal g v =
      let is_disabled : bool = SET.has tbl.blacklist g in
      if is_disabled then
        (*v^"\n[X]"^(goal2str g)*)
        v
      else
        v^"\n"^(goal2str g)
    in
    SET.fold gset proc_goal ""

  let newtbl (s:slvr) (rf:gltbl) (gls:goal list) (triv:uvar->bool):gltbl =
    let st =  SlvrSearchLib.mksearch () in
    let sln = SlnLib.mksln () in
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let handle_component (x) =
       let nid = UnivLib.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_component x) (MAP.to_values rf.nodes) in
    let v =  {
       goals = SET.make_dflt ();
       nodes = nodetbl;
       used_nodes = MAP.make();
       is_trivial = triv;
       blacklist = SET.make_dflt ();
       search= st;
       sln= sln;
    } in
    let steps = List.map (fun x -> SAddGoal x) gls in
    let _ = SearchLib.setroot st (s,v) steps in
    (v)


  (*make an empty node without the goals*)
  let mktbl s (is_trivial:uvar->bool) : gltbl =
    let comp2node (c:hwvid hwcomp) =
      let nvars = List.filter (fun (x:hwvid hwportvar) ->
          x.bhvr <> HWBhvUndef) (MAP.to_values (c.vars)) in
      let hwvar2ic i = match h2u i with 
            | MathId(MNParam(n,v)) -> ICVal(v)
            | HwId(HNParam(c,n)) -> ICVal(v)
            | var -> ICVar(var)
      in 
      let hwvar2urel (x:hwvid hwvar) =
        let h2u = UnivLib.hwid2unid in
        let new_lhs = h2u x.lhs in
        let bhv = match x.bhv with
        | HWBhvDigital(bhv) -> 
        | HWBhvAnalogVar(bhv) -> 
        | HWBhvAnalogStateVar(bhv) -> 
          let time = HNTime(HCMLocal(c.name),c.time) in
          
          UState(h2u l, tf r, ic, h2u time)
        | _ -> error "math2goal.comp2node" "impossible"
      in
      let nrels = List.map var2urel nvars in
      let n = {rels=SET.from_list nrels; name=c.name} in
      n
    in
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let sln = SlnLib.mksln () in
    let nodes : unode list = List.map comp2node (MAP.to_values s.hw.comps) in
    let handle_node (x) =
       let nid = UnivLib.name2unodeid x.name in
       let _ = MAP.put nodetbl nid x in
       let _ = SlnLib.mkcomp sln nid in
       ()
    in
    let _ = List.iter (fun x -> handle_node x) nodes in
    let search= SlvrSearchLib.mksearch () in
    let tbl = {
        goals=SET.make_dflt ();
        is_trivial=is_trivial;
        nodes=nodetbl;
        sln=sln;
        search=search;
        used_nodes = MAP.make ();
        blacklist = SET.make_dflt ()
      } in
    tbl

  let mkgoalroot s tbl =
    let fltmath x = x.rel <> MRNone in
    let math2goal (x:mvar) : goal =
      let m2u : mid -> unid = UnivLib.mid2unid in
      let tf (x:mid ast) : unid ast =
        let t = ASTLib.trans (ASTLib.map x m2u) _rm_pars in
        t
      in
      match x.rel with
      | MRFunction(l,r) ->
        let rel = UFunction(m2u l, tf r) in
        if tbl.is_trivial rel then TrivialGoal(rel) else NonTrivialGoal(rel)
      | MRState(l,r, MNParam(icname,ic,ictype) ) ->
        let time = (MathLib.getvar s.prob (OPTION.force_conc s.prob.time)).typ in
        let ic_cnd : unid init_cond = ICVal(ic) in 
        let rel = UState(m2u l, tf r, ic_cnd, m2u time) in
        if tbl.is_trivial rel then TrivialGoal(rel) else NonTrivialGoal(rel)
      | MRNone -> error "math2goal" "impossible."
    in
    let goals : goal list = List.map math2goal (List.filter fltmath (MAP.to_values s.prob.vars)) in
    let steps = List.map (fun x -> SAddGoal x) goals in
    let _ = SearchLib.setroot tbl.search (s,tbl) steps in
    ()

  let mknullroot s tbl =
    let _ = SearchLib.setroot tbl.search (s,tbl) [] in
    ()

  let mkroot s tbl steps =
    let _ = SearchLib.setroot tbl.search (s,tbl) steps in
    ()
end
