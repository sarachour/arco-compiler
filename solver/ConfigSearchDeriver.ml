open HWData
open HWLib

exception DerivationException of string;;

type delta = 
   | DUseComponent of hwcomp
   | DAddWire of hwexpr*string*(string option) 
   | DAggregate of delta list
   | DSetPort of hwliteral*hwexpr
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
   | GTrivialNode of goal*delta
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
      | DSetPort(n,e) ->
         let nexpr = HWUtil.hwlit2str n in 
         let expr = HWUtil.hwexpr2str e in 
         nexpr^":="^expr 
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
      | GTrivialNode(g,d) -> prefix^"trivial.\n"
      | GEmpty -> prefix^"empty.\n"
      | GLinkedNode(g) -> prefix^"linked:"^(_goal2str (prefix^__spacing) g)^"\n"

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
      | (GTrivialNode(g1,d1),GTrivialNode(g2,d2)) -> g1 = g2 && d1 = d2
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


module SolutionSet = Util.Set(struct type t = goalnode end)
module GoalTable : 
sig   
   type slnset = SolutionSet.set
   type goal_table = {
      mutable tbl: (goal*slnset) list
   }
   val create : unit -> goal_table 
   val has_goal : goal_table -> goal -> bool
   val get_goal : goal_table -> goal -> slnset option
   val declare_goal : goal_table -> goal -> goal_table
   val add_solution : goal_table -> goal -> goalnode -> goal_table
   val remove_dups : goal_table -> goalnode -> goalnode
end = 
struct 
   type slnset = SolutionSet.set
   type goal_table = {
      mutable tbl: (goal*slnset) list
   }
   let create () = {tbl=[]}

   let has_goal (tb:goal_table) (g:goal) : bool =  
      let rec _has_goal l = match l with
         | (h,_)::t ->  if h = g then true else (_has_goal t)
         | [] -> false 
      in
      _has_goal tb.tbl

   

   let get_goal (tb:goal_table) (g:goal) : slnset option =  
      let rec _get_goal l = match l with
         | (h,v)::t ->  if h = g 
            then Some(v) 
            else (_get_goal t)
         | [] -> None 
      in
      _get_goal tb.tbl

   

   let declare_goal (tb:goal_table) (g:goal) : goal_table = 
      if (has_goal tb g) = false then 
         begin
         tb.tbl <- (g,SolutionSet.create())::tb.tbl; 
         tb 
         end
      else tb

   let add_solution tb g n: goal_table = 
      if (has_goal tb g) then 
         let rec upd_tb x = match x with 
            | (gl,s)::t -> if gl = g 
               then 
                  let ns = SolutionSet.add s n in 
                  (gl,ns)::t
               else 
                  (gl,s)::(upd_tb t)
            | [] -> [] 
         in
         tb.tbl <- upd_tb tb.tbl; tb 
      else raise (DerivationException "goal does not exist in table.") 

   let rec remove_dups tb (n:goalnode): goalnode = 
      match n with 
      | GUnsolvedNode(g) -> if has_goal tb g then GLinkedNode(g) else GUnsolvedNode(g)
      | GMultipleSolutionNode(g,lst) -> 
         let nlst = List.map (fun x -> remove_dups tb x) lst in 
         GMultipleSolutionNode(g,nlst)
      | _ -> n
end

