
open Util
  
open HWData
open MathData

open SolverData

open HWData 
open HWLib
open AST

open MathLib

open SolverUtil

exception SolverCompLibError of string
  

let error n m = raise (SolverCompLibError (n^":"^m))

module ConcCompLib =
struct

  let mkhwcompcfg () : hwcompcfg =
    {
      inps = MAP.make();
      outs = MAP.make();
      pars = MAP.make();
      mapvars = MAP.make();
    }

  let mkvarcfg (expr:unid ast) : hwvarcfg =
    {expr=expr}

  let varcfg2str (cfg:hwvarcfg) =
    ASTLib.ast2str cfg.expr unid2str

  let is_conc (cfg:hwcompcfg) (p:string) =
    MAP.has cfg.inps p ||
    MAP.has cfg.outs p ||
    MAP.has cfg.pars p

  let _conc_map mp (p:string) (v:'a) =
    MAP.put mp p v;
    ()

  let _abs_map mp (p:string)  =
    if MAP.has mp p then
      noop (MAP.rm mp p)
    else
      ()

  let conc_param cfg = _conc_map cfg.pars and abs_param cfg = _abs_map cfg.pars
  let conc_in cfg = _conc_map cfg.inps and abs_in cfg = _abs_map cfg.inps
  let conc_out (cfg:hwcompcfg) = _conc_map cfg.outs and abs_out (cfg:hwcompcfg) = _abs_map cfg.outs

  let get_var_config (cfg:hwcompcfg) (v:string) : unid ast option =
    if MAP.has cfg.inps v then
      Some ((MAP.get cfg.inps v).expr)
    else if MAP.has cfg.outs v then
      Some ((MAP.get cfg.outs v).expr)
    else
      None

  let iter_var_cfg (cfg:hwcompcfg) (v:string->hwvarcfg->unit) (p:string->number->unit) =
    MAP.iter cfg.inps (fun x cfg -> v x cfg);
    MAP.iter cfg.outs (fun x cfg -> v x cfg);
    MAP.iter cfg.pars (fun x vl -> p x vl);
    ()

  let get_param_config (cfg:hwcompcfg) (v:string) =
    if MAP.has cfg.pars v then
      Some (MAP.get cfg.pars v)
    else
      None
  let concrete_bhvr (bhvr:hwvid hwbhv) (cfg:hwcompcfg) =
    error "concrete_bhvr" "unimpl"

  let concrete_defs (defs:hwvid hwbhv) (cfg:hwcompcfg) =  
    error "concrete_defs" "unimpl"

  let concrete_hwexpr_from_compid enc_cmp cfg expr  = 
    ASTLib.trans_id expr (fun (node:hwvid) -> match node with
        | HNPort(HWKInput,cmp,port,prop) ->
          if MAP.has cfg.inps port && cmp = enc_cmp then
           ((MAP.get cfg.inps port).expr)
          else Term(HwId(node))
        | HNPort(HWKOutput,cmp,port,prop) ->
          if MAP.has cfg.outs port && cmp = enc_cmp then
          ((MAP.get cfg.outs port).expr)
          else Term(HwId(node))
        | HNParam(cmp,name) ->
          if MAP.has cfg.pars name && cmp = enc_cmp then
            (number_to_ast (MAP.get cfg.pars name))
          else Term(HwId(node))
        | _ -> Term(HwId(node))
      )

  let concrete_hwexpr_from_compinst (cmp:hwvid hwcomp) (inst:int) (cfg:hwcompcfg) (expr:hwvid ast) =
    let enc_cmp = HCMGlobal({name=cmp.name;inst=inst}) in 
    concrete_hwexpr_from_compid enc_cmp cfg expr


  let specialize_params_from_compid (enc_cmp) cfg expr =
    ASTLib.trans_id expr (fun (node:hwvid) -> match node with
        | HNParam(cmp,name) ->
          if MAP.has cfg.pars name && cmp = enc_cmp then
            (number_to_ast (MAP.get cfg.pars name))
          else Term((node))
        | _ -> Term((node))
      )

  let specialize_params_hwexpr_from_compinst (cmp:hwvid hwcomp) (inst:int) (cfg:hwcompcfg) (expr:hwvid ast) =
    let enc_cmp = HCMGlobal({name=cmp.name;inst=inst}) in 
    specialize_params_from_compid enc_cmp cfg expr

  (*
    todo map variables with truncation
     data structure: Input Map |-> ival[hw] = A*ival[math]+B
     conns impose constraints = A = 0 or B = 0
     
  *)


  
  (*wire*)

  let get_conc_comp (tbl) (inst:hwcompinst) : ucomp_conc=
    let insts : ucomp_ctx =  (MAP.get tbl.comp_ctx inst.name) in
    MAP.get insts.insts inst.inst

  let conccomp2str (comp:hwvid hwcomp) (cfg:hwcompcfg) (ist:int) =
    let is_comp cmp = match cmp with
      | HCMLocal(_) -> error "conccomp2str" "no hcm local allowed" 
      | HCMGlobal(ci) -> comp.name = ci.name && ist = ci.inst
    in
    let hwvid2plugstr (x:hwvid) : string = match x with
      | HNPort(_,cmp,port,_) ->
          if is_comp cmp then
            match get_var_config cfg port with
            | Some(expr) -> uast2str expr
            | None -> hwid2str x
          else hwid2str x
      | HNParam(cmp,param) ->
        if is_comp cmp then
          match get_param_config cfg param with
          | Some(num) ->string_of_number num 
          | None -> hwid2str x
        else
          hwid2str x
      | _ -> hwid2str x
    in
    HwLib.hwcomp2str comp hwvid2plugstr 
end


module SolverCompLib =
struct

  let grade_hwvar_with_goal (c:'a hwcomp) (hv:'a hwportvar) (m:unifiable_goal) = 0

  let compatible_hwvar_with_mvar (hv:'a hwportvar) (v:mid mvar) : bool =
    match hv.bhvr, v.bhvr with
    | HWBAnalogState(_),MBhvStateVar(_) -> true
    | HWBAnalog(_),MBhvVar(_) -> true
    | _,MBhvInput -> error "compatible_hwvar_with_mvar" "cannot unify input"
    | _,MBhvUndef-> error "compatible_hwvar_with_mvar" "cannot unify undefined"
    | _ -> false

  let compatible_hwvar_with_hwexpr (env:'a hwenv) (hv:'a hwportvar) (dest_wire:wireid)
      (prop:string) (expr:'b ast) : bool =
    if hv.prop = prop then
      if HwLib.is_connectable env hv.comp hv.port dest_wire.comp.name dest_wire.port then
        begin
          match hv.bhvr with
          | HWBAnalog(_) -> true
          | _ -> false
        end
      else
        false
    (*not the same property*)
    else
      false

  let compatible_hwvar_with_goal tbl (hv:'a hwportvar) (v:unifiable_goal) : bool =
    match v with
    | GUMathGoal(mgoal) -> compatible_hwvar_with_mvar hv mgoal.d
    | GUHWInExprGoal(hgoal) ->
      compatible_hwvar_with_hwexpr tbl.env.hw hv hgoal.wire hgoal.prop hgoal.expr
    | _ -> error "compatible_hwvar_with_goal" "unimpl"

  let compatible_comp_with_goal tbl (c:ucomp) (mv:unifiable_goal) : 'a hwportvar list =
    let comp_vars : 'a hwportvar list = HwLib.comp_fold_outs c.d (fun hv lst ->
        if compatible_hwvar_with_goal tbl hv mv
        then hv::lst else lst
      ) []
    in
    comp_vars

  let compatible_used_comp_with_goal tbl (c:ucomp_conc) (mv:unifiable_goal) : 'a hwportvar list =
    let comp_vars : 'a hwportvar list = HwLib.comp_fold_outs c.d (fun hv lst ->
        if compatible_hwvar_with_goal tbl hv mv && ConcCompLib.is_conc c.cfg hv.port
        then hv::lst else lst
      ) []
    in
    comp_vars

  let has_available_insts (tbl:gltbl) (name:hwcompname) = 
    let cmp_ctx : ucomp_ctx = MAP.get tbl.comp_ctx name in
    let cmp_ideal = MAP.get tbl.avail_comps name in
    MAP.size cmp_ctx.insts < cmp_ideal.d.insts

  let mk_conc_comp_of_inst (tbl:gltbl) (f:hwcompname) (cmpinst:int) : ucomp_conc =
    let cmp_ctx : ucomp_ctx = MAP.get tbl.comp_ctx f in 
    let cmp : hwvid hwcomp = HwLib.getcomp tbl.env.hw f in
    let cmpid = HCMGlobal({name=f;inst=cmpinst}) in
    let glbl_cmp :hwvid hwcomp = HwLib.map_comp cmp
        (fun (v:hwvid) -> match v with
           | HNPort(knd,HCMLocal(n),port,prop) ->
             HNPort(knd,cmpid,port,prop)
           | HNParam(HCMLocal(n),v) ->
             HNParam(cmpid,v)
           | _ -> v )
    in
    {inst=cmpinst;d=glbl_cmp;cfg=ConcCompLib.mkhwcompcfg()}

  let mk_conc_comp (tbl:gltbl) (f:hwcompname) : ucomp_conc =
    let cmp_ctx : ucomp_ctx = MAP.get tbl.comp_ctx f in 
    let cmpinst = cmp_ctx.cnt in
    cmp_ctx.cnt <- cmp_ctx.cnt + 1;
    mk_conc_comp_of_inst tbl f cmpinst 
    
  
    
  let add_conc_comp (tbl:gltbl) (c:ucomp_conc) =
    let cmp_ctx : ucomp_ctx = MAP.get tbl.comp_ctx c.d.name in 
    if MAP.has cmp_ctx.insts c.inst = false then
      noop (MAP.put cmp_ctx.insts c.inst c)
    else
      error "add_conc_comp" "cannot add comp that already exists"

  let rm_conc_comp (tbl:gltbl) (c:ucomp_conc) =
    let cmp_ctx : ucomp_ctx = MAP.get tbl.comp_ctx c.d.name in 
    if MAP.has cmp_ctx.insts c.inst  then
      noop (MAP.rm cmp_ctx.insts c.inst)
    else
      error "add_conc_comp" "cannot remove comp that does not exist"


  let get_conc_comp (tbl:gltbl) (f:hwcompinst) = 
    if MAP.has tbl.comp_ctx f.name then
      let ctx = MAP.get tbl.comp_ctx f.name in
      if MAP.has ctx.insts f.inst then
        MAP.get ctx.insts f.inst
      else
        error "get_conc_comp" ("no instance "^(string_of_int f.inst)^" of component "^
                               (HwLib.hwcompname2str f.name))
    else
      error "get_conc_comp" ("no component with the hardware name "^(HwLib.hwcompname2str f.name))

  let get_avail_comp (tbl:gltbl) (f:hwcompname) =
    MAP.get tbl.avail_comps f


  let _invoke_conc_fxn (f) (tbl:gltbl) (id:hwcompinst) =
    let cmp = get_conc_comp tbl id in
    f cmp

  let conc_param tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.conc_param cmp.cfg port v) tbl id
  let conc_in tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.conc_in cmp.cfg port v) tbl id
  let conc_out tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.conc_out cmp.cfg port v) tbl id
  let abs_param tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.abs_param cmp.cfg port ) tbl id
  let abs_in tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.abs_in cmp.cfg port ) tbl id
  let abs_out tbl id port v =
    _invoke_conc_fxn (fun cmp -> ConcCompLib.abs_out cmp.cfg port ) tbl id



  let fold_used_comps (tbl:gltbl) (f:hwcompinst -> ucomp_conc -> 'b -> 'b) (x0:'b) : 'b =
    MAP.fold tbl.comp_ctx (fun name ctx r ->
        MAP.fold ctx.insts (fun inst cmp r2 -> f {name=name;inst=inst} cmp r2) r) x0

  let fold_avail_comps (tbl:gltbl) (f:hwcompname -> ucomp -> 'b -> 'b) (x0:'b) : 'b =
    MAP.fold tbl.avail_comps (fun k v r -> match k with
        | HWCmComp(_) -> f k v r
        | _ -> r) x0

  let iter_avail_comps (tbl:gltbl) (f:hwcompname ->ucomp -> unit) =
    fold_avail_comps tbl (fun a b () -> f a b) ()

  let iter_used_comps (tbl:gltbl) (f:hwcompinst ->ucomp_conc -> unit) =
    fold_used_comps tbl (fun a b () -> f a b) ()

  let ccomps2str (g:gltbl)  =
    MAP.fold g.comp_ctx (fun compname compinsts str ->
        MAP.fold compinsts.insts (fun compinst conccomp str ->
            str^"==== "^(HwLib.hwcompname2str compname)^" "^(string_of_int compinst)^" ====\n"^
            (ConcCompLib.conccomp2str conccomp.d conccomp.cfg compinst)^"\n"
          ) str
      ) ""
end
