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
   val hwlit2str : hwliteral -> string

   val str2iid : string -> inst
   val str2compid : string -> compid
   val str2portid : string -> portid
   val str2hwprop : string -> hwprop
   val str2hwlit : string -> hwliteral

   val hwprop2str : hwprop -> string
   val hwsym2str : hwsymbol -> string
   val hwlit2str : hwliteral -> string
   val hwexpr2str : hwexpr -> string
   val hwrel2str : hwrel -> string

   val hwexpr2symbols : hwexpr -> hwsymbol list
   val hwrel2symbols  : hwrel -> hwsymbol list



   val map2expr : hwexpr -> (hwexpr -> hwexpr option) -> hwexpr
   val map2rel : hwrel -> (hwexpr -> hwexpr option) -> hwrel

end =
struct

   let mkiid i = match i with Some(i) -> Instance(i) | None -> Any
   let mkcompid s i = (s, mkiid i)
   let mkportid p s i = (p , mkcompid s i)

   let hwprop2str h = match h with Voltage -> "V" | Current -> "I"
   let iid2str i = match i with Any -> "?" | Instance(v) -> string_of_int v
   let compid2str (c,i) = c^"#"^(iid2str i)
   let portid2str (p,c) = (compid2str c)^"<"^p^">"
   let hwsym2str h = match h with
       | Input(x) -> "in:"^(portid2str x)
       | Output(x) -> "out:"^(portid2str x)

   let hwlit2str h = match h with
       | Var(p,x) -> (hwprop2str p)^"{"^(hwsym2str x)^"}"
       | Param(p) -> p

   let str2iid s =
       match s with
       | "?" -> Any
       | n ->
        try
          let num = int_of_string n in Instance(num)
        with Failure(_) -> raise (HwLibException ("str2iid: malformed expression: <"^s^">"))

   let str2compid s =
       let iodelim  = "#" in
       match (Str.split (Str.regexp iodelim) s) with
       | [name;id] -> (name, str2iid id)
       | _ -> raise (HwLibException ("str2compid: malformed expression: <"^s^">"))

   let str2portid s =
       let iodelim  = "[\\<\\>]" in
       match (Str.split (Str.regexp iodelim) s) with
       | id::port::[] -> let c = str2compid id in (port,c)
       | h::t -> raise (HwLibException ("str2portid: malformed expression: <"^h^"> of <"^s^">")  )

   let str2hwprop s = match s with
    | "V" -> Voltage
    | "I" -> Current
    | _ -> raise (HwLibException  ("str2hwprop: malformed expression: <"^s^"> ") )

   let str2hwsym s =
    let iodelim = ":" in
    match Str.split (Str.regexp iodelim) s with
    | ["in";rest] -> let v = str2portid rest in Input(v)
    | ["out";rest] -> let v = str2portid rest in Output(v)
    | _ -> raise (HwLibException  ("str2hwsym: malformed expression: <"^s^"> ") )

   let str2hwlit s =
      let iodelim = "[{}]+" in
      match Str.split (Str.regexp iodelim) s with
      | [kind;id] -> let pr = str2hwprop kind and pid = str2hwsym id in
        Var(pr, pid)
      | _ -> raise (HwLibException  ("str2hwsym: malformed expression: <"^s^"> ") )
      | [name] -> Param(name)
      | h::t -> raise (HwLibException  ("str2hwlit: malformed expression: <"^h^"> of <"^s^">") )


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
      c.ports <- (Input (HwUtil.mkportid name c.name None))::c.ports; c

   let add_output (c:hwcomp) (name:string) : hwcomp =
      c.ports <- (Output (HwUtil.mkportid name c.name None))::c.ports; c

   let add_param (c:hwcomp) name value =
      c.params <- (name,value)::c.params; c

   let get_param (c:hwcomp) name =
      let res = List.filter (fun (x,v) -> x = name) c.params in
      match res with
      | [] -> raise (HwLibException ("No parameter with name <"^name^"> found"))
      | [(s,n)] -> n
      | h::t -> raise (HwLibException ("Multiple declarations of parameter with name <"^name^"> found"))

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

   let rec mangle (l:hwliteral) = HwUtil.hwlit2str l

   let symvar2hwliteral n : hwliteral = HwUtil.str2hwlit n

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
               | v -> Symbol(mangle v)
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
      let s : SymLib.symenv = SymLib.create_env (h.name) in
      let vars = (ports2symlst h.ports) in
      if is_virt then
         s.wildcards <- vars
      else
         s.vars <- List.map (fun (b,c) -> b) vars
      ;
      s.exprs <- List.map hwrel2symrel h.relations;
      s
end
