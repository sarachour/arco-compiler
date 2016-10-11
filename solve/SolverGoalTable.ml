
open Common
open Globals

open HWLib
open HWData

open MathData
open MathLib

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

(*
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

  let _rm_pars (s:slvr) x : unid ast option =
    match x with
    | Term(HwId(HNParam(HCMLocal(c),n))) ->
      let pars : number list = (HwLib.getparam s.hw c n).value in
      begin match pars with
        | [v] -> Some (ast_of_number (v))
        | [] -> error "_rm_pars" "parameter is not set"
        | _ -> None
      end
    | Term(MathId(MNParam(n,v))) ->
      Some (ast_of_number (v))
    | _ -> None

  *)
  (*make an empty node without the goals*)
  let mktbl (env:uenv) : gltbl =
    (*
    let eh2u x = ASTLib.trans (ASTLib.map x h2u) (_rm_pars s) in 
    let comp2node (c:hwvid hwcomp) : unode =
      let nvars = MAP.size c.outs in
        let hwvar2uvar (x:hwvid hwportvar) : uvar =
          let new_lhs = HwId(HNPort(x.knd,HCMLocal(c.name),x.port,x.prop)) in
          let ubhv : ubhv= match x.bhvr with
            | HWBDigital(bhv) -> UBhvVar({rhs=eh2u bhv.rhs;knd=UBHDigitalVar()})
            | HWBAnalogVar(bhv) -> UBhvVar({rhs=eh2u bhv.rhs;knd=UBHAnalogVar()})
            | HWBAnalogStateVar(bhv) ->
          let ic_port,ic_prop = bhv.ic in
          let new_ic_var : unid = HwId(HNPort(HNInput,HCMLocal(c.name),ic_port,ic_prop)) in
          UBhvState({rhs=eh2u bhv.rhs;ic=ICVar(new_ic_var); knd=UBHAnalogStateVar()})
        | _ -> UBhvUndef          
        in
        {lhs=new_lhs;bhvr=ubhv}
      in
      let hwpar2upar (c:hwparam) : uparam =
        {name=c.name;values=c.value}
      in
      let vars = MAP.make() and params = MAP.make() in
      MAP.iter c.params (fun par data -> if List.length data.value == 1 then () else
                            noop (MAP.put params par (hwpar2upar data)));
      MAP.iter c.vars (fun v data -> let ndat = hwvar2uvar data in
                        noop (MAP.put vars (ndat.lhs) [ndat]));
      {vars=vars;params=params;name=c.name;comp_id=UnivLib.name2unodeid c.name}
    in
      *)
    let hwcomp2ucomp (x:hwvid hwcomp) : unid hwcomp = HwLib.map_comp x (fun x -> HwId(x)) in 
    let comptbl : (hwcompname,ucomp) map = MAP.make () in
    let sln = SlnLib.mksln () in
    List.iter (fun (x:hwvid hwcomp)  ->
        let u_comp = hwcomp2ucomp x in
        MAP.put comptbl u_comp.name {d=u_comp};
        SlnLib.mkcomp sln u_comp.name;
        ()
    ) (MAP.to_values env.hw.comps);
    (*let search= SlvrSearchLib.mksearch () in*)
    let tbl : gltbl = {
        goals=SET.make_dflt ();
        avail_comps=comptbl;
        comp_ctx=MAP.make();
        sln_ctx=sln;
      } in
    tbl



  
  let mkgoalroot (s:slvr) (tbl:gltbl) =
    let fltmath (x:mid mvar) = x.bhvr <> MBhvUndef in
    let math2goal (x:mid mvar) : goal =
      let m2u : mid -> unid = UnivLib.mid2unid in
      let tf (x:mid ast) : unid ast =
        let t = ASTLib.trans (ASTLib.map x m2u) (_rm_pars s) in
        t
      in
      let lhs : unid = MathId(MNVar(x.knd,x.name)) in
      let bhvr : ubhv= match x.bhvr with
        | MBhvVar(bhv) ->
          UBhvVar ({rhs=(tf bhv.rhs); knd=UBMMathVar()})
        | MBhvStateVar(bhv) ->
          UBhvState ({rhs=(tf bhv.rhs); ic=ICVal(bhv.ic); knd=UBMMathStateVar()})
        | MBhvUndef -> error "math2goal" "impossible."
      in
      let vrb:uvar = {lhs=lhs;bhvr=bhvr} in
        if tbl.is_trivial vrb then TrivialGoal(vrb) else NonTrivialGoal(vrb)
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
