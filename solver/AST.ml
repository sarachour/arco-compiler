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

module ASTLib : sig
    val ast2str : ('a ast) -> ('a -> string) -> string
    val trans : ('b ast) -> ('b ast ->  ('b ast) option)  -> ('b ast)
    val map : ('a ast)  -> ('a -> 'b)  -> ('b ast)
    val expand : ('a ast)  -> ('a -> 'b ast)  -> ('b ast)
    val iter : ('a ast) -> ('a ast -> unit) -> unit
    val fold : ('a ast) -> ('a ast -> 'b -> 'b) -> 'b -> 'b
    val to_symcaml : ('a ast) -> ('a -> symvar) -> (symexpr)
    val eq : ('a ast) -> ('a ast) -> ('a -> symvar) -> ('a -> ('a->symvar)-> symdecl) -> bool
    val pattern : ('a ast) -> ('a ast) -> ('a -> symvar) -> (symvar -> 'a)  ->  ('a -> bool-> ('a -> symvar)-> symdecl) -> int -> ('a symassign) list option
    val simpl : ('a ast) -> ('a -> symvar) -> (symvar -> 'a)  ->  ('a-> ('a -> symvar)-> symdecl) -> 'a ast
    val sub : ('a ast) -> (('a,'a ast) map) -> 'a ast
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
      | OpN(v,lst) -> "("^(list2str lst (opn2str v))^")"
      | Op2(v,a,b) -> "("^(ast2str a fn)^(op22str v)^(ast2str b fn)^")"
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

    let mkenv (type a) (exprs: (a ast) list) (cnv:a->symvar) (decl:  int -> a -> (a->symvar) -> symdecl) : symcaml*(symdecl list)*(symdecl list) =
      let env = SymCaml.init() in
      (*let _ = SymCaml.set_debug env true in *)
      let _ = SymCaml.clear env in
      let getvars  (i:int)  (x:a ast) (r:(symdecl) set): (symdecl) set = match x with
        | Term(x) -> SET.add r (decl i x cnv)
        | Deriv(Term(x),v) -> SET.add r (decl i x cnv)
        | _ -> r
      in
      let onevarset (ast:a ast) (i:int)  (r: (symdecl) set) : (symdecl) set =
        fold ast (getvars i) r
      in
      let cmpvars x y = match x,y with
      | (SymbolVar(ra),SymbolVar(rb)) -> ra = rb
      | (WildcardVar(ra,_), WildcardVar(rb,_)) -> ra = rb
      | _ -> false
      in
      let allvars = LIST.fold_i onevarset exprs (SET.make cmpvars) in
      let syms,wcs = defsyms env (SET.to_list allvars) cnv in
      (env,wcs,syms)


    let simpl (type a) (ast: symexpr ast) : symexpr ast = error "simpl" "unimplemented"

    let eq (type a) (e1:a ast) (e2:a ast) (cnv:a->symvar) (decl:a->(a->symvar)->symdecl) : bool =
      let env,_,_ = mkenv [e1;e2] cnv (fun i x c -> decl x c) in
      let lhe = to_symcaml e1 cnv in
      let rhe = to_symcaml e2 cnv in
      SymCaml.eq env lhe rhe

    let simpl (type a) (e1:a ast) (cnv:a->symvar) (icnv:symvar -> a)  (decl:a->(a->symvar)->symdecl) : a ast =
      let env,_,_ = mkenv [e1] cnv (fun i x c -> decl x c) in
      let lhe = to_symcaml e1 cnv in
      let r = SymCaml.simpl env lhe in
      let res = from_symcaml r icnv in
      res

    let pattern (type a) (type b) (e1:a ast) (e2:a ast) (cnv:a->symvar) (icnv:symvar -> a) (decl:a->bool->(a->symvar)->symdecl) (n:int) =
      let max_depth = 4 in
      let decl_tmpl_or_pat i x cnv =  if i = 0 then decl x false cnv else decl x true cnv in
      let env,iwcs,syms = mkenv [e1;e2] cnv decl_tmpl_or_pat in
      let cand = to_symcaml e1 cnv in
      let templ = to_symcaml e2 cnv in
      (*let _ = SymCaml.set_debug env true in*)
      let mmap x =
        let nm = MAP.make() in
        let f k v = MAP.put nm (icnv k) (from_symcaml v icnv); () in
        let _ = MAP.iter x (fun k v -> f k v) in
        nm
      in
      let sols : (symvar,symexpr) map set = SET.make (fun x y -> x = y) in
      let rec solve wcs depth =
        if (SET.size sols) = n || depth == max_depth then () else
        (*let _ = SymCaml.set_debug env true in
        let templ = SymCaml.simpl env templ in
        let cand = SymCaml.simpl env cand in*)
        let res = SymCaml.pattern env templ cand in
        match res with
        | Some(r) ->
            let symap = MAP.from_list r in
            let _ = SET.add sols symap in
            let solve_with_one_ban (x:symdecl) =
              match x with
              | WildcardVar(n,bans) ->
                if MAP.has symap n = false then () else
                  let nx = WildcardVar(n, (MAP.get symap n)::(bans)) in
                  let nwcs = LIST.sub  x nx wcs in
                  let _,nwcs = defsyms env nwcs cnv in
                  solve nwcs (depth+1)
              | _ -> ()
            in
            let _ = List.iter solve_with_one_ban wcs  in
            ()
        | None -> ()
      in
      let _ = solve iwcs 0 in
      let nlst : (a,a ast) map list = SET.map sols mmap in
      match nlst with
      | [] -> None
      | h::t -> Some (nlst)

  let sub (type a) (expr:a ast) (subs: (a,a ast) map) : a ast =
    let tf x = match x with
    | Term(v) -> if MAP.has subs v then Some(MAP.get subs v) else None
    | _ -> None
    in
    trans expr tf
end
