open ScipyOptimizeData;;
open Sys;;
open Util;;
open Core.Std;;

exception ScipyOptimizeLib_error of string
module ScipyOptimizeLib =
struct

  let id = REF.mk 0

  let emit : string -> sciopt_st list -> unit =
    fun fn sts ->
      let fh = open_out fn in
      let wrstr s = "\""^s^"\"" in
      Printf.fprintf fh "from engines.map.optimize import OptimizeProblem\n";
      List.iter ~f:(fun (st:sciopt_st) ->
          match st with
          | SCIInitialize(tol,iters,dim) ->
            Printf.fprintf fh "prob = OptimizeProblem(%e,%d,%d)\n" tol iters dim;
          | SCIInitGuess(idx,value) ->
            Printf.fprintf fh "prob.initial(%d,%e)\n" idx value
          | SCIBound(vmin,vmax) ->
            Printf.fprintf fh "prob.bound(%e,%e)\n" vmin vmax
          | SCIEq(expr1,expr2) ->
            Printf.fprintf fh "prob.eq(\"%s\",\"%s\")\n" (expr1) (expr2)
          | SCINeq(expr1,expr2) ->
            Printf.fprintf fh "prob.neq(\"%s\",\"%s\")\n" (expr1) (expr2)
          | SCIGTE(expr1,expr2) ->
            Printf.fprintf fh "prob.gte(\"%s\",\"%s\")\n" (expr1) (expr2)
          | SCILTE(expr1,expr2) ->
            Printf.fprintf fh "prob.lte(\"%s\",\"%s\")\n" (expr1) (expr2)
          | SCIInterval(expr,min,max) ->
            Printf.fprintf fh "prob.interval(\"%s\",%f,%f)\n" (expr) min max
          | SCIObjective(v) ->
            Printf.fprintf fh "prob.objective(\"%s\")\n" (v)
          | SCIComment(v) ->
            Printf.fprintf fh "# %s\n" v 
          | SCISolve ->
            Printf.fprintf fh "prob.solve()\n"
          | SCINewline ->
            Printf.fprintf fh "\n"
          | SCIWrite(outf) ->
            Printf.fprintf fh "prob.write(\"%s\")\n" (outf)
          | _ -> raise (ScipyOptimizeLib_error "unimpl")
        ) sts;
      close_out fh

  let int_to_error_code : int -> sciopt_error_code =
    fun id ->
      match id with
      | -1 -> SCIGradEvalRequired
      | 1 -> SCIFunctionEvalRequired
      | 2 -> SCIMoreEqCstrThanVars
      | 3 -> SCIMoreThan3nItersInLSQProb
      | 4 -> SCIIncompatCstr
      | 5 -> SCISingularMatE
      | 6 -> SCISingularMatC
      | 7 -> SCIRankDefEqCstr 
      | 8 -> SCIPosDirectDerivative 
      | _ -> SCIUnknown

  let error_code_to_str : sciopt_error_code -> string =
    fun id ->
      match id with
      | SCIGradEvalRequired -> "Gradient evaluation required (g & a)"
      | SCIFunctionEvalRequired -> "Function evaluation required (f & c)"
      | SCIMoreEqCstrThanVars  -> "More equality constraints than independent variables"
      | SCIMoreThan3nItersInLSQProb -> "More than 3*n iterations in LSQ subproblem"
      | _ -> "Inequality constraints incompatible"
      | _ -> "Singular matrix E in LSQ subproblem"
      | _ -> "Singular matrix C in LSQ subproblem"
      | _ -> "Rank-deficient equality constraint subproblem HFTI"
      | _ -> "Positive directional derivative for linesearch"
      | _ -> "Iteration limit exceeded"

  let parse_output : string -> sciopt_result =
    fun outfile ->
      let lines = In_channel.read_lines outfile in
      match lines with
      | "success"::model ->
        let status = SCISuccess in
        let mdl = MAP.make () in
        List.iter ~f:(fun (line:string) ->
            match STRING.split line "=" with
            | [idx;value] ->
              noop (MAP.put mdl
                      (int_of_string idx)
                      (float_of_string value)
                   )
            | _ -> ()
          ) model;
        {status=status;vect=Some(mdl);obj=0.0-.1.0}

      | "unknown"::rest ->
        let status = SCIMalformedProb in
        {status=status;vect=None;obj=0.0-.1.0}

      | "failure"::errcode::rest ->
        let status = SCIError(int_to_error_code (int_of_string errcode)) in 
        {status=status;vect=None;obj=0.0-.1.0}

  let exec : string -> sciopt_st list -> int -> sciopt_result =
    fun suffix sts timeout ->
      let filename = "mapopt_"^(string_of_int (REF.dr id))^".py" in
      let outfile = "mapopt_"^(string_of_int (REF.dr id))^".out" in
      let logfile= "mapopt_"^(string_of_int (REF.dr id))^".log" in
      print_string ("==== Evaluating <"^filename^"> ====\n");
      REF.upd id (fun x -> x+1);
      emit filename (sts @ [SCISolve; SCIWrite(outfile)]);
      Sys.command ("python "^filename^" > "^logfile);
      parse_output outfile


end
