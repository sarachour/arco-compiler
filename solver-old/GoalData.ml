open HwData
(* a list of subgoals you have to remove *)
type goal = {
   mutable name: hwliteral option;
   mutable value: hwcomp;
}

(*the set of goals. A solved goal node is a goal with a list of new subgoals
An aggregate goal node is a list of possible solutions of a goal*)
type goalnode =
   | GSolutionNode of goal*(goalnode list)
   | GUnsolvedNode of goal
   | GMultipleSolutionNode of goal*(goalnode list)
   | GNoSolutionNode of goal
   | GTrivialNode of goal
   | GLinkedNode of goal
   | GEmpty

module SlnSet = Util.Set(struct type t = goalnode end)
