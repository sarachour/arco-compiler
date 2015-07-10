

(*
   Given a partial hardware configuration (things partly connected with generic connections)
   Determine if the following component-relation pattern
*)
module ConfigSearchDeriver : 
sig 
   (* a configuration delta. You may use a component, 
      connect ports of components in use or be a set of deltas*)
      
   type name_t = hwliteral;
   type val_t = hwcomp;

   type delta = 
      | DUseComponent of hwcomp
      | DAddWire of hwexpr*string*(string option) 
      | DAggregate of list delta
      | DNone 

   type conf_t = delta;

   (* a list of subgoals you have to remove *)
   type goal = {
      mutable name: hwliteral;
      mutable value: hwcomp;
   }
   
   (*the set of goals*)
   type goalnode = 
      | SolvedGoalNode of goal*conf_t*(goalnode list)
      | UnsolvedGoalNode of goal 
      | NoSolution
      | Assignment of string*string
      | Constant of string*string

   type goaltree = goalnode

   val init : hwliteral -> hwcomp -> goal
   
   val delta2str : delta -> string
   val goal2str : goal -> string
   val goaltree2str : goaltree -> string 

   val traverse : goaltree (goal -> goalnode) goal

end = 
struct 
   
   



end