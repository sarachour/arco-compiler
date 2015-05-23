(* kind with name *)


type 'a maybe = Some of 'a | None

type fragment = 
   Token of string
   | Kind of string
   | Variable of string
   | Group of fragment list
   | Optional of fragment list
   | Required of fragment list
   | Action of string
;;

type grammar = fragment list


type varlist = (string*string) list

exception BSLexiconParseError of string
exception BSLexiconBindError of string
let kind_exists kname = true

let raise_parse_error x = raise (BSLexiconParseError x)
let raise_bind_error x = raise (BSLexiconBindError x)
let rec grammar2str (g:grammar) = 
   match g with
      Token(a)::t -> a^" "^(grammar2str t)
      | Kind(a)::t -> a^":kind "^(grammar2str t)
      | Action(a)::t -> a^":action "^(grammar2str t)
      | Variable(a)::t -> a^":var "^(grammar2str t)
      | Group(a)::t -> "("^(grammar2str a)^") "^(grammar2str t)
      | Required(a)::t -> "req"^(grammar2str [Group(a)])^(grammar2str t)
      | Optional(a)::t -> "opt"^(grammar2str [Group(a)])^(grammar2str t)
      | [] -> ""

let rec pg (g: grammar) (s: string list) : varlist*(string list) = 
   let perr = raise_parse_error in
   match (g,s) with
      (Token(a1)::t1,a2::t2) -> 
         if a1 = a2 then pg t1 t2 else perr (a1^" and "^a2^" don't match.")
      |(Kind(a1)::t1,a2::t2) -> 
         if (a1 = a2) then 
            if (kind_exists a1) then pg t1 t2 else perr("kind "^a1^" does not exist")
         else perr (a1^" and "^a2^" don't match.")
      |(Variable(a1)::t1,a2::t2) -> 
         let v,s = pg t1 t2 in
         (a1,a2)::v,s
      |(Group(a1)::t1,t) -> 
         let v1,s1 = (pg a1 t) in 
         let v2,s2 = (pg t1 s1) in
            (v1 @ v2),(s1 @ s2)
      |(Required(a1)::t1,t) ->
         pg (Group(a1)::t1) t
      |(Optional(a1)::t1,t) ->
         begin
         try 
            pg (Required(a1)::t1) t 
         with
            BSLexiconParseError(s) -> (pg t1 t)
            | _ -> perr "unknown error" ;
         end
      |([],[]) -> [],[]
      | _  -> perr "unknown error"


let rec gg (g:grammar) (v: varlist) : string list = []

type kind = {
   name: string;
   phrase: grammar;
}
module Kind ( Q : sig type typ end) : 
sig
   type t = Q.typ
   val spec  : kind 
   val parse :  string list -> t maybe
   val generate :  t -> (string list) maybe
   val bind : varlist -> t maybe 
   val unbind : t -> varlist
   val test : string list -> bool
   val to_string : string
end =
struct 
   type t = Q.typ
   
   let spec = {name="";phrase=[]}

   let _name = ""
   let bind v = None
   let unbind i = []

   let parse s =
      try
         let v =  (pg spec.phrase s) in 
         bind v
      with
         _ -> None

   let generate i = 
      try
         let v = unbind i in 
         Some(gg spec.phrase v)
      with
      | _ -> None

   let to_string  =
      "name:"^spec.name^"\n"^
      "grammar:"^grammar2str spec.phrase^"\n"

   let test g = match parse g with
      Some(a) -> true
      | None -> false


end


