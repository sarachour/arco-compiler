open AST
open SolverData
open Util

open HWLib
open HWData

open IntervalLib
open SolverCompLib
open SlnLib

type matvar =
  | MATScalar of string

type matlit =
  | MATStr of string
  | MATInt of int
  | MATFloat of float

type matexpr =
  | MATVar of matvar 
  | MATLit of matlit
  | MATFxn of string*(matexpr list)

type matst =
  | MATComment of string
  | MATCond of matexpr*matst*matst
  | MATBlock of matst list
  | MATStmt of matexpr
  | MATAssign of matvar*matexpr
  | MATFxnDecl of string*(matvar list)*(matst list)

type matloc = {
  x : int;
  y : int;
}

type matrect = {
  loc : matloc;
  width: int;
  height: int;
}

type matlayout = {
  blocks: matrect list;
}

module SimulinkRouter =
struct


end


module SimulinkGen =
struct

  let basic_fxns = MAP.make ();;
  noop (MAP.put basic_fxns "*" "simulink/Math Operations/Product");;
  noop (MAP.put basic_fxns "+" "simulink/Math Operations/Sum");;
  noop (MAP.put basic_fxns "int" "simulink/Continuous/Integrator");;
  noop (MAP.put basic_fxns "sat" "simulink/Discontinuities/Saturation");;
  noop (MAP.put basic_fxns "in" "simulink/Ports & Subsystems/In1");;
  noop (MAP.put basic_fxns "out" "simulink/Ports & Subsystems/Out1");;
  noop (MAP.put basic_fxns "const" "simulink/Sources/Constant");;
  noop (MAP.put basic_fxns "noise" "simulink/Sources/Uniform Random Number");;
  noop (MAP.put basic_fxns "pulse" "simulink/Sources/Pulse Generator");;
  noop (MAP.put basic_fxns "gain" "simulink/Math Operations/Gain");;
  noop (MAP.put basic_fxns "-" "simulink/Math Operations/Subtract");;
  noop (MAP.put basic_fxns "mfxn" "simulink/Math Operations/Math Function");;
  noop (MAP.put basic_fxns "comp" "simulink/Ports & Subsystems/Subsystem");;

  let symtbl = MAP.make ()

  let clear_tbl () =
    MAP.clear symtbl

  let declare_var k = MAP.put symtbl k (); ()

  let symtbl_size () = MAP.size symtbl

  let defined k = MAP.has symtbl k

  let get_basic_fxn name =
    MAP.get basic_fxns name

  let comp_addr circ iname =
    (circ^"/"^(HwLib.hwcompname2str iname))

  let port_addr circ iname port =
    (comp_addr circ iname)^"/"^port

 
  let add_block route newdest =
    MATStmt(MATFxn("add_block",[
        MATLit(MATStr(route));
        MATLit(MATStr(newdest))
      ]))

  let set_param mvar param vl =
     MATStmt(MATFxn("set_param",[
        mvar;
        MATLit(MATStr(param));
        vl
      ]))

  let relative ns loc =
    STRING.removeprefix loc (ns^"/") 

  let add_line ns gsrc gsnk =
    let src = relative ns gsrc in
    let snk = relative ns gsnk in
    (MATStmt(MATFxn("add_line",[
        MATLit(MATStr(ns));
        MATLit(MATStr(src));
        MATLit(MATStr(snk));
      ])))

  let remove_line ns gsrc gsnk =
    let src = relative ns gsrc in
    let snk = relative ns gsnk in
    (MATStmt(MATFxn("delete_line",[
        MATLit(MATStr(ns));
        MATLit(MATStr(src));
        MATLit(MATStr(snk));
      ])))

  let remove_block ns name =
    (MATStmt(MATFxn("delete_block",[
        MATLit(MATStr(ns^"/"^name));
       ])))

  let _model_preamble (stmtq:matst queue) name =
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    q (MATComment "define model name");
    let model_name = MATScalar("model_name") in
    q (MATAssign(model_name,MATLit(MATStr(name))));
    q (MATComment "create and open the model");
    q (MATStmt(MATFxn("open_system",[
        MATFxn("new_system",[MATVar(model_name)])
      ])));
    q (MATComment "set solver method");
    q (set_param (MATVar model_name) "Solver" (MATLit (MATStr("ode3"))));
    ()

  let get_input_loc namespace v =
    namespace^"/_"^v^"/1"

  let get_output_loc namespace v =
    namespace^"/_"^v^"/1"


  let get_ext_input_loc namespace v=
    namespace^"/"^v^"/1"

  let get_ext_output_loc namespace v=
    namespace^"/"^v^"/1"


  let create_in q ns (vr:string)=
    let loc = ns^"/"^vr in
    let internal_loc = ns^"/_"^vr in
    if defined loc = false then      
      begin
        declare_var loc;
        declare_var internal_loc;
        q (add_block (get_basic_fxn "in") loc);
        q (add_block (get_basic_fxn "gain") internal_loc)
      end;
    loc^"/1",internal_loc^"/1"

  let create_out q ns (vr:string) =
    let loc = ns^"/"^vr in
    let internal_loc = ns^"/_"^vr in
    (*the iytoyt has an internal and external lock*)
    if defined loc = false then      
      begin
        declare_var loc;
        declare_var internal_loc;
        q (add_block (get_basic_fxn "out") loc);
        q (add_block (get_basic_fxn "gain") internal_loc);
        q (add_line ns (get_output_loc ns vr) (get_ext_output_loc ns vr))
      end;
    loc^"/1",internal_loc^"/1"

  let create_const (q:matst->unit) (namespace:string) (value:float) =
    let id = symtbl_size () in
    let loc = namespace^"/const_"^(string_of_int id) in
    if defined loc = false then      
      begin
        declare_var (loc);
        q (add_block (get_basic_fxn "const") (loc));
        q (set_param
             (MATLit(MATStr(loc))) "Value"
             (MATLit(MATStr(string_of_float value)))
          )
      end;
    loc^"/1"

  let create_sub q namespace n_inps =
    let id = symtbl_size () in
    let loc = namespace^"/add_"^(string_of_int id) in
    let inpstr=  "+"^(STRING.repeat "-" (n_inps-1)) in
    declare_var (loc);
    q (add_block (get_basic_fxn "+") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> loc^"/"^(string_of_int x))
        (LIST.mkrange 1 n_inps)
    in
    let out_loc = loc^"/"^(string_of_int (1)) in
    loc,inp_locs,out_loc


  let create_neg q namespace =
    let id = symtbl_size () in
    let loc = namespace^"/neg_"^(string_of_int id) in
    let inpstr=  "-" in
    declare_var (loc);
    q (add_block (get_basic_fxn "+") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_loc = loc^"/"^(string_of_int (1)) in
    let out_loc = loc^"/"^(string_of_int (1)) in
    loc,inp_loc,out_loc


  let create_add q namespace n_inps =
    let id = symtbl_size () in
    let loc = namespace^"/sub_"^(string_of_int id) in
    let inpstr=  STRING.repeat "+" n_inps in
    declare_var (loc);
    q (add_block (get_basic_fxn "+") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> loc^"/"^(string_of_int x))
        (LIST.mkrange 1 (n_inps))
    in
    let out_loc = loc^"/"^(string_of_int (1)) in
    loc,inp_locs,out_loc


  let create_mult q namespace n_inps =
    let id = symtbl_size () in
    let loc = namespace^"/mul_"^(string_of_int id) in
    let inpstr=  STRING.repeat "*" n_inps in
    declare_var (loc);
    q (add_block (get_basic_fxn "*") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> loc^"/"^(string_of_int x))
        (LIST.mkrange 1 (n_inps))
    in
    let out_loc = loc^"/"^(string_of_int (1)) in
    loc,inp_locs,out_loc

  let create_div q namespace  =
    let id = symtbl_size () in
    let loc = namespace^"/div_"^(string_of_int id) in
    let inpstr=  "*/" in
    declare_var (loc);
    q (add_block (get_basic_fxn "*") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let numer_loc = loc^"/"^(string_of_int 1) in
    let denom_loc = loc^"/"^(string_of_int 2) in
    let out_loc = loc^"/"^(string_of_int 1) in
    loc,numer_loc,denom_loc,out_loc


  let create_power q namespace  =
    let id = symtbl_size () in
    let loc = namespace^"/pow_"^(string_of_int id) in
    declare_var (loc);
    q (add_block (get_basic_fxn "mfxn") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Function"
         (MATLit(MATStr("pow"))));
    let base_loc = loc^"/1" in
    let exp_loc = loc^"/2" in
    let out_loc = loc^"/1" in
    loc,base_loc,exp_loc,out_loc

    
  let create_clamp q namespace min max =
    let id = symtbl_size () in
    let loc = namespace^"/sat_"^(string_of_int id) in
    declare_var (loc);
    q (add_block (get_basic_fxn "sat") loc);
    q (set_param
         (MATLit(MATStr(loc))) "UpperLimit"         
         (MATLit(MATStr(string_of_float max))));
    q (set_param
         (MATLit(MATStr(loc))) "LowerLimit"         
         (MATLit(MATStr(string_of_float min))));
    let clamp_in = loc^"/1" in
    let clamp_out = loc^"/1" in
    loc,clamp_in,clamp_out

  let create_sample q namespace sample =
    let id = symtbl_size () in
    let loc = namespace^"/smp_"^(string_of_int id) in
    let vloc = namespace^"/smpv_"^(string_of_int id) in
    declare_var (loc);
    declare_var (vloc);
    q (add_block (get_basic_fxn "pulse") loc);
    q (add_block (get_basic_fxn "*") vloc);
    q (set_param
         (MATLit(MATStr(loc))) "Period"         
         (MATLit(MATStr(string_of_float sample))));
    q (set_param
         (MATLit(MATStr(loc))) "PulseWidth"         
         (MATLit(MATStr("50"))));
    q (set_param
         (MATLit(MATStr(vloc))) "Inputs"
         (MATLit(MATStr("**"))));
    let sample_out = loc^"/1" in
    let mul_in1 = vloc^"/1" in
    let mul_in2 = vloc^"/2" in
    let mul_out = vloc^"/1" in
    q (add_line namespace sample_out mul_in2);
    loc,mul_in1,mul_out

  let create_noise q namespace =
   let id = symtbl_size () in
   let loc = namespace^"/unz_"^(string_of_int id) in
   let vloc = namespace^"/unzv_"^(string_of_int id) in
   let aloc = namespace^"/unza_"^(string_of_int id) in
   declare_var (loc);
   declare_var (vloc);
   declare_var (aloc);
   q (add_block (get_basic_fxn "noise") loc);
   q (add_block (get_basic_fxn "*") vloc);
   q (add_block (get_basic_fxn "+") aloc);
   q (set_param
         (MATLit(MATStr(aloc))) "Inputs"
         (MATLit(MATStr("++"))));
   q (set_param
         (MATLit(MATStr(vloc))) "Inputs"
         (MATLit(MATStr("**"))));
   let noise_out = loc^"/1" in
   let mul_in1 = vloc^"/1" in
   let mul_in2 = vloc^"/2" in
   let mul_out = vloc^"/1" in
   let add_in1 = aloc^"/1" in
   let add_in2 = aloc^"/2" in
   let add_out = aloc^"/1" in
   q (add_line namespace noise_out mul_in2);
   q (add_line namespace mul_out add_in2);
   vloc,mul_in1,add_in1,add_out

  let create_integrator q namespace =
    let id = symtbl_size () in
    let loc = namespace^"/int_"^(string_of_int id) in
    declare_var (loc);
    q (add_block (get_basic_fxn "int") loc);
    let integ_in_out = loc^"/1" in
    loc,integ_in_out,integ_in_out

  let expr2blockdiag (q:matst->unit) (namespace:string)  (expr:hwvid ast)  =
    let rec _expr2blockdiag el =
      match el with
      | Term(HNPort(HWKInput,_,port,_)) ->
        get_input_loc namespace port
      | Term(HNPort(HWKOutput,_,port,_)) ->
        get_output_loc namespace port
      | Term(HNParam(_,name)) ->
        get_input_loc namespace name
      | Term(_) ->
        error "conv" "unhandled term time"
      | Decimal(d) ->
        create_const q namespace (d) 
      | Integer(i) ->
        create_const q namespace (float_of_int i)
      | OpN(Add,args) ->
        let handles = List.map (fun arg -> _expr2blockdiag arg) args in
        let adder,ins,out = create_add q namespace (List.length handles) in
        List.iter (fun (add_in,h_out) ->
            q (add_line namespace h_out add_in)
          ) (LIST.zip ins handles);
        out
      | OpN(Sub,args) ->
        let handles = List.map (fun arg -> _expr2blockdiag arg) args in
        let adder,ins,out = create_sub q namespace (List.length handles) in
        List.iter (fun (add_in,h_out) ->
            q (add_line namespace h_out add_in)
          ) (LIST.zip ins handles);
        out
      | OpN(Mult,args) ->
        let handles = List.map (fun arg -> _expr2blockdiag arg) args in
        let mult,ins,out = create_mult q namespace (List.length handles) in
        List.iter (fun (add_in,h_out) ->
            q (add_line namespace h_out add_in)
          ) (LIST.zip ins handles);
        out
      | Op2(Power,base,exp) ->
        let base = _expr2blockdiag base in
        let exp = _expr2blockdiag exp in
        let power,pow_base,pow_exp,pow_out = create_power q namespace in
        q (add_line namespace exp pow_exp);
        q (add_line namespace base pow_base);
        pow_out

      | Op2(Div,numer,denom) ->
        let numer = _expr2blockdiag numer in
        let denom = _expr2blockdiag denom in
        let mult,mult_numer,mult_denom,mult_out = create_div q namespace  in
        q (add_line namespace numer mult_numer);
        q (add_line namespace denom mult_denom);
        mult_out
      | Op1(Neg,expr) ->
        let expr_loc = _expr2blockdiag expr in
        let adder,inp,out = create_neg q namespace in
        q (add_line namespace expr_loc inp);
        out
      | Op1(Exp,expr) ->
        error "conv" "unhandled exp"
      | _ ->
        error "conv" "unhandled"
    in
  _expr2blockdiag expr

  let create_subsystem q namespace name =
    let loc = (namespace^"/"^name) in
    q (add_block (get_basic_fxn "comp") loc);
    q (remove_line loc "In1/1" "Out1/1");
    q (remove_block loc "In1");
    q (remove_block loc "Out1");
    loc

  let create_block circuit (comp:hwvid hwcomp) : matst list =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let cmpns =
      create_subsystem q circuit (HwLib.hwcompname2str comp.name)
    in
    HwLib.comp_iter_ins comp (fun vr ->
        let ext_in,int_in = create_in q cmpns vr.port in
        match vr.defs with
        | HWDAnalog(defs) ->
          let min,max = IntervalLib.interval2numbounds defs.ival in
          let clamp,clamp_in,clamp_out= create_clamp q cmpns min max in
          q (add_line cmpns ext_in clamp_in);
          q (add_line cmpns clamp_out int_in);
        | HWDDigital(defs) ->
          let sample,_ = defs.freq in
          let sample_cmp,sample_in,sample_out =
            create_sample q cmpns (float_of_number sample)
          in
          q (add_line cmpns ext_in sample_in);
          q (add_line cmpns sample_out int_in);
          ()
        | _ -> error "comp_iter_ins" "unexpected"
      );
    HwLib.comp_iter_outs comp (fun vr ->
        create_out q cmpns vr.port;
        ()
    );
    HwLib.comp_iter_params comp (fun (par:hwparam) ->
        let ext_in,int_in = create_in q cmpns par.name in
        q (add_line cmpns ext_in int_in);
        ()
    );
    HwLib.comp_iter_outs comp (fun vr ->
        let int_out = get_output_loc cmpns vr.port in
        match vr.bhvr,vr.defs with
        | HWBAnalog(bhvr),HWDAnalog(defs) ->
          (*let min,max = IntervalLib.interval2numbounds defs.ival in*)
          (*compute handles*)
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
          (*let _,clamp_in,clamp_out= create_clamp q cmpns min max in*)
          (*this is where you'd pipe the output through a few things*)
          let _,variance,noise_in,noise_out = create_noise q cmpns in 
          (*then you connect*)
          q (add_line cmpns handle noise_in);
          q (add_line cmpns var_handle variance);
          q (add_line cmpns noise_out int_out);
          ()
        | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
          (*let min,max = IntervalLib.interval2numbounds defs.deriv.ival in*)
          let smin,smax = IntervalLib.interval2numbounds defs.stvar.ival in
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          (*this is where you'd pipe the output through a few things*)
          let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
          (*let _,clamp_in,clamp_out= create_clamp q cmpns min max in*)
          let _,sclamp_in,sclamp_out= create_clamp q cmpns smin smax in
          (*this is where you'd pipe the output through a few things*)
          let _,variance,noise_in,noise_out = create_noise q cmpns in 
          let _,integ_in,integ_out = create_integrator q cmpns in
          (*then you connect*)
          q (add_line cmpns handle noise_in);
          q (add_line cmpns var_handle variance);
          q (add_line cmpns noise_out integ_in);
          q (add_line cmpns integ_out sclamp_in);
          q (add_line cmpns sclamp_out int_out);
          (*then you connect*)
          ()
        | HWBAnalog(bhvr),HWDDigital(defs) ->
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          let sample,_ = defs.freq in
          let _,sample_in,sample_out =
            create_sample q cmpns (float_of_number sample)
          in
          q (add_line cmpns handle sample_in);
          q (add_line cmpns sample_out int_out);
        | _ -> error "iter outs" "unexpected"
    );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let create_library circuit (g:hwvid hwenv) : matst list=
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let lib_ns :string  =
      create_subsystem q circuit ("library")
    in
    qs [MATComment("");MATComment("")];
    HwLib.iter_comps g (fun cmp ->
        let stmts : matst list= create_block lib_ns cmp in
        q (MATComment(""));
        qs stmts;
        ()
      );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let get_comp_from_lib namespace (name:hwcompname) =
    namespace^"/library/"^(HwLib.hwcompname2str name)

  let create_circuit (tbl) namespace =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in

    let sln : usln = tbl.sln_ctx in
    let circ_ns :string  =
      create_subsystem q namespace ("circuit")
    in
    SolverCompLib.iter_used_comps tbl (fun (inst:hwcompinst) ccomp ->
        let loc = circ_ns^"/"^(HwLib.hwcompinst2str inst) in 
        q (add_block (get_comp_from_lib namespace inst.name) loc)
      );
    SlnLib.iter_conns sln (fun (src:wireid) (dst:wireid) ->
        let src_loc = circ_ns^"/"^(HwLib.hwcompinst2str src.comp)^"/"^src.port in
        let dst_loc = circ_ns^"/"^(HwLib.hwcompinst2str dst.comp)^"/"^dst.port in
        q (add_line circ_ns src_loc dst_loc)
      );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

 let to_simulink (tbl:gltbl) (mappings:hw_mapping list) (name:string) =
    clear_tbl();
    let hw = tbl.env.hw in
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let model_name = name in
    _model_preamble stmtq model_name;
    debug ("=== Emitting Library ===");
    let libstmts = (create_library model_name hw) in
    let circ_stmts = create_circuit tbl model_name in
    let stmts = QUEUE.to_list stmtq in
    [
      MATComment("circuit build script");
      MATFxnDecl("preamble",[],stmts);
      MATFxnDecl("build_comp_library",[],libstmts);
      MATComment("");MATComment("");
      MATFxnDecl("build_circuit",[],circ_stmts);
      MATComment("");
    ]

  let matvar2str (xvar:matvar) = match xvar with
    | MATScalar(v) -> v

  let matlit2str (lit:matlit) = match lit with
    | MATStr(v) ->("'"^v^"'")
    | MATInt(x) -> string_of_int x
    | MATFloat(x) -> string_of_float x

  let matexpr2buf fb (xexpr:matexpr) : unit =
    let os x = noop (output_string fb x) in
    let rec _matexpr2buf xe :unit  =
      match xe with
      | MATFxn(name,h::t) ->
        begin
          os (name^"(");
          _matexpr2buf h;
          List.iter (fun next ->
              os ","; _matexpr2buf next
            ) t;
          os (")")
        end
      | MATFxn(name,[]) ->
        begin
          os (name^"()")
        end
      | MATLit(lit) ->
        os (matlit2str lit)
      | MATVar(v) ->
        os (matvar2str v)
    in
    _matexpr2buf xexpr

  let matst2buf fb (xst:matst) : unit =
    let os x = output_string fb x in
    let ident2str i = STRING.repeat "  " i in
    let rec _matst2buf ident x =
      let sp = ident2str ident in
      match x with
      | MATFxnDecl(name,vars,stmts) ->
        begin
          let args = List.map (fun x -> MATVar(x)) vars in
          os (sp^"function ");
          matexpr2buf fb (MATFxn(name,args));
          os "\n";
          List.iter (fun x -> _matst2buf (ident+1) x) stmts
        end
      | MATStmt(expr) ->
        begin
          os sp;
          matexpr2buf fb expr;
          os ";\n"
        end
      | MATAssign(vr,expr) ->
        begin
          os (sp^(matvar2str vr)^"=");
          matexpr2buf fb expr;
          os ";\n"
        end
      | MATBlock(stmts) ->
          List.iter (fun x -> _matst2buf (ident) x) stmts
      | MATCond(cond,ifblk,elseblk) ->
        begin
          os (sp^"if ");
          matexpr2buf fb cond;
          _matst2buf (ident+1) ifblk;
          os (sp^"else ");
          _matst2buf (ident+1) elseblk;
        end
      | MATComment(x) ->
        os (sp^"%"^x^"\n")
    in
    _matst2buf 0 xst

  let to_buf fb (lst:matst list) = 
    List.iter (fun x -> matst2buf fb x) lst;
    flush_all();
    ()

  let to_file stmts filename =
    print_string ("===> Emitting Simulation to "^(filename)^"\n");
    let oc = open_out filename in
    to_buf oc stmts;
    close_out oc;
    ()

end
