type token =
  | TOKEN of (string)
  | QTOKEN of (string)
  | DECIMAL of (float)
  | INTEGER of (int)
  | COMMA
  | OPARAN
  | CPARAN
  | EOF
  | QUOTE

open Parsing;;
let _ = parse_error;;
# 2 "SymCamlParser.mly"

open Printf
open SymCamlData


# 21 "SymCamlParser.ml"
let yytransl_const = [|
  261 (* COMMA *);
  262 (* OPARAN *);
  263 (* CPARAN *);
    0 (* EOF *);
  264 (* QUOTE *);
    0|]

let yytransl_block = [|
  257 (* TOKEN *);
  258 (* QTOKEN *);
  259 (* DECIMAL *);
  260 (* INTEGER *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\000\000"

let yylen = "\002\000\
\003\000\001\000\001\000\003\000\004\000\004\000\006\000\004\000\
\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\010\000\002\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\005\000\008\000\
\000\000\006\000\009\000\000\000\000\000\004\000\007\000"

let yydgoto = "\002\000\
\005\000\012\000\013\000"

let yysindex = "\005\000\
\255\254\000\000\006\255\009\255\000\000\000\000\000\255\005\255\
\007\255\008\255\004\255\010\255\011\255\000\000\000\000\000\000\
\014\255\000\000\000\000\009\255\012\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\013\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\001\000\004\000"

let yytablesize = 21
let yytable = "\003\000\
\003\000\009\000\010\000\011\000\006\000\001\000\004\000\008\000\
\017\000\003\000\018\000\007\000\014\000\015\000\016\000\020\000\
\019\000\021\000\023\000\003\000\022\000"

let yycheck = "\001\001\
\001\001\002\001\003\001\004\001\001\000\001\000\008\001\004\000\
\005\001\001\001\007\001\006\001\008\001\007\001\007\001\005\001\
\007\001\004\001\007\001\007\001\020\000"

let yynames_const = "\
  COMMA\000\
  OPARAN\000\
  CPARAN\000\
  EOF\000\
  QUOTE\000\
  "

let yynames_block = "\
  TOKEN\000\
  QTOKEN\000\
  DECIMAL\000\
  INTEGER\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : SymCamlData.symexpr) in
    Obj.repr(
# 30 "SymCamlParser.mly"
                    (let c = _2 in c)
# 99 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : SymCamlData.symexpr) in
    Obj.repr(
# 31 "SymCamlParser.mly"
        (let c = _1 in c)
# 106 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : SymCamlData.symexpr) in
    Obj.repr(
# 35 "SymCamlParser.mly"
         (let a = _1 in [a])
# 113 "SymCamlParser.ml"
               : SymCamlData.symexpr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : SymCamlData.symexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : SymCamlData.symexpr list) in
    Obj.repr(
# 36 "SymCamlParser.mly"
                       (let t = _3 and h = _1 in h::t)
# 121 "SymCamlParser.ml"
               : SymCamlData.symexpr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 40 "SymCamlParser.mly"
                               (
    let name = _1 and varname = _3 in
    if name = "Symbol" then
      Symbol(varname)
    else if name = "Wild" then
      Symbol(varname)
    else 
      raise (SymCamlParserError ("only symbols can have token arguments: "^name^":"^varname))
  )
# 137 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 49 "SymCamlParser.mly"
                                (
    let name = _1 and value = _3 in
    if name = "Integer" then
      Integer(value)
    else 
      raise (SymCamlParserError "only integers can have int arguments")
  )
# 151 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 56 "SymCamlParser.mly"
                                              (
    let name = _1 and numer = _3 and denom = _5 in
    if name = "Rational" then
      let fnumer : float = float(numer) and fdenom : float = float(denom) in
      let res : float = fnumer /. fdenom in
      Decimal(res)
    else 
      raise (SymCamlParserError "only numerators can have two int arguments")
  )
# 168 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : float) in
    Obj.repr(
# 65 "SymCamlParser.mly"
                                (
    let name = _1 and value = _3 in
    if name = "XXX" then
      Decimal(value)
    else 
      raise (SymCamlParserError "only XXX can have decimal arguments")
  )
# 182 "SymCamlParser.ml"
               : SymCamlData.symexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : SymCamlData.symexpr list) in
    Obj.repr(
# 72 "SymCamlParser.mly"
                                (
    let name = _1 and lst = _3 in
    match (name,List.length lst) with
    | ("Pow",2) -> Exp(List.nth lst 0,List.nth lst 1)
    | ("Add",_) -> Add(lst)
    | ("Mul",_) -> Mult(lst)
    | ("Equality",2) -> Eq(List.nth lst 0,List.nth lst 1)
    | ("Derivative",_) -> 
      begin
      match lst with 
      | vexpr::arglist -> 
        let rec proc_lst l :(symvar*int) list = match l with
          | Symbol(x)::Integer(i)::t -> (x,i)::(proc_lst t)
          | Symbol(x)::[]-> [(x,1)]
          | _ -> raise (SymCamlParserError "derivative requires symbol-int pattern.")
        in
        let derivs = proc_lst arglist in 
          Deriv(vexpr, derivs)
      | [] -> raise (SymCamlParserError "derivative requires expression.")
      end
    | (n,l) -> raise (SymCamlParserError 
      ("unexpected function "^n^" or number of arguments "^(string_of_int l)))
  )
# 212 "SymCamlParser.ml"
               : SymCamlData.symexpr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : SymCamlData.symexpr)
;;
