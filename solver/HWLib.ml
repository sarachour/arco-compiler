open HWData
open Util

exception HWLibException of string;;

module HWUtil :
sig
   val hwid2str : hwid -> string
   val hwlit2str : hwliteral -> string
   val hwexpr2str : hwexpr -> string 
   val hwrel2str : hwrel -> string
end =
struct 
   let hwid2str h = match h with
      |(i,Some(n)) -> (string_of_int i)^"."^n
      |(i,None) -> (string_of_int i)
   
   let hwlit2str h = match h with
      | Parameter(p) -> p 
      | Voltage(v) -> "V("^v^")"
      | Current(v) -> "I("^v^")"

   let rec hwexpr2str h = 
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
      | Div(x,y) -> "\\frac{"^(hwexpr2str x)^"}{"^(hwexpr2str y)^"}"
      | Mult(lst) -> hwexprlst2str lst "\\cdot"
      | Literal(l) -> hwlit2str l
      | Deriv(x) -> "\\frac{\\partial}{\\partial t}"^(hwexpr2str x)
      | Exp(x,y) -> "{"^(hwexpr2str x)^"}^{"^(hwexpr2str y)^"}"
      | NatExp(x) ->"e^{"^(hwexpr2str x)^"}"

   let rec hwrel2str r = 
      match r with
      | Eq(a,b) -> (hwexpr2str a)^"="^(hwexpr2str b)
      | Set(a,b) -> (hwlit2str a)^":="^(hwexpr2str b)
end


module HWComp :
sig
   val create : string -> hwid -> hwcomp 
   val add_input : hwcomp -> string-> hwid -> hwcomp
   val add_output : hwcomp -> string-> hwid -> hwcomp
   val add_param : hwcomp -> string -> decimal maybe-> hwcomp
   val bind : hwcomp -> string -> hwid -> hwcomp
   val clone :(string -> hwid) -> hwcomp-> hwcomp
   val add_constraint: hwcomp -> hwrel -> hwcomp
   val comp2str : hwcomp -> string
end = 
struct
   let create name hwid : hwcomp = 
      {inputs=[];outputs=[];params=[];constraints=[];id=(name,hwid)}
   
   let add_input (c:hwcomp) name hwid : hwcomp = 
      c.inputs <- (name,hwid)::c.inputs; c

   let add_output (c:hwcomp) name hwid : hwcomp = 
      c.outputs <- (name,hwid)::c.outputs; c

   let add_param (c:hwcomp) name value = 
      c.params <- (name,value)::c.params; c

   let add_constraint (c:hwcomp) rel = 
      c.constraints <- rel::c.constraints; c

   let bind (c:hwcomp) (name) (id) = 
      let bind_to_var (n,x) = if n == name then (n,id) else (n,x) in
      c.inputs <- List.map bind_to_var c.inputs;
      c.outputs <- List.map bind_to_var c.outputs;
      c.id <- bind_to_var c.id;
      c

   let clone (genid: string->hwid)  (c:hwcomp)=
      let (name, id) = c.id in
      let prefix = "comp_"^name^"_" in
      let copy_var (n,x) = let newx = genid (prefix^n) in (n,newx) in
      c.inputs <- List.map copy_var c.inputs;
      c.outputs <- List.map copy_var c.outputs;
      c.id <- copy_var c.id;
      c

   let comp2str (c:hwcomp) : string = 
      let print_param p = match p with
         |(n, Some(v)) -> "    param "^n^" = "^(string_of_float v)^"\n"
         |(n, None) -> "   param "^n^" = ?\n"
      in
      let print_input (n,i) = "   in "^n^" := "^(HWUtil.hwid2str i)^"\n" in
      let print_output (n,i) = "   out "^n^" := "^(HWUtil.hwid2str i)^"\n" in
      let print_relation r = "   rel "^(HWUtil.hwrel2str r)^"\n" in
      let rec print_list func lst = match lst with
         |h::t -> (func h)^(print_list func t)
         |[] -> ""
      in
      let (name,nid) = c.id in
      name^":="^(HWUtil.hwid2str nid)^"\n"^
      (print_list (print_param) c.params)^
      (print_list (print_input) c.inputs)^
      (print_list (print_output) c.outputs)^
      (print_list (print_relation) c.constraints)
end

module HWElem :
sig
   val elem2str : hwelem -> string
   val clone :  (string->hwid) -> hwelem-> hwelem
end = 
struct 
   let elem2str e = match e with
      | Component(x) -> HWComp.comp2str x
      | _ -> "unsupported.\n"

   let clone f e = match e with
      |Component(x) -> Component (HWComp.clone f x)
      | _ -> raise (HWLibException "cloning other elements unsupported.")

end

module HWSchem :
sig
   val create : string->hwid -> hwschem
   val schem2str: hwschem -> string
   val add_input: hwschem -> string -> hwid -> hwschem
   val add_output: hwschem -> string -> hwid -> hwschem
   val add_wire: hwschem -> hwire -> hwschem
   val add_joins: hwschem -> string -> hwterm list -> hwschem
   val add_elem: hwschem -> string -> hwelem -> hwschem
end = 
struct
   let create name hwid : hwschem = 
      {inputs=[];outputs=[];elems=[];wires=[];id=(name,hwid)}

   let add_wire sc w =
      sc.wires <- w::sc.wires; sc

   let add_elem sc n e =
      sc.elems <- (n,e)::sc.elems; sc

   let add_joins sc wire_name js = 
      let results = List.filter (fun {id=(n,i);conns=lst} -> n = wire_name) sc.wires in
            match results with
            | [wire] -> wire.conns <- js @ wire.conns; sc
            | [] -> raise (HWLibException ("no wires with name "^wire_name^" exist in schematic."))
            | _ ->raise (HWLibException ("too many wires with name "^wire_name^" exist in schematic."))

   let schem2str h = 
      let rec list2str func ws = match ws with
         | h::t -> (func h )^(list2str func t)
         | [] -> ""
      in 
      let join2str js = match js with
         | Wire(wn) -> wn^" "
         | Port(en,pn) -> en^"."^pn^" "
      in
      let wire2str ws = match ws with
         | {id=(name,(idx,Some(nid))); conns=clst} -> 
            let join_str = list2str join2str clst in
            "wire "^name^"=["^join_str^"]\n"
         | _ -> raise (HWLibException "unexpected type for wire.")
      in
      let elem2str (n,e) = n^" -> "^HWElem.elem2str e in
      
         "schematic:\n"^
         (list2str wire2str h.wires)^
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
      let st = HWSymTbl.create() in
      let sid = HWSymTbl.add st "root" in
      {schem=HWSchem.create "root" (sid); st=st}
   let create_config () = Constraints([])
   let config2str c = ""
   let arch2str a = HWSchem.schem2str a.schem
end
