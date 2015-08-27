open HWData
open Util
open SymCaml
open SymCamlData
open SymLib 

open Str

exception HWLibException of string;;

module HWUtil :
sig
   val hwid2str : hwid -> string
   val hwsym2str : hwsymbol -> string
   val hwlit2str : hwliteral -> string
   val hwexpr2str : hwexpr -> string 
   val hwrel2str : hwrel -> string

   val hwexpr2symbols : hwexpr -> hwsymbol list 
   val hwrel2symbols  : hwrel -> hwsymbol list 

   val scrubns4literal : hwliteral -> string option -> hwliteral 
   val scrubns4expr : hwexpr -> string option -> hwexpr 
   val scrubns4rel : hwrel -> string option -> hwrel

   val wrapns4literal : hwliteral -> string -> hwliteral
   val wrapns4expr : hwexpr -> string -> hwexpr 
   val wrapns4rel : hwrel -> string -> hwrel

   val map2expr : hwexpr -> (hwexpr -> hwexpr option) -> hwexpr 
   val map2rel : hwrel -> (hwexpr -> hwexpr option) -> hwrel
   
end =
struct 
   let hwid2str h = match h with
      |(i,Some(n)) -> (string_of_int i)^"."^n
      |(i,None) -> (string_of_int i)
   
   let rec hwsym2str h = match h with
      |Input(x) -> "i:"^x
      |Output(x) -> "o:"^x
      |Param(x) -> "p:"^x 
      |FixedParam(x,d) -> x^":"^(string_of_float d)
      |Namespace(x,v) -> x^"."^(hwsym2str v)

   let rec hwlit2str h = match h with
      | Voltage(v) -> "V("^(hwsym2str v)^")"
      | Current(v) -> "I("^(hwsym2str v)^")"

   let rec hwexpr2str (h:hwexpr) = 
      let hwexprlst2str lst delim =
            begin
            match lst with
               | h::t -> List.fold_right (fun x y -> y^delim^(hwexpr2str x)) t (hwexpr2str h)
               | [] -> raise (HWLibException ("cannot print operation "^delim^" with no arguments."))
            end
      in
      match h with   
      | Add(lst) -> hwexprlst2str lst "+"
      | Sub(lst) -> hwexprlst2str lst "-"
      | Mult(lst) -> hwexprlst2str lst "\\cdot"
      | Div(x,y) -> "\\frac{"^(hwexpr2str x)^"}{"^(hwexpr2str y)^"}"
      | Exp(x,y) -> "{"^(hwexpr2str x)^"}^{"^(hwexpr2str y)^"}"
      | Deriv(x) -> "\\frac{\\partial}{\\partial t}"^(hwexpr2str x)
      | NatExp(x) ->"e^{"^(hwexpr2str x)^"}"
      | Literal(l) -> hwlit2str l
      | Decimal(x) -> string_of_float x 
      | Integer(x) -> string_of_int x 

   let rec hwrel2str (r:hwrel) = 
      match r with
      | Eq(a,b) -> (hwexpr2str a)^"="^(hwexpr2str b)
      | Set(a,b) -> (hwlit2str a)^":="^(hwexpr2str b)

   let _make_symbols_unique (lst: hwsymbol list) : hwsymbol list =
      match lst with 
         | a::b -> 
            let tl = List.filter (fun x -> x <> a) b in a::tl 
         | [] -> []

   let hwexpr2symbols (h:hwexpr) : hwsymbol list = 
      let rec _hwexpr2symbols (h:hwexpr) : hwsymbol list = 
         let hwexprlst2symbols lst : hwsymbol list = 
            List.fold_right (fun x r -> (_hwexpr2symbols x) @ r) lst []
         in
         match h with 
         |Add(lst) -> hwexprlst2symbols lst
         |Sub(lst) -> hwexprlst2symbols lst
         |Mult(lst) -> hwexprlst2symbols lst
         |Literal(Voltage(l)) -> [l]
         |Literal(Current(l)) -> [l]
         |Deriv(x) -> _hwexpr2symbols x
         |NatExp(x) -> _hwexpr2symbols x
         |Exp(x,y) -> (_hwexpr2symbols x) @ (_hwexpr2symbols y)
         |Div(x,y) -> (_hwexpr2symbols x) @ (_hwexpr2symbols y)
         | _ -> []
      in
      let hunc = _hwexpr2symbols h in 
      _make_symbols_unique hunc 

   let hwrel2symbols (r:hwrel) : hwsymbol list = 
      match r with 
      |Eq(a,b) -> _make_symbols_unique ((hwexpr2symbols a) @ (hwexpr2symbols b))
      |Set(Voltage(a),b) -> _make_symbols_unique (a::(hwexpr2symbols b))
      |Set(Current(a),b) -> _make_symbols_unique (a::(hwexpr2symbols b))


   let scrubns4literal (l:hwliteral) (ns: string option) : hwliteral = 
      let rec scrubns4symbols (s:hwsymbol) : hwsymbol = match s with 
         | Namespace(n,e) -> 
            begin
            match (n,ns) with 
            |(curr_name, Some(ns)) -> if curr_name = ns then (scrubns4symbols e) else s
            |(_, None) -> scrubns4symbols e
            end
         | _ -> s
      in
      match l with 
      | Current(s) -> Current (scrubns4symbols s) 
      | Voltage(s) -> Current (scrubns4symbols s)

   let scrubns4expr (e:hwexpr) (ns:string option) =
      let rec _scrubsns4expr (h:hwexpr) : hwexpr = 
         let scrubsns4exprlst lst : hwexpr list = 
            List.fold_right (fun x r -> (_scrubsns4expr x)::r) lst []
         in
         match h with 
         |Add(lst) -> Add (scrubsns4exprlst lst)
         |Sub(lst) -> Sub (scrubsns4exprlst lst)
         |Mult(lst) -> Mult (scrubsns4exprlst lst)
         |Literal(l) -> Literal(scrubns4literal l ns)
         |Deriv(x) -> Deriv (_scrubsns4expr x)
         |NatExp(x) -> NatExp (_scrubsns4expr x)
         |Exp(x,y) -> Exp (_scrubsns4expr x,_scrubsns4expr y)
         |Div(x,y) -> Div (_scrubsns4expr x,_scrubsns4expr y)
         | a -> a
      in
      let nunc = _scrubsns4expr e in 
      nunc

   let scrubns4rel (r:hwrel) (ns:string option) : hwrel = 
      match r with 
      |Eq(a,b) -> Eq(scrubns4expr a ns, scrubns4expr b ns)
      |Set(a,b) -> Set(scrubns4literal a ns, scrubns4expr b ns)

   let wrapns4literal l ns = 
      match l with 
      | Voltage(s) -> Voltage(Namespace(ns,s))
      | Current(s) -> Current(Namespace(ns,s))

   let wrapns4expr ex ns = 
      let rec _wrapns4expr (h:hwexpr) : hwexpr = 
         let wrapns4exprlst lst : hwexpr list = 
            List.fold_right (fun x r -> (_wrapns4expr x)::r) lst []
         in
         match h with 
         |Add(lst) -> Add (wrapns4exprlst lst)
         |Sub(lst) -> Sub (wrapns4exprlst lst)
         |Mult(lst) -> Mult (wrapns4exprlst lst)
         |Literal(l) -> Literal(wrapns4literal l ns)
         |Deriv(x) -> Deriv (_wrapns4expr x)
         |NatExp(x) -> NatExp (_wrapns4expr x)
         |Exp(x,y) -> Exp (_wrapns4expr x,_wrapns4expr y)
         |Div(x,y) -> Div (_wrapns4expr x,_wrapns4expr y)
         | a -> a
      in
      let nunc = _wrapns4expr ex in 
      nunc
   let wrapns4rel (r:hwrel) (ns:string) : hwrel = 
      match r with 
      |Eq(a,b) -> Eq(wrapns4expr a ns, wrapns4expr b ns)
      |Set(a,b) -> Set(wrapns4literal a ns, wrapns4expr b ns)

   let map2expr (ex:hwexpr) (fn:hwexpr -> hwexpr option) : hwexpr = 
      let rec _map2expr (h:hwexpr) : hwexpr = 
      let map2exprlst lst : hwexpr list = 
            List.map _map2expr lst
         in
         let res = fn h in 
         match res with 
         | None ->
            begin
            match h with 
            |Add(lst) -> Add (map2exprlst lst)
            |Sub(lst) -> Sub (map2exprlst lst)
            |Mult(lst) -> Mult (map2exprlst lst)
            |Deriv(x) -> Deriv (_map2expr x)
            |NatExp(x) -> NatExp (_map2expr x)
            |Exp(x,y) -> Exp (_map2expr x,_map2expr y)
            |Div(x,y) -> Div (_map2expr x,_map2expr y)
            | other -> other
            end
         |Some(x) -> x
      in 
      _map2expr ex

   let map2rel (r:hwrel) (fn: hwexpr -> hwexpr option) : hwrel = 
      match r with 
      |Eq(a,b) -> Eq(map2expr a fn, map2expr b fn)
      |Set(a,b) -> 
         begin 
         let y = map2expr b fn in 
         match fn (Literal a) with 
         | Some(Literal(x)) -> Set(x, y)
         | _ -> Set(a, y)
         end
