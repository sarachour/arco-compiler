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
          | SCIInitialize(dim) ->
            Printf.fprintf fh "prob = OptimizeProblem(%d)\n" dim
          | SCISetIters(value)->
            Printf.fprintf fh "prob.set_prop('iters',%d)\n" value
          | SCISetTries(value)->
            Printf.fprintf fh "prob.set_prop('tries',%d)\n" value
          | SCISetResults(value)->
            Printf.fprintf fh "prob.set_prop('results',%d)\n" value
          | SCISetCstrTol(value)->
            Printf.fprintf fh "prob.set_prop('ctol',%e)\n" value
          | SCISetMinTol(value)->
            Printf.fprintf fh "prob.set_prop('tol',%e)\n" value
          | SCISetMethod(value) ->
            Printf.fprintf fh "prob.set_prop('method','%s')\n" (string_of_sciopt_method value) 
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

  let parse_result : string list -> int -> sciopt_result*(string list) =
    fun lines dim ->
    match lines with
      | "success"::tol::lst->
        let status = SCISuccess in
        let tol = float_of_string tol in
        let model,rest = LIST.split_n lst dim in
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
        {status=status;tolerance=tol;vect=Some(mdl);obj=0.0-.1.0},rest

      | "unknown"::rest ->
        let status = SCIMalformedProb in
        {status=status;tolerance=0.0;vect=None;obj=0.0-.1.0},rest

      | "failure"::errcode::rest ->
        let status = SCIError(int_to_error_code (int_of_string errcode)) in 
        {status=status;tolerance=0.0;vect=None;obj=0.0-.1.0},rest

  let parse_output : string -> sciopt_result list =
    fun outfile ->
      let dim,lines = match In_channel.read_lines outfile with
        | dim::lines -> (int_of_string dim), lines
        | [] -> raise (ScipyOptimizeLib_error "unexpected")
      in
      let results = SET.make_dflt() in
      let rec _process buf =
        match buf with
        | [] -> ()
        | _ ->
          let result,rest = parse_result buf dim in
          SET.add results result;
          _process rest
      in
      _process lines;
      SET.to_list results
      
  let exec : string -> sciopt_st list -> int -> sciopt_result list =
    fun suffix sts timeout ->
      let filename = "mapopt_"^(string_of_int (REF.dr id))^".py" in
      let outfile = "mapopt_"^(string_of_int (REF.dr id))^".out" in
      let logfile= "mapopt_"^(string_of_int (REF.dr id))^".log" in
      print_string ("==== Evaluating <"^filename^"> ====\n");
      flush_all();
      REF.upd id (fun x -> x+1);
      emit filename (sts @ [SCISolve; SCIWrite(outfile)]);
      Sys.command ("python "^filename^" > "^logfile);
      parse_output outfile


end
