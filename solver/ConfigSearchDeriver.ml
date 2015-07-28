open HWData
open HWLib

type delta = 
   | DUseComponent of hwcomp
   | DAddWire of hwexpr*string*(string option) 
   | DAggregate of delta list
   | DNone 


(* a list of subgoals you have to remove *)
type goal = {
   mutable name: hwliteral option;
   mutable value: hwcomp;
}

(*the set of goals. A solved goal node is a goal with a list of new subgoals
An aggregate goal node is a list of possible solutions of a goal*)
type goalnode = 
   | GSolutionNode of goal*delta*(goalnode list)
   | GUnsolvedNode of goal 
   | GMultipleSolutionNode of goal*(goalnode list)
   | GNoSolutionNode of goal 
   | GTrivialNode of goal
   | GLinkedNode of goal
   | GEmpty


(*
   Given a partial hardware configuration (things partly connected with generic connections)
   Determine if the following component-relation pattern
*)
module GoalData : 
sig 

   val delta2str : delta -> string
   val goal2str : goal -> string
   val goalnode2str : goalnode -> string 
   val _goalnode2str : string -> goalnode -> string 
   val make_goal : hwliteral option -> hwcomp -> goal
   val is_eq : goalnode -> goalnode -> bool
   val remove_dups : goalnode -> goalnode
end = 
struct 

   let __spacing = "  "
   let rec _delta2str (prefix:string) (d:delta) : string = match d with 
      | DUseComponent(hwcomp) -> let ns = hwcomp.ns in
         prefix^"use component "^ns
      | DAddWire(expr,src,Some(sink)) ->
         let sexpr = HWUtil.hwexpr2str expr in 
         prefix^sexpr^" : "^src^" -> "^sink
      | DAddWire(expr,src,None) ->
         let sexpr = HWUtil.hwexpr2str expr in 
         prefix^sexpr^" : "^src^" -> ?"
      | DAggregate(lst) -> 
         List.fold_right (fun x r -> r^(_delta2str prefix x)^"\n") lst ""
      | DNone -> "none"

   let _goal2str (prefix:string) (d:goal) : string = 
      let expr = HWUtil.hwrel2str (List.nth (d.value.constraints) 0) in 
      match d.name with 
         | Some(name) -> prefix^"goal -> "^(HWUtil.hwlit2str name)^" | "^expr
         | None ->  prefix^"goal -> _ | "^expr

   let rec _goalnode2str (prefix:string) (d:goalnode) : string = 
      let _goallist2str lst delim= 
         List.fold_right (fun x r -> r^delim^(_goalnode2str (prefix^__spacing) x)) lst ""
      in 
      match d with 
      | GNoSolutionNode(g) -> prefix^"no solution\n"
      | GUnsolvedNode(g) -> prefix^(_goal2str (prefix^__spacing) g)^"\n"
      | GSolutionNode(g,d,subs) -> 
         (_goal2str prefix g)^"\n"^(_delta2str (prefix^"-> ") d)^"\n\n"^
         (_goallist2str subs "")
      | GMultipleSolutionNode(g,lst) -> 
         prefix^"multiple solutions:\n\n"^
         (_goallist2str lst "\n")
      | GTrivialNode(g) -> prefix^"trivial.\n"
      | GEmpty -> prefix^"empty.\n"
      | GLinkedNode(g) -> prefix^"linked.\n"

   let delta2str (d:delta) : string = _delta2str "" d 
   let goal2str (d:goal) : string = _goal2str "" d
   let goalnode2str (d:goalnode) : string = _goalnode2str "" d

   let make_goal (hl:hwliteral option) (hc:hwcomp) : goal = 
      {name=hl; value=hc}

   let rec is_eq a b = 
      let has x a = match List.filter (fun r -> is_eq r x) a with 
         | [] -> false 
         | _ -> true
      in
      let eq_lsts a b = 
         let rec _eq_lsts x y = match (x,y) with 
            | (h1::t1,h2::t2) -> (has h1 b)&&(has h2 a)&&(_eq_lsts t1 t2)
            | (h1::t1,[]) -> (has h1 b)&&(_eq_lsts t1 [])
            | ([], h2::t2) -> (has h2 a)&&(_eq_lsts [] t2)
            | ([],[]) -> true
         in
         _eq_lsts a b
      in
      match (a,b) with 
      | (GNoSolutionNode(g1),GNoSolutionNode(g2)) -> g1 = g2 
      | (GUnsolvedNode(g1),GUnsolvedNode(g2)) -> g1 = g2 
      | (GTrivialNode(g1),GTrivialNode(g2)) -> g1 = g2 
      | (GEmpty, GEmpty) -> true 
      | (GLinkedNode(g1),GLinkedNode(g2)) -> g1 = g2 
      | (GSolutionNode(g1,d1,s1),GSolutionNode(g2,d2,s2)) -> 
         g1 = g2 && d1 = d2 && (eq_lsts s1 s2) 
      | (GMultipleSolutionNode(g1,l1),GMultipleSolutionNode(g2,l2)) ->
         g1 = g2 && (eq_lsts l1 l2)

   (*removes duplicates on multiple solution nodes*)
   let remove_dups m = match m with 
   | GMultipleSolutionNode(g,lst) ->
      let rec dedup lst = match lst with 
         | h::t -> 
            begin 
            match List.filter (fun x -> is_eq x h) t with 
            | [] -> h::(dedup t)
            | _ -> dedup t
            end
         | [] -> []
      in 
      GMultipleSolutionNode(g, (dedup lst))
   | _ -> m

