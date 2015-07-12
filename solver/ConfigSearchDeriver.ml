open HWData
open HWLib

(*
   Given a partial hardware configuration (things partly connected with generic connections)
   Determine if the following component-relation pattern
*)
module ConfigSearchDeriver : 
sig 
   (* a configuration delta. You may use a component, 
      connect ports of components in use or be a set of deltas*)
      
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
      | GMultipleSolutionNode of goalnode list
      | GNoSolutionNode
      | GTrivialNode

   type goaltree = goalnode

   val make_goal : hwliteral option -> hwcomp -> goal

   val delta2str : delta -> string
   val goal2str : goal -> string
   val goaltree2str : goaltree -> string 

   val traverse : goaltree -> (goal -> goalnode) -> bool -> goaltree

end = 
struct 
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
      | GMultipleSolutionNode of goalnode list
      | GNoSolutionNode
      | GTrivialNode

   type goaltree = goalnode

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

   let rec _goaltree2str (prefix:string) (d:goaltree) : string = 
      let _goallist2str lst delim= 
         List.fold_right (fun x r -> r^delim^(_goaltree2str (prefix^__spacing) x)) lst ""
      in 
      match d with 
      | GNoSolutionNode -> prefix^"no solution\n"
      | GUnsolvedNode(g) -> prefix^(_goal2str (prefix^__spacing) g)^"\n"
      | GSolutionNode(g,d,subs) -> 
         (_goal2str prefix g)^"\n"^(_delta2str (prefix^"-> ") d)^"\n\n"^
         (_goallist2str subs "")
      | GMultipleSolutionNode(lst) -> 
         prefix^"multiple solutions:\n\n"^
         (_goallist2str lst "\n")
      | GTrivialNode -> prefix^"trivial.\n"

   let delta2str (d:delta) : string = _delta2str "" d 
   let goal2str (d:goal) : string = _goal2str "" d
   let goaltree2str (d:goaltree) : string = _goaltree2str "" d

   let make_goal (hl:hwliteral option) (hc:hwcomp) : goal = 
      {name=hl; value=hc}

   type traverse_meta = {
      depth: int
   }
   let traverse (gt:goaltree) (fn:goal->goalnode) (interactive:bool) : goaltree = 
      let new_meta () = {depth=0;} in 
      let upd_meta d = {depth=d.depth+1} in
      let rep pref g t = 
         if interactive then 
            begin
            Printf.printf " %s\n" pref;
            Printf.printf " @ depth %d\n" (t.depth);
            Printf.printf "%s\n" (_goaltree2str "    " g);
            flush_all()
            end
         else 
            ()
      in
      let wait () =  
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
      in
      let rec _traverse (g:goalnode) (t:traverse_meta) : goalnode = 
         match g with 
         | GUnsolvedNode(x) -> 
            rep "=> Processing Unsolved Node" g t;
            wait();
            let newnode = fn x in 
            rep "=> Generated Solved Node" newnode t;
            wait();
            Printf.printf "==========================\n";
            let tnew = t in 
            _traverse newnode tnew
         | GSolutionNode(g,d,lst) ->
            let tnew = t in 
            let nlst = List.map (fun x -> _traverse x tnew) lst in
            GSolutionNode(g,d,nlst)
         | GMultipleSolutionNode(lst) -> 
            let tnew = upd_meta t in 
            let nlst = List.map (fun x -> _traverse x tnew) lst in
            begin
            match List.filter (fun x -> match x with GNoSolutionNode -> false | _ -> true) nlst with 
               | [] -> GNoSolutionNode 
               | [h] -> h 
               | h::t -> GMultipleSolutionNode(h::t)
            end
         | GNoSolutionNode -> GNoSolutionNode
         | GTrivialNode -> GTrivialNode
      in 
         _traverse gt (new_meta())

end