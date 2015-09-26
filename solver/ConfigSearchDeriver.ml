open HwData
open HwLib
open Util
open HwSlnLib
open HwSlnData
open GoalData
open GoalLib

exception DerivationException of string;;

module ConfigSearchDeriver :
sig
   type goal_table = GoalTable.goal_table

   (*
    Comprised of depth, table of goals and running solution
   *)
   type goalcache = {
      mutable depth: int;
      mutable tbl: goal_table;
      mutable sln: sln;
   }
   val traverse : goalnode  -> bool -> sln option

end =
struct
   type goal_table = GoalTable.goal_table
   type goaltree = goalnode
   type goalcache = {
      mutable depth: int;
      mutable tbl: goal_table;
      mutable sln: sln;
   }


   let pr str interactive =
      if interactive then
         begin
         Printf.printf " %s\n" str;
         flush_all()
         end
      else
         ()

   let exc (a:unit->unit) interactive =
      if interactive then
         begin
         a();
         flush_all()
         end
      else
         ()

   let rep pref g (t:goalcache) interactive =
      if interactive then
         begin
         Printf.printf " %s\n" pref;
         Printf.printf " @ depth %d\n" (t.depth);
         Printf.printf "%s\n" (GoalUtils._goalnode2str "    " g);
         flush_all()
         end
      else
         ()

   let wait interactive =
         if interactive then
            begin
            Printf.printf "press any key to continue (q to quit):\n";
            flush_all();
            let line = input_line stdin in
            if line = "q" then
               exit 0
            else
               ()
            end
         else
         ()


   (*find identical goals in a multiple goal list*)
   let prune  (c:goalcache) (g:goalnode)=
      let g_nodup = GoalUtils.remove_dups g in
      let g_noref = GoalTable.remove_dups c.tbl g_nodup in
      g_noref

   let incr_depth (t:goalcache) : goalcache =
      let nd = t.depth + 1 in
      {depth=nd; tbl=t.tbl; sln=t.sln}

   let update_table (t:goalcache) (fn:goal_table -> goal_table): goalcache =
      t.tbl <- fn t.tbl; t

   let create_cache () =
      {depth=0; tbl=GoalTable.create(); sln=Solution.create()}

  let traverse (g: goalnode) (iactive:bool) : sln option =
      let c = create_cache() in
      None


end
