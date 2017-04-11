open Util

open ASTUnifyData
open ASTXUnify

open AST
open Interactive
open Globals

open HWData
open HWLib

open MathData
open MathLib

open Search
open SearchData
open Z3Data

open SolverData
open SolverUtil

open SlnLib

open GoalLib
open SolverCompLib

open IntervalData
open IntervalLib

open StochData
open StochLib

open MapData
open MapUtil

open SymCamlData


exception MapSpecError of string

let error n m = raise (MapSpecError (n^":"^m))

let debug = print_debug 4 "prob-gen"
let dumb_cstrs_DBG = false 
  

module MapExpr =
struct

  let get_abs_var (p:('a -> map_port_info)) (v:'a map_var) =
    match v with
    | MPVScale(vr) ->
      let data = p vr in
      data.scale
    | MPVOffset(vr) ->
      let data = p vr in
      data.offset

  let string_of_map_cstr (p:map_cstr) =
    match p with
    | MCGT -> ">"
    | MCGTE -> ">="
    | MCNE -> "!="

  let z3_of_map_cstr (cstr:map_cstr)(targ) (other) =
    match cstr with
    |MCGT -> Z3GT(targ,other)
    |MCGTE -> Z3GTE(targ,other)
    |MCNE -> Z3Not(Z3Eq(targ,other))

  let string_of_map_port (p:map_port) =
    let comp,port = p in
    "<"^(HwLib.hwcompname2str comp)^","^port^">"

  let string_of_map_var (type a) (p:a map_var ) tostr = match p with
    | MPVOffset(o) -> "offset("^(tostr o)^")"
    | MPVScale(o) -> "scale("^(tostr o)^")"

  let string_of_map_port_var q = string_of_map_var q string_of_map_port


  let string_of_map_expr (type a) (x:a map_expr) (tostr:a -> string) =
    let rec _tostr e =
      match e with
        | MEVar(q) -> tostr q
        | MEAdd(a,b) -> (_tostr a)^"+"^(_tostr b)
        | MESub(a,b) -> (_tostr a)^"-"^(_tostr b)
        | MEMult(a,b) -> (_tostr a)^"*"^(_tostr b)
        | MEDiv(a,b) -> (_tostr a)^"/"^(_tostr b)
        | MEPower(a,b) -> (_tostr a)^"^"^(string_of_number b)
        | MEConst(a) -> string_of_number a
        | MEAny -> "@"
    in
    _tostr x

  let to_ast (type a) (expr: a map_expr) (any:a) : a ast =
    let rec _toast e =
      match e with
      | MEVar(q) -> Term(q)
      | MEConst(Integer q) -> Integer q
      | MEConst(Decimal q) -> Decimal q
      | MEDiv(a,b) -> Op2(Div,_toast a, _toast b)
      | MEPower(a,Integer b) -> Op2(Power,_toast a, Integer b)
      | MEPower(a,Decimal b) -> Op2(Power,_toast a, Decimal b)
      | MEMult(a,b) -> OpN(Mult,[_toast a;_toast b])
      | MEAdd(a,b) -> OpN(Add,[_toast a;_toast b])
      | MESub(a,b) -> OpN(Sub,[_toast a;_toast b])
      | MEAny -> Term(any)
    in
    _toast expr 

  let from_ast (type a) (expr: a ast) (any:a) : a map_expr =
    let pair_off (fxn:a map_expr -> a ast -> a map_expr)
        (start:a map_expr) (rest:a ast list) :a map_expr =
      List.fold_left
        (fun (rest:a map_expr) (curr:a ast) ->
           fxn rest curr
        ) start rest 
    in
    let rec _fromast e : a map_expr=
      match e with
      | Term(q) -> if q = any then MEAny else MEVar(q)
      | Integer(i) -> MEConst(Integer i)
      | Decimal(i) -> MEConst(Decimal i)
      | Op2(Div,a,b) -> MEDiv(_fromast a, _fromast b)
      | OpN(Add,h::t) ->
        pair_off
          (fun a b -> MEAdd(a, _fromast b))
          (_fromast h) t
      | OpN(Sub,h::t) ->
        pair_off
         (fun a b -> MESub(a, _fromast b))
         (_fromast h) t
      | OpN(Mult,h::t) ->
        pair_off
         (fun a b -> MEDiv(a, _fromast b))
         (_fromast h) t
      | Op1(Neg,h) ->
        MESub(MEConst(Integer 0),_fromast h)
      | Op2(Power,h,Integer(i)) ->
        MEPower(_fromast h,(Integer i))
      | Op2(Power,h,Decimal(i)) ->
        MEPower(_fromast h,(Decimal i))
      | _ -> error "fromast" "unimpl"
    in
    _fromast expr

  let simpl (type a) (expr:a map_expr) (any:a)
      (tosym:a->symvar) (fromsym:symvar->a) =
    let expr = to_ast expr any in
    let decl v cnv =
      SymbolVar(cnv v)
    in
    let res = ASTLib.simpl expr tosym fromsym decl in
    from_ast res any

  let z3 (type a) freshvars prefix (expr:a map_expr) (atoz3 : a -> z3expr) =
    let fresh_var () =
      let i = SET.size freshvars in
      let vname = prefix^"_"^(string_of_int i) in
      SET.add freshvars vname;
      vname
    in
    let rec _work e = match e with
      | MEVar(q) -> atoz3 q
      | MEAdd(a,b) -> Z3Plus(_work a, _work b)
      | MESub(a,b) -> Z3Sub(_work a, _work b)
      | MEConst(Integer x) -> Z3Int(x)
      | MEConst(Decimal x) -> Z3Real(x)
      | MEMult(a,b) -> Z3Mult(_work a,_work b)
      | MEDiv(a,b) -> Z3Div(_work a,_work b)
      | MEPower(a,Integer b) -> Z3Power(_work a, Z3Int b)
      | MEPower(a,Decimal b) -> Z3Power(_work a, Z3Real b)
      | MEAny -> Z3Var(fresh_var ())

    in
    _work expr

  let string_of_map_port_var_expr (x:map_port map_var map_expr) =
    string_of_map_expr x string_of_map_port_var

  let map e f =
    let rec _map e =
      match e with
      | MEVar(q) -> MEVar(f q)
      | MEAdd(a,b) -> MEAdd(_map a, _map b)
      | MESub(a,b) -> MESub(_map a, _map b)
      | MEPower(a,b) -> MEPower(_map a, b)
      | MEMult(a,b) -> MEMult(_map a, _map b)
      | MEDiv(a,b) -> MEDiv(_map a, _map b)
      | MEAny -> MEAny
      | MEConst(v) -> MEConst(v)
    in
    _map e

end

module MapSpec =
struct

  let find_comp_config (ctx:'a map_ctx) (cmp:hwcompname)
      (params:(string,number) map) =
    let param_list = MAP.to_list params in 
    let same_params (cmp:'a map_comp) : bool =
      List.fold_right (fun ((par,value):string*number) (eq:bool) ->
          print ("===  "^par^" ==\n"^
            (MAP.str cmp.params
               (fun x->x) (string_of_number) )^"\n");
          let cmp_value = MAP.get cmp.params par in
          cmp_value = value && eq
        ) param_list true
    in
    let cmps : 'a map_abs_comp = MAP.get ctx.comps cmp in 
    MAP.fold cmps.spec (
      fun _ (cmp:'a map_comp) (matches:'a map_comp list) ->
        if same_params cmp then
          cmp::matches
        else
          matches
      ) []

  let string_of_abs_var_id (id:int) =
    "v("^(string_of_int id)^")"

  let string_of_map_abs_var (avar:'a map_abs_var) (conv:'a -> string) =
    let expr2str (i:int map_expr) =
      MapExpr.string_of_map_expr i (string_of_abs_var_id)
    in
    let cstr2str (cstr,expr) =
      (MapExpr.string_of_map_cstr cstr)^(expr2str expr)
    in
    "exprs="^(LIST.tostr expr2str "=" avar.exprs )^"\n"^
    "cstrs="^(LIST.tostr cstr2str "," avar.cstrs )^"\n"^
    "value="^(OPTION.tostr avar.value (string_of_number))^"\n"^
    "mems="^(LIST.tostr MapExpr.string_of_map_port_var "," avar.members)^"\n"


  let map_var (type a) (type b)
      (x:a map_var) (f:a->b) : b map_var =
    match x with
    | MPVScale(r) -> MPVScale(f r)
    | MPVOffset(r) -> MPVOffset(f r)

  let get_comp (ctx:'a map_ctx) name id : 'a map_comp =
    let cmp : 'a map_abs_comp = MAP.get ctx.comps name in
    let ccmp = MAP.get cmp.spec id in
    ccmp

  
  let _get_port comp name =
    let key = name in 
    let portinfo=
      if MAP.has comp.inps key then
        MAP.get comp.inps key 
      else
        MAP.get comp.outs key 
    in
    portinfo


  let set_offset_var (ctx:'a map_circ)
      (key:'a) (id:int) =
    let d = MAP.get ctx.ports key in
    d.offset.abs_var <- id

  let set_scale_var (ctx:'a map_circ)
      (key:'a) (id:int) =
    let d = MAP.get ctx.ports key in
    d.scale.abs_var <- id

  let set_offset_var (ctx:'a map_circ)
      (key:'a) (id:int) =
    let d = MAP.get ctx.ports key in
    d.offset.abs_var <- id

  let ctx_get_abs_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (aid:int) : 'a map_abs_var=
    let comp = get_comp ctx name id in 
    let a = MAP.get comp.vars aid in
    a

  let ctx_get_offset_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (port:string) : 'a map_abs_var =
    let comp = get_comp ctx name id in 
    let d = _get_port comp port in
    MAP.get comp.vars d.offset.abs_var 

  let ctx_get_scale_var (ctx:'a map_ctx)
      (name:hwcompname) (id:int) (port:string) : 'a map_abs_var=
    let comp = get_comp ctx name id in 
    let d = _get_port comp port in
    MAP.get comp.vars d.scale.abs_var 

  let get_offset_var (ctx:'a map_circ)
      (key:'a) (id:int) =
    let d = MAP.get ctx.ports key in
    d.offset.abs_var 

  let get_scale_var (ctx:'a map_circ)
      (key:'a) (id:int) =
    let d = MAP.get ctx.ports key in
    d.scale.abs_var 

  let string_of_map_port_info (aport:map_port_info) =
    "string_of_map_port: unimpl"

  let string_of_map_port ((a,b):map_port) =
     (HwLib.hwcompname2str a)^"."^b

  let string_of_map_comp (comp:'a map_comp) (f:'a -> string) =
    ("====== #"^(string_of_int comp.id)^" ======")^"\n"^
    (MAP.str comp.vars (string_of_abs_var_id)
       (fun q -> string_of_map_abs_var q f))^"\n"^
    (MAP.str comp.inps (ident) (string_of_map_port_info))^"\n"^
    (MAP.str comp.outs (ident) (string_of_map_port_info))^"\n"
    
  let string_of_map_ctx (env:'a map_ctx) (f:'a->string) =
    MAP.str env.comps
      (fun q -> "=== "^(HwLib.hwcompname2str q)^" ===\n")
      (fun (x:'a map_abs_comp) ->
         MAP.str x.spec (fun _ -> "\n")
           (fun q -> string_of_map_comp q f)
      )


end

module MapCompSpecCompressor =
struct

  let create_abs_var (prob:'a map_comp) : 'a map_abs_var =
    let id = MAP.size prob.vars in
    let obj = {
      exprs = [];
      cstrs = [];
      value = None;
      members = [];
      priority = 0;
      id = id;
    } in
    noop (MAP.put prob.vars id obj);
    obj

  let create_var () : map_var_info =
    {priority=0; abs_var=(-1)}

  let create_port port : map_port_info =
    {
      port=port;
      range=None;
      deriv_range=None;
      offset=create_var ();
      scale=create_var ();
      is_stvar=false;
    }

  let create_input (prob:'a map_comp) name  (port) =
    noop (MAP.put prob.inps (port) (create_port port));
    ()

  let create_output (prob:'a map_comp) name (port) =
    noop (MAP.put prob.outs (port) (create_port port));
    ()

  type compress_partition =
    | PRTVar of map_port map_var
    | PRTExpr of map_port map_var map_expr
    | PRTCstr of map_cstr*map_port map_var map_expr
    | PRTConst of number

  let string_of_compress_partition c :string = match c with
    | PRTVar(v) -> MapExpr.string_of_map_port_var v
    | PRTExpr(e) -> MapExpr.string_of_map_port_var_expr e
    | PRTConst(c) -> string_of_number c
    | PRTCstr(cstr,e) ->
      (MapExpr.string_of_map_cstr cstr)^(MapExpr.string_of_map_port_var_expr e)


  let create_param prob parname (parval:number) =
    noop (MAP.put prob.params parname parval);
    ()

  
  let _get_abs_var (comp:'a map_comp) n =
    let avar = MAP.get comp.vars n in
    avar

  let _get_port = MapSpec._get_port

  let set_var_priority comp varname prio =
    match varname with
    | MPVOffset(_,portname) ->
      let portinfo = _get_port comp portname in
      portinfo.offset.priority <- prio
    | MPVScale(_,portname) ->
      let portinfo = _get_port comp portname in
      portinfo.scale.priority <- prio


  let get_cover  (cover:hwdefs) =
    match  cover with
    |HWDAnalog(defs) ->
      begin
          (IntervalLib.interval2numinterval defs.ival)
      end

    |HWDDigital(defs) ->
      begin
          (IntervalLib.interval2numinterval defs.ival)
      end
    | HWDAnalogState(defs) ->
      begin
          (IntervalLib.interval2numinterval defs.stvar.ival);
      end

  let port_info_set_cover (portinfo:map_port_info) (cover:hwdefs) =
    match  cover with
    |HWDAnalog(defs) ->
      begin
        portinfo.range <-
          Some (IntervalLib.interval2numinterval defs.ival)
      end

    |HWDDigital(defs) ->
      begin
        portinfo.range <-
          Some (IntervalLib.interval2numinterval defs.ival)
      end
    | HWDAnalogState(defs) ->
      begin
        print (portinfo.port^"\n");
        portinfo.range <-
          Some (IntervalLib.interval2numinterval defs.stvar.ival);
        portinfo.deriv_range <-
          Some (IntervalLib.interval2numinterval defs.deriv.ival);
        portinfo.is_stvar <- true;
      end

  let comp_set_cover (comp:'a map_comp)
      (portname:string) (cover:hwdefs) =
    let portinfo = _get_port comp portname in
    port_info_set_cover portinfo cover

  let set_abs_var (comp:'a map_comp)
      (id:int) (varname:map_port map_var) : unit =
    let avar = _get_abs_var comp id in
    avar.members <- varname::avar.members;
    match varname with
    | MPVOffset(_,portname) ->
      begin
        let portinfo = _get_port comp portname in
        portinfo.offset.abs_var <- id
      end

    | MPVScale(_,portname) ->
      begin
        let portinfo = _get_port comp portname in
        portinfo.scale.abs_var <- id
      end


  let add_abs_cstr (comp:'a map_comp) (id:int)
      (cstr:map_cstr) (expr:map_port map_var map_expr) =
    let v : 'a map_abs_var = MAP.get comp.vars id in
    let id_expr : int map_expr =
      MapExpr.map expr (fun (v:map_port map_var) ->
        match v with
        | MPVOffset(_,portname) ->
          let portinfo = _get_port comp portname in
          portinfo.offset.abs_var

        | MPVScale(_,portname) ->
          let portinfo = _get_port comp portname in
          portinfo.scale.abs_var

      )
    in
    v.cstrs <- (cstr,id_expr)::v.cstrs;
    ()

  let add_abs_expr (comp:'a map_comp) (id:int)
      (expr:map_port map_var map_expr) =
    let v : 'a map_abs_var = MAP.get comp.vars id in
    let id_expr : int map_expr =
      MapExpr.map expr (fun (v:map_port map_var) ->
        match v with
        | MPVOffset(_,portname) ->
          let portinfo = _get_port comp portname in
          portinfo.offset.abs_var

        | MPVScale(_,portname) ->
          let portinfo = _get_port comp portname in
          portinfo.scale.abs_var

      )
    in
    v.exprs <- id_expr::v.exprs;
    ()

  let set_abs_const (comp:'a map_comp) (id:int) (c:number) =
    let v : 'a map_abs_var = MAP.get comp.vars id in
    match v.value with
    | None ->
      begin
        v.value <- Some c;
        true
      end

    | Some(x) ->
      if c = x
      then true else false



  let add_partition parts
      (x1:compress_partition) (x2:compress_partition) =
    let not_cstr (x:compress_partition) = match x with
      | PRTCstr(_) -> false
      | _ -> true
    in
    let matches = QUEUE.filter parts (fun q ->
        let has_x1 = SET.has q x1 && not_cstr x1 in
        let has_x2 = SET.has q x2 && not_cstr x2 in 
        has_x1 || has_x2
      ) in
      match matches with
      | [s] ->
        begin
          noop (SET.add s x1);
          noop (SET.add s x2);
          ()
        end
      | [] ->
        begin
          let s = SET.make () in
          noop (SET.add s x1);
          noop (SET.add s x2);
          noop (QUEUE.enqueue parts s);
          ()
        end
      | [s1;s2] ->
        begin
          noop (SET.add_all s1 (SET.to_list s2));
          noop (QUEUE.rm parts s2);
          SET.destroy s2;
          noop (SET.add_all s1 [x1;x2]);
          ()
        end

      | _ ->
        error "add_partition" "more than one exist"

  let compress name (stmts : map_stmt list) : 'a map_comp option =
    let prob : 'a map_comp =
      {
        id=0;
        vars=MAP.make();
        inps=MAP.make();
        outs=MAP.make();
        params=MAP.make()
      }
    in
    let valid = REF.mk true in
    let parts : compress_partition set queue = QUEUE.make () in
    
    List.iter (fun (stmt:map_stmt) -> match stmt with
        | MSDeclInput(hwn,hwp) ->
          begin
            create_input prob hwn hwp;
            add_partition parts (PRTVar (MPVScale(hwn,hwp)))
              (PRTVar (MPVScale(hwn,hwp)));
            add_partition parts (PRTVar (MPVOffset(hwn,hwp)))
              (PRTVar (MPVOffset(hwn,hwp)))
          end

        | MSDeclOutput(hwn,hwp) ->
          begin
            create_output prob hwn hwp;
            add_partition parts (PRTVar (MPVScale(hwn,hwp)))
              (PRTVar (MPVScale(hwn,hwp)));
            add_partition parts (PRTVar (MPVOffset(hwn,hwp)))
              (PRTVar (MPVOffset(hwn,hwp)))
          end

        | MSDeclParam((_,par),s) ->
          create_param prob par s

        | MSSetVarPriority(v1,p) ->
          set_var_priority prob v1 p 

        | MSSetPortCover((_,v1),c) ->
          comp_set_cover prob v1 c

        | MSVarHasCstr(v,cstr,expr) ->
          add_partition parts (PRTVar v) (PRTCstr (cstr,expr))

        | MSVarEqualsVar(v1,v2) ->
          add_partition parts (PRTVar v1) (PRTVar v2)

        | MSVarEqualsConst(v1,e) ->
          add_partition parts (PRTVar v1) (PRTConst e)

        | MSVarEqualsExpr(v1,e) ->
          add_partition parts (PRTVar v1) (PRTExpr e)

        | MSExprEqualsExpr(e1,e2) ->
          add_partition parts (PRTExpr e1) (PRTExpr e2)

        | MSExprEqualsConst(e1,c) ->
          add_partition parts (PRTExpr e1) (PRTConst c)

        | MSInvalid -> REF.upd valid (fun _ -> false)
        | MSValid -> ()
      ) stmts;

    (*process the var data.*)
    let expr_buf = MAP.make () in 
    QUEUE.iter parts (fun (equiv_set) ->
        let abs : 'a map_abs_var = create_abs_var prob in
        let exprs,cstrs =
          SET.fold equiv_set (fun (q:compress_partition) (exprs,cstrs) ->
            match q with
            | PRTExpr(e) ->
              (e::exprs,cstrs)
            | PRTCstr(c,e) ->
              (exprs,(c,e)::cstrs)
            | PRTVar(v) ->
              ret (set_abs_var prob abs.id v) (exprs,cstrs) 
            | PRTConst(c) ->
              begin
                let succ = set_abs_const prob abs.id c in
                REF.upd valid (fun q -> succ && q);
                exprs,cstrs
              end
            ) ([],[])
        in
        noop (MAP.put expr_buf abs.id (exprs,cstrs));
        ()
      );
    (*traverse expression buf.*)
    MAP.iter expr_buf (fun id (exprs,cstrs) ->
        List.iter (fun e ->
            add_abs_expr prob id e;
          ) exprs;
        List.iter (fun (cstr,expr) ->
            add_abs_cstr prob id cstr expr 
          ) cstrs

    );
    if REF.dr valid = false then None else
    Some prob

end

module MapCompSpecInitialSln =
struct

end

module MapCompSpecGenerator =
struct

  type map_proj = {
    scale: map_port map_var map_expr; 
    offset : map_port map_var map_expr; 
  }

  let wrap_const (x:'a map_expr) (f:number) = match x with
    | MEConst(q) -> if q <> f then MSInvalid else MSValid
    | MEVar(q) -> MSVarEqualsConst(q,f)
    | q -> MSExprEqualsConst(q,f)

  let feedback_in_terms (fdbk:string list) (lst:hwvid ast list)  =
    let rec is_term_feedback (el:'a ast) = match el with
      | OpN(Mult,exprs) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false exprs
      | Op2(Div,expr1,expr2) ->
        List.fold_left (fun isfdbk t -> isfdbk || is_term_feedback t) false [expr1;expr2]
      | Term(HNPort(HWKOutput,HCMGlobal(cmpinst),port,prop)) ->
        LIST.has fdbk port
      | _ -> false
    in
    let feedback_exprs = List.filter is_term_feedback lst in
    List.length feedback_exprs > 0

  let get_nonfeedback_terms enq (fdbk:string list) (lst:hwvid ast list) (projs:map_proj list) =
    let rec get_nonfeedback_term (expr:hwvid ast) (sc:map_proj) =
      if feedback_in_terms fdbk [expr] then
        None
      else
        Some(sc)
    in
    let nonfeedback = List.map
        (fun (x,y) -> get_nonfeedback_term x y)
        (LIST.zip lst projs )
    in
    OPTION.conc_list nonfeedback

  let map_expr_simpl (x:map_port map_var map_expr) =
    let to_sym (x:map_port map_var) = match x with
      | MPVScale(cmp,p) -> "scale:"^(HwLib.hwcompname2str cmp)^":"^p
      | MPVOffset(cmp,p) -> "offset:"^(HwLib.hwcompname2str cmp)^":"^p
    in
    let from_sym (x:string) = match STRING.split x ":" with
      | ["scale";name;port] -> MPVScale(HwLib.str2hwcompname name,port)
      | ["offset";name;port] -> MPVOffset(HwLib.str2hwcompname name,port)
      | _ -> error "from_sym" "malformed"
    in
    MapExpr.simpl x (MPVScale(HWCmComp "*","*"))
      to_sym from_sym

  let derive_mapping_add enq arg_projs =
      (*create scaling constraints*)
        List.iter (fun (proj2:map_proj) ->
            List.iter (fun (proj1:map_proj) ->
                match proj1.scale,proj2.scale with
                | MEVar(a),MEVar(b) -> enq (MSVarEqualsVar(a,b))
                | MEVar(a),MEConst(b) -> enq (MSVarEqualsConst(a,b))
                | MEConst(a),MEVar(b) -> enq (MSVarEqualsConst(b,a))
                | expr,MEVar(a) -> enq (MSVarEqualsExpr(a,expr))
                | MEVar(a),expr -> enq (MSVarEqualsExpr(a,expr))
                | expr1,expr2 -> enq (MSExprEqualsExpr(expr1,expr2))
              ) arg_projs
          )  arg_projs;
        let res_offset = match arg_projs with
          | p1::rest -> List.fold_right (fun (proj:map_proj) expr ->
              MEAdd(expr,proj.offset)
          ) rest p1.offset
          | [] -> error "res_scale" "cannot offset args"
        in
        let res_scale : map_port map_var map_expr= match arg_projs with
          | p1::rest -> List.fold_right (fun curr h ->
              match h,curr.scale with
              | MEConst(_),MEVar(a) -> h
              | MEVar(_),expr -> h
              | _ -> curr.scale 
            ) rest p1.scale
          | [] -> error "res_scale" "cannot scale no args"
        in
        {scale=res_scale;offset=res_offset}
         

  let derive_mapping_sub =
    let proj = derive_mapping_add in
    proj

  let derive_mapping_problem_neg enq (arg:map_proj) : map_proj =
    {scale=arg.scale; offset=arg.offset}



  let derive_mapping_mult enq ( fdbk:string list) arg_projs
      arg_terms (res_expr:'a ast) : map_proj =
    (*if this aggregate term is zero, then*)
    (*this term goes to zero*)
    match res_expr with
      | Integer(0) ->
        begin
          let res_scale = match arg_projs with
            | h::t -> List.fold_right (fun curr rest ->
                MEMult(rest,curr.scale)
              ) t h.scale
            | [] -> error "derive_mapping_mult" "unknown"
          in
          {scale=res_scale;offset=MEConst(Integer 0)}
        end
      | _ -> 
        (*if this term contains feedback, the feedback term is the only thing scaled*)
        begin
          if feedback_in_terms fdbk arg_terms then
            begin
              let coeff_projs =
                get_nonfeedback_terms enq fdbk arg_terms arg_projs
              in
              (*ensure the scaling terms are one *)
              List.iter (fun (term:map_proj) ->
                  enq (wrap_const term.scale (Integer 1))
                ) coeff_projs
            end;
          (*all offsets must equal zero*)
          List.iter (fun (term:map_proj)->
              enq (wrap_const term.offset (Integer 0))
            ) arg_projs;
          (*scale is product.*)
          let res_scale = match arg_projs with
            | h::t ->
              List.fold_right (fun x rest -> MEMult(x.scale,rest)) t h.scale
            | [] ->
              error "res_scale" "added"
          in
          {scale=res_scale;offset=MEConst((Integer 0))}
        end





  let derive_mapping_div (enq) (numer) (denom) =
    enq (wrap_const numer.scale (Integer 1) );
    enq (wrap_const denom.offset (Integer 0) );
    let res = {
      scale=MEDiv(numer.scale,denom.scale);
      offset=MEConst((Integer 0))
    }
    in
    res

  let derive_mapping_pow_val(enq) (base) exp (expval:number) =
    enq (wrap_const base.offset (Integer 0) );
    enq (wrap_const exp.offset (Integer 0) );
    enq (wrap_const exp.scale (Integer 1) );
         {
           scale=MEPower(base.scale,expval);
           offset=MEConst((Integer 0))
         }

  let derive_mapping_pow_var (enq) (base) exp  =
    enq (wrap_const base.offset (Integer 0));
    enq (wrap_const exp.offset (Integer 0));
    enq (wrap_const exp.scale (Integer 1));
    enq (wrap_const base.scale (Integer 1));
    {scale=MEConst(Integer 1);offset=MEConst(Integer 0)}

  let derive_mapping_pow_expr (enq) (base) exp =
    enq (wrap_const base.offset (Integer 0) );
    enq (wrap_const exp.offset (Integer 0) );
    enq (wrap_const exp.scale (Integer 1) );
    enq (wrap_const base.scale (Integer 1) );
    {scale=MEConst(Integer 1); offset=MEConst(Integer 0);}


  let derive_mapping_neg (enq) arg =
    enq (wrap_const arg.scale (Integer 1) );
    error "derive_mapping_exp" "unimpl"

  let derive_mapping_exp (enq) arg =
    enq (wrap_const arg.scale (Integer 1) );
    error "derive_mapping_exp" "unimpl"
    (*
    {scale=MEConst((Integer 1));offset=MEExp(arg.offset)}
    *)

  let decompose_list (inps:hwvid ast list)
        (fn:hwvid ast -> map_proj*hwvid ast)
      : (map_proj list*hwvid ast list) =
      List.fold_right (fun (farg:hwvid ast)
                        ((args,terms):(map_proj list)*(hwvid ast list)) ->
                        let ((arg,expr):(map_proj*hwvid ast)) = fn farg in 
                        (arg::args,expr::terms)
        ) inps ([],[])

  
  (*propagate wire rules for scaling factors *)
  let derive_mapping_expr hwenv (node:hwvid ast) (fdbk:string list)
      (params:(string,number) map)
    : (map_stmt list)*map_proj =
    (*visit all the elements in a list*)
    let cstrs : map_stmt queue = QUEUE.make () in 
    let add_cstr x =
      noop (QUEUE.enqueue cstrs x)
    in
    let rec _derive_mapping_problem (expr:hwvid ast) : (map_proj)*hwvid ast =
      let proj,res =
        match expr with
        | Term(HNPort(knd,HCMLocal(cmp),port,prop)) ->
          {
            scale=MEVar(MPVScale(cmp,port));
            offset=MEVar(MPVOffset(cmp,port))
          },node


        | Term(HNParam(cmp,name)) ->
          let pval = MAP.get params name in
          let constv : 'a ast= match pval with
            | Integer(i) -> Integer(i)
            | Decimal(d) -> Decimal(d)
          in
          {
            scale=MEConst((Integer 1));
            offset=MEConst((Integer 0))
          }, constv

        | Term(HNTime) ->
          error "hntime" "should not exist in prog."
          (*no offset unless the value is resolvable as a number*)

        | OpN(Mult,args) ->
          let ((arg_projs,arg_terms):(map_proj list*hwvid ast list)) =
            decompose_list args _derive_mapping_problem
          in
          let res_term : hwvid ast=
            HwLib.simplify hwenv (OpN(Mult,arg_terms))
          in
          let res_proj =
            derive_mapping_mult add_cstr fdbk arg_projs arg_terms res_term
          in
          res_proj,res_term


        | OpN(Add,args) ->
          let (arg_projs,arg_terms) =
            decompose_list args _derive_mapping_problem
          in
          let res_projs =
            derive_mapping_add add_cstr arg_projs
          in
          res_projs,OpN(Add,arg_terms)


        | OpN(Sub,args) ->
          let (arg_projs,arg_terms) =
            decompose_list args _derive_mapping_problem
          in
          let res_projs =
            derive_mapping_sub add_cstr arg_projs
          in
          res_projs,OpN(Sub,arg_terms)

        | Op2(Div,num,denom) -> 
          let lnumer,numer_term = _derive_mapping_problem num in
          let ldenom,denom_term = _derive_mapping_problem denom in
          let res_projs =
            derive_mapping_div add_cstr lnumer ldenom
          in
          res_projs,Op2(Div,numer_term,denom_term)

        | Op1(Exp,expr) ->
          let arg_proj,arg_expr = _derive_mapping_problem expr in
          let res_proj = derive_mapping_exp add_cstr arg_proj in
          res_proj,(Op1(Exp,arg_expr)) 

        | Op1(Neg,expr) ->
          let arg_proj,arg_expr = _derive_mapping_problem expr in
          let res_proj = derive_mapping_neg add_cstr arg_proj in
          res_proj,Op1(Neg,arg_expr)

        | Op2(Power,Term(base),Integer(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Integer exp) in
          let res_proj :map_proj =
            derive_mapping_pow_val add_cstr
              base_proj exp_proj (Integer (exp))
          in
          res_proj,Op2(Power,exp_expr,base_expr)


        | Op2(Power,Term(base),Decimal(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Decimal exp) in
          let res_proj = derive_mapping_pow_val add_cstr
              exp_proj base_proj (Decimal (exp)) in
          res_proj,Op2(Power,exp_expr,base_expr)


        | Op2(Power,Term(base),Term(exp)) ->
          let base_proj,base_expr = _derive_mapping_problem (Term base) in
          let exp_proj,exp_expr = _derive_mapping_problem (Term exp) in
          let res_proj = derive_mapping_pow_var add_cstr exp_proj base_proj in 
          res_proj,Op2(Power,exp_expr,base_expr)



        | Op2(Power,base,exp) ->
          let base_proj,base_expr = _derive_mapping_problem base in
          let exp_proj,exp_expr = _derive_mapping_problem exp in
          let res_proj =
            {scale=MEConst(Integer 1); offset=MEConst(Integer 0)}
          in
          res_proj,Op2(Power,base_expr,exp_expr)

        | Integer(0) ->
          {scale=MEAny; offset=MEConst(Integer 0)},Integer(0)

        | Decimal(0.) ->
          {scale=MEAny; offset=MEConst(Integer 0)},Decimal(0.)

        | Integer(i) -> 
          {scale=MEConst((Integer 1)); offset=MEConst(Integer 0);},Integer(i)

        | Decimal(d) ->
          {scale=MEConst((Integer 1)); offset=MEConst(Integer 0);},Decimal(d)

        | _ -> error "derive_scaling_factor" "unhandled"
      in
      let simpl_res = HwLib.simplify hwenv res in
      proj,simpl_res
    in
    let proj,_= _derive_mapping_problem node in
    let stmts = QUEUE.to_list cstrs in 
    QUEUE.destroy cstrs;
    stmts,{
      scale=map_expr_simpl proj.scale;
      offset=map_expr_simpl proj.offset
    }

  let wrap_var_eq_expr v e = match e with
    | MEVar(q) -> (MSVarEqualsVar(v,q))
    | MEConst(q) -> (MSVarEqualsConst(v,q))
    | q -> (MSVarEqualsExpr(v,q))

  let derive_mapping_variable hwenv comp params (v:hwvid hwportvar) : map_stmt list =
      let stmtq = QUEUE.make() in
      let enq x =
        noop (QUEUE.enqueue stmtq x)
      in
      let enq_all x =
        noop (QUEUE.enqueue_all stmtq x)
      in
      (*stupidly enforce linear*)
      begin
        match v.bhvr with
        | HWBAnalog(bhvr) ->
            let cstrs,linear = derive_mapping_expr hwenv bhvr.rhs [] params in
            begin
              enq_all cstrs;
              enq (wrap_var_eq_expr (MPVScale(comp,v.port)) linear.scale);
              enq (wrap_var_eq_expr (MPVOffset(comp,v.port)) linear.offset);
              ()
            end

          | HWBAnalogState(bhvr) ->
            let cstrs,linear = derive_mapping_expr hwenv bhvr.rhs [v.port] params in
            begin
              let icvar,_ =bhvr.ic in
              enq_all cstrs;
              enq (wrap_var_eq_expr (MPVScale(comp,v.port)) linear.scale);
              enq (MSVarEqualsConst(MPVOffset(comp,v.port),Integer 0));
              (*all derivs must be scaled*)
              enq (MSVarHasCstr(MPVScale(comp,v.port),MCNE,
                                MEConst (Integer 1)));
              enq (MSSetVarPriority(MPVScale(comp,v.port),2));
              enq (wrap_var_eq_expr
                     (MPVOffset(comp,v.port)) linear.offset);
              enq (MSVarEqualsVar(MPVScale(comp,v.port),
                                  MPVScale(comp,icvar)));
              enq (MSVarEqualsVar(MPVOffset(comp,v.port),
                                  MPVOffset(comp,icvar)));
              ()
            end

          | _ -> error "hw_derive_scaling_factor" "unhandled"
      end;
      let lst = QUEUE.to_list stmtq in
      QUEUE.destroy stmtq;
      lst

  let derive_mapping_comp_with_params hwenv (comp:'a hwcomp)
      (params:(string,number) map) =
    let stmts = QUEUE.make () in
    let enq xs = List.iter (fun x -> noop(QUEUE.enqueue stmts x)) xs in
    MAP.iter params (fun pname pval ->
        enq ([MSDeclParam((comp.name,pname),pval)])
      );
    (*add decls*)
    HwLib.comp_iter_ins comp (fun var ->
        enq ([
            MSDeclInput(comp.name,var.port);
            MSSetPortCover((comp.name,var.port),var.defs)

          ]);
        enq ([
            ])
    );
    (*add behavior cstrs*)
    HwLib.comp_iter_outs comp (fun outvar ->
        enq ([
            MSDeclOutput(comp.name,outvar.port);
            MSSetPortCover((comp.name,outvar.port),outvar.defs)
          ])
      );
    HwLib.comp_iter_outs comp (fun outvar ->
        let cstrlst : map_stmt list =
          derive_mapping_variable hwenv comp.name params outvar 
        in
        enq cstrlst;
      );
    let cstrs = QUEUE.to_list stmts in
    QUEUE.destroy stmts;
    (params,cstrs)

  (*derive scaling factors from the component*)
  let derive_mapping_comp hwenv (comp:hwvid hwcomp)= 
    let param_combos : ((string,number) map) list =
      HwLib.all_param_combos comp
    in
    if List.length param_combos = 0 then
      [derive_mapping_comp_with_params hwenv comp (MAP.make())]
    else
      List.map
        (fun params ->
          derive_mapping_comp_with_params hwenv comp params 
        )
        param_combos
end

