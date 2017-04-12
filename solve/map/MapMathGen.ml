open Util;;
open MapData;;
open MathLib;;
open MathData;;
open AST;;
open MapPartition;;
open MapExpr;;

exception MapMathGenError of string

let error n m  : unit= raise (MapMathGenError (n^":"^m))


module MapMathGen =

struct

(*given an expression, of math vars, come up with an mapping constraint *)

  type 'a map_proj =
    {
      expr:'a map_expr;
    }

  let proj_opt_list_to_exprs (sc_exprs:'a map_proj option list) =
    List.fold_left (fun args_opt pr_opt ->
        match args_opt, pr_opt with
        | Some(args),Some(pr) -> Some (pr.expr::args)
        | None,_ -> None
        | _,None -> None
      ) (Some []) sc_exprs 

  let cons_map_expr (f:'a map_expr->'a map_expr->'a map_expr) (args:'a map_expr list) =
    match args with
    | h::t -> List.fold_left (fun curr_expr arg -> f curr_expr arg) (h) t
    | _ -> raise (MapMathGenError "unexpected")

  let equiv_map_expr (q:'a map_expr partition)  (args:'a map_expr list) =
    match args with
    | h::t ->
      begin
        MapPartition.add_partition q (h::t);
        Some(h)
      end

    | _ ->
      (raise (MapMathGenError "unexpected"))

  (* derive the scaling constraints, but only if the expression is only state variables*)
  let gen_scale_expr menv (expr:mid ast) (deriv_scale_var:'a) (tostr:'a -> string) =
    let equiv = MapPartition.mk
        (fun x -> MapExpr.string_of_map_expr x tostr )
    in
    let rec _work (expr:mid ast) :'a map_proj option=
      let proc_args exprs =
        proj_opt_list_to_exprs (List.map _work exprs)
      in
      match expr with
      | Term(MNVar(k,name)) ->
        if MathLib.isstvar menv name then
          Some {expr=MEVar(deriv_scale_var);}
        else
          None

      | Term(MNParam(name,Integer 0)) ->
        Some {expr=MEConst(Integer 0)}

      | Term(MNParam(name,Decimal 0.)) ->
        Some {expr=MEConst(Integer 0)}

      | Term(MNParam(name,v)) ->
        Some {expr=MEConst(Integer 1)}

      | Integer(0) ->
        Some {expr=MEConst(Integer 0)}

      | Decimal(0.) ->
        Some {expr=MEConst(Integer 0)}

      | Integer(i) ->
        Some {expr=MEConst(Integer 1)}

      | Decimal(i) ->
        Some {expr=MEConst(Integer 1)}

      | Op2(Power,denom,Integer i) ->
        begin
          let sdenom = _work denom  in
          match sdenom with
          | Some(d) -> Some {expr=MEPower(d.expr,Integer i)}
          | None -> None
        end
      | Op2(Power,denom,Decimal i) ->
        begin
          let sdenom = _work denom  in
          match sdenom with
          | Some(d) -> Some {expr=MEPower(d.expr,Decimal i)}
          | None -> None
        end

      | Op2(Power,base,exp) ->
        Some {expr=MEConst(Integer 1)}

      | Op2(Div,a,b) ->
        begin
          let sa = _work a and sb = _work b  in
          match sa,sb with
          | Some(d),Some(d2) ->
            Some {expr=MEDiv(d.expr,d2.expr)}
          | _ -> None
        end

      | Op1(Neg,expr) ->
        begin
          match _work expr with
          | Some(e) -> Some {expr=MESub(MEConst(Integer 0),e.expr)}
          | None -> None
        end

      | OpN(Mult,exprs) ->
        begin
          match proc_args exprs with
          | Some(lst) ->
            Some {expr=cons_map_expr (fun a b -> MEMult(a,b)) lst }
          | None -> None
        end

      | OpN(Add,exprs) ->
        begin
          match proc_args exprs with
          | Some(lst) ->
            OPTION.map (equiv_map_expr equiv lst)
              (fun e -> {expr=e})
              
          | None -> None
        end
      | OpN(Sub,exprs) ->
        begin
          match proc_args exprs with
          | Some(lst) ->
            OPTION.map (equiv_map_expr equiv lst)
              (fun e -> {expr=e})
              
          | None -> None
        end

      
      | _ -> raise (MapMathGenError "unhandled expression") 
    in
    equiv,_work expr

end
