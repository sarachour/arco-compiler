open AST
open Unit
open Util
open HWCstr
open Common
open HWData



exception HwLibError of string

module HwLib =
struct

  let mkenv () = {
    units=UnitLib.mkenv();
    comps=MAP.make();
    props=MAP.make();
    cstr=HwCstrLib.mkcstrs();
    time=None}

  let copy_cid prop = "copy."^prop
  let input_cid prop = "input."^prop
  let output_cid prop = "output."^prop

  let get_special nm =
  match STRING.split nm "\." with
  | ["copy";q] -> Some("copy",q)
  | ["input";q] -> Some("input",q)
  | ["output";q] -> Some("output",q)
  | _ -> None

  let is_special nm = match get_special nm with
  | Some(_) -> true
  | None -> false

  let getcstr c = c.cstr

  let hwid2port hwid = match hwid with
  | HNPort(k,HCMGlobal(c,i),n,p,_) -> k,c,n,p,Some(i)
  | HNPort(k,HCMLocal(c),n,p,_) -> k,c,n,p,None
  | _ -> error "hwid2port" "only works for port hwids"

  let compid2str c = match c with
  | HCMGlobal(n,i) -> n
  | HCMLocal(n) -> n

  let tolcl x = match x with
  | HNPort(k,HCMGlobal(c,i),x,p,u) ->
    HNPort(k,HCMLocal(c),x,p,u)
  | _ -> x

  let hwvid2str e =
    let c2str c = match c with
    | HCMLocal(n) -> n^"."
    | HCMGlobal(n,i) -> n^"["^(string_of_int i)^"]."
    in
    match e with
    | HNPort(_,c,v,prop,unt) ->(c2str c)^prop^"{"^v^"}:"^unt
    | HNParam(c,v,vl,u) -> (c2str c)^v
    | HNTime(_) -> "t"

  let rel2str v =
    match v with
    | HRNone -> "(none)"
    | HRFunction(l,r) -> "fun "^ASTLib.ast2str r (fun x -> hwvid2str x)
    | HRState(l,r,ic) -> "state "^ASTLib.ast2str r (fun x -> hwvid2str x)^" initial:"^(hwvid2str ic)

  let cv2hwid c v prop inst =
    match v.typ,prop,inst with
    | (HPortType(k,m),Some(p),None) ->
      if MAP.has m p = false then error "cv2hwid" ("property "^p^" does not exist in map for "^c.name) else
      HNPort(k,HCMLocal(c.name),v.name,p,MAP.get m p)
    | (HPortType(k,m),Some(p),Some(i)) ->
      if MAP.has m p = false then error "cv2hwid" ("property "^p^" does not exist in map for "^c.name) else
      HNPort(k,HCMGlobal(c.name,i),v.name,p,MAP.get m p)
    | (HParamType(f,u),_,None) ->
      HNParam(HCMLocal(c.name),v.name,f,u)
    | (HParamType(f,u),_,Some(i)) ->
      HNParam(HCMGlobal(c.name,i),v.name,f,u)
    | _ -> error "cv2hwid" "unexpected arguments"

  let print e =
    let pkind2str v =
      match v with
      | HNInput -> "input"
      | HNOutput -> "output"
    in
    let type2str v =
      match v with
      | HPortType(knd,tps) -> "port "^(pkind2str knd)
      | HParamType(v,t) -> "param : "^(UnitLib.unit2str t)^" = "^(string_of_number v)
    in
    let print_var (x:hwvar) =
      let _ = Printf.printf "   %s of %s" x.name (type2str x.typ) in
      let _ = Printf.printf " : %s " (rel2str x.rel) in
      let _ = Printf.printf "\n" in
      ()
    in
    let print_comp c =
      let _ = Printf.printf "==> component %s \n" c.name in
      let _ = MAP.iter c.vars  (fun k v -> print_var v) in
      let _ = Printf.printf "   time t = %s\n" (UnitLib.unit2str c.time) in
      ()
    in
    let print_prop k v =
      let print_units x r = r^" "^x in
      let units= SET.fold v print_units "" in
      Printf.printf "%s : %s\n" k units
    in
   let print_props () =
    MAP.iter (e.props) (fun k v -> print_prop k v)
   in
   let print_time () =
    match (e.time) with
    | Some(x,v) -> print_prop x v
    | None -> Printf.printf "(no time variable defined)\n"
  in
   let _ = Printf.printf "==== Units ====\n" in
   let _ = UnitLib.print (e.units) in
   let _ = Printf.printf "==== Props ====\n" in
   let _ = print_props () in
   let _ = Printf.printf "==== Time =====\n" in
   let _ = print_time () in
   let _ = Printf.printf "==== Components =====\n" in
   let _ = MAP.iter e.comps (fun k v -> print_comp v) in
   let _ = Printf.printf "==== Constraints =====\n" in
   let _ = HwCstrLib.print e.cstr in
   ()

  let hastime e =
    match (e.time) with Some(_) -> true | None -> false


  let hascomp e n =
    MAP.has (e.comps) n

  let hasprop e n =
    MAP.has (e.props) n

  let mkcomp e name =
    if hascomp e name then
      error "mkcomp" ("comp with name "^name^"already defined.")
    else
      let c : hwcomp = {name=name;vars=MAP.make();spice=None; time=UNone} in
      let _ = MAP.put e.comps name c in
      e

  let mkspice (e:hwenv) (cname:string) (name:string) (args:string list) =
    if hascomp e cname = false then
      error "mkcomp" ("comp with name "^cname^"not defined.")
    else
      let c : hwcomp = MAP.get e.comps cname in
      let _ = (c.spice <- Some(name,args)) in
      e



  let gettime e =
    match e.time with
    | Some(t) -> t
    | _ -> error "gettime" "time must be defined in spec."

  let getcomp e cname =
    if hascomp e cname = false then
      error "getcomp" ("comp with name "^cname^" does not exist")
    else
        MAP.get e.comps cname

  let spice (e:hwenv) (cname:string) : (string*(string list)) option =
    let c = getcomp e cname in
    c.spice

  let hasvar e cname iname =
    let c = getcomp e cname in
    MAP.has c.vars iname

  let getvar e cname iname =
    let c = getcomp e cname in
    if MAP.has c.vars iname = false then
      error "getport" ("port with name "^iname^" does not exist.")
    else
      MAP.get c.vars iname


  let getvars e cname =
    let c = getcomp e cname in
    MAP.to_values c.vars

  let get_port_by_kind e k c =
    let vrs = getvars e c in
    let o = List.filter (fun q -> match q.typ with
        | HPortType(z,_) -> z = k
        | _ -> false
    ) vrs in
    match o with
    | [h] -> h
    | h::t -> error "get_port_by_kind"
      ("more than one port of that kind exists: # ports "^(string_of_int (List.length o)))
    | _ -> error "get_port_by_kind" "no port of that kind exists"

  let getcomps e  =
    MAP.to_values e.comps

  let getunit e (cname:string) pname propname =
    let p = getvar e cname pname in
    match p.typ with
    | HPortType(_,unts) ->
      if MAP.has unts propname then
        MAP.get unts propname
      else
        error "getunit" ("unit does not exist for param "^propname)
    | _ -> error "getunit" "param doesn't have type unit."


  let mkport e cname (hwkind:hwvkind) iname (types:(propid*untid) list) =
    if hascomp e cname = false then
      error "mkport" ("comp with name "^cname^" already defined.")
    else
      let c = MAP.get e.comps cname in
      if MAP.has c.vars iname then
        error "mkport" ("variable with name "^iname^" already exists")
      else
        let prps : (propid,untid) map = MAP.make () in
        let add_propunit ((p,x):propid*untid) =
          if hasprop e p = false then
            error "mkport" ("prop "^p^" doesn't exist")
          else if UnitLib.has e.units x = false then
            error "mkport" ("unit "^x^" doesn't exist")
          else
            let _ = MAP.put prps p x in
            ()
        in
        let _ = List.iter add_propunit types in
        let vrt = HPortType(hwkind,prps) in
        let vr = {name=iname; rel=HRNone; typ=vrt} in
        MAP.put c.vars iname vr

  let mkparam e cname iname vl (t:unt) =
  if hascomp e cname = false then
    error "mkparam" ("comp with name "^cname^" already defined.")
  else
    let c = MAP.get e.comps cname in
    if MAP.has c.vars iname then
      error "mkparam" ("variable with name "^iname^" already exists")
    else
    let vr = {name=iname; rel=HRNone; typ=HParamType(vl,t)} in
    MAP.put c.vars iname vr

  let mkrel e cname pname (rel:hwrel) =
    let p = getvar e cname pname in
    match p.rel with
    | HRNone -> p.rel <- rel
    | _ -> error "mkrel" ("relation already exists for port "^pname)

  let mkcompspd e name unt =
    let p = getcomp e name in
    let _ = p.time <- UExpr(unt) in
    e

  let mktime e name units =
    if hastime e then
      error "mktime" "time already defined"
    else
      let s = SET.make (fun x y -> x = y) in
      let add_unit n =
        if UnitLib.has (e.units) n = false then
          error "mkunit" ("unit "^n^" doesn't exist")
        else
          let _ = SET.add s n in
          ()
      in
      let _ = List.iter add_unit units in
      let _ = e.time <- Some(name,s) in
      e


  let mkprop e name units =
    if hasprop e name then
      error "mkprop" ("prop "^name^" already exists")
    else
      let s = SET.make (fun x y -> x = y) in
      let add_unit n =
        if UnitLib.has (e.units) n = false then
          error "mkprop" ("unit "^n^" doesn't exist")
        else
          let _ = SET.add s n in
          ()
      in
      let _ = List.iter (fun x -> add_unit x) units in
      let _ = e.props <- MAP.put (e.props) name s in
      e



end