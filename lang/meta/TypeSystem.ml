open Util 
open Relation


(* Types *)
type typ = 
   Action of string*((string*typ) list)*relation*typ
   | State of string
   
   | Parameter
;;
type identifier = string*typ



(* type system with inheritence *)
module type TypeSystemSig =
sig 
   type inherit_entry = {
      entry: typ;
      mutable children: typ list;
      mutable parents: typ list;
   }
   type ts = {
      mutable types: typ list;
      mutable hierarchy:inherit_entry list;
   }
   val get_child_types: ts -> typ -> typ list
   val get_parent_types: ts -> typ -> typ list
   val get: ts->string->typ maybe
   val create: unit->ts
   val has: ts->typ->bool
   val add: ts->typ->ts
   val extends: ts->typ->typ->ts
   val is: ts->typ->typ->bool
   val to_string: ts -> string
end 


module TypeSystem : TypeSystemSig = struct
   type inherit_entry = {
      entry: typ;
      mutable children: typ list;
      mutable parents: typ list;
   }
   type ts = {
      mutable types: typ list;
      mutable hierarchy: inherit_entry list;
   }
   let create () = {types=[];hierarchy=[]}

   let get_child_types (root:ts) (t:typ) =
      let rec _get_child_types lst e : typ list = 
         match lst with
            h::t -> if h.entry = e then h.children else _get_child_types t e 
            | [] -> []
      in 
         _get_child_types root.hierarchy t 
        

   let get_parent_types (root:ts) (t:typ) =
      let rec _get_parent_types lst e: typ list = 
         match lst with
            h::t -> if h.entry = e then h.parents else _get_parent_types t e 
            | [] -> []
      in 
         _get_parent_types root.hierarchy t

   
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
         ts.hierarchy <- {entry=ty;children=[];parents=[]}::ts.hierarchy;
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
      let rec _extends (m:typ) (l:typ list) : bool =
         begin
         match l with
            h::t -> if h = m then true else _extends m t 
            | [] -> false
         end
      in
         _extends chld (get_child_types t par)

   let to_string (t:ts) : string = 
      let rec _print_type (t:typ) = 
         begin
         match t with
            |State(x) -> "state:"^x
            |Parameter -> "parameter"
            |Action(name, inputs, rel, output) -> "action:"^name
               ^" ("^
                  (List.fold_right (fun (n,t) str -> str^n^"="^(_print_type t)^"," ) inputs "")
               ^") -> "^(to_string rel)^" -> "^(_print_type output)
               
         end
      in
      let rec _print_types (t: typ list) delim = 
         begin
         match t with 
            |h::t -> (_print_type h)^delim^(_print_types t delim)
            |[] -> ""
         end
      in
      let rec _print_inheritence (env:ts) (t: typ list) delim delim2 = 
         match t with 
            | h::t -> (_print_type h)^" := "^(_print_types (get_child_types env h) delim)^
               delim2^(_print_inheritence env t delim delim2)
            | [] -> ""

      in
         "# Types\n   "^(_print_types t.types "\n   ")^"\n"^
         "# Inheritence\n   "^(_print_inheritence t t.types " " "\n   ")^"\n"

   let extends (t:ts) (child:typ) (par:typ) : ts =
      let rec is_valid par chl = 
         begin
         match (par,chl) with
            (State(a),State(b)) -> true
            |(Action(n1,inps1,rel1,outp1),Action(n2,inps2,rel2,outp2)) -> false
            | _ -> false
         end
      in
      let rec add_child (lst:inherit_entry list) (par:typ) (chl:typ) : inherit_entry list = 
         match lst with
            | h::t -> if h.entry = par 
               then begin h.children <- chl::h.children; h::t end
               else h::(add_child t par chl)
            | [] -> []
      in
      let rec add_parent lst par chl = 
         match lst with
            | h::t -> if h.entry = chl 
               then begin h.parents <- par::h.parents; h::t end
               else h::(add_parent t par chl)
            | [] -> []
      in
      if has t par && has t child then
         if is_valid par child then
            begin
            t.hierarchy <- add_child t.hierarchy par child;
            t.hierarchy <- add_parent t.hierarchy par child;
            t
            end
         else
            raise (TypeException "type cannot extend provided type because type signatures mismatch.")
      else
         raise (TypeException "cannot extend: parent or child type doesn't exist.")


end;;