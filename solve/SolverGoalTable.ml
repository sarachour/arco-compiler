
open Common
open Globals

open HW
open HWData
open HWCstr

open Math
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


module GoalTableLib =
struct



  let is_trivial g = match g with TrivialGoal(g) -> true | _ -> false

  let wrap_goal = GoalStubLib.wrap_goal
  let unwrap_goal = GoalStubLib.unwrap_goal
  let add_goal = GoalStubLib.add_goal
  let deactivate_goal = GoalStubLib.deactivate_goal
  let activate_goal = GoalStubLib.activate_goal


  let add_partial_comp (t:gltbl) (id:unodeid) (i:int) (cmp:unode) = GoalStubLib.add_partial_comp t id i cmp

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
        v^"\n[X]"^(goal2str g)
      else
        v^"\n"^(goal2str g)
    in
    SET.fold gset proc_goal ""

  let newtbl (s:slvr) (rf:gltbl) (gls:goal list) (triv:urel->bool):gltbl =
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
       dngl = MAP.make();
       is_trivial = triv;
       blacklist = SET.make_dflt ();
       search= st;
       sln= sln;
    } in
    let steps = List.map (fun x -> SAddGoal x) gls in
    let _ = SearchLib.setroot st (s,v) steps in
    (v)

  let mktbl s (is_trivial:urel->bool) : gltbl =
    (* add all relations to the tableau of goals. *)
    let rm_pars x : unid ast option =
      match x with
      | Term(HwId(HNParam(c,n,v,p))) -> Some (ast_of_number (v))
      | Term(MathId(MNParam(n,v,u))) ->Some (ast_of_number (v))
      | _ -> None
    in
    let math2goal (x:mvar) : goal =
      let m2u = UnivLib.mid2unid in
      let tf x =
        let t = ASTLib.trans (ASTLib.map x m2u) rm_pars in
        t
      in
      match x.rel with
      | MRFunction(l,r) ->
        let rel = UFunction(m2u l, tf r) in
        if is_trivial rel then TrivialGoal(rel) else NonTrivialGoal(rel)
      | MRState(l,r,x) ->
        let time = (MathLib.getvar s.prob (OPTION.force_conc s.prob.time)).typ in
        let rel = UState(m2u l, tf r, m2u x, m2u time) in
        if is_trivial rel then TrivialGoal(rel) else NonTrivialGoal(rel)
      | MRNone -> error "math2goal" "impossible."
    in
    let fltmath x = x.rel <> MRNone in
    let comp2node (c:hwcomp) =
      let nvars = List.filter (fun (x:hwvar) -> x.rel <> HRNone) (MAP.to_values (c.vars)) in
      let var2urel (x:hwvar) =
        let h2u = UnivLib.hwid2unid in
        let tf x = ASTLib.trans (ASTLib.map x h2u) rm_pars in
        match x.rel with
        | HRFunction(l,r) -> UFunction(h2u l, tf r)
        | HRState(l,r,i) ->
          let time = HNTime(HCMLocal(c.name),c.time) in
          UState(h2u l, tf r, h2u i, h2u time)
        | _ -> error "math2goal.comp2node" "impossible"
      in
      let nrels = List.map var2urel nvars in
      let n = {rels=SET.from_list nrels; name=c.name} in
      n
    in
    let nodetbl : (unodeid,unode) map = MAP.make () in
    let goals : goal list = List.map math2goal (List.filter fltmath (MAP.to_values s.prob.vars)) in
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
        dngl = MAP.make ();
        blacklist = SET.make_dflt ()
      } in
    let steps = List.map (fun x -> SAddGoal x) goals in
    let _ = SearchLib.setroot search (s,tbl) steps in
    tbl

end