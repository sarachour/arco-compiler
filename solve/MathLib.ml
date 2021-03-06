open AST
open Unit
open Util
open MathData

open StochData
open IntervalData

open StochLib
open IntervalLib

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

  let mbhv2str (type a) (s:string) (m:a mbhv) (f:a->string) : string = match m with
    | MBhvStateVar(st) -> "ddt "^s^"="^(ASTLib.ast2str st.rhs f)^" ic="^(string_of_number st.ic)^
                          " / std(ddt "^s^") = "^(StochLib.stoch2str st.stoch f)
    | MBhvVar(v) -> s^"="^(ASTLib.ast2str v.rhs f)^" / std("^s^") = "^(StochLib.stoch2str v.stoch f) 
    | MBhvInput -> "<input>"
    | MBhvUndef -> "<undef>"

  let mdef2str (v:string) (m:mdef) : string = match m with
    | MDefStVar(d) -> "[ddt "^v^"]="^(IntervalLib.interval2str d.deriv.ival)^" / "^
                    "["^v^"]="^(IntervalLib.interval2str d.stvar.ival)^" / "^
                    "max-sample = "^(OPTION.tostr d.sample string_of_number)^
                    "min-speed = "^(OPTION.tostr d.speed string_of_number)

    | MDefVar(d) -> "["^v^"]="^(IntervalLib.interval2str d.ival)

  let mvar2str (type a) (m:a mvar) (f:a->string) : string =
    (kind2str m.knd)^" "^m.name^" :> "^(mbhv2str m.name m.bhvr f)^" {"^
    (mdef2str m.name m.defs)^"}"

  let mast2str (type a) (m:mid ast) = ASTLib.ast2str m mid2str
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
                           

  let to_buf m fb =
    let os x = output_string fb x in
    let var_to_buf (v:mid mvar) : unit=
      os ((v.name)^": "^
          (mbhv2str v.name v.bhvr mid2str)^"\n"^
          (mdef2str v.name v.defs)^"\n");
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


  let hasvar (e:'a menv) (name:string) =
    MAP.has e.vars name

  let getvar (e:'a menv) (name:string) =
    if hasvar e name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      MAP.get (e.vars) name


  let var_gettimecstr (e:'a menv) (name:string) =
    let v : 'a mvar = getvar e name in
    match v.defs with
    | MDefStVar(def) -> def.sample,def.speed
    | _ -> None,None

  let isvar (e:'a menv) (name:string) =
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

  let isstvar e name =
    let v = getvar e name in
    match v.bhvr with
    | MBhvStateVar(_) -> true
    | _ -> false

  let str2mid e name =
    if isparam e name then
      let p = getparam e name in
      MNParam(p.name,p.value)
    else if isvar e name then
      let v = getvar e name in
      MNVar(v.knd,v.name)
    else if istime e name then
      MNTime
    else
      error "str2mid" "error"

  let var2mid (v:'a mvar) =
    MNVar(v.knd,v.name)

  let mktime (e:'a menv) (name:string) un : mid menv =
    if MAP.has (e.vars) name then
      error "mkvar" ("variable "^name^" already exists.")
    else
    let _ = e.time <- Some(name) in
    if UnitTypeChecker.valid (e.units) un then
      e
    else
      error "mkvar" "type is invalid"


  let upd_def e name (f:mdef -> mdef) =
    let v = getvar e name in
    v.defs <- f v.defs;
    ()

  let mkmvardef () =
    {ival=IntervalLib.mkdflt_ival ()}

  let mkvar e name knd un : mid menv =
    if isvar e name || isparam e name then
      error "mkvar" ("variable "^name^" already exists.")
    else
      begin
        if UnitTypeChecker.valid (e.units) un then
        let bhv = if knd = MInput then MBhvInput else MBhvUndef in
        let def : mvardef = mkmvardef () in 
        let v = {
          name=name;
          bhvr=bhv;
          knd=knd;
          defs=MDefVar(def);
          typ=un;
        } in
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

  let mkstd e name rhs shape =
    let stoch = StochLib.create_stoch rhs shape in 
    let v = getvar e name in
    match v.bhvr with
    | MBhvStateVar(bhv) -> bhv.stoch <- stoch; ()
    | MBhvVar(bhv) -> bhv.stoch <- stoch; ()
    | _ -> error "mkstd" "cannot have standard deviation for undefined or input variable."



  let mkstrel (e:'a menv) name (rhs:mid ast) ic =
    if MAP.has (e.vars) name = false then
      error "mkstrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.bhvr <> MBhvUndef then
        error "mkstrel" ("variable "^name^" already has relation defined.")
      else
        begin
          let bhv : mid mderiv = {
            rhs=rhs;
            ic=ic;
            stoch=StochLib.mkstoch();
          } in
          let def : mstvardef = {
            deriv=mkmvardef();
            stvar=mkmvardef();
            sample = None;
            speed = None;
          }  in
          dat.bhvr <- MBhvStateVar(bhv);
          dat.defs <- MDefStVar(def);
          e
        end

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


  let mkrel (e:'a menv) name rhs : mid menv =
    if MAP.has (e.vars) name = false then
      error "mkrel" ("variable "^name^" does not exist.")
    else
      let dat = MAP.get (e.vars) name in
      if dat.bhvr <> MBhvUndef then
        error "mkrel" ("variable "^name^" already has relation defined.")
      else
        if true then
          let bhv : mid mfxn = {
            rhs=rhs;
            stoch=StochLib.mkstoch();
          } in
          dat.bhvr <- MBhvVar(bhv);
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

  let iter_vars (e:'a menv) f =
    MAP.iter e.vars (fun k v -> f v)

  let fold_vars (e:'a menv) f r0 =
    MAP.fold e.vars (fun k v r -> f v r) r0

  let replace_params (env:'a menv) (e:mid ast) =
    ASTLib.trans_id e (fun (x:mid) -> match x with
        | MNParam(name,vl) ->
          number_to_ast vl
        | _ -> Term(x)
      )


  let inference_var e (xstart:'a mvar) (cnv:'a -> mid) =
    let lookup_stack = STACK.make () in
    let rec _infer_var (x:'a mvar) =
      let lookup (x:'a) : interval = match cnv x with
        | MNVar(MInput,p) -> let vr = getvar e p in
          _infer_var vr

        | MNParam(p,n) -> let param = getparam e p in
          IntervalLib.float_to_interval (float_of_number param.value)

        | MNTime -> error "inference_var" "time is unbounded"

        | MNVar(MLocal,p) -> let vr = getvar e p in
          _infer_var vr

        | MNVar(MOutput,p) -> let vr = getvar e p in
          _infer_var vr 

      in
      let requires_infer = match x.defs with
      | MDefVar(def) -> IntervalLib.is_undefined def.ival
      | MDefStVar(def) ->
        if IntervalLib.is_undefined def.stvar.ival then
          error "inference_var" "cannot leave the bounds of a state variable undefined."
        else IntervalLib.is_undefined def.deriv.ival && x.name = xstart.name 
      in
      if requires_infer && STACK.has lookup_stack x.name = false then
        begin
          noop (STACK.push lookup_stack x.name);
          let ival = match x.bhvr with
            | MBhvVar(bhvr) ->
              let ival =
                try
                  IntervalLib.derive_interval bhvr.rhs lookup
                with
                | IntervalLibError(e) ->
                  print_string (">> while trying to compute interval of:"^x.name^"\n");
                  raise (IntervalLibError e)
              in
              print_string ("derive: "^x.name^" -> "^(IntervalLib.interval2str ival)^"\n");
              begin match x.defs with
                | MDefVar(x) -> x.ival <- ival; ival
                | _ -> error "inference_var" "expected var def for var behavior"
              end
            | MBhvStateVar(bhvr) ->
              let ival =
                try
                  IntervalLib.derive_interval bhvr.rhs lookup
                with
                | IntervalLibError(e) ->
                  print_string (">> while trying to compute interval of:"^x.name^"\n");
                  raise (IntervalLibError e)
              in
              print_string ("derive: "^x.name^" -> "^(IntervalLib.interval2str ival)^"\n");
              begin
                match x.defs with
                | MDefStVar(def) -> def.deriv.ival <- ival; def.stvar.ival 
                | _ -> error "inference_var" "expected st-var def for var behavior"
                end
            | MBhvInput ->
              error "inference_var" ("cannot infer interval for input ["^x.name^"]")
            | MBhvUndef ->
              error "inference_var"
                (xstart.name^"] cannot infer interval of undefined output ["^x.name^"]")
        in
        STACK.push lookup_stack x.name;
        ival
        end
      else
        begin
          match x.defs with
          | MDefVar(dev) -> dev.ival
          | MDefStVar(dev) -> dev.stvar.ival
        end

    in
    _infer_var xstart

  let expr_is_stvar (menv:mid menv) (mast:mid ast) =
    match mast with
    | Term(MNVar(_,n)) ->
      isstvar menv n
    | _ ->
      false

  let expr_has_stvar (menv:mid menv) (mast:mid ast) =
    ASTLib.fold mast (fun expr has_stvar ->
        expr_is_stvar menv expr || has_stvar
      ) false


  let inference (e:'a menv) (cnv:'a -> mid) =
    print_string "======== Infer Math Vars =============\n";
    iter_vars e (fun x -> noop (inference_var e x cnv));
    ()
    
end