end


module GoalTable : 
sig   
   type goal_table = {
      tbl: (goal*(goalnode list)) list
   }
   val create : unit -> goal_table 
end = 
struct 
   type goal_table = {
      tbl: (goal*(goalnode list)) list
   }
   let create () = {tbl=[]}
end

module ConfigSearchDeriver : 
sig 
   type goal_table = GoalTable.goal_table
   type goaltree = goalnode
   type solution = string

   type goalcache = {
      mutable depth: int;
      mutable tbl: goal_table;
   }

   val get_solution: goaltree -> solution option
   val solution2str : solution -> string 
   val traverse : goaltree -> (goal -> goalnode) -> bool -> goaltree

end = 
struct 
   type goal_table = GoalTable.goal_table
   type goaltree = goalnode
   type solution = string
   
   type goalcache = {
      mutable depth: int;
      mutable tbl: goal_table;
   }

   let get_solution (gt:goaltree) : solution option = 
      Some("solution exists")

   let solution2str (s:solution) : string = 
      s


   let pr str interactive = 
      if interactive then 
         begin
         Printf.printf " %s\n" str;
         flush_all()
         end
      else 
         ()
   
   let rep pref g (t:goalcache) interactive = 
      if interactive then 
         begin
         Printf.printf " %s\n" pref;
         Printf.printf " @ depth %d\n" (t.depth);
         Printf.printf "%s\n" (GoalData._goalnode2str "    " g);
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
      let g_nodup = GoalData.remove_dups g in 
      g_nodup

   let incr_depth (t:goalcache) : goalcache = 
      let nd = t.depth + 1 in 
      {depth=nd; tbl=t.tbl}

   let add_goal (t:goalcache) (g:goal): goalcache = 
      t 

   let create_cache () = 
      {depth=0; tbl=GoalTable.create()}

   let add_solution (t:goalcache) (g:goal) (n:goalnode): goalcache = 
      t 
   let traverse (gt:goaltree) (fn:goal->goalnode) (is_iactive:bool) : goaltree = 
      let max_depth = 5 in
      let rec _traverse (g:goalnode) (t:goalcache) : goalnode = 
         match g with 
         | GUnsolvedNode(x) -> 
            if t.depth = max_depth then GNoSolutionNode(x) else 
               begin
               rep "=> Processing Unsolved Node" g t is_iactive;
               wait is_iactive;
               let node = fn x in 
               let pnode = prune t node in
               rep "=> Generated Solved Node" pnode t is_iactive;
               wait is_iactive;
               pr "==========================\n" is_iactive;
               let tnew = t in 
               _traverse pnode tnew
               end
         | GSolutionNode(g,d,lst) ->
            let tnew = t in 
            let nlst = List.map (fun x -> _traverse x tnew) lst in
            GSolutionNode(g,d,nlst)
         | GMultipleSolutionNode(x,lst) -> 
            let tnew = incr_depth t in 
            let nlst = List.map (fun x -> _traverse x tnew) lst in
            begin
            match List.filter (fun x -> match x with GNoSolutionNode(v) -> false | _ -> true) nlst with 
               | [] -> GNoSolutionNode(x)
               | [h] -> h 
               | h::t -> GMultipleSolutionNode(x,h::t)
            end
         | GNoSolutionNode(g) -> GNoSolutionNode(g)
         | GTrivialNode(g) -> GTrivialNode(g)
      in 
         _traverse gt (create_cache())

end