end


module HWComp :
sig
   val create : string -> hwcomp 
   val add_input : hwcomp -> string -> hwcomp
   val add_output : hwcomp -> string-> hwcomp
   val add_param : hwcomp -> string -> hwdecimal option-> hwcomp
   val add_constraint: hwcomp -> hwrel -> hwcomp
   (*
   val bind : hwcomp -> string -> hwid -> hwcomp
   *)
   val comp2str : hwcomp -> string
   val clone : hwcomp-> hwcomp
end = 
struct
   let create ns : hwcomp = 
      {ports=[];constraints=[];ns=ns}
   
   let add_input (c:hwcomp) (name:string) : hwcomp = 
      c.ports <- (Namespace(c.ns,(Input name)))::c.ports; c

   let add_output (c:hwcomp) (name:string) : hwcomp = 
      c.ports <- (Namespace(c.ns,(Output name)))::c.ports; c

   let add_param (c:hwcomp) name value = 
      let new_id = match value with 
         |Some(v) -> Namespace(c.ns,(FixedParam(name,v) ))
         |None -> Namespace(c.ns,(Param name))
      in
      c.ports <-new_id::c.ports; c

   let add_constraint (c:hwcomp) rel = 
      c.constraints <- rel::c.constraints; c


   let clone (c:hwcomp) : hwcomp =
      {ns=c.ns; ports=c.ports; constraints=c.constraints}

   let comp2str (c:hwcomp) : string = 
      let print_port i = "   port "^(HWUtil.hwsym2str i)^"\n" in
      let print_relation r = "   rel "^(HWUtil.hwrel2str r)^"\n" in
      let rec print_list func lst = match lst with
         |h::t -> (func h)^(print_list func t)
         |[] -> ""
      in
      let name = c.ns in
      name^";\n"^
      (print_list (print_port) c.ports)^
      (print_list (print_relation) c.constraints)
