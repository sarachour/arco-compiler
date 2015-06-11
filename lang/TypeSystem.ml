open Util 
open Relation
open Rule

(* Types *)
type typ = 
   Action of string*((string*typ) list)*relation*((string*rule) list)*(string*typ)
   | State of string
   | Signal of string
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
   val get_descendent_types: ts -> typ -> typ list
   val get_child_types: ts -> typ -> typ list
   val get_parent_types: ts -> typ -> typ list
   val get: ts->string->typ maybe
   val create: unit->ts
   val has: ts->typ->bool
   val add: ts->typ->ts
   val extends: ts->typ->typ->ts
   val is: ts->typ->typ->bool
   val type2str: typ -> string
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
   let create () = {types=[];hierarchy=[{entry=Parameter; children=[]; parents=[]}]}

   let get_child_types (root:ts) (t:typ) =
      let rec _get_child_types lst e : typ list = 
         match lst with
            h::t -> if h.entry = e then h.entry::h.children else _get_child_types t e 
            | [] -> []
      in 
         _get_child_types root.hierarchy t 
     
   let get_descendent_types (root:ts) (t:typ) : typ list=  
      let rec _get_desc_types (lst:typ list): typ list = 
         match lst with
            | h::t -> 
               let rest = _get_desc_types t in 
               let is_in = List.fold_right (fun x inside -> (h = x) || inside) rest false in
                  if is_in then rest
                  else (get_child_types root h) @ rest
            | [] -> []
      in
         _get_desc_types (get_child_types root t) 

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
            |Signal(n)::t -> if n = e then Some(Signal(n)) else _get t e 
            |Action(n,x1,x2,x3,x4)::t -> if n = e then Some(Action(n,x1,x2,x3,x4)) else _get t e 
            |[] -> None
         end
      in
         _get t.types e

   let add ts (ty:typ) =
      let validate_type (t:typ) =
         match t with 
            | Action(n,inp,rel,rules,out) ->
               let idents = List.map (fun (n,t) -> n) (inp@[out]) in
               begin
               try 
                  def4rel rel idents;
                  def4rules rules idents;
               with
                  | RuleException(e) -> raise (TypeException ("Rule "^n^": [RuleException] "^e)) 
                  | RelationException(e) ->  raise (TypeException ("Rule "^n^": [RelationException] "^e)) 
               end
            | _ -> ()
      in 
      let name = match ty with
         |State(x) -> x
         |Signal(x) ->x
         |Parameter ->"parameter"
         |Action(x,_,_,_,_) -> x
      in
      if (get ts name) = None then 
      begin
         validate_type ty;
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
      let rec _extends (nodes: typ list) (child:typ) : bool =
         begin
         match nodes with
            h::t -> 
               if h = par then  true else _extends t child 
            | [] -> false
         end
      in
         _extends (get_descendent_types t par) chld

   let rec type2str (t:typ) : string = 
      match t with
         |State(x) -> "state:"^x
         |Signal(x) -> "sig:"^x
         |Parameter -> "parameter"
         |Action(name, inputs, rel, rules, (nout, tout)) -> "action:"^name^"{ "^
               (List.fold_right (fun (n,t) str -> str^n^":"^(type2str t)^"*" ) inputs "")^" -> "^
               (Relation.to_string rel)^
               (List.fold_right (fun (n,r) str -> str^" -> "^n^" : "^(Rule.to_string r)) rules "")^
               " -> "^nout^":"^(type2str tout)^"\n"
            
      

   let to_string (t:ts) : string = 
      let prefix = "   " in 
      let rec _print_types (t: typ list) delim = 
         begin
         match t with 
            |h::t -> (type2str h)^delim^(_print_types t delim)
            |[] -> ""
         end
      in
      let rec _print_inheritence (env:ts) (t: typ list) delim delim2 = 
         match t with 
            | h::t -> (type2str h)^" := "^(_print_types (get_child_types env h) delim)^
               delim2^(_print_inheritence env t delim delim2)
            | [] -> ""

      in
         "# Types\n   "^(_print_types t.types "\n   ")^"\n"^
         "# Inheritence\n   "^(_print_inheritence t t.types " " "\n   ")^"\n"

   let extends (t:ts) (child:typ) (par:typ) : ts =
      let rec is_valid par chl = 
         begin
         match (par,chl) with
            |(State(a),State(b)) -> true
            |(Signal(a),Signal(b)) -> true
            |(Action(n1,inps1,rel1,rul1,outp1),Action(n2,inps2,rel2,rul2,outp2)) -> false
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