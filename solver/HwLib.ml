open HwData
open Util
open SymCaml
open SymCamlData
open SymLib

open Str

exception HwLibException of string;;

module HwUtil :
sig
   val mkiid: int option -> inst
   val mkcompid : string -> int option -> compid
   val mkportid : string -> string -> int option -> portid

   val iid2str : inst -> string
   val compid2str : compid ->string
   val portid2str : portid -> string

   val str2iid : string -> inst
   val str2compid : string -> compid
   val str2portid : string -> portid
   val str2hwprop : string -> hwprop

   val hwprop2str : hwprop -> string
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

   let mkiid i = match i with Some(i) -> Instance(i) | None -> Any
   let mkcompid s i = (s, mkiid i)
   let mkportid p s i = (p , mkcompid s i)

   let iid2str i = match i with Any -> "*" | Instance(v) -> string_of_int v
   let compid2str (c,i) = c^"."^(iid2str i)
   let portid2str (p,c) = (compid2str c)^"["^p^"]"

   let str2iid s = raise (HwLibException "str2iid: Unimplemented")
   let str2compid s = raise (HwLibException "str2compid: Unimplemented")
   let str2portid s = raise (HwLibException "str2portid: Unimplemented")
   let str2hwprop s = raise (HwLibException "str2hwprop: Unimplemented")


   let rec hwsym2str h = match h with
      |Input(x) -> "i:"^(portid2str x)
      |Output(x) -> "o:"^(portid2str x)
      |Namespace(n,x) -> n^"."^(hwsym2str x)

   let hwprop2str h = match h with Voltage -> "V" | Current -> "I"
   let rec hwlit2str h = match h with
      | Var(p,v) -> (hwprop2str p)^"("^(hwsym2str v)^")"
      | Param(x) -> "P."^x

   let rec hwexpr2str (h:hwexpr) =
      let hwexprlst2str lst delim =
            begin
            match lst with
               | h::t -> List.fold_right (fun x y -> y^delim^"("^(hwexpr2str x)^")") t (hwexpr2str h)
               | [] -> raise (HwLibException ("cannot print operation "^delim^" with no arguments."))
            end
      in
      match h with
      | Add(lst) -> hwexprlst2str lst "+"
      | Sub(lst) -> hwexprlst2str lst "-"
      | Mult(lst) -> hwexprlst2str lst " \\cdot "
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
         |Literal(Var(p,l)) -> [l]
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
      | Var(p,s) -> Var(p,scrubns4symbols s)
      | Param(n) -> Param(n)

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

   let wrapns4literal l ns =
      match l with
      | Var(p,s) -> Var(p,Namespace(ns,s))
      | Param(s) -> Param(s)

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
end


module HwComp :
sig
   val create : string -> hwcomp
   val add_input : hwcomp -> string -> hwcomp
   val add_output : hwcomp -> string-> hwcomp
   val set_spice : hwcomp -> string-> hwcomp
   val add_param : hwcomp -> string -> float-> hwcomp
   val get_param : hwcomp -> string -> float
   val add_constraint: hwcomp -> hwrel -> hwcomp
   (*
   val bind : hwcomp -> string -> hwid -> hwcomp
   *)
   val comp2str : hwcomp -> string
   val clone : hwcomp-> hwcomp
end =
struct
   let create name : hwcomp =
      {ports=[];relations=[];params=[];spice="";name=name}

   let add_input (c:hwcomp) (name:string) : hwcomp =
      c.ports <- (Input (HwUtil.mkportid c.name name None))::c.ports; c

   let add_output (c:hwcomp) (name:string) : hwcomp =
      c.ports <- (Output (HwUtil.mkportid c.name name None))::c.ports; c

   let add_param (c:hwcomp) name value =
      c.params <- (name,value)::c.params; c

   let get_param (c:hwcomp) name = raise (HwLibException "get_param: Unimplemented.")

   let add_constraint (c:hwcomp) rel =
      c.relations <- rel::c.relations; c

   let set_spice (c:hwcomp) spice =
      c.spice <- spice; c

   let clone (c:hwcomp) : hwcomp =
      {name=c.name; ports=c.ports; params = c.params; spice=c.spice;relations=c.relations}

   let comp2str (c:hwcomp) : string =
      let print_port i = "   port "^(HwUtil.hwsym2str i)^"\n" in
      let print_relation r = "   rel "^(HwUtil.hwrel2str r)^"\n" in
      let rec print_list func lst = match lst with
         |h::t -> (func h)^(print_list func t)
         |[] -> ""
      in
      let name = c.name in
      name^";\n"^
      (print_list (print_port) c.ports)^
      (print_list (print_relation) c.relations)
end

module HwElem :
sig
   val elem2str : hwelem -> string
   val clone :  hwelem-> hwelem