module ConfigSearchDeriver : 
sig 
   type goal_table = GoalTable.goal_table
   type goaltree = goalnode
   
   type solution =   
      | SMultipleSolutions of solution list 
      | SSolution of delta*(solution list)
      | SNoSolution


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

   type solution =   
      | SMultipleSolutions of solution list 
      | SSolution of delta*(solution list)
      | SNoSolution

   type goalcache = {
      mutable depth: int;
      mutable tbl: goal_table;
   }

   (*
   handle multiple solutions. Ie -> propagate them downward.

   *)
   let get_solution (gt:goaltree) : solution option = 
      let all_combos (prefix: solution list) (combos: (solution list) list) = 
         let combos = Util.cartesian_prod_n combos in 
         List.map (fun x -> prefix @ x) combos 
      in
      let rec get_norm_solns v = 
         let _fun v r = 
            match v with 
            | SMultipleSolutions(v) -> r
            | SSolution(d,v) -> (SSolution(d,v))::r 
            | SNoSolution -> r
         in
         List.fold_right _fun v []
      in
      let rec get_mul_solns v = 
         let _fun v r = 
            match v with 
            | SMultipleSolutions(v) -> v::r
            | SSolution(d,v) -> r
            | SNoSolution -> r
         in
         List.fold_right _fun v []
      in
      let rec has_mul_solns v = (List.length (get_mul_solns v)) > 0 in
      let rec _get_solution (gt:goalnode) : solution =
         match gt with 
         | GTrivialNode(g,d) -> 
            SSolution(d,[])
         | GSolutionNode(g,d,chld) -> 
            let _ = Printf.printf "basic solution node %d\n" (List.length chld) in
            let rest = List.map (fun x -> _get_solution x) chld in
            if List.length (List.filter (fun x -> x = SNoSolution) rest) = 0 then
               begin
               if has_mul_solns rest then 
                  begin
                     let prefix = get_norm_solns rest in 
                     let choices = get_mul_solns rest in
                     Printf.printf "nsols: %d\n" (List.length choices); 
                     match all_combos prefix choices with 
                     | [h] -> SSolution(d,h)
                     | h::t -> SMultipleSolutions(List.map (fun x -> SSolution(d,x)) (h::t))
                     | [] -> SNoSolution  
                  end
               else 
                  SSolution(d,rest)
               end
            else 
               raise (DerivationException "Solution Node with unmet Subgoals")

         | GMultipleSolutionNode(g,chld) -> 
            let _ = (Printf.printf "multiple solution node: %d\n" (List.length chld)) in
            let rest = List.map (fun x -> _get_solution x) chld in
            let rest = List.filter (fun x -> x <> SNoSolution) rest in
            begin 
               match rest with 
               | [h] -> h 
               | h::t -> SMultipleSolutions(h::t)
               | [] -> SNoSolution
            end
         | GNoSolutionNode(g) -> SNoSolution
         | GLinkedNode(g) -> raise (DerivationException "Linked Node not Expected.")
         | GEmpty -> raise (DerivationException "Unexpected Node.")
      in
         match _get_solution gt with
         | SNoSolution -> None 
         | v -> Some v


   let solution2str (sol:solution) : string = 
      let sp = "   " in
      let sort_by_kind lst = 
         let order_by_kind a b = match (a,b) with 
         | (SSolution(v,[]),_) -> -1 
         | (_, SSolution(v,[])) -> 1
         | (SMultipleSolutions(_),_) -> 1 
         | (_,SMultipleSolutions(_)) -> -1
         | _ -> 0 
         in
         List.sort order_by_kind lst
      in
      let rec _solution2str ind s = match s with 
         | SSolution(del, rest) -> ind^(GoalData.delta2str del)^"\n"^
            (List.fold_right (fun x r -> (_solution2str (ind^sp) x)^r) (sort_by_kind rest) "")
         | SMultipleSolutions(v) -> ind^"multiple\n"
         | SNoSolution -> ind^"no solution\n"
      in
      _solution2str "" sol

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
      let g_noref = GoalTable.remove_dups c.tbl g_nodup in 
      g_noref

   let incr_depth (t:goalcache) : goalcache = 
      let nd = t.depth + 1 in 
      {depth=nd; tbl=t.tbl}

   let update_table (t:goalcache) (fn:goal_table -> goal_table): goalcache = 
      t.tbl <- fn t.tbl; t

   let create_cache () = 
      {depth=0; tbl=GoalTable.create()}


   let replace_links (tb:goal_table) (g:goalnode) : goalnode = 
      let is_no_sol x = match x with
         | GNoSolutionNode(_) -> true
         | _ -> false
      in
      let has e lst = List.length (List.filter (fun x -> x = e) lst) > 0 in 
      let rec _replace_links stk g = 
         let handle_list lst hd : goalnode list = 
            List.map (fun x -> _replace_links (hd @ stk) x) lst 
         in
         match g with 
         | GMultipleSolutionNode(g,sols) ->
            if has g (stk) then 
               GNoSolutionNode(g)
            else
               let rest = handle_list sols [] in
               let rest = List.filter (fun x -> (is_no_sol x) = false) rest in
               begin 
               match rest with 
               | [h] -> h
               | h::t -> GMultipleSolutionNode(g,rest)
               | [] -> GNoSolutionNode(g)
               end
         | GSolutionNode(g,d,sols) -> 
            if has g (stk) then 
               GNoSolutionNode(g)
            else
               let rest = handle_list sols [] in
               if List.length (List.filter (fun x -> is_no_sol x) rest) = 0 then 
                  GSolutionNode(g,d,rest)
               else 
                  GNoSolutionNode(g)
         | GLinkedNode(g) ->
            if has g (stk) then 
               GNoSolutionNode(g)
            else
            begin
               match GoalTable.get_goal tb g with 
                  | Some([gn]) -> _replace_links (g::stk) gn
                  | Some(gh::gt) ->  _replace_links (g::stk) gh
                  | Some([]) -> GNoSolutionNode(g);
                  | None -> GNoSolutionNode(g)
            end
         | g -> g
      in
         _replace_links [] g
   let traverse (gt:goaltree) (fn:goal->goalnode) (is_iactive:bool) : goaltree = 
      let max_depth = 5 in
      let cache = create_cache() in 
      let rec _traverse (t:goalcache) (gnode:goalnode) : goalnode = 
         let gnode = prune t gnode in
         match gnode with 
         | GUnsolvedNode(x) -> 
            let t = update_table t (fun v -> GoalTable.declare_goal v x) in
            rep "=> Processing Unsolved Node" gnode t is_iactive;
            wait is_iactive;
            let node = prune t (fn x) in 
            rep "=> Generated Solved Node" node t is_iactive;
            wait is_iactive;
            pr "==========================\n" is_iactive;
            _traverse t node

         | GSolutionNode(g,d,lst) ->
            let t = update_table t (fun v -> GoalTable.add_solution v g gnode) in
            let nlst = List.map (fun x -> _traverse t x) lst in
            GSolutionNode(g,d,nlst)
         | GMultipleSolutionNode(g,lst) -> 
            let t = update_table t (fun v -> GoalTable.add_solution v g gnode) in
            let t = incr_depth t in 
            let nlst = List.map (fun x -> _traverse t x) lst in
            begin
            match List.filter (fun x -> match x with GNoSolutionNode(v) -> false | _ -> true) nlst with 
               | [] -> GNoSolutionNode(g)
               | [h] -> 
                  let t = update_table t (fun v -> GoalTable.add_solution v g h) in
                  h 
               | h::tl -> 
                  let nd = GMultipleSolutionNode(g,h::tl) in 
                  let t = update_table t (fun v -> GoalTable.add_solution v g nd) in
                  nd
            end
         | GNoSolutionNode(g) -> GNoSolutionNode(g)
         | GLinkedNode(g) ->  
            rep "=> Found Linked Node" gnode t is_iactive;
            GLinkedNode(g)
         | GTrivialNode(g,d) -> 
            let t = update_table t (fun v -> GoalTable.add_solution v g gnode) in
            GTrivialNode(g,d)
      in 
         let weakref = _traverse cache gt in
         let strongref = replace_links cache.tbl weakref in
         strongref

end