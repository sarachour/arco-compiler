open AST
open SolverData
open Util

open HWLib
open HWData

open IntervalLib
open SolverCompLib
open SlnLib

open Interactive

type matvar =
  | MATScalar of string

type matlit =
  | MATStr of string
  | MATInt of int
  | MATFloat of float
  | MATArr of matlit list  
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


type simulink_format =
  | SFIdealSDE
  | SFIdealODE
  | SFCircSDE
  | SFCircODE
  | SFCircMapSDE
  | SFCircMapODE


module SimulinkRouter =
struct


end

let _print_debug = print_debug 1 "dbg"
let debug = print_debug 1 "dbg"

module SimulinkGen =
struct

  let simulink_format = REF.mk SFIdealODE

  let upd_format form =
    REF.upd simulink_format (fun x -> form)

  let model_noise ()= match REF.dr simulink_format with
    | SFIdealSDE -> true
    | SFCircSDE -> true
    | SFCircMapSDE -> true
    | _ -> false

  let model_ideal () = match REF.dr simulink_format with
    | SFCircSDE -> false
    | SFCircODE -> false
    | SFCircMapSDE -> false
    | SFCircMapODE -> false
    | SFIdealSDE -> true
    | SFIdealODE -> true

  let model_mapper form = match REF.dr simulink_format with
    | SFCircMapODE -> true
    | SFCircMapSDE -> true
    | _ -> false


  let basic_fxns = MAP.make ();;
  noop (MAP.put basic_fxns "*" "simulink/Math Operations/Product");;
  noop (MAP.put basic_fxns "+" "simulink/Math Operations/Sum");;
  noop (MAP.put basic_fxns "int" "simulink/Continuous/Integrator");;
  noop (MAP.put basic_fxns "sat" "simulink/Discontinuities/Saturation");;
  noop (MAP.put basic_fxns "in" "simulink/Ports & Subsystems/In1");;
  noop (MAP.put basic_fxns "out" "simulink/Ports & Subsystems/Out1");;
  noop (MAP.put basic_fxns "const" "simulink/Sources/Constant");;
  noop (MAP.put basic_fxns "noise" "simulink/Sources/Uniform Random Number");;
  noop (MAP.put basic_fxns "disc" "simulink/Discontinuities/Quantizer");;
  noop (MAP.put basic_fxns "gain" "simulink/Math Operations/Gain");;
  noop (MAP.put basic_fxns "-" "simulink/Math Operations/Subtract");;
  noop (MAP.put basic_fxns "mfxn" "simulink/Math Operations/Math Function");;
  noop (MAP.put basic_fxns "comp" "simulink/Ports & Subsystems/Subsystem");;

  type simblock = {
    ins : (string,int) map;
    outs: (string,int) map;
  }
  type simns = string list
  type simel =
    | SIMBlock of simns*string 
    | SIMBlockIn of simns*string*string
    | SIMBlockOut of simns*string*string

  type symtbl = {
    (*fully qualified name*)
    paths: (string,simel) map;
    (*comp to block info*)
    blocks: (string,simblock) map
  }

  let symtbl = {
    paths = MAP.make();
    blocks = MAP.make();
  }

  let clear_tbl () =
    MAP.clear symtbl.paths;
    MAP.clear symtbl.blocks

  let ns_to_str ns =
    match ns with
    | h::t -> (List.fold_left (fun s x -> s^"/"^x) h t)^"/"
    | [] -> ""

  let blk_outport_to_id blk port =
    if MAP.has symtbl.blocks blk then
      let simblock = MAP.get symtbl.blocks blk in
      if MAP.has simblock.outs port then
        MAP.get simblock.outs port
      else
        error "blk_outport_to_id" ("port doesn't exist: "^blk^" for "^port)
    else
      error "blk_outport_to_id" ("block doesn't exist: "^blk^" for "^port)

  let blk_inport_to_id blk port =
    if MAP.has symtbl.blocks blk then
      let simblock = MAP.get symtbl.blocks blk in
      if MAP.has simblock.ins port then
        MAP.get simblock.ins port
      else
        error "blk_inport_to_id" ("port doesn't exist: "^blk^" for "^port)

    else
      error "blk_inport_to_id" ("block doesn't exist: "^blk^" for "^port)

  let rec loc2path x = match x with
    | SIMBlock(ns,blk) -> (ns_to_str ns)^blk
    | SIMBlockIn(ns,blk,p) ->
      let blkpath = loc2path (SIMBlock(ns,blk)) in
      (ns_to_str ns)^blk^"/"^(string_of_int (blk_inport_to_id blkpath p))
    | SIMBlockOut(ns,blk,p) ->
      let blkpath = loc2path (SIMBlock(ns,blk)) in
      (ns_to_str ns)^blk^"/"^(string_of_int (blk_outport_to_id blkpath p))

  let has_block x =
    match x with
    | SIMBlock(_) -> MAP.has symtbl.blocks (loc2path x)

  let get_block x =
    match x with
    | SIMBlock(_) -> MAP.get symtbl.blocks (loc2path x)

  let mk_sim_in x p = match x with
    | SIMBlock(ns,blk) -> SIMBlockIn(ns,blk,p)
    | _ -> error "mk_sim_in" "input must be on a block"

  let mk_sim_out x p = match x with
    | SIMBlock(ns,blk) -> SIMBlockOut(ns,blk,p)
    | _ -> error "mk_sim_in" "input must be on a block"

  (*make an input in the enclosing parameter*)
  let mk_sim_ext_in ns p =
    let cmp = LIST.last ns in
    let pns = LIST.except_last ns in
    let par_cmp = SIMBlock(pns,cmp) in
    if has_block par_cmp then
      SIMBlockIn(pns,cmp,p)
    else
      error "mk_sim_ext_in"
        ("cannot make an external input ("^p^") for nonexistant block:"^(loc2path par_cmp))

  let mk_sim_ext_out ns p =
    let cmp = LIST.last ns in
    let pns = LIST.except_last ns in
    let par_cmp = SIMBlock(pns,cmp) in
    if has_block par_cmp then
      SIMBlockOut(pns,cmp,p)
    else
      error "mk_sim_ext_in" "cannot make an external input for nonexistant block"

  let declare_var (k:simel)=
    begin
      match k with
      | SIMBlock(ns,blkn) ->
        if MAP.has symtbl.blocks (loc2path k) = false then
          debug ("   > declare cmp "^(loc2path (SIMBlock(ns,blkn))));
          noop (MAP.put symtbl.blocks (loc2path k) {ins=MAP.make();outs=MAP.make()})
      | SIMBlockIn(ns,blkn,inp) ->
        let blk = get_block (SIMBlock(ns,blkn)) in
        if MAP.has blk.ins inp = false then
          begin
            debug ("   > declare in "^(loc2path (SIMBlock(ns,blkn)))^" -> "^inp);
            noop (MAP.put blk.ins inp (MAP.size blk.ins + 1))
          end
      | SIMBlockOut(ns,blkn,out) ->
        let blk = get_block (SIMBlock(ns,blkn)) in
        if MAP.has blk.outs out = false then
          begin
            debug ("   > declare out "^(loc2path (SIMBlock(ns,blkn)))^" -> "^out);
            noop (MAP.put blk.outs out (MAP.size blk.outs + 1))
          end
    end;
    let path = loc2path k in
    debug (">+ "^path);
    MAP.put symtbl.paths path k;
    ()

  let declare_vars ks =
    List.iter (fun x -> declare_var x) ks
      
  let symtbl_size () = MAP.size symtbl.paths

  let defined k = MAP.has symtbl.paths (loc2path k)

  let get_basic_fxn name =
    MAP.get basic_fxns name

  let comp_addr circ iname =
    (circ^"/"^(HwLib.hwcompname2str iname))

  let port_addr circ iname port =
    (comp_addr circ iname)^"/"^port

  let set_position route x y w h =
    let posarr =
      List.map (fun x -> MATInt(x)) [x;y;w;h]
    in
     MATStmt(MATFxn("set_param",[
        MATLit(MATStr(route));
        MATLit(MATStr("position"));
        MATLit(MATArr(posarr))
      ]))

  let add_block route newdest =
    MATStmt(MATFxn("add_block",[
        MATLit(MATStr(route));
        MATLit(MATStr(newdest))
      ]))

  let add_route_block route newdest =
    MATStmt(MATFxn("add_block",[
        MATLit(MATStr(route));
        MATLit(MATStr(loc2path newdest))
      ]))

  let copy_route_block route newdest =
    MATStmt(MATFxn("add_block",[
        MATLit(MATStr(loc2path route));
        MATLit(MATStr(loc2path newdest))
      ]))

  let decl_copy refr newinst : unit =
    let data = get_block refr in
    MAP.put symtbl.blocks (loc2path newinst) data;
    ()

  let set_param mvar param vl =
     MATStmt(MATFxn("set_param",[
        mvar;
        MATLit(MATStr(param));
        vl
      ]))

  let set_route_param mvar param vl =
     MATStmt(MATFxn("set_param",[
        MATLit(MATStr(loc2path mvar));
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

  let add_route_line src snk = match src, snk with
    | SIMBlockIn(ns1,cmp1,inp),SIMBlockOut(ns2,cmp2,out) ->
      if ns1 = ns2 then
        add_line (STRING.remove_last_char (ns_to_str ns1)) (loc2path snk) (loc2path src)
      else
        error "add_route_line" ("namespaces don't match:"^(ns_to_str ns1)^" != "^(ns_to_str ns2))

    | SIMBlockOut(ns1,cmp1,out),SIMBlockIn(ns2,cmp2,inp) ->
      if ns1 = ns2 then
        add_line (STRING.remove_last_char (ns_to_str ns1)) (loc2path src) (loc2path snk)
      else
        error "add_route_line" ("namespaces don't match:"^(ns_to_str ns1)^" != "^(ns_to_str ns2))


    | SIMBlockIn(_),SIMBlockIn(_) ->
      error "add_route_line"
        ("cannot connect input to input: "^(loc2path src)^"->"^(loc2path snk))

    | SIMBlockOut(_),SIMBlockOut(_) ->
      error "add_route_line"
        ("cannot connect output to output: "^(loc2path src)^"->"^(loc2path snk))

    | _ ->
      error "add_route_line"
        ("cannot connect comps: "^(loc2path src)^"->"^(loc2path snk))
        


  let remove_line ns (gsrc:string)  (gsnk:string) =
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

  let create_in q (ns:string list) (vr:string)=
    (*comp*)
    let loc = SIMBlock(ns,vr) in
    let internal_loc = SIMBlock(ns,"_"^vr) in
    (*output port from external*)
    let loc_out_port = mk_sim_out loc "O" in
    (*output port for internal*)
    let int_loc_out_port = mk_sim_out internal_loc "O" in
    let int_loc_in_port = mk_sim_in internal_loc "I" in
    let external_loc = mk_sim_ext_in ns vr in
    if defined loc = false then      
      begin
        declare_vars [loc;internal_loc];
        declare_vars [loc_out_port;
                      int_loc_in_port;int_loc_out_port];
        declare_vars [external_loc];
        q (add_route_block (get_basic_fxn "in")  loc);
        q (add_route_block (get_basic_fxn "gain") internal_loc)
      end;
    loc_out_port,int_loc_in_port,int_loc_out_port

  let create_out q ns (vr:string) =
    let loc = SIMBlock(ns,vr) in
    let external_loc = mk_sim_ext_out ns vr in
    let internal_loc = SIMBlock(ns,"_"^vr) in
    let loc_in_port = mk_sim_in loc "I" in
    let int_loc_out_port = mk_sim_out internal_loc "O" in
    let int_loc_in_port = mk_sim_in internal_loc "I" in
    (*the iytoyt has an internal and external lock*)
    if defined loc = false then      
      begin
        declare_vars [loc;external_loc;internal_loc];
        declare_vars [loc_in_port;
                      int_loc_in_port;int_loc_out_port];
        q (add_route_block (get_basic_fxn "out") loc);
        q (add_route_block (get_basic_fxn "gain") internal_loc);
        q (add_route_line int_loc_out_port loc_in_port)
      end;
    int_loc_in_port,int_loc_out_port,loc_in_port

  let create_const (q:matst->unit) (namespace:simns) (value:float) =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"const_"^(string_of_int id)) in
    let loc_out = mk_sim_out loc "O" in
    if defined loc = false then
      begin
        declare_var (loc);
        declare_var (loc_out);
        q (add_route_block (get_basic_fxn "const") (loc));
        q (set_route_param
             loc "Value"
             (MATLit(MATStr(string_of_float value)))
          )
      end;
    loc_out

  let create_sub q namespace n_inps =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"sum_"^(string_of_int id)) in
    let inpstr=  "+"^(STRING.repeat "-" (n_inps-1)) in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "+") loc);
    q (set_route_param
         loc "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> mk_sim_in loc ("I"^(string_of_int x)))
        (LIST.mkrange 1 n_inps)
    in
    declare_vars inp_locs;
    let out_loc = mk_sim_out loc "O" in
    declare_var out_loc;
    loc,inp_locs,out_loc


  let create_neg q namespace =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"neg_"^(string_of_int id)) in
    let inpstr=  "-" in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "+") loc);
    q (set_route_param
         loc "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_loc = mk_sim_in loc "I" in
    let out_loc = mk_sim_out loc "O" in
    declare_vars [inp_loc;out_loc];
    loc,inp_loc,out_loc


  let create_add q namespace n_inps =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"sub_"^(string_of_int id)) in
    let inpstr=  STRING.repeat "+" n_inps in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "+") loc);
    q (set_route_param
         loc "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> mk_sim_in loc ("I"^(string_of_int x)))
        (LIST.mkrange 1 n_inps)
    in
    declare_vars inp_locs;
    let out_loc = mk_sim_out loc "O" in
    declare_var out_loc;
    loc,inp_locs,out_loc


  let create_mult q namespace n_inps =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"mul_"^(string_of_int id)) in
    let inpstr=  STRING.repeat "*" n_inps in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "*") loc);
    q (set_route_param
         loc "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> mk_sim_in loc ("I"^(string_of_int x)))
        (LIST.mkrange 1 n_inps)
    in
    declare_vars inp_locs;
    let out_loc = mk_sim_out loc "O" in
    declare_var out_loc;
    loc,inp_locs,out_loc

  let create_div q namespace  =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"div_"^(string_of_int id)) in
    let inpstr=  "*/" in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "*") loc);
    q (set_route_param
         loc "Inputs"
         (MATLit(MATStr(inpstr))));
    let numer_loc = mk_sim_in loc "N" in
    let denom_loc = mk_sim_in loc "D" in
    let out_loc = mk_sim_out loc "O" in
    declare_vars [numer_loc;denom_loc;out_loc];
    loc,numer_loc,denom_loc,out_loc


  let create_power q namespace  =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"pow_"^(string_of_int id)) in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "mfxn") loc);
    q (set_route_param
         loc "Function"
         (MATLit(MATStr("pow"))));
    let base_loc = mk_sim_in loc "B" in
    let exp_loc = mk_sim_in loc "E" in
    let out_loc = mk_sim_out loc "O" in
    declare_vars [base_loc;exp_loc;out_loc];
    loc,base_loc,exp_loc,out_loc

    
  let create_clamp q namespace min max =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"sat_"^(string_of_int id)) in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "sat") loc);
    q (set_route_param
         (loc) "UpperLimit"         
         (MATLit(MATStr(string_of_float max))));
    q (set_route_param
         (loc) "LowerLimit"         
         (MATLit(MATStr(string_of_float min))));
    let inp_loc = mk_sim_in loc "I" in
    let out_loc = mk_sim_out loc "O" in
    declare_vars [inp_loc;out_loc];
    loc,inp_loc,out_loc

  let create_sample q namespace sample =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"smp_"^(string_of_int id)) in
    declare_vars [loc];
    q (add_route_block (get_basic_fxn "disc") loc);
    q (set_route_param
         (loc) "Interval"         
         (MATLit(MATStr(string_of_float sample))));
    let sample_out = mk_sim_out loc "O" in
    let sample_in = mk_sim_in loc "I" in
    declare_vars [sample_out;sample_in];
    loc,sample_in,sample_out

  let create_noise q namespace =
   let id = symtbl_size () in
   let loc = SIMBlock(namespace,"unz_"^(string_of_int id)) in
   let aloc = SIMBlock(namespace,"unza_"^(string_of_int id)) in
   let vloc = SIMBlock(namespace,"unzv_"^(string_of_int id)) in
   declare_vars [loc;aloc;vloc];
   q (add_route_block (get_basic_fxn "noise") loc);
   q (add_route_block (get_basic_fxn "*") vloc);
   q (add_route_block (get_basic_fxn "+") aloc);
   q (set_route_param
         (aloc) "Inputs"
         (MATLit(MATStr("++"))));
   q (set_route_param
         (vloc) "Inputs"
         (MATLit(MATStr("**"))));

   let noise_out = mk_sim_out loc "O" in
   let mul_in1 = mk_sim_in vloc "I1" in
   let mul_in2 = mk_sim_in vloc "I2" in
   let mul_out = mk_sim_out vloc "O" in
   let add_in1 = mk_sim_in aloc "I1" in
   let add_in2 = mk_sim_in aloc "I2" in
   let add_out = mk_sim_out aloc "O" in
   declare_vars [noise_out;mul_in1;mul_in2;mul_out;
             add_in1;add_in2;add_out];
   q (add_route_line noise_out mul_in2);
   q (add_route_line mul_out add_in2);
   vloc,mul_in1,add_in1,add_out

  let create_integrator q namespace =
    let id = symtbl_size () in
    let loc = SIMBlock(namespace,"int_"^(string_of_int id)) in
    declare_var (loc);
    q (add_route_block (get_basic_fxn "int") loc);
    let integ_in = mk_sim_in loc "I" in
    let integ_out = mk_sim_out loc "O" in
    declare_vars [integ_in;integ_out];
    loc,integ_in,integ_out


  let create_linmap q namespace (mp:hw_mapping) (inverse:bool) =
    let id = symtbl_size () in
    let offloc = SIMBlock(namespace,"lmap_ofs_"^(string_of_int id)) in
    let scloc = SIMBlock(namespace,"lmap_sc_"^(string_of_int id)) in
    let scaling_fact = if inverse then 1.0 /. mp.scale else mp.scale in
    let offset_fact =
      if inverse then 0. -. mp.offset /. mp.scale else mp.offset
    in
    declare_vars [offloc;scloc];
    let scfact_out = create_const q namespace scaling_fact in
    let offfact_out = create_const q namespace offset_fact in 
    q (add_route_block (get_basic_fxn "*") scloc);
    q (add_route_block (get_basic_fxn "+") offloc);
    let mul_in1 = mk_sim_in scloc "I1" in
    let mul_in2 = mk_sim_in scloc "I2" in
    let mul_out = mk_sim_out scloc "O" in
    let add_in1 = mk_sim_in offloc "I1" in
    let add_in2 = mk_sim_in offloc "I2" in
    let add_out = mk_sim_out offloc "O" in
    declare_vars [mul_in1;mul_in2;mul_out;add_in1;add_in2;add_out];
    q (add_route_line scfact_out mul_in2);
    q (add_route_line offfact_out add_in2);
    q (add_route_line mul_out add_in1);
    mul_in1,add_out

  let expr2blockdiag (q:matst->unit) (namespace:simns)  (expr:hwvid ast)  =
    let cmp = LIST.last namespace in
    (*let ns = LIST.except_last namespace in*)
    let rec _expr2blockdiag el =
      match el with
      | Term(HNPort(HWKInput,_,port,_)) ->
        SIMBlockOut(namespace,"_"^port,"O")
      | Term(HNPort(HWKOutput,_,port,_)) ->
        SIMBlockOut(namespace,"_"^port,"O")
      | Term(HNParam(_,name)) ->
        SIMBlockOut(namespace,"_"^name,"O")
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
            q (add_route_line h_out add_in)
          ) (LIST.zip ins handles);
        out
      | OpN(Sub,args) ->
        let handles = List.map (fun arg -> _expr2blockdiag arg) args in
        let adder,ins,out = create_sub q namespace (List.length handles) in
        List.iter (fun (add_in,h_out) ->
            q (add_route_line h_out add_in)
          ) (LIST.zip ins handles);
        out
      | OpN(Mult,args) ->
        let handles = List.map (fun arg -> _expr2blockdiag arg) args in
        let mult,ins,out = create_mult q namespace (List.length handles) in
        List.iter (fun (add_in,h_out) ->
            q (add_route_line h_out add_in)
          ) (LIST.zip ins handles);
        out
      | Op2(Power,base,exp) ->
        let base = _expr2blockdiag base in
        let exp = _expr2blockdiag exp in
        let power,pow_base,pow_exp,pow_out = create_power q namespace in
        q (add_route_line exp pow_exp);
        q (add_route_line base pow_base);
        pow_out

      | Op2(Div,numer,denom) ->
        let numer = _expr2blockdiag numer in
        let denom = _expr2blockdiag denom in
        let mult,mult_numer,mult_denom,mult_out = create_div q namespace  in
        q (add_route_line numer mult_numer);
        q (add_route_line denom mult_denom);
        mult_out
      | Op1(Neg,expr) ->
        let expr_loc = _expr2blockdiag expr in
        let adder,inp,out = create_neg q namespace in
        q (add_route_line expr_loc inp);
        out
      | Op1(Exp,expr) ->
        error "conv" "unhandled exp"
      | _ ->
        error "conv" "unhandled"
    in
  _expr2blockdiag expr

  let create_subsystem q namespace name =
    let loc = SIMBlock(namespace,name) in
    declare_var loc;
    q (add_route_block (get_basic_fxn "comp") loc);
    q (remove_line (loc2path loc) "In1/1" "Out1/1");
    q (remove_block (loc2path loc) "In1");
    q (remove_block (loc2path loc) "Out1");
    loc

  let create_block namespace (comp:hwvid hwcomp) : matst list =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let cmploc,cmpns =
      match create_subsystem q namespace (HwLib.hwcompname2str comp.name) with
      | SIMBlock(ns,str) -> SIMBlock(ns,str),ns @ [str]
      | _ -> error "create_block" "subsystem must be a block"
    in
    declare_var cmploc;
    HwLib.comp_iter_ins comp (fun vr ->
        let ext_out,int_in,int_out = create_in q cmpns vr.port in
        match vr.defs with
        | HWDAnalog(defs) ->
          let min,max = IntervalLib.interval2numbounds defs.ival in
          let clamp,clamp_in,clamp_out= create_clamp q cmpns min max in
          q (add_route_line ext_out clamp_in);
          q (add_route_line clamp_out int_in);
        | HWDDigital(defs) ->
          let sample,_ = defs.freq in
          let sample_cmp,sample_in,sample_out =
            create_sample q cmpns (float_of_number sample)
          in
          q (add_route_line ext_out sample_in);
          q (add_route_line sample_out int_in);
          ()
        | _ -> error "comp_iter_ins" "unexpected"
      );
    HwLib.comp_iter_outs comp (fun vr ->
        create_out q cmpns vr.port;
        ()
    );
    HwLib.comp_iter_params comp (fun (par:hwparam) ->
        let ext_in,int_in,int_out = create_in q cmpns par.name in
        q (add_route_line ext_in int_in);
        ()
    );
    HwLib.comp_iter_outs comp (fun vr ->
        let int_out = SIMBlockIn(cmpns,"_"^vr.port,"I") in
        match vr.bhvr,vr.defs with
        | HWBAnalog(bhvr),HWDAnalog(defs) ->
          (*let min,max = IntervalLib.interval2numbounds defs.ival in*)
          (*compute handles*)
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          let min,max = IntervalLib.interval2numbounds defs.ival in
          begin
            match model_noise(), model_ideal() with
            | true,true ->
              let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
              let _,variance,noise_in,noise_out = create_noise q cmpns in 
              q (add_route_line handle noise_in);
              q (add_route_line var_handle variance);
              q (add_route_line noise_out int_out);
              ()
            | true,false ->
              let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
              let _,variance,noise_in,noise_out = create_noise q cmpns in 
              let _,clamp_in,clamp_out= create_clamp q cmpns min max in
              q (add_route_line handle clamp_in);
              q (add_route_line clamp_out noise_in);
              q (add_route_line var_handle variance);
              q (add_route_line noise_out int_out);
              ()
            | false,true ->
              ()
            | false,false ->
              let _,clamp_in,clamp_out= create_clamp q cmpns min max in
              q (add_route_line handle clamp_in);
              q (add_route_line clamp_out int_out);
              ()
              (*this is where you'd pipe the output through a few things*)
          (*then you connect*)
          end
        | HWBAnalogState(bhvr),HWDAnalogState(defs) ->
          (*let min,max = IntervalLib.interval2numbounds defs.deriv.ival in*)
          let smin,smax = IntervalLib.interval2numbounds defs.stvar.ival in
          let dmin,dmax = IntervalLib.interval2numbounds defs.deriv.ival in
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          let _,integ_in,integ_out = create_integrator q cmpns in
          begin
            match model_noise(),model_ideal() with
              | true,true ->
                (*this is where you'd pipe the output through a few things*)
                let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
                let _,variance,noise_in,noise_out = create_noise q cmpns in 
                q (add_route_line handle noise_in);
                q (add_route_line var_handle variance);
                q (add_route_line noise_out integ_in);
                q (add_route_line integ_out int_out);
              | true,false ->
                let var_handle = expr2blockdiag q cmpns bhvr.stoch.std in
                let _,variance,noise_in,noise_out = create_noise q cmpns in 
                let _,dclamp_in,dclamp_out= create_clamp q cmpns dmin dmax in
                let _,sclamp_in,sclamp_out= create_clamp q cmpns smin smax in
                q (add_route_line handle dclamp_in);
                q (add_route_line dclamp_out noise_in);
                q (add_route_line var_handle variance);
                q (add_route_line noise_out integ_in);
                q (add_route_line integ_out sclamp_in);
                q (add_route_line sclamp_out int_out);
                ()
              | false,true ->
                q (add_route_line handle integ_in);
                q (add_route_line integ_out int_out);
                () 
              | false,false ->
                let _,dclamp_in,dclamp_out= create_clamp q cmpns dmin dmax in
                let _,sclamp_in,sclamp_out= create_clamp q cmpns smin smax in
                q (add_route_line handle dclamp_in);
                q (add_route_line dclamp_out integ_out);
                q (add_route_line integ_out sclamp_in);
                q (add_route_line sclamp_out int_out);
                ()
          end
          | HWBAnalog(bhvr),HWDDigital(defs) ->
          let handle = expr2blockdiag q cmpns bhvr.rhs in
          let sample,_ = defs.freq in
          begin
            match model_ideal() with
            | true ->
              q (add_route_line handle int_out)
            | false -> 
              let _,sample_in,sample_out =
                create_sample q cmpns (float_of_number sample)
              in
              q (add_route_line handle sample_in);
              q (add_route_line sample_out int_out);
              ()
          end
        | _ -> error "iter outs" "unexpected"
    );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let create_library (namespace:simns) (g:hwvid hwenv) : matst list=
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let lib_ns :string  list =
      match create_subsystem q namespace ("library") with
      | SIMBlock(ns,cmp) -> ns@[cmp]
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

  let create_circuit (tbl) namespace (mappings:(wireid,hw_mapping) map) =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in

    let sln : usln = tbl.sln_ctx in
    let circ_ns :simns = match create_subsystem q namespace "circuit" with
      | SIMBlock(ns,cmp) -> ns@[cmp]
    in
    let lib_ns = namespace @ ["library"] in
    SolverCompLib.iter_used_comps tbl (fun (inst:hwcompinst) ccomp ->
        let loc = SIMBlock(circ_ns,HwLib.hwcompinst2str inst) in
        let refr = SIMBlock(lib_ns,HwLib.hwcompname2str inst.name) in
        decl_copy refr loc;
        q (copy_route_block refr loc)
      );
    SlnLib.iter_conns sln (fun (src:wireid) (dst:wireid) ->
        let src_loc = SIMBlockOut(circ_ns,(HwLib.hwcompinst2str src.comp),src.port) in
        let dst_loc = SIMBlockIn(circ_ns,(HwLib.hwcompinst2str dst.comp),dst.port) in
        q (add_route_line src_loc dst_loc)
      );
    SlnLib.iter_routes sln (fun (l:ulabel) generates -> match l with
        | MOutLabel(_) ->
          error "create_circuit" "there should not be any out-> in routes"
        | MLocalLabel(_) ->
          error "create_circuit" "there should not be any local-> in routes"
        | MInLabel(lbl) ->
          let dst_loc :simel = SIMBlockIn(circ_ns,(HwLib.hwcompinst2str lbl.wire.comp),lbl.wire.port) in
          let src_out_ext,src_in_int,src_out_int =
            create_in q circ_ns ((HwLib.hwcompinst2str lbl.wire.comp)^"_in")
          in
          begin
            match model_mapper () with
            | true ->
              let mapping = MAP.get mappings lbl.wire in
              let linmap_in,linmap_out= create_linmap q circ_ns mapping false in
              q (add_route_line src_out_ext linmap_in);
              q (add_route_line linmap_out src_in_int);
              q (add_route_line src_out_int dst_loc)
            | false ->
              q (add_route_line src_out_ext src_in_int);
              q (add_route_line src_out_int dst_loc)
          end

        | MExprLabel(_) ->
          error "create_circuit" "there should not be any expr -> routes"
        | ValueLabel(lbl) ->
          let dst_loc : simel= SIMBlockIn(circ_ns,(HwLib.hwcompinst2str lbl.wire.comp),lbl.wire.port) in
          let src_loc_out : simel = create_const q circ_ns (float_of_number lbl.value) in
          begin
            match model_mapper () with
            | true ->
              let mapping = MAP.get mappings lbl.wire in
              let linmap_in,linmap_out= create_linmap q circ_ns mapping false in
              q (add_route_line src_loc_out linmap_in);
              q (add_route_line linmap_out dst_loc)
            | false ->
              q (add_route_line src_loc_out dst_loc)
          end


      );
      SlnLib.iter_generates sln (fun (l:ulabel) routes -> match l with
          | MOutLabel(lbl) ->
            begin
              match lbl.wire.comp.name with
              | HWCmOutput(_) ->
                let src_loc : simel = SIMBlockOut(circ_ns,HwLib.hwcompinst2str lbl.wire.comp,lbl.wire.port) in
                let dst_in_int,dst_out_int,dst_out_ext =
                  create_out q circ_ns ((HwLib.hwcompinst2str lbl.wire.comp)^"_out")
                in
                let mapping = MAP.get mappings lbl.wire in
                let linmap_in,linmap_out= create_linmap q circ_ns mapping true in
                q (add_route_line src_loc linmap_in);
                q (add_route_line linmap_out dst_in_int);
                ()
              | _ -> ()
            end
          | _ -> ()
        );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

 let to_simulink (tbl:gltbl) (mappings:(wireid,hw_mapping) map) (name:string) (form:simulink_format) =
    clear_tbl();
    let hw = tbl.env.hw in
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let model_name = name in
    _model_preamble stmtq model_name;
    debug ("=== Emitting Library ===");
    let libstmts = (create_library [model_name] hw) in
    let circ_stmts = create_circuit tbl [model_name] mappings in
    let preamble_stmts = QUEUE.to_list stmtq in
    let main_stmts = [
      MATStmt(MATFxn("preamble",[]));
      MATStmt(MATFxn("build_comp_library",[]));
      MATStmt(MATFxn("build_circuit",[]));
    ] in
    [
      MATComment("toplevel script");
      MATFxnDecl("main",[],main_stmts);
      MATComment("");MATComment("");
      MATComment("circuit build script");
      MATFxnDecl("build_circuit",[],circ_stmts);
      MATComment("");MATComment("");
      MATComment("preamble function");
      MATFxnDecl("preamble",[],preamble_stmts);
      MATComment("");MATComment("");
      MATComment("library assembly function");
      MATFxnDecl("build_comp_library",[],libstmts);
      MATComment("");MATComment("");
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
          List.iter (fun x -> _matst2buf (ident+1) x) stmts;
          os "end\n"
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
          os (sp^"end\n")
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