end =
struct
   let elem2str e = match e with
      | Component(x) -> HwComp.comp2str x
      | _ -> "unsupported.\n"

   let clone e = match e with
      |Component(x) -> Component (HwComp.clone x)
      | _ -> raise (HwLibException "cloning other elements unsupported.")

end

module HwSchem :
sig
   val create : string -> hwschem
   val add_input: hwschem -> string -> hwschem
   val add_output: hwschem -> string -> hwschem

   val add_elem: hwschem -> string -> hwelem -> hwschem
   val schem2str: hwschem -> string
end =
struct
   let create name : hwschem =
      {ports=[];elems=[];name=name}

   let add_elem sc n e =
      sc.elems <- e::sc.elems; sc

   let add_input (c:hwschem) (name:string) : hwschem =
      let new_id = Input (HwUtil.mkportid name c.name None) in
      c.ports <- new_id::c.ports; c

   let add_output (c:hwschem) (name:string) : hwschem =
      let new_id = Output (HwUtil.mkportid name c.name None) in
      c.ports <- new_id::c.ports; c

   let schem2str (h:hwschem) : string =
      let rec list2str func ws = match ws with
         | h::t -> (func h )^(list2str func t)
         | [] -> ""
      in

      let port2str e = HwUtil.hwsym2str e in
      let elem2str e = "unknown"^" -> "^HwElem.elem2str e in

         "schematic: "^h.name^"\n"^
         (list2str port2str h.ports)^
         (list2str elem2str h.elems)

end

module HwArch :
sig
   val create : unit -> hwarch
   val create_config : unit -> hwconfig
   val config2str : hwconfig -> string
   val arch2str : hwarch -> string
end =
struct
   let create () =
      {schem=HwSchem.create "root"}
   let create_config () = None
   let config2str c = ""
   let arch2str a = HwSchem.schem2str a.schem
end

module HwSymLib :
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
      | _ -> raise (HwLibException "unexpected int to wildtype")

   let rec mangle (l:hwliteral) =
      let pdelim = ":" in
      let sdelim = "$" in
      let iodelim = "|" in
      let rec mangle_sym (s:hwsymbol) =
         match s with
         | Namespace(q,e) -> q^sdelim^(mangle_sym e)
         | Input(x) -> "in"^iodelim^(HwUtil.portid2str x)
         | Output(x) -> "out"^iodelim^(HwUtil.portid2str x)
      in
      match l with
         | Var(p,x) -> "v"^pdelim^(mangle_sym x)^pdelim^(HwUtil.hwprop2str p)
         | Param(x) -> "p"^pdelim^x

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
                  | ["in";name] -> Input (HwUtil.str2portid name)
                  | ["out";name] -> Output (HwUtil.str2portid name)
                  | _ -> raise (HwLibException ("kind: unknown literal {"^str^"}"))
               end
            | [] -> raise (HwLibException ("ns: unknown literal {"^str^"}"))
         in
         mkid (Str.split (Str.regexp sdelim) str)
      in
      match Str.split (Str.regexp delim) n with
      | ["v";id;pstr] -> let pr = HwUtil.str2hwprop pstr in Var(pr,parse_id id)
      | ["p";name] -> Param (name)
      | _ -> raise (HwLibException ("t:unknown literal "^n))

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
            | _ -> Literal(Param("?"))
      in
      _symexpr2hwexpr e

   let symexpr2hwrel e : hwrel=
	  match e with
	  | Eq(v,r) -> Eq (symexpr2hwexpr v, symexpr2hwexpr r)
	  | _ -> Eq(Literal(Param("?")), Literal(Param("?")))

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
               | Param(l) -> Decimal(HwComp.get_param h l)
               | x -> Symbol(mangle x)
            end
         | Literal(x) -> Symbol(mangle x)
         | Integer(x) -> Integer(x)
         | Decimal(x) -> Decimal(x)
         | _ -> raise (SymLibException "unhandled symlib expr")
      in
      let hwrel2symrel (r:hwrel) : symexpr = match r with
         |Eq(a,b) -> Eq((hwexpr2symexpr a),(hwexpr2symexpr b))
      in
      let rec ports2symlst (r:hwsymbol list) : SymLib.wctype list =
         let proc (h:hwsymbol) : SymLib.wctype list=
            match h with
            |_ ->
               let hid = int_of_wildtype Var in
               [(mangle (Var(Voltage,h)) ,[]);(mangle (Var(Current,h)) ,[])]
         in
         match r with
         |h::t -> (proc h)@(ports2symlst t)
         |[] -> []
      in
      let s : SymLib.symenv = SymLib.create_env() in
      let vars = (ports2symlst h.ports) in
      if is_virt then
         s.wildcards <- vars
      else
         s.vars <- List.map (fun (b,c) -> b) vars
      ;
      s.exprs <- List.map hwrel2symrel h.relations;
      s
end
