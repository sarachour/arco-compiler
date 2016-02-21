open AST
open Unit
open Util
open MathCstr
open Common

exception MathException of string

let error n s = raise (MathException (n^": "^s))



type mid =
  | MNVar of mkind*string*unt
  | MNParam of string*number*unt
  | MNTime of unt

type mrel = MRState of mid*(mid ast)*mid | MRFunction of mid*(mid ast) | MRNone


type mtype = mid

type mvar = {
  name: string;
  mutable rel: mrel;
  typ: mtype;
}

type menv = {
  mutable vars : (string, mvar) map;
  mutable units: unt_env;
  mutable time : string option;
  mutable cstr: mcstrs;
}


module MathLib:
sig
  val mkenv : unit -> menv
  val to_buf : menv -> out_channel -> unit
  val to_file : menv -> string -> unit
  val cstrs : menv -> mcstrs
  val mid2str : mid -> string
  val kind2str: mkind -> string
  val mid2name : mid -> string
  val rel2str : mrel -> string
  val mkvar : menv -> string -> mkind -> unt -> menv
  val mktime : menv -> string -> unt -> menv
  val getvar : menv -> string -> mvar
  val getkind : menv -> string -> mkind option
  val mkparam : menv -> string -> number -> unt -> menv
  val mkstrel : menv -> string -> mid ast -> number -> menv
  val mkrel : menv -> string -> mid ast -> menv
  val isvar : mvar -> bool
  val isvar : menv -> string -> bool

