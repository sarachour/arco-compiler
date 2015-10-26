open SymCamlData
open SymCaml
open Util




type ast_opn =
  | Mult
  | Add
  | Sub
  | Func of string

type ast_op2 =
  | Power
  | Div

type ast_op1 =
  | Exp
  | Neg

type index =
  | IRange of int*int
  | IIndex of int
  | IToStart of int
  | IToEnd of int

type 'a ast =
  | Term of 'a
  | Acc of ('a ast)*(index list)
  | OpN of ast_opn*(('a ast) list)
  | Op2 of ast_op2*('a ast)*('a ast)
  | Op1 of ast_op1*(('a ast))
  | Deriv of ('a ast)*('a ast)
  | Decimal of float
  | Integer of int

type 'a symdecl =
  | WildcardVar of 'a*('a  -> 'a list -> ('a ast) list)
  | SymbolVar of 'a



exception ASTException of (string)
let error n msg = raise (ASTException(n^": "^msg))

module ASTLib : sig
    val ast2str : ('a ast) -> ('a -> string) -> string
    val trans : ('b ast) -> ('b ast ->  ('b ast) option)  -> ('b ast)
    val map : ('a ast)  -> ('a -> 'b)  -> ('b ast)
    val expand : ('a ast)  -> ('a -> 'b ast)  -> ('b ast)
    val iter : ('a ast) -> ('a ast -> unit) -> unit
    val fold : ('a ast) -> ('a ast -> 'b -> 'b) -> 'b -> 'b
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
    val eq : ('a ast) -> ('a ast) -> ('a -> symvar) -> ('a -> 'a symdecl) -> bool
    val pattern : ('a ast) -> ('b ast) -> ('a -> symvar) -> ('b -> symvar) -> ('a -> 'a symdecl) -> ('b -> 'b symdecl) -> unit
end =
struct

    let rec ast2str a fn : string =
      let list2str lst delim =
        match lst with
        | h::h2::t -> List.fold_right (fun x r -> r^delim^(ast2str x fn)) (h2::t) (ast2str h fn)
        | [h] -> ast2str h fn
        | [] -> ""
      in
      let opn2str t = match t with
      | Mult -> "*"
      | Add -> "+"
      | Sub -> "-"
      | Func(_) -> ","
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
      | Term(x) -> fn x
      | OpN(Func(name),lst) ->name^"("^(list2str lst (opn2str (Func(name))  ))^")"
      | OpN(v,lst) -> list2str lst (opn2str v)
      | Op2(v,a,b) -> (ast2str a fn)^(op22str v)^(ast2str b fn)
      | Op1(v,a) -> (op12str v)^"("^(ast2str a fn)^")"
      | Deriv(a,v) -> "deriv("^(ast2str a fn)^","^(ast2str v fn)^")"
      | Decimal(d) -> string_of_float d
      | Integer(i) -> string_of_int i


      let _MAP (type a) (type b) (a:a ast) (conv_elem:b ast -> b ast option) (conv_term: a -> b ast) : b ast  =
        let rec _map (el:a ast) : b ast =
          let maplst (lst:(a ast) list) : (b ast) list =
            List.fold_left (fun r x -> (_map x)::r) [] lst
          in
          let choose ne : b ast=
            match conv_elem ne with Some(re) -> re | None -> ne
          in
          match el with
            | Term(l) ->
              let ne = conv_term l in
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
            | Deriv(e,v) ->
              let ne = Deriv(_map e, _map v) in
              choose ne
            | Decimal(d) ->
              choose (Decimal(d))
            | Integer(i) ->
              choose (Integer(i))
        in
        _map a

    let trans (a:'b ast) (conv_elem: 'b ast -> ('b ast) option) : 'b ast =
      _MAP a conv_elem (fun x -> Term(x))

    let map (type x) (type y) (a:x ast) (cnv_term:x -> y) : y ast =
     let cnv_el (v:y ast) : (y ast) option = None in
     let cnv_t (v:x) = Term(cnv_term v) in
     let res : y ast = _MAP a cnv_el cnv_t in
     res

    let expand (type x) (type y) (a:x ast) (cnv_term:x -> y ast) : y ast =
      let cnv_el (v) = None in
      let res : y ast = _MAP a cnv_el cnv_term in
      res

    let fold (type x) (type y) (a:x ast) (fld:x ast -> y ->y)  (b0:y) : y =
      let rec _fold (el: x ast) (b: y) : y =
        let _foldlst (lst:(x ast) list) b0 : y =
          List.fold_right (fun a b -> let nb = _fold a b in fld a nb) lst b0
        in
        match el with
          | OpN(op,elst) -> let nb : y = _foldlst elst b in
            fld el nb
          | Op2(op,e1,e2) -> let nb : y = _foldlst [e1;e2] b in
            fld el nb
          | Op1(op,e1) -> let nb : y = _foldlst [e1] b in
            fld el nb
          | _ -> fld el b
      in
        _fold a b0

    let size (type x) (a:x ast) : int =
      fold a (fun pt n -> n + 1) 0

    let iter (type x) (a: x ast) (fn: x ast -> unit) : unit =
      let fld x r = let _ = fn x in r in
      fold a fld ()

    type symcaml = SymCaml.symcaml

    let to_symcaml (type a) (x:a ast)  (fn:a -> symvar) : symexpr =
      let op1_ast2sym x : SymCamlData.op1 = match x with
        | Exp -> NatExp
        | Neg -> Neg
      in
      let op2_ast2sym x : SymCamlData.op2 = match x with
        | Power -> Exp
        | Div -> Div
      in
      let opn_ast2sym x : SymCamlData.opn = match x with
        | Add -> Add
        | Mult -> Mult
        | Sub -> Sub
      in
      let rec _tosym (e:a ast) = match e with
        | Term(x) -> let sx = fn x in Symbol(sx)
        | Deriv(Term(x),Term(v)) -> let sx = fn x and sv  = fn v in
          let wrt = [(sv,1)] in
          Op1(Deriv(wrt),Symbol(sx))
        | Deriv(_,_) -> error "to_symcaml" "unsupported expression: deriv of expression"
        | Op1(op,e1) -> Op1((op1_ast2sym op), _tosym e1)
        | Op2(op,e1,e2) -> Op2(op2_ast2sym op, _tosym e1, _tosym e2)
        | OpN(op,elst) -> let nlst = List.map (fun x -> _tosym x) elst in
          OpN(opn_ast2sym op, nlst)
        | Decimal(v) -> Decimal(v)
        | Integer(v) -> Integer(v)
      in
        _tosym x

    let from_symcaml (type a) ast (fn:symvar -> a) : a ast = error "from_symcaml" "unimplemented"

    let newenv () =
      let env = SymCaml.init() in
      let _ = SymCaml.clear env in
      env

    let mkenv (type a) (env) (exprs: (a ast) list) (cnv:a->symvar) (decl: a -> a symdecl) : symcaml =
      let getvars (x:a ast) (r:(a symdecl) set) : (a symdecl) set = match x with
        | Term(x) -> SET.add r (decl x)
        | Deriv(Term(x),v) -> SET.add r (decl x)
        | _ -> r
      in
      let onevarset (ast:a ast) (r: (a symdecl) set) : (a symdecl) set =
        fold ast getvars r
      in
      let allvars = List.fold_right onevarset exprs (SET.make (fun x y -> x = y)) in
      let syms = SET.filter allvars (fun x -> match x with SymbolVar(_) -> true | _ -> false) in
      let wcs = SET.filter allvars (fun x -> match x with WildcardVar(_) -> true | _ -> false) in
      let symbans =List.map (fun x -> match x with SymbolVar(n) -> n | _ -> error "mkenv/symbans" "must be a symbol") syms in
      let define_sym x =
        match x with
        | SymbolVar(n) -> let _ =  SymCaml.define_symbol env (cnv n) in ()
        | _ -> error "mkenv/define_sym" "impossible to have wildcard in symbol declaration"
      in
      let define_wc x =
        match x with
        | WildcardVar(n,trans) -> let bans = trans n symbans in
          let sybans = List.map (fun x -> to_symcaml x cnv) bans in
          let _ = SymCaml.define_wildcard env (cnv n) sybans in
          ()
        | _ -> error "mkenv/define_wc" "impossible to have symbol in wildcard declaration"
      in
      let _ = List.iter define_sym syms in
      let _ = List.iter define_wc wcs in
      env

    let simpl (type a) (ast: symexpr ast) : symexpr ast = error "simpl" "unimplemented"

    let eq (type a) (e1:a ast) (e2:a ast) (cnv:a->symvar) (decl:a->a symdecl) : bool =
      let env = newenv () in
      let env = mkenv env [e1;e2] cnv decl in
      let lhe = to_symcaml e1 cnv in
      let rhe = to_symcaml e2 cnv in
      SymCaml.eq env lhe rhe

    let pattern (type a) (type b) (e1:a ast) (e2:b ast)
      (cnv1:a->symvar) (cnv2: b->symvar)
      (decl1:a->a symdecl) (decl2:b->b symdecl) : unit =

      let env = newenv () in
      let env = mkenv env [e1] cnv1 decl1 in
      let env = mkenv env [e2] cnv2 decl2 in
      let cand = to_symcaml e1 cnv1 in
      let templ = to_symcaml e2 cnv2 in
      let res = SymCaml.pattern env cand templ in
      ()
end
