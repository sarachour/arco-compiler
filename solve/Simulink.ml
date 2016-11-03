open AST
open SolverData
open Util

open HWLib
open HWData

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
  noop (MAP.put basic_fxns "\int" "simulink/Continuous/Integrator");;
  noop (MAP.put basic_fxns "in" "simulink/Ports & Subsystems/In1");;
  noop (MAP.put basic_fxns "out" "simulink/Ports & Subsystems/Out1");;
  noop (MAP.put basic_fxns "const" "simulink/Math Operatio(ns/Const");;
  noop (MAP.put basic_fxns "*v" "simulink/Math Operations/Gain");;
  noop (MAP.put basic_fxns "-" "simulink/Math Operations/Subtract");;
  noop (MAP.put basic_fxns "mfxn" "simulink/Math Operations/Math Function");;
  noop (MAP.put basic_fxns "minmax" "simulink/Math Operations/MinMax");;
  noop (MAP.put basic_fxns "comp" "simulink/Ports & Subsystems/Subsystem");;

  let symtbl = MAP.make ()

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

  let create_in q namespace (vr:string)=
    let loc = namespace^"/"^vr in
    if defined loc = false then      
      begin
        declare_var loc;
        q (add_block (get_basic_fxn "in") loc)
      end;
    loc

  let create_out q namespace (vr:string) =
    let loc = namespace^"/"^vr in
    if defined loc = false then      
      begin
        declare_var loc;
        q (add_block (get_basic_fxn "out") loc)
      end;
    loc

  let create_const (q:matst->unit) (namespace:string) (value:float) =
    let loc = namespace^"/const_"^(string_of_float value) in
    if defined loc = false then      
      begin
        declare_var (loc);
        q (add_block (get_basic_fxn "const") (loc));
        q (set_param
             (MATLit(MATStr(loc))) "Constant value"
             (MATLit(MATFloat(value)))
          )
      end;
    loc

  let create_sub q namespace n_inps =
    let id = symtbl_size () in
    let loc = namespace^"/add_#"^(string_of_int id) in
    let inpstr=  "+"^(STRING.repeat "-" n_inps) in
    declare_var (loc);
    q (add_block (get_basic_fxn "+") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> loc^"/"^(string_of_int x))
        (LIST.mkrange 0 n_inps)
    in
    let out_loc = loc^"/"^(string_of_int (n_inps + 1)) in
    loc,inp_locs,out_loc


  let create_add q namespace n_inps =
    let id = symtbl_size () in
    let loc = namespace^"/add_#"^(string_of_int id) in
    let inpstr=  STRING.repeat "+" n_inps in
    declare_var (loc);
    q (add_block (get_basic_fxn "+") loc);
    q (set_param
         (MATLit(MATStr(loc))) "Inputs"
         (MATLit(MATStr(inpstr))));
    let inp_locs = List.map
        (fun (x:int) -> loc^"/"^(string_of_int x))
        (LIST.mkrange 0 n_inps)
    in
    let out_loc = loc^"/"^(string_of_int (n_inps + 1)) in
    loc,inp_locs,out_loc

  let relative ns loc =
    STRING.removeprefix loc (ns^"/") 

  let connect_src_to_snk q namespace src snk =
    let rel_src = relative namespace src in
    let rel_snk = relative namespace snk in
    q (MATStmt(MATFxn("add_line",[
        MATLit(MATStr(namespace));
        MATLit(MATStr(rel_src));
        MATLit(MATStr(rel_snk));
      ])));
    ()

    let expr2blockdiag (q:matst->unit) (namespace:string) (comp:hwvid hwcomp) (expr:hwvid ast) =
      let comp_namespace = comp_addr namespace comp.name in
      let rec _expr2blockdiag el =
        match el with
        | Term(HNPort(HWKInput,_,port,_)) ->
          let port = port_addr namespace comp.name port in
          port^"/1"
        | Term(HNPort(HWKOutput,_,port,_)) ->
          let port = port_addr namespace comp.name port in
          port^"/0"
        | Decimal(d) ->
          create_const q comp_namespace (d) 
        | Integer(i) ->
          create_const q comp_namespace (float_of_int i)
        | OpN(Add,args) ->
          let handles = List.map (fun arg -> _expr2blockdiag arg) args in
          let adder,ins,out = create_add q comp_namespace (List.length handles) in
          List.iter (fun (add_in,h_out) ->
              connect_src_to_snk q comp_namespace h_out add_in
            ) (LIST.zip ins handles);
          out
        | OpN(Sub,args) ->
          let handles = List.map (fun arg -> _expr2blockdiag arg) args in
          let adder,ins,out = create_sub q comp_namespace (List.length handles) in
          List.iter (fun (add_in,h_out) ->
              connect_src_to_snk q comp_namespace h_out add_in
            ) (LIST.zip ins handles);
          out
        | _ ->
          "???"
      in
    _expr2blockdiag expr

  let create_block circuit (comp:hwvid hwcomp) : matst list =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let cmp = get_basic_fxn "comp" in
    let fxn = get_basic_fxn "+" in
    q (add_block cmp (comp_addr circuit comp.name));
    HwLib.comp_iter_ins comp (fun vr ->
        let loc = comp_addr circuit comp.name in
        create_in q loc vr.port ;
        ()
      );
    HwLib.comp_iter_outs comp (fun vr ->
        let loc = comp_addr circuit comp.name in
        create_out q loc vr.port;
        ()
    );
    HwLib.comp_iter_outs comp (fun vr ->
        match vr.bhvr with
        | HWBAnalog(bhvr) ->
          let handle = expr2blockdiag q circuit comp bhvr.rhs in
          ()
        | HWBAnalogState(bhvr) ->
          let handle = expr2blockdiag q circuit comp bhvr.rhs in
          ()
    );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let create_library circuit (g:hwvid hwenv) : matst list=
    let library = circuit^"/"^"library" in
    let stmtq = QUEUE.make () in
    QUEUE.enqueue stmtq (add_block
                     (get_basic_fxn "comp")
                     library
                  );
    QUEUE.enqueue_all stmtq [MATComment("");MATComment("")];
    HwLib.iter_comps g (fun cmp ->
        let stmts = create_block library cmp in
        QUEUE.enqueue stmtq (MATComment(""));
        QUEUE.enqueue_all stmtq stmts;
        ()
      );
    let stmts = QUEUE.to_list stmtq in
    QUEUE.destroy stmtq;
    stmts

  let to_simulink (hw:hwvid hwenv)  =
    let stmtq = QUEUE.make () in
    let q x = noop (QUEUE.enqueue stmtq x) in
    let qs x = noop (QUEUE.enqueue_all stmtq x) in
    let model_name = "circuit" in
    _model_preamble stmtq model_name;
    qs (create_library model_name hw);
    let stmts = QUEUE.to_list stmtq in
    [
      MATComment("circuit build script");
      MATFxnDecl("build_circuit",[],stmts);
      MATComment("");
      MATStmt(MATFxn("build_circuit",[]));
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