end =
struct
  let refl x y = (x = y)
  let mkenv () : menv =
    {vars=MAP.make(); time=None; units=UnitLib.mkenv(); cstr=MathCstrLib.mkcstrs()}

  let cstrs e = e.cstr
  let mid2str x =
    let pr_nuid n u =
      (*n^":"^(UnitLib.unit2str u)*)
      n
    in
    match x with
    | MNVar(_,n,u) -> pr_nuid n u
    | MNParam(n,v,u) ->pr_nuid n u
    | MNTime(u) -> pr_nuid "t" u

  let isvar v =
    match v.typ with
    | MNVar(_) -> true
    | _ -> false

  let kind2str (k:mkind) : string = match k with
    | MInput -> "input"
    | MOutput -> "output"
    | MLocal -> "local"

  let rel2str (v:mrel) : string = match v with
    | MRState(l,r,MNParam(_,ic,_)) -> (ASTLib.ast2str r (fun x -> mid2str x))^" | ic = "^(string_of_number ic)
    | MRFunction(l,r) -> (ASTLib.ast2str r (fun x -> mid2str x))
    | MRNone -> "(none)"

  let mid2unit (x:mid) : unt = match x with
    |MNVar(_,_,u) -> u
    |MNParam(_,_,u) -> u
    |MNTime(u) -> u

  let mid2name x =
    match x with
    | MNVar(_,n,u) -> n
    | MNParam(n,v,u) -> n
    | MNTime(u) ->  "t"



  let typ2str (v:mtype) : string = mid2str v



  let to_buf m fb =
    let os x = output_string fb x in
    let var_to_buf (v:mvar) : unit=
      let _ =
        os ((v.name)^":"^(typ2str v.typ)^" = "^(rel2str v.rel)^"\n")
      in
      ()
    in
    Printf.printf "==== Units ====\n";
    UnitLib.to_buf (m.units) fb;
    Printf.printf "==== Vars =====\n";
    MAP.iter (m.vars) (fun k v -> var_to_buf v);
    Printf.printf "==== Cstrs ======\n";
    MathCstrLib.print m.cstr

  let to_file m file =
    let oc = open_out file in
    let _ = to_buf m oc in
    let _ = close_out oc in
    ()

  let gettime e =
   e.time


  let hasvar e name =
    MAP.has e.vars name

  let getvar e name =
    if hasvar e name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      MAP.get (e.vars) name

  let isvar e name =
    match (getvar e name).typ with
    | MNVar(_) -> true
    | _ -> false

  let getkind e name =
    if hasvar e name then
      match (getvar e name).typ with
      | MNVar(k,_,_) -> Some k
      | _ -> None
    else
      error "getkind" ("variable "^name^" does not exist")

  let getunit e name =
    let n = getvar e name in
    match n.typ with
    | MNVar(_,_,u) -> u
    | MNParam(_,_,u) -> u
    | MNTime(u) -> u

  let mktime e name un : menv =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
    let _ = e.time <- Some(name) in
    if UnitTypeChecker.valid (e.units) un then
      let v = {name=name; rel=MRNone; typ=MNTime(un)} in
      let _ = e.vars <- MAP.put (e.vars) name v in
      e
    else
      error "mkvar" "type is invalid"


  let mkvar e name knd un : menv =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      begin
      if UnitTypeChecker.valid (e.units) un then
        let v = {name=name; rel=MRNone; typ=MNVar(knd,name,un)} in
        let _ = e.vars <- MAP.put (e.vars) name v in
        e
      else
        error "mkvar" "type is invalid"
      end

  let mkparam e name vl un : menv =
    if MAP.has (e.vars) name then
      error "mkparam" ("param "^name^" already exists.")
    else
      begin
      if UnitTypeChecker.valid (e.units) un then
        let v = {name=name; rel=MRNone; typ=MNParam(name,vl,un)} in
        let _ = e.vars <- MAP.put (e.vars) name v in
        e
      else
        error "mkvar" "type is invalid"
      end

  let mkstrel e name (rhs:mid ast) ic =
    if MAP.has (e.vars) name = false then
      error "mkstrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MRNone then
        error "mkstrel" ("variable "^name^" already has relation defined.")
      else
        let getkind x = match x with
        |MNVar(k,_,_) -> k
        | _ -> error "mkstrel" "must be var"
        in
        match e.time with
        | Some(tv) ->
          let tu = (getvar e tv).typ in
          let lu = (getvar e name).typ in
          let lk = getkind ((getvar e name).typ) in
          let lhs : mid ast= (Deriv(Term(lu),Term(tu))) in
          if true then
            let icname = (name^"_0") in
            let ictype = mid2unit lu in
            let _ = mkparam e icname ic ictype in
            let _ = dat.rel <- MRState(lu,rhs,MNParam(icname,ic,ictype)) in
            e
          else e
          (*
          let tr : untid ast = UnitTypeChecker.typeof rhs mid2unit in
          let tl : untid ast= UnitTypeChecker.typeof lhs mid2unit in
          if UnitTypeChecker.typecheck tl tr then
            let icname = (name^"_0") in
            let ictype = mid2unit lu in
            let _ = mkparam e icname ic ictype in
            let _ = dat.rel <- MRState(lu,rhs,MNParam(icname,ic,ictype)) in
            e
          else
            error "mkstrel" ("variable "^name^" doesn't type check with expression: "^
              (UnitLib.unit2str (UExpr tl))^" =? "^(UnitLib.unit2str (UExpr tr))
          *)
        | None ->
          error "mkstrel"  "time variable not defined anywhere."


  let mkrel e name rhs : menv =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.rel <> MRNone then
        error "mkrel" ("variable "^name^" already has relation defined.")
      else
        if true then
          let mid = (getvar e name).typ in
          let _ = dat.rel <- MRFunction(mid,rhs) in
          e
        else e
        (*
        let get_type x = getunit e x in
        let mid = (getvar e name).typ in
        let tl = UnitTypeChecker.typeof (Term(mid)) mid2unit in
        let tr = UnitTypeChecker.typeof rhs mid2unit in
        if UnitTypeChecker.typecheck tl tr then
          let _ = dat.rel <- MRFunction(mid,rhs) in
          e
        else
          error "mkrel"  ("variable "^name^" doesn't type check with expression: "^
            (UnitLib.unit2str (UExpr tl))^" =? "^(UnitLib.unit2str (UExpr tr)))
        *)
end
