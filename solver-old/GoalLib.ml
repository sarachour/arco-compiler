open GoalData
open HwLib
open HwData
open Util

exception GoalLibException of string;;
(*
  Given a partial hardware configuration (things partly connected with generic connections)
  Determine if the following component-relation pattern
*)
module GoalUtils :
sig
  val goal2str : goal -> string
  val goalnode2str : goalnode -> string
  val _goalnode2str : string -> goalnode -> string
  val make_goal : hwliteral option -> hwcomp -> goal
  val is_eq : goalnode -> goalnode -> bool
  val remove_dups : goalnode -> goalnode
end =
struct

  let __spacing = "  "

  let _goal2str (prefix:string) (d:goal) : string =
     let expr = HwUtil.hwrel2str (List.nth (d.value.relations) 0) in
     match d.name with
        | Some(name) -> prefix^"goal -> "^(HwUtil.hwlit2str name)^" | "^expr
        | None ->  prefix^"goal -> _ | "^expr

  let rec _goalnode2str (prefix:string) (d:goalnode) : string =
     let _goallist2str lst delim=
        List.fold_right (fun x r -> r^delim^(_goalnode2str (prefix^__spacing) x)) lst ""
     in
     match d with
     | GNoSolutionNode(g) -> prefix^"no solution\n"
     | GUnsolvedNode(g) -> prefix^(_goal2str (prefix^__spacing) g)^"\n"
     | GSolutionNode(g,subs) ->
        (_goal2str prefix g)^"\n"^"\n\n"^
        (_goallist2str subs "")
     | GMultipleSolutionNode(g,lst) ->
        prefix^"multiple solutions:\n\n"^
        (_goallist2str lst "\n")
     | GTrivialNode(g) -> prefix^"trivial.\n"
     | GEmpty -> prefix^"empty.\n"
     | GLinkedNode(g) -> prefix^"linked:"^(_goal2str (prefix^__spacing) g)^"\n"


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
     | (GSolutionNode(g1,s1),GSolutionNode(g2,s2)) ->
        g1 = g2 && (eq_lsts s1 s2)
     | (GMultipleSolutionNode(g1,l1),GMultipleSolutionNode(g2,l2)) ->
        g1 = g2 && (eq_lsts l1 l2)
     | _ -> false

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
   type slnset = SlnSet.set
   type goal_table = {
      mutable tbl: (goal*slnset) list
   }
   val create : unit -> goal_table
   val has_goal : goal_table -> goal -> bool
   val get_goal : goal_table -> goal -> slnset option
   val concretize : goal_table -> goal_table
   val declare_goal : goal_table -> goal -> goal_table
   val add_solution : goal_table -> goal -> goalnode -> goal_table
   val remove_dups : goal_table -> goalnode -> goalnode
