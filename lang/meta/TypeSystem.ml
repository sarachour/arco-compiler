open Util 
open Relation

(* Types *)
type typ = 
   Action of string*(typ list)*relation*typ
   | State of string
   | Parameter
;;



(* type system with inheritence *)
module type TypeSystemSig =
sig 
   type 'a tree = 
      Leaf of 'a 
      | Node of 'a * 'a tree list
      | Empty 
   ;;
   type ts = {
      mutable types: typ list;
      mutable hierarchy:typ tree;
   }
   val get_child_types: typ tree -> typ -> typ list
   val get_parent_types: typ tree -> typ -> typ list
   val get: ts->string->typ maybe
   val create: unit->ts
   val has: ts->typ->bool
   val add: ts->typ->ts
   val extends: ts->typ->typ->ts
   val is: ts->typ->typ->bool
end 


module TypeSystem : TypeSystemSig = struct
   type 'a tree = 
      Leaf of 'a 
      | Node of 'a*('a tree list) 
      | Empty 
   ;;
   type ts = {
      mutable types: typ list;
      mutable hierarchy: typ tree;
   }
   let create () = {types=[];hierarchy=Empty}

   let get_child_types root t =
      let rec _traverse_vert r ty : (typ list) maybe =
         let rec _traverse_horiz lst ty : (typ list) maybe = 
            begin
            match lst with
               h::t -> 
                  let hl = _traverse_vert h ty in
                  let tl = _traverse_horiz t ty in
                  begin
                  match (hl,tl) with
                     (Some(a), Some(b)) -> Some(a@b)
                     |(Some(a), None) -> Some(a)
                     |(None, Some(b)) -> Some(b)
                     |(None,None) -> None
                  end
               | [] -> None 
            end
         in 
         begin
         match r with
            Node(m,lst) -> 
               let rest = match (_traverse_horiz lst ty) with Some(a) -> a | None -> [] in
               if m = ty then Some(m::rest)
               else Some(rest)
            | Leaf(m) -> Some([m])
            | Empty -> None
         end
      in 
         begin
         match _traverse_vert root t  with
            Some(a) -> a 
            | None -> []
         end

   let get_parent_types root t =
      let rec _traverse_vert r ty upst : (typ list) maybe =
         let rec _traverse_horiz lst ty upst : (typ list) maybe = 
            begin
            match lst with
               h::t -> 
                  begin
                  match _traverse_vert h ty upst with
                     Some(a) -> Some(a)
                     | None -> (_traverse_horiz t ty upst)
                  end
               | [] -> None 
            end
         in 
         begin
         match r with
            |Node(m,lst) -> if m = ty 
               then Some(m::upst) 
               else _traverse_horiz lst ty upst
            | Leaf(m) -> if m = t then Some([m]) else None
            | Empty -> None
         end
      in 
         begin
         match _traverse_vert root t [] with
            Some(a) -> a 
            | None -> []
         end

   
   let get (t:ts) (e:string) : typ maybe =
      let rec _get (r:typ list) (e:string) =
         begin
         match r with
            |Parameter::t -> if e = "parameter" then Some(Parameter) else _get t e
            |State(n)::t -> if n = e then Some(State(n)) else _get t e 
            |Action(n,x1,x2,x3)::t -> if n = e then Some(Action(n,x1,x2,x3)) else _get t e 
            |[] -> None
         end
      in
         _get t.types e

   let add ts (ty:typ) =
      let name = match ty with
         |State(x) -> x
         |Parameter ->"parameter"
         |Action(x,_,_,_) -> x
      in
      if (get ts name) = None then 
      begin
         ts.types <- ty::(ts.types);
         ts
      end
      else 
         raise (TypeException "type already exists.")


   let has (t:ts) (e:typ) : bool =
      let rec _has (r:typ list) (e:typ) =
         begin
         match r with
            h::t -> if h = e then true else _has t e 
            |[] -> false
         end
      in
         _has t.types e


   let is (t:ts) (chld:typ) (par:typ) : bool =
      let rec _extends (m:typ) (l:typ list) : bool=
         begin
         match l with
            h::t -> if h = m then true else _extends m t 
            | [] -> false
         end
      in
         _extends chld (get_child_types t.hierarchy par)

   let extends (t:ts) (child:typ) (par:typ) : ts =
      let rec remove_elem rt e : ((typ tree) maybe)*(typ tree) =
         let rec remove_from_children lst e :((typ tree) maybe)*((typ tree) list) = 
            begin 
            match lst with 
               h::t -> 
                  begin
                  match remove_elem h e with
                     |(Some(a), Empty) -> (Some(a), t)
                     |(Some(a), newh) -> (Some(a), newh::t)
                     |(None, newh) -> 
                        let (a,nlst) = remove_from_children t e in (a,h::nlst)
                  end
               | [] -> (None,[])
            end
         in
         begin
         match rt with
            Node(a,lst) -> if a = e 
               then (Some(Node(a,lst)),Empty) 
               else 
                  let (q,lst) = remove_from_children lst e in 
                     (q, Node(a,lst))
            | Leaf(a) -> if a = e then (Some(Leaf(a)),Empty) else (None,Leaf(a))
            | Empty -> (None, Empty)
         end
      in   
      let rec add_elem rt par e : (typ tree) = 
         begin
         match rt with
            |Node(a,rest) -> if a = par then Node(a,e::rest) else Node(a,rest)
            | Leaf(a) -> if a = par then Node(a,[e]) else Leaf(a)
            | Empty -> Empty
         end
      in
      let rec is_valid par chl = 
         let rec is_valid_arglist parlst chllst=
            begin
            match (parlst,chllst) with
               (h1::t1,h2::t2) ->
                  if (is t h2 h1) then (is_valid_arglist t1 t2) else false
               |([],[]) -> true
               | _ -> false
            end
         in
         begin
         match (par,chl) with
            (State(a),State(b)) -> true
            |(Action(n1,inps1,rel1,outp1),Action(n2,inps2,rel2,outp2)) ->
               (is_valid_arglist inps1 inps2 && is_valid_arglist [outp1] [outp2])
         end
      in
      if has t par && has t child then
         if is_valid par child then
            let (subtree, ntree) = remove_elem t.hierarchy child in
            begin
            match subtree with
               | Some(st) -> let newtree = add_elem ntree par st in t.hierarchy <- newtree; t
               | None -> raise (TypeException "Failed to extend type.")
            end
         else
            raise (TypeException "type cannot extend provided type because type signatures mismatch.")
      else
         raise (TypeException "cannot extend: parent or child type doesn't exist.")


end;;