end

module HWElem :
sig
   val elem2str : hwelem -> string
   val clone :  hwelem-> hwelem
end = 
struct 
   let elem2str e = match e with
      | Component(x) -> HWComp.comp2str x
      | _ -> "unsupported.\n"

   let clone e = match e with
      |Component(x) -> Component (HWComp.clone x)
      | _ -> raise (HWLibException "cloning other elements unsupported.")

end

module HWSchem :
sig
   val create : string -> hwschem
   val add_input: hwschem -> string -> hwschem
   val add_output: hwschem -> string -> hwschem

   val add_elem: hwschem -> string -> hwelem -> hwschem
   val schem2str: hwschem -> string
end = 
struct
   let create name : hwschem = 
      {ports=[];elems=[];ns=name}

   let add_elem sc n e =
      sc.elems <- e::sc.elems; sc

   let add_input (c:hwschem) name : hwschem = 
      let new_id = Namespace(c.ns, Input(name)) in
      c.ports <- new_id::c.ports; c

   let add_output (c:hwschem) name : hwschem = 
      let new_id = Namespace(c.ns, Output(name)) in
      c.ports <- new_id::c.ports; c

   let schem2str (h:hwschem) : string = 
      let rec list2str func ws = match ws with
         | h::t -> (func h )^(list2str func t)
         | [] -> ""
      in 
      
      let port2str e = HWUtil.hwsym2str e in 
      let elem2str e = "unknown"^" -> "^HWElem.elem2str e in
      
         "schematic: "^h.ns^"\n"^
         (list2str port2str h.ports)^
         (list2str elem2str h.elems)

