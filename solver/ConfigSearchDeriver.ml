open HWData


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

   type goaltree = goalnode

   let delta2str (d:delta) : string = ""
   let goal2str (d:goal) : string = ""
   let goaltree2str (d:goaltree) : string = ""

   let make_goal (hl:hwliteral option) (hc:hwcomp) : goal = 
      {name=hl; value=hc}

   let traverse (gt:goaltree) (fn:goal->goalnode) (interactive:bool) : goaltree = 
      let rep pref g = if interactive then Printf.printf "%s: %s\n" pref (goaltree2str g) else ()
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
      let rec _traverse (g:goalnode) : goalnode = 
         rep "debug" g;
         match g with 
         | GUnsolvedNode(x) -> 
            rep "unsolved node" g;
            let newnode = fn x in 
            rep "solved node" newnode;
            wait();
            _traverse g
         | GSolutionNode(g,d,lst) ->
            let nlst = lst in 
            (*let nlst = List.map (fun x -> _traverse x ) lst in*) 
            GSolutionNode(g,d,nlst)
         | GMultipleSolutionNode(lst) -> 
            let nlst = lst in 
            (*let nlst = List.map (fun x -> _traverse x ) lst in*) 
            begin
            match List.filter (fun x -> match x with GNoSolutionNode -> false | _ -> true) nlst with 
               | [] -> GNoSolutionNode 
               | [h] -> h 
               | h::t -> GMultipleSolutionNode(h::t)
            end
         | GNoSolutionNode -> GNoSolutionNode
      in 
         _traverse gt

end