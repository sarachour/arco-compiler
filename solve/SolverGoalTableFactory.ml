
open Globals

open HWLib
open HWData

open MathData
open MathLib

open AST
open Util
open Unit

open IntervalLib

open SymCamlData

open SearchData
open Search 

open SMapMain

open SolverData
open SolverUtil
open SlnLib

open SolverSearch

open GoalLib

exception GoalTableError of string

let error n m = raise (GoalTableError (n^":"^m))

module GoalTableFactory =
struct


  (*make an empty node without the goals*)
  let mktbl (env:uenv) : gltbl =
    let comptbl : (hwcompname,ucomp) map = MAP.make () in
    let compctxtbl : (hwcompname,ucomp_ctx) map = MAP.make () in
    let sln = SlnLib.mksln () in
    List.iter (fun (hwcomp:hwvid hwcomp)  ->
        MAP.put comptbl hwcomp.name {d=hwcomp};
        MAP.put compctxtbl hwcomp.name {insts=MAP.make();cnt=0};
        ()
    ) (MAP.to_values env.hw.comps);
    let search= SlvrSearchLib.mksearch () in
    let tbl : gltbl = {
        env=env;
        goals=MAP.make();
        avail_comps=comptbl;
        comp_ctx=compctxtbl;
        sln_ctx=sln;
        search=search;
        map_ctx=SMapMain.mkctx env.hw (comptbl);
      } in
    tbl



  let mkgoalroot (tbl:gltbl) (enable:mid mvar->bool) : unit =
    let steps :sstep list = MathLib.fold_vars tbl.env.math (fun v r ->
        let goal : goal = GoalLib.mk_mathgoal tbl v in
        let step = SModGoalCtx(SGAddGoal(goal)) in
        if enable v then step::r
        else step::SModGoalCtx(SGChangeGoalStatus(goal.id,false))::r
      ) []
    in
    SearchLib.setroot tbl.search tbl steps;
    ()

  let mknullroot tbl =
    SearchLib.setroot tbl.search tbl []

  let mkroot tbl steps =
    SearchLib.setroot tbl.search tbl steps

end
