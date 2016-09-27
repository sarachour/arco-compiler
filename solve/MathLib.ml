open AST
open Unit
open Util
open MathData
open Common

exception MathException of string

let error n s = raise (MathException (n^": "^s))




module MathLib =
struct
  let refl x y = (x = y)
  let mkenv () : mid menv =
    {vars=MAP.make(); params=MAP.make();time=None; units=UnitLib.mkenv()}

  let mid2str x =
    let pr_nuid n  =
      (*n^":"^(UnitLib.unit2str u)*)
      n
    in
    match x with
    | MNVar(_,n) -> pr_nuid n 
    | MNParam(n,v) ->pr_nuid n 
    | MNTime -> pr_nuid "t" 

    
  let kind2str (k:mkind) : string = match k with
    | MInput -> "input"
    | MOutput -> "output"
    | MLocal -> "local"
(*
  let rel2str (v:mrel) : string = match v with
    | MRState(l,r,MNParam(_,ic,_)) -> (ASTLib.ast2str r (fun x -> mid2str x))^" | ic = "^(string_of_number ic)
    | MRFunction(l,r) -> (ASTLib.ast2str r (fun x -> mid2str x))
    | MRNone -> "(none)"
*)
 (*
  let mid2unit (x:mid) : unt = match x with
    |MNVar(_,_) -> u
    |MNParam(_,_) -> u
    |MNTime -> u
*)
  let mid2name x =
    match x with
    | MNVar(_,n)-> n
    | MNParam(n,v) -> n
    | MNTime ->  "t"


  let to_buf m fb =
    let os x = output_string fb x in
    let var_to_buf (v:mid mvar) : unit=
      let _ =
        os ((v.name)^":"^"TODO\n")
      in
      ()
    in
    Printf.printf "==== Units ====\n";
    UnitLib.to_buf (m.units) fb;
    Printf.printf "==== Vars =====\n";
    MAP.iter (m.vars) (fun k v -> var_to_buf v);
    ()

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
    MAP.has e.vars name 

  let getkind e name =
    if isvar e name = false then
      error "getkind" "this is not a variable"
    else
      (getvar e name).knd

  let getunit e name =
    let n = getvar e name in
    n.typ 
    
  let isparam e name = 
    MAP.has e.params name

  let getparam e name = 
    if isparam e name = false then
      error "getparam" ("variable hs not a param")
    else
      MAP.get e.params name

  let istime e name = match e.time with
    | Some(t) -> t = name
    | None -> false

  let var_to_mid e name =
    if isparam e name then
      let p = getparam e name in
      MNParam(p.name,p.value)
    else if isvar e name then
      let v = getvar e name in
      MNVar(v.knd,v.name)
    else if istime e name then
      MNTime
    else
      error "var_to_mid" "error"

  let mktime e name un : mid menv =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
    let _ = e.time <- Some(name) in
    if UnitTypeChecker.valid (e.units) un then
      e
    else
      error "mkvar" "type is invalid"

  let set_mag e (name:string) (min:number) (max:number) (typ:unt) =
    ()

  let mkvar e name knd un : mid menv =
    if isvar e name || isparam e name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      begin
      if UnitTypeChecker.valid (e.units) un then
        let v = {name=name; bhvr=MBhvUndef; knd=knd; typ=un} in
        e.vars <- MAP.put e.vars name v;
        e
      else 
        error "mkvar" "type is invalid"
      end

  let mkparam e name vl un : mid menv =
    if isvar e name || isparam e name then
      error "mkparam" ("param "^name^" already exists.")
    else
      begin
      if UnitTypeChecker.valid (e.units) un then
        let v = {name=name;value=vl;typ=un} in
        let _ = e.params <- MAP.put (e.params) name v in
        e
      else
        error "mkvar" "type is invalid"
      end

  let mkstrel e name (rhs:mid ast) ic =
    if MAP.has (e.vars) name = false then
      error "mkstrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.bhvr <> MBhvUndef then
        error "mkstrel" ("variable "^name^" already has relation defined.")
      else
        match e.time with
        | Some(tv) ->
          let bhv : mid mderiv = {
            rhs=rhs;
            ic=ic
          } in
          dat.bhvr <- MBhvStateVar(bhv);
          e
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


  let mkrel e name rhs : mid menv =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.bhvr <> MBhvUndef then
        error "mkrel" ("variable "^name^" already has relation defined.")
      else
        if true then
          let bhv : mid mfxn = {rhs=rhs} in
          let _ = dat.bhvr <- MBhvVar(bhv) in
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
