open SymCamlData

type 'a ast_term =
  | Literal of 'a
  | Deriv of ('a*'a)


type ast_opn =
  | Mult
  | Add
  | Sub

type ast_op2 =
  | Power
  | Div

type ast_op1 =
  | Exp
  | Neg

type 'a ast =
  | Term of 'a ast_term
  | OpN of ast_opn*(('a ast) list)
  | Op2 of ast_op2*('a ast)*('a ast)
  | Op1 of ast_op1*(('a ast))
  | Decimal of float
  | Integer of int


exception ASTException of (string)
let error n msg = raise (ASTException(n^": "^msg))

module ASTLib : sig
    val ast2str : ('a ast) -> ('a -> string) -> string
    val trans : ('b ast) -> ('b ast ->  ('b ast) option)  -> ('b ast)
    val map : ('a ast)  -> ('a -> 'b)  -> ('b ast)
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
end =
struct

    let rec ast2str a fn : string =
      let list2str lst delim =
        match lst with
        | h::h2::t -> List.fold_right (fun x r -> r^delim^(ast2str x fn)) (h2::t) (ast2str h fn)
        | [h] -> ast2str h fn
        | [] -> ""
      in
      let term2str t = match t with
      | Literal(x) -> fn x
      | Deriv(x,v) -> "deriv("^(fn x)^","^(fn v)^")"
      in
      let opn2str t = match t with
      | Mult -> "*"
      | Add -> "+"
      | Sub -> "-"
      in
      let op12str t = match t with
      | Exp -> "exp"
      | Neg -> "-"
      in
      let op22str t = match t with
      | Power -> "^"
      | Div -> "/"
      in
      match a with
      | Term(x) -> term2str x
      | OpN(v,lst) -> list2str lst (opn2str v)
      | Op2(v,a,b) -> (ast2str a fn)^(op22str v)^(ast2str b fn)
      | Op1(v,a) -> (op12str v)^"("^(ast2str a fn)^")"
      | Decimal(d) -> string_of_float d
      | Integer(i) -> string_of_int i


      let _internal_map (type a) (type b) (a:a ast) (conv_elem:b ast -> b ast option) (conv_term: a -> b) : b ast  =
        let rec _map (el:a ast) : b ast =
          let maplst (lst:(a ast) list) : (b ast) list =
            List.fold_left (fun r x -> (_map x)::r) [] lst
          in
          let choose ne : b ast=
            match conv_elem ne with Some(re) -> re | None -> ne
          in
          match el with
            | Term(Literal(x)) ->
              let ne = Term(Literal (conv_term x)) in
              choose ne
            | Term(Deriv(x,v)) ->
              let ne = Term(Deriv( conv_term x, conv_term v)) in
              choose ne
            | Op2(op,e1,e2) ->
              let ne1 = _map e1 and ne2 = _map e2 in
              let ne = Op2(op,ne1,ne2) in
              choose ne
            | OpN(op,elst) ->
              let nelst = maplst elst in
              let ne = OpN(op, nelst) in
              choose ne
            | Op1(op,e) ->
              let ne = Op1(op,_map e) in
              choose ne
            | Decimal(d) ->
              choose (Decimal(d))
            | Integer(i) ->
              choose (Integer(i))
        in
        _map a

    let trans (a:'b ast) (conv_elem: 'b ast -> ('b ast) option) : 'b ast =
      _internal_map a conv_elem (fun x -> x)

    let map (type x) (type y) (a:x ast) (cnv_term:x -> y) : y ast =
     let cnv_el (v:y ast) : (y ast) option = None in
     let res : y ast = _internal_map a cnv_el cnv_term in
     res

    let to_symcaml (type a) (x:a ast)  (fn:a -> symvar) : symexpr = error "to_symcaml" "unimplemented"

    let from_symcaml (type a) ast (fn:symvar -> a) : a ast = error "from_symcaml" "unimplemented"

    let simpl (type a) (to:a->symvar) (fm:symvar->b) (ast: a ast) : a ast = error "simpl" "unimplemented"



end
