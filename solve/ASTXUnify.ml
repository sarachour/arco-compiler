open SymCamlData
open SymCaml
open PyCamlWrapper

open Util
open Globals
open Interactive

open SearchData
open Search

open AlgebraicLib

open AST
open ASTUnifyData

open SolverData
open SlnLib
open SolverUtil

open SolverCompLib

open StochLib

open HWData
open MathData

open HWLib
open MathLib

exception ASTUnifier_error of (string)

let spy_print_debug = print_debug 4 "sympy"
let _print_debug = print_debug 4 "uni"
let debug : string -> unit =_print_debug  
let spydebug: string -> unit =spy_print_debug  
let auni_menu = menu 3

type  rnode = (rstep) snode




module ASTUnifier =
struct

  let tempmid : unit -> mid =
    fun () ->
      raise (ASTUnifier_error "temp_mid: unimpl")


   let construct_hw_comp : unid AlgebraicLib.UnifyEnv.t ->
    hwvid hwcomp -> hwcompcfg -> int option -> string -> unit =
    fun env comp cfg inst_maybe hwvar ->
    (*==== HARDWARE ====*)
      let proc_expr (e:hwvid ast) : unid ast =
        hwast2uast (ASTLib.map e (HwLib.try_toglbl inst_maybe))
      in
      let proc_var (e:hwvid) =
        HwId (HwLib.try_toglbl inst_maybe e)
      in
      let cmpid = HwLib.mkcompid comp.name inst_maybe in 
      (*inputs are wildcards*)
      MAP.iter comp.ins (fun portname portd ->
        let portid : unid =
            proc_var (HwLib.port2hwid
               portd.knd portd.comp portd.port portd.prop portd.typ)
        in

        match ConcCompLib.get_var_config cfg portname with
        | None -> 
          begin
            AlgebraicLib.UnifyEnv.define_pat env portid 
          end
        | Some(expr) ->
            begin
              AlgebraicLib.UnifyEnv.define_pat env portid;
              AlgebraicLib.UnifyEnv.init_pat env portid 
                (expr);
            ()
          end
      );
      (* parameters are lists of possible values *)
      MAP.iter comp.params (fun paramn paramd ->
        AlgebraicLib.UnifyEnv.define_pat_param env
          (HwId(HNParam(cmpid,paramn))) paramd.value 
        );

      (*outputs are wildcards*)
      MAP.iter comp.outs (fun (portname:string) (portd :hwvid hwportvar)->
        let portid : unid =
            proc_var (HwLib.port2hwid
               portd.knd portd.comp portd.port portd.prop portd.typ)
        in

        match ConcCompLib.get_var_config cfg portname with 
        | None ->
          begin
            AlgebraicLib.UnifyEnv.define_pat env portid;
            match portd.bhvr with
            | HWBAnalog(expr) ->
              AlgebraicLib.UnifyEnv.define_pat_expr env portid
                (proc_expr expr.rhs)
            | HWBDigital(expr) ->
              AlgebraicLib.UnifyEnv.define_pat_expr env portid
                (proc_expr expr.rhs)
            | HWBAnalogState(expr) ->
              let ic_port,ic_prop = expr.ic in 
              let ic_id =
                proc_var (HwLib.port2hwid portd.knd
                            portd.comp ic_port ic_prop portd.typ)
              in
              AlgebraicLib.UnifyEnv.define_pat env ic_id;
              AlgebraicLib.UnifyEnv.define_pat_deriv_expr env portid
                (proc_expr expr.rhs) (Term(ic_id)) 
            | _ -> ()
          end
        | Some(expr) ->
            begin
            AlgebraicLib.UnifyEnv.define_pat env portid;
            AlgebraicLib.UnifyEnv.init_pat env portid expr;
            ()
          end
      );
    let hwvarport = HwLib.comp_getvar comp hwvar in
    let hwvarid = HwLib.port2hwid
        hwvarport.knd hwvarport.comp hwvarport.port hwvarport.prop
        hwvarport.typ
    in
    AlgebraicLib.UnifyEnv.pat_prioritize env (proc_var hwvarid);
   () 

  (*construct the hardware expression you wish to unify.
    This is always an input, so it does not have any dependencies
  *)
  let construct_hw_expr : unid AlgebraicLib.UnifyEnv.t -> hwvid hwenv -> mid menv ->
    hwvid -> unid ast -> unit =
    fun env hwenv menv hwtargvar hexpr ->
      (*define the symbols*)
      let vars : unid list = ASTLib.get_vars hexpr in
      (*variables unification depends on*)
      (*
      List.iter (fun (uvar:unid) -> match uvar with
          | MathId(MNVar(_,name)) ->
            begin
              AlgebraicLib.UnifyEnv.define_sym env (uvar);
              let mvar = MathLib.getvar menv name in
              match mvar.bhvr with
              | MBhvVar(bhv) ->
                begin
                  AlgebraicLib.UnifyEnv.define_sym_expr env (uvar) (mast2uast bhv.rhs)
                end
              | MBhvInput ->
                begin
                  AlgebraicLib.UnifyEnv.define_sym_expr env (uvar) (Term (uvar))
                end
              | MBhvStateVar(bhv) ->
                begin
                  (*TODO: add derivative if unmodelled *)
                end
                
            end
          | MathId(MNParam(name,v)) ->
            begin
              AlgebraicLib.UnifyEnv.define_sym_param env (uvar) ([v])
            end
          | MathId(_) ->
            raise (ASTUnifier_error "unhandled mathid variable")
          | HwId(hid) ->
            raise (ASTUnifier_error "hwid not expected in assignment goal.")
          
        ) vars;
      *)
      (*actual unification*)
      AlgebraicLib.UnifyEnv.define_sym env (HwId hwtargvar);
      AlgebraicLib.UnifyEnv.define_sym_expr env (HwId hwtargvar) hexpr;
      AlgebraicLib.UnifyEnv.sym_prioritize env (HwId hwtargvar);
      ()

  let force_assign : unid AlgebraicLib.UnifyEnv.t -> hwvid hwcomp -> hwcompcfg -> int option ->
    string -> unid ast -> unit =
    fun uenv comp cfg inst inport expr ->
      MAP.iter comp.ins (fun (port:string) (hvar:hwvid hwportvar) ->
          let hwid : hwvid =
            HwLib.port2hwid hvar.knd hvar.comp hvar.port hvar.prop hvar.typ
          in
          if inport = port then
            AlgebraicLib.UnifyEnv.init_pat uenv (HwId hwid) expr
          else
            AlgebraicLib.UnifyEnv.restrict_pat uenv (HwId hwid) expr
        );
      ()

  
  (*
     this is the math expression.
  *)
  let construct_math : unid AlgebraicLib.UnifyEnv.t -> mid menv ->  bool -> unit
    =
      fun (env) (menv) model_derivs ->
        MathLib.iter_vars menv (fun mvar ->
            let mid : mid = MathLib.var2mid mvar in
            AlgebraicLib.UnifyEnv.define_sym env (MathId mid); 
            match mvar.bhvr with
            | MBhvStateVar(bhv) ->
              begin
                if model_derivs  then
                  AlgebraicLib.UnifyEnv.define_sym_deriv_expr env
                    (MathId mid) (mast2uast bhv.rhs)
                    (ASTLib.number2ast bhv.ic)
                else
                  AlgebraicLib.UnifyEnv.define_sym_expr env
                    (MathId mid) (Term (MathId mid))
              end
            | MBhvVar(bhv) ->
              begin
                AlgebraicLib.UnifyEnv.define_sym_expr env
                  (MathId mid) (mast2uast bhv.rhs);
                ()
              end
            | MBhvInput ->
              begin
                AlgebraicLib.UnifyEnv.define_sym_expr env
                  (MathId mid) (Term (MathId mid))
              end
            | _ ->
              error "construct_math" "unexpected"
          );
        MAP.iter menv.params (fun _ mparam ->
            let paramid = MathLib.str2mid menv mparam.name in
            AlgebraicLib.UnifyEnv.define_sym_param env
              (MathId paramid) [mparam.value]
          );
        ()


  let prioritize_math : unid AlgebraicLib.UnifyEnv.t -> mid menv -> string -> unit
    =
    fun env menv mname ->
      let mid = MathLib.str2mid menv mname in
      AlgebraicLib.UnifyEnv.sym_prioritize env (MathId mid);
      ()

  (*given an assignment*)
  let to_rsteps : string -> unid ast option -> (unid*unid ast) list -> rstep list
    -> rstep list =
    fun patport targexpr asgns init_steps ->
      (*convert an assignment to variable*)
      let to_assign_rstep : unid -> unid ast -> rstep =
        fun vrb expr ->
          let cfg = {expr=expr} in
          print_string ((unid2str vrb)^"="^(uast2str expr)^"\n");
          match vrb with
          | HwId(HNPort(HWKInput,cmp,port,prop)) ->
            RAddInAssign(port,cfg)
          | HwId(HNPort(HWKOutput,cmp,port,prop)) ->
            RAddOutAssign(port,cfg)
          | HwId(HNParam(cmp,param)) ->
            begin
              match expr with
              | Integer(i) ->
                RAddParAssign(param,Integer i)
              | Decimal(d) ->
                RAddParAssign(param,Decimal d)
            end
      in
      (*generate a connection from the target hardware port to the port in another component*)
      let to_connect_output_rstep : string -> hwcompinst -> string -> rstep =
        fun outport compinst port ->
          begin
            let dest : wireid = {comp=compinst;port=port} in
            match targexpr with
            | Some(expr) ->
              RConnectOutput(outport,dest,{expr=expr})
            | None ->
              raise (ASTUnifier_error
                       "unexpected: cannot have connection for math unify")
          end
      in
      let to_connect_input_rstep : string -> hwcompinst -> string -> rstep =
        fun inport compinst port ->
          begin
            let dest : wireid = {comp=compinst;port=port} in
            match targexpr with
            | Some(expr) ->
              RConnectInput(inport,dest,{expr=expr})
            | None ->
              raise (ASTUnifier_error
                       "unexpected: cannot have connection for math unify")
          end
      in
      let all_steps = LIST.fold asgns (fun (v,e) (steps:rstep list)  ->
          match e with
          (*the connection unification can be ignored*)
          | Term(variable) ->
            begin
              (*if this is a reflexive assignment, move on*)
              if v = variable then steps else
                (*this is not a reflexive assignment. Generate a connection or mapping*)
                begin
                  match v,variable with
                  (*we're connecting hardware ports*)
                  | HwId(HNPort(HWKOutput,_,outport,_)),HwId(HNPort(HWKInput,HCMGlobal(compinst),port,prop)) ->
                    (to_connect_output_rstep outport compinst port)::steps

                  | HwId(HNPort(HWKInput,_,inport,_)),HwId(HNPort(HWKOutput,HCMGlobal(compinst),port,prop)) ->
                    (to_connect_input_rstep inport compinst port)::steps

                  | HwId(HNPort(_)),HwId(HNPort(_)) ->
                    begin
                      Printf.printf "Assignment %s = %s\n"
                        (unid2str v)
                        (uast2str e);
                      raise (ASTUnifier_error "cannot connect input<->input, or output<->output")
                    end

                  | HwId(_),HwId(_) ->
                    begin
                      Printf.printf "Assignment %s = %s\n"
                        (unid2str v)
                        (uast2str e);
                      raise (ASTUnifier_error
                               "unexpected hardware id. It's an output or param, or local")
                    end

                  (*this is a typical assignment*)
                  | HwId(_),MathId(_) ->
                    (to_assign_rstep v e )::steps
                end
            end
            
          | _ ->
            (to_assign_rstep v e)::steps


        ) init_steps 
      in
      all_steps


  let solve_math :
    mid menv -> hwvid hwcomp -> hwcompcfg -> int option -> string -> string ->
    rstep list -> rstep list list =
    fun menv comp cfg inst hwvar mvar steps -> 
      begin
        let un_env : unid AlgebraicLib.UnifyEnv.t =
          AlgebraicLib.UnifyEnv.init
            (HwLib.hwcompname2str comp.name) (unid2str) in
        construct_hw_comp un_env comp cfg inst hwvar;
        construct_math un_env menv true;
        prioritize_math un_env menv mvar;
        let alg_env = AlgebraicLib.init (unid2str) in
        let branching = Globals.get_glbl_int "unify-branch" in
        let restrict_size = Globals.get_glbl_int "unify-restrict-size" in
        let asgns = AlgebraicLib.unify alg_env un_env branching restrict_size in 
        List.map (fun asgn -> to_rsteps hwvar (None) asgn steps) asgns
      end


  let solve_hw :
    mid menv -> hwvid hwenv -> hwvid hwcomp -> hwcompcfg -> int option -> string -> hwvid ->
    unid ast -> rstep list -> rstep list list =
    fun menv hwenv comp cfg inst hwpatvar htargvar hexpr steps ->
      begin
        let un_env = AlgebraicLib.UnifyEnv.init
            (HwLib.hwcompname2str comp.name) (unid2str) in
        construct_hw_comp un_env comp cfg inst hwpatvar;
        construct_math un_env menv false;
        construct_hw_expr un_env hwenv menv htargvar hexpr;
        let alg_env = AlgebraicLib.init (unid2str) in
        let branching = Globals.get_glbl_int "unify-branch" in
        let restrict_size = Globals.get_glbl_int "unify-restrict-size" in
        let asgns = AlgebraicLib.unify alg_env un_env branching restrict_size in
        (*asgns to rsteps*)
        List.map (fun asgn -> to_rsteps hwpatvar (Some hexpr) asgn steps) asgns
      end

  let solve_hw_passthru :
    mid menv -> hwvid hwenv -> hwvid hwcomp -> hwcompcfg -> int option -> string -> string -> hwvid ->
    unid ast -> rstep list -> rstep list list =
    fun menv hwenv comp cfg inst hwpatoutput hwpatinput htargvar hexpr steps ->
      begin
        let un_env = AlgebraicLib.UnifyEnv.init
            (HwLib.hwcompname2str comp.name) (unid2str) in
        construct_hw_comp un_env comp cfg inst hwpatoutput;
        construct_math un_env menv false;
        construct_hw_expr un_env hwenv menv htargvar hexpr;
        force_assign un_env comp cfg inst hwpatinput hexpr;
        (*TODO: foreach other input, don't allow this assignment*)
        (*restrict_assign un_env comp cfg inst otherpatinput hexpr;*)
        let alg_env = AlgebraicLib.init (unid2str) in
        let branching = Globals.get_glbl_int "unify-branch" in
        let restrict_size = Globals.get_glbl_int "unify-restrict-size" in
        let asgns = AlgebraicLib.unify alg_env un_env branching restrict_size in
        (*asgns to rsteps*)
        List.map (fun asgn -> to_rsteps hwpatoutput (Some hexpr) asgn steps) asgns
      end

  (* take the set of assignments, and convert to steps *)
  let get_solutions (env:runify) : (rstep list) list=
    let results : rnode list = SearchLib.get_solutions env.search None in
    (* convert to eqn steps*)
    List.map (fun result ->
        let steps : rstep list =
          SearchLib.get_path env.search result in
        LIST.uniq steps
      ) results

  let unify_comp_with_hwvar_passthrough (hwenv:hwvid hwenv) (menv:mid menv)
      (comp:hwvid hwcomp) (cfg:hwcompcfg) (inst:int option)
      (hpatoutport:string) (hpatinport:string)(hwtargvar:hwvid) (hexpr:unid ast) (steps:rstep list) =
    solve_hw_passthru menv hwenv comp cfg inst hpatoutport hpatinport hwtargvar hexpr steps 
 
  let unify_comp_with_hwvar (hwenv:hwvid hwenv) (menv:mid menv)
      (comp:hwvid hwcomp) (cfg:hwcompcfg) (inst:int option)
      (hpatvar:string) (hwtargvar:hwvid) (hexpr:unid ast) (steps:rstep list) =
    solve_hw menv hwenv comp cfg inst hpatvar hwtargvar hexpr steps 

  let unify_comp_with_mvar (hwenv:hwvid hwenv) (menv:mid menv)
      (comp:hwvid hwcomp) (cfg:hwcompcfg) (inst:int option)
      (hvar:string)
      (mvar:string) =
    solve_math menv comp cfg inst hvar mvar []

end
