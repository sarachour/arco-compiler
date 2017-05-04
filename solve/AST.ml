open SymCamlData
open SymCaml
open Util
open Globals


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
  | IRange of irange
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

type symdecl =
  | WildcardVar of symvar*((symexpr) list)
  | SymbolVar of symvar

let ast_of_number (n:number) : 'a ast =
    match n with
    | Decimal(q) -> Decimal(q)
    | Integer(q) -> Integer(q)


exception ASTException of (string)
let error n msg = raise (ASTException(n^": "^msg))

type 'a symassign = ('a,'a ast) map

let number_to_ast (a:number) : 'a ast = match a with
  | Decimal(d) -> Decimal(d)
  | Integer(i) -> Integer(i)


module ASTLib
(*): sig
    val ast2str : ('a ast) -> ('a -> string) -> string
    val trans : ('b ast) -> ('b ast ->  ('b ast) option)  -> ('b ast)
    val map : ('a ast)  -> ('a -> 'b)  -> ('b ast)
    val expand : ('a ast)  -> ('a -> 'b ast)  -> ('b ast)
    val iter : ('a ast) -> ('a ast -> unit) -> unit
    val fold : ('a ast) -> ('a ast -> 'b -> 'b) -> 'b -> 'b
    val get_vars : ('a ast) -> ('a list)
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
    val eq : ('a ast) -> ('a ast) -> ('a -> symvar) -> ('a -> ('a->symvar)-> symdecl) -> bool
    val pattern : ('a ast) -> ('a ast) -> ('a -> symvar) -> (symvar -> 'a)  ->  ('a -> bool-> ('a -> symvar)-> symdecl) -> int -> ('a symassign) list option
    val simpl : ('a ast) -> ('a -> symvar) -> (symvar -> 'a)  ->  ('a-> ('a -> symvar)-> symdecl) -> 'a ast
    val sub : ('a ast) -> (('a,'a ast) map) -> 'a ast
    val subs : ('a ast) -> ((('a,'a ast) map) list) -> 'a ast
    
  end*)

= struct
    let number2ast (x:number) : 'a ast = match x with
        | Integer(i) -> Integer(i)
        | Decimal(d) -> Decimal(d)

    let rec ast2str a fn : string =
      let list2str lst delim =
        match lst with
        | h::h2::t -> List.fold_left (fun r x -> r^delim^(ast2str x fn)) (ast2str h fn) (h2::t)
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
      | OpN(v,lst) -> "("^(list2str lst (opn2str v))^")"
      | Op2(v,a,b) -> "("^(ast2str a fn)^(op22str v)^(ast2str b fn)^")"
      | Op1(v,a) -> (op12str v)^"("^(ast2str a fn)^")"
      | Deriv(a,v) -> "deriv("^(ast2str a fn)^","^(ast2str v fn)^")"
      | Decimal(d) -> string_of_float d
      | Integer(i) -> string_of_int i


      let _MAP (type a) (type b) (a:a ast) (conv_elem:b ast -> b ast option) (conv_term: a -> b ast) : b ast  =
        let rec _map (el:a ast) : b ast =
          let maplst (lst:(a ast) list) : (b ast) list =
            List.fold_right (fun x r -> (_map x)::r) lst []
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
            | _ -> error "_MAP" "unimplemented node"
        in
        _map a

      let trans_id (type a) (type b) (targ:a ast) (conv_elem: a  -> b ast ) : b ast =
        _MAP targ (fun x -> None) conv_elem

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

      let fold (type x) (type y) (a:x ast) (fld:x ast -> y -> y)  (b0:y) : y =
        let rec _fold (el: x ast) (b: y) : y =
          let _foldlst (lst:(x ast) list) b0 : y =
            List.fold_left (fun b a -> let nb = _fold a b in fld a nb) b0 lst
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

      let get_vars (type a) (e:a ast) : a list =
        let vset : a set = fold e (fun xast st ->
            match xast with
            | Term(l) -> SET.add st l
            | _ -> st
            ) (SET.make_dflt () )
        in
        SET.to_list vset

      let has_var (type a) (e:a ast) (x:a) : bool =
        let vrs = get_vars e in
        LIST.has vrs x

    let compute (type x) (a:x ast) : float option =
      let conv (lst: x ast list) fn =
        let fnlst = List.fold_right (fun x r ->
          match x,r with
          |(Decimal(v),Some(rv)) -> Some(fn v rv)
          | _ -> None
        ) in
        let comp = match lst with
        | Decimal(h)::t -> fnlst t (Some h)
        | [Decimal(h)] -> Some (h)
        | _ -> None
        in
        match comp with
        |Some(v) -> Decimal(v)
        |None ->   Integer(-1)
      in
      let tf v = match v with
      | Integer(x) -> Some (Decimal (float_of_int x))
      | Decimal(x) -> None
      | Term(x) -> Some (Integer(-1))
      | Op1(Exp,Decimal(x)) -> Some (Decimal (exp x))
      | Op1(Neg,Decimal(x)) -> Some (Decimal (0.-.x))
      | Op2(Power,Decimal(x),Decimal(y)) -> Some (Decimal (x**y))
      | Op2(Div, Decimal(x),Decimal(y)) -> Some (Decimal (x/.y))
      | OpN(Add, dlst) -> Some (conv dlst (fun x r -> x +. r))
      | OpN(Sub, dlst) -> Some (conv dlst (fun x r -> x -. r))
      | OpN(Mult, dlst) -> Some (conv dlst (fun x r -> x *. r))
      | OpN(Func(_),_) -> None
      | _ ->  Some (Integer(-1))
      in
      match trans a tf with
      | Decimal(x) -> Some(x)
      | _ -> None
               
    let size (type x) (a:x ast) : int =
      fold a (fun pt n -> n + 1) 0

    let score (type x) (a:x ast) : int =
      fold a (fun pt n -> match pt with
          | Op2(Power,_,_) -> n+4
          | Op1(Exp,_) -> n+4
          | Op2(Div,_,_) -> n+2
          | OpN(Mult,_) -> n+2
          | Op1(Neg,_) -> n
          | _ -> n+1) 0

    let iter (type x) (a: x ast) (fn: x ast -> unit) : unit =
      let fld x r = let _ = fn x in r in
      fold a fld ()


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
        | Func(q) -> Function(q)
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
        | Decimal(v) -> if MATH.float_is_int v then Integer(MATH.int_of_float v) else Decimal(v)
        | Integer(v) -> Integer(v)
      in
        _tosym x

    let from_symcaml (type a) (ast:symexpr) (fn:symvar -> a) : a ast =
      let op1_sym2ast (x:SymCamlData.op1)  = match x with
      | NatExp -> Exp
      | Neg -> Neg
      in
      let op2_sym2ast (x:SymCamlData.op2) = match x with
      | Exp -> Power
      | Div -> Div
      in
      let opn_sym2ast (x:SymCamlData.opn) = match x with
      | Add -> Add
      | Mult -> Mult
      | Sub -> Sub
      | Function(q) -> Func(q)
      in
      let rec _fromsym (e:symexpr) : a ast =
        let _fromsymlist lst =
          List.map (fun x -> _fromsym x) lst
        in
        match e with
        | Symbol(v) -> Term(fn v)
        | Decimal(v) -> if MATH.float_is_int v then Integer(MATH.int_of_float v) else Decimal(v)
        | Integer(v) -> Integer(v)
        | Op1(op,e1) -> Op1((op1_sym2ast op), _fromsym e1)
        | Op2(op,e1,e2) -> Op2(op2_sym2ast op, _fromsym e1, _fromsym e2)
        | OpN(op,en) -> OpN(opn_sym2ast op, _fromsymlist en)
        in
        _fromsym ast

    let defsyms env x cnv =
      let define_sym x r =
        match x with
        | SymbolVar(n) -> let _ =  SymCaml.define_symbol env n in x::r
        | _ -> r
      in
      let syms = List.fold_right define_sym x [] in
      let define_wc x r =
        match x with
        | WildcardVar(n,sybans) ->
          let _ = SymCaml.define_wildcard env (n) sybans in
          x::r
        | _ -> r
      in
      let wcs = List.fold_right define_wc x [] in
      syms,wcs


    let mkenv (type a) (exprs: (a ast) list)
        (cnv:a->symvar) (decl:  int -> a -> (a->symvar) -> symdecl)
      : symcaml*(symdecl list)*(symdecl list) =
      let env = SymCaml.init (Some "/usr/local/bin/python3") SV076 (None)  in
      let _ = SymCaml.clear env in
      let getvars  (i:int)  (x:a ast) (r:(symdecl) set): (symdecl) set = match x with
        | Term(x) -> SET.add r (decl i x cnv)
        | Deriv(Term(x),v) -> SET.add r (decl i x cnv)
        | _ -> r
      in
      let onevarset (ast:a ast) (i:int)  (r: (symdecl) set) : (symdecl) set =
        fold ast (getvars i) r
      in
      let allvars = LIST.fold_i onevarset exprs (SET.make ()) in
      let syms,wcs = defsyms env (SET.to_list allvars) cnv in
      (env,wcs,syms)


    let eq (type a) (e1:a ast) (e2:a ast) (cnv:a->symvar) (decl:a->(a->symvar)->symdecl) : bool =
      let env,_,_ = mkenv [e1;e2] cnv (fun i x c -> decl x c) in
      let lhe = to_symcaml e1 cnv in
      let rhe = to_symcaml e2 cnv in
      SymCaml.eq env lhe rhe

    let simpl (type a)
        (e1:a ast) (cnv:a->symvar)
        (icnv:symvar -> a)  (decl:a->(a->symvar)->symdecl) : a ast =
      let env,_,_ = mkenv [e1] cnv (fun i x c -> decl x c) in
      let lhe = to_symcaml e1 cnv in
      let r = SymCaml.simpl env lhe in
      let res = from_symcaml r icnv in
      res


  let sub_fxn (type a) (expr:a ast) (subfxn:a -> a ast option) : a ast =
    let tf x = match x with
    | Term(v) -> subfxn v 
    | _ -> None
    in
    trans expr tf

  
  let sub (type a) (type b) expr (subs: (a,a ast) map) : a ast =
    sub_fxn expr (fun k -> if MAP.has subs k then Some(MAP.get subs k) else None)


  let subs (type a) (expr:a ast) (subs : (a,a ast) map list) : a ast = 
    let rec _subs e s = match s with
    | h::t -> _subs (sub e h) t
    | [] -> e
    in
    _subs expr subs

  let sub_one (type a) (expr:a ast) (lhs:a) (rhs:a ast) : a ast =
    let v = MAP.make () in
    let _ = MAP.put v lhs rhs in
    sub expr v

  let add_deps (type a) (g:(a,unit) graph) (l:a) (e:a ast) =
    let add_node_if_dne l = if GRAPH.hasnode g l = false then
      let _ = GRAPH.mknode g l in ()
      else ()
    in
    let vars = get_vars e in
    let _ = add_node_if_dne l in
    let _ = List.iter (fun inp ->
        let _ = add_node_if_dne inp in
        let _ = GRAPH.mkedge g inp l ()
        in ()) vars in
    ()


  let mk_dep_graph (type a) (es:(a*(a ast)) list) (tostr:a -> string) : (a,unit) graph =
    let g = GRAPH.make (fun x y -> x = y) (fun x -> tostr x) (fun y -> "()") in
    let _ = List.iter (fun (l,r) -> add_deps g l r) es in
    g




end