end

module HWArch :
sig
   val create : unit -> hwarch
   val create_config : unit -> hwconfig
   val config2str : hwconfig -> string
   val arch2str : hwarch -> string
end =
struct
   let create () = 
      {schem=HWSchem.create "root"}
   let create_config () = None
   let config2str c = ""
   let arch2str a = HWSchem.schem2str a.schem
end

module HWSymLib :
sig
   type wildtype = Param | Var 

   val wildtype_of_int : int -> wildtype
   val hwcomp2symenv : hwcomp -> bool -> SymLib.symenv
   

   val symvar2hwliteral : string -> hwliteral
   val symexpr2hwexpr : symexpr  -> hwexpr 
   val symexpr2hwrel : symexpr -> hwrel

end = 
struct
   type wildtype = Param | Var 
   let int_of_wildtype w = match w with Param -> 0 | Var -> 1
   let wildtype_of_int w = match w with 0 -> Param | 1 -> Var 
      | _ -> raise (HWLibException "unexpected int to wildtype")

   let rec mangle (l:hwliteral) = 
      let pdelim = ":" in 
      let sdelim = "$" in 
      let iodelim = "|" in
      let rec mangle_sym (s:hwsymbol) = 
         match s with 
         |Namespace(q,e) -> q^sdelim^(mangle_sym e)
         |Input(x) -> "in"^iodelim^x
         |Output(x) -> "out"^iodelim^x
         |Param(x) -> "param"^iodelim^x
         |FixedParam(x,n) -> raise (HWLibException ("fixed parameter not supported")) 
      in
      match l with 
         | Current(x) -> (mangle_sym x)^pdelim^"I"
         | Voltage(x) -> (mangle_sym x)^pdelim^"V"

   let symvar2hwliteral n : hwliteral =
      let delim = ":" in 
      let sdelim = "\$" in 
      let iodelim = "|" in
      let parse_id str = 
         let rec mkid lst = match lst with
            | h::h2::t -> Namespace(h, mkid (h2::t))
            | [h] -> 
               begin 
                  match (Str.split (Str.regexp iodelim) h) with 
                  | ["in";name] -> Input(name)
                  | ["out";name] -> Output(name)
                  | ["param";name] -> Param(name)
                  | _ -> raise (HWLibException ("kind: unknown literal {"^str^"}")) 
               end
            | [] -> raise (HWLibException ("ns: unknown literal {"^str^"}"))
         in 
         mkid (Str.split (Str.regexp sdelim) str)
      in
      match Str.split (Str.regexp delim) n with 
      | [id;"V"] -> Voltage(parse_id id)
      | [id;"I"] -> Current(parse_id id)
      | _ -> raise (HWLibException ("t:unknown literal "^n))

   let symexpr2hwexpr (e:symexpr): hwexpr = 
      let rec _symexpr2hwexpr e : hwexpr =
         let symexprlst2hwexprlst lst = 
               List.map (fun x -> _symexpr2hwexpr x) lst 
         in
         match e with 
            | Add(lst) -> Add (symexprlst2hwexprlst lst)
            | Sub(lst) -> Sub (symexprlst2hwexprlst lst)
            | Mult(lst) -> Mult (symexprlst2hwexprlst lst)
            | Div(a,b) -> Div(_symexpr2hwexpr a,_symexpr2hwexpr b)
            | Exp(a,b) -> Exp (_symexpr2hwexpr a,_symexpr2hwexpr b)
            | NatExp(a) -> NatExp (_symexpr2hwexpr a)
            | Symbol(e) -> Literal (symvar2hwliteral e)
            | Deriv(e,dlst) -> Deriv(_symexpr2hwexpr e)
            | Integer(i) -> Integer(i)
            | Decimal(d) -> Decimal(d)
            | _ -> Literal(Current(Input("?")))
      in 
      _symexpr2hwexpr e

   let symexpr2hwrel e : hwrel= 
	  match e with
	  | Eq(v,r) -> Eq (symexpr2hwexpr v, symexpr2hwexpr r)
	  | _ -> Eq(Literal(Current(Input("?"))), Literal(Current(Input("?"))))

   let rec hwcomp2symenv (h:hwcomp) is_virt =
      let rec hwexpr2symexpr (e:hwexpr) : symexpr = 
         let exprlst2symexprlst lst = 
            List.map (fun x -> hwexpr2symexpr x) lst 
         in
         match e with 
         | Add(lst) -> Add(exprlst2symexprlst lst)
         | Sub(lst) -> Sub(exprlst2symexprlst lst)
         | Mult(lst) -> Mult(exprlst2symexprlst lst)
         | Div(n,d) -> Div(hwexpr2symexpr n, hwexpr2symexpr d)
         | Exp(b,e) -> Exp(hwexpr2symexpr b, hwexpr2symexpr e)
         | NatExp(e) -> NatExp(hwexpr2symexpr e) 
         | Deriv(e) -> Deriv(hwexpr2symexpr e, [("t",1)])
         | Literal(l) -> 
            begin 
               match l with 
               | Voltage(FixedParam(l,n)) -> Decimal(n)
               | Current(FixedParam(l,n)) -> Decimal(n)
               | x -> Symbol(mangle x)
            end
         | Literal(x) -> Symbol(mangle x)
         | Integer(x) -> Integer(x)
         | Decimal(x) -> Decimal(x)
         | _ -> raise (SymLibException "unhandled symlib expr")
      in 
      let hwrel2symrel (r:hwrel) : symexpr = match r with 
         |Eq(a,b) -> Eq((hwexpr2symexpr a),(hwexpr2symexpr b))
         |Set(a,b) -> Eq((hwexpr2symexpr (Literal a)),(hwexpr2symexpr b))
      in
      let rec ports2symlst (r:hwsymbol list) : SymLib.wctype list = 
         let proc (h:hwsymbol) : SymLib.wctype list= 
            match h with 
            |Param(_) -> 
               let hid = int_of_wildtype Param in 
               [(mangle (Voltage h),[]);(mangle (Current h),[])]
            |_ ->
               let hid = int_of_wildtype Var in 
               [(mangle (Voltage h),[]);(mangle (Current h),[])]
         in
         match r with 
         |FixedParam(n,s)::t -> (ports2symlst t)
         |h::t -> (proc h)@(ports2symlst t)
         |[] -> []
      in
      let s : SymLib.symenv = {vars=[];wildcards=[];exprs=[];ns=h.ns} in
      let vars = (ports2symlst h.ports) in
      if is_virt then 
         s.wildcards <- vars
      else
         s.vars <- List.map (fun (b,c) -> b) vars
      ;
      s.exprs <- List.map hwrel2symrel h.constraints;
      s
end
