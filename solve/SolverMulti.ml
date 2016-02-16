open Util

open ASTUnifyData
open ASTUnify


open Interactive
open Globals

open HWData
open Math

open Search
open SearchData

open SolverGoalTable
open SolverData
open SolverUtil
open SolverSln
open SolverTrivial
open SolverSearch
open SolverEqn


(*search for each variable*)
type ssearchst = {
  search: (sstep,slvr*gltbl) ssearch;
  exclude_goals: goal set;
}

type msearchst = (unid, ssearchst) map

type msearch = {
  mutable nodes : (unodeid, unode) map;
  mutable goals : goal set;
  st: msearchst;
  is_trivial: urel->bool;
  slvr: slvr;
}

module MultiSearch =
struct
  let mkssearchst (ms:msearch) (id:unid) =
    {
      search=SlvrSearchLib.mksearch ();
      exclude_goals=SET.make_dflt();
    }

  let mktbl (ms:msearch) (id:unid) =
    (*make the current search state*)
    let _ = if MAP.has ms.st id = false then
      let _ = MAP.put ms.st id (mkssearchst ms id) in ()
    in
    (*get the current state*)
    let st : ssearchst = MAP.get ms.st id in
    (*ban everything but current variable*)
    let tbl = {
      goals=ms.goals;
      nodes=ms.nodes;
      dngl=MAP.make();
      blacklist=st.exclude_goals;
      is_trivial=ms.is_trivial;
      search=st.search;
      sln=SlnLib.mksln();
    }
    in
    tbl

  let clonetbl (ms:msearch) (tbl:gltbl) =
    let tbl = {
      goals=tbl.goals;
      nodes=tbl.nodes;
      dngl=tbl.dngl;
      blacklist=tbl.blacklist;
      is_trivial=tbl.is_trivial;
      search=tbl.search;
      sln=tbl.sln;
    }
    in
    tbl

  (* find n more solutions *)
  let dosearch (sl:msearch) (id:unid) (nsols:int) =
    (*mktable*)
    let tbl = mktbl sl id in
    let st = MAP.get sl.st id in
    let currsols = SearchLib.num_solutions st.search None in
    let _ = SolverEqn.solve sl.slvr tbl (nsols+currsols) in
    ()

  (*take the state and apply it*)
  let apply_state (sl:msearch) (id:unid) (tbl:gltbl) =
    let stree = MAP.get sl.st id in
    let slns = SearchLib.get_solutions stree.search None in
    (*fork table*)
    tbl


  let mkmulti sl =
    let scratch = GoalTableLib.mktbl sl (TrivialLib.is_trivial) in
      let msearch = {
        nodes = scratch.nodes;
        goals = scratch.goals;
        is_trivial = scratch.is_trivial;
        st = MAP.make();
        slvr = sl;
      }
    in
    msearch

  let msolve sl (ms:msearch) : (sln list) option=
    None

end