end =
struct
   type slnset = SlnSet.set
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
         tb.tbl <- (g,SlnSet.create())::tb.tbl;
         tb
         end
      else tb

   let add_solution tb g n: goal_table =
      if (has_goal tb g) then
         let rec upd_tb x = match x with
            | (gl,s)::t -> if gl = g
               then
                  let ns = SlnSet.add s n in
                  (gl,ns)::t
               else
                  (gl,s)::(upd_tb t)
            | [] -> []
         in
         tb.tbl <- upd_tb tb.tbl; tb
      else raise (GoalLibException "goal does not exist in table.")

   let rec remove_dups tb (n:goalnode): goalnode =
      match n with
      | GUnsolvedNode(g) -> if has_goal tb g then GLinkedNode(g) else GUnsolvedNode(g)
      | GMultipleSolutionNode(g,lst) ->
         let nlst = List.map (fun x -> remove_dups tb x) lst in
         GMultipleSolutionNode(g,nlst)
      | _ -> n

   type conc_tbl = {
      mutable c: goal list
   }
   let concretize_node (ct:conc_tbl) (gt:goal_table) (goalnode:goalnode) : goalnode =
      let replace_in_table (gl:goal) (st:goalnode list) =
         let rec _replace_in_table gl st tbl =
            match tbl with
            |(v,sols)::t -> if v = gl
               then (v,st)::(_replace_in_table gl st t)
               else (v,sols)::(_replace_in_table gl st t)
            | [] -> []
         in
         gt.tbl <- _replace_in_table gl st gt.tbl
      in
      let is_concretized (gl:goal) =
         let res = (List.length (List.filter (fun x -> x = gl) ct.c)) > 0 in
         res
      in
      let mark_concretized (gl:goal) =
         ct.c <- gl::ct.c
      in
      let is_no_sol x = match x with
         | GNoSolutionNode(_) -> true
         | _ -> false
      in
      let rec _cn (stk:goal list) (gn:goalnode) : goalnode=
         let handle_list stack lst =
            List.map (fun x -> _cn stack x) lst
         in
         match gn with
         | GSolutionNode(g,chld) ->
            let rest = handle_list stk chld in
            if List.length (List.filter is_no_sol rest) > 0
            then GNoSolutionNode(g)
            else GSolutionNode(g,rest)
         | GMultipleSolutionNode(g,chld) ->
            let rest = handle_list stk chld in
            let rest = List.filter (fun x -> (is_no_sol x) = false) rest in
            GMultipleSolutionNode(g,rest)
         | GUnsolvedNode(g) ->
            _cn stk (GLinkedNode(g))
         | GLinkedNode(g) ->
            if OptUtils.has stk g then
               GNoSolutionNode(g)
            else
               begin
               match get_goal gt g with
               | Some([h]) ->
                  if is_concretized g then
                     h
                  else
                     let nh = _cn (g::stk) h in
                     let _ = replace_in_table g [nh] in
                     let _ = mark_concretized g in
                     nh
               | Some(h::t) ->
                  if is_concretized g then
                     GMultipleSolutionNode(g,h::t)
                  else
                     let nht = handle_list (g::stk) (h::t) in
                     let _ = replace_in_table g nht in
                     let _ = mark_concretized g in
                     GMultipleSolutionNode(g,nht)
               | Some([]) -> GNoSolutionNode(g)
               | None -> GNoSolutionNode(g)
               end
         | _ -> gn
      in
         _cn [] goalnode

   let concretize (gt:goal_table): goal_table =
      let ct : conc_tbl = {c=[]} in
      let mark_concretized (gl:goal) =
         ct.c <- gl::ct.c
      in
      let proc_sln (g:goal) (s:goalnode) : goalnode option=
         match concretize_node ct gt s with
         | GNoSolutionNode(_) -> let _ = mark_concretized g in None
         | gn -> let _ = mark_concretized g in Some(gn)
      in
      let proc_slns (g:goal) (s:slnset) : (goal*slnset) option =
         let nelems = OptUtils.conc (List.map (fun x -> proc_sln g x) s) in
         match nelems with
         | h::t -> Some (g,nelems)
         | [] -> None
      in
      gt.tbl <- OptUtils.conc (List.map (fun (g,s) -> proc_slns g s) (gt.tbl) );
      gt


end

(*

   let replace_links (tb:goal_table) (g:goalnode) (iactive:bool): goalnode =
      let is_no_sol x = match x with
         | GNoSolutionNode(_) -> true
         | _ -> false
      in
      let _ = Printf.printf "Resolving Links.. this may take a while\n" in
      let has e lst = List.length (List.filter (fun x -> x = e) lst) > 0 in
      let rec _replace_links (depth:int) (g:goalnode) =
         let handle_list (lst: goalnode list) : goalnode list =
            List.map (fun x -> _replace_links (depth+1) x) lst
         in
         match g with
         | GMultipleSolutionNode(g,sols) ->
            let _ = exc (fun () -> Printf.printf "> m[%d]: %s\n" depth (GoalData.goal2str g)) iactive in
            let rest = handle_list sols in
            let rest = List.filter (fun x -> (is_no_sol x) = false) rest in
            begin
            match rest with
            | [h] -> h
            | h::t -> GMultipleSolutionNode(g,rest)
            | [] -> GNoSolutionNode(g)
            end
         | GSolutionNode(g,d,sols) ->
            let _ = exc (fun () -> Printf.printf "> s[%d]: %s\n" depth (GoalData.goal2str g)) iactive in
            let rest = handle_list sols in
            if List.length (List.filter (fun x -> is_no_sol x) rest) = 0 then
               GSolutionNode(g,d,rest)
            else
               GNoSolutionNode(g)
         | GLinkedNode(g) ->
            let _ = exc (fun () ->Printf.printf  "> l[%d]: %s\n" depth (GoalData.goal2str g)) iactive in
            begin
               match GoalTable.get_goal tb g with
               | Some([gn]) -> gn
               | Some(gh::gt) -> GMultipleSolutionNode(g,(gh::gt))
               | Some([]) -> GNoSolutionNode(g)
               | None -> GNoSolutionNode(g)
            end
         | GUnsolvedNode(g) ->
			let _ = Printf.printf "WARNING: found unexpected unsolved node in link strengthening\n" in
			_replace_links (depth+1) (GLinkedNode(g))
		 | GTrivialNode(g,d) -> GTrivialNode(g,d)
		 | GNoSolutionNode(g) -> GNoSolutionNode(g)
         | _ ->  raise (DerivationException "Unexpected Node.")
      in
         _replace_links 0 g


*)
