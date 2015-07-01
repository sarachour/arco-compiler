open HWData
open Util

exception HWLibException of string;;

module HWUtil :
sig
   val hwid2str : hwid -> string
end =
struct 
   let hwid2str h = match HWSymTbl.get_id h with
   |(i,Some(n)) -> (string_of_int i)^"."^n
   |(i,None) -> (string_of_int i)

end


module HWComp :
sig
   val create : hwid -> hwcomp 
   val add_input : hwcomp -> hwid -> hwcomp
   val add_output : hwcomp -> hwid -> hwcomp
   val add_param : hwcomp -> string -> decimal maybe-> hwcomp
   val comp2str : hwcomp -> string
end = 
struct
   let create hwid : hwcomp = 
      {inputs=[];outputs=[];params=[];behavior=[];id=hwid}
   
   let add_input (c:hwcomp) hwid : hwcomp = 
      c.inputs <- hwid::c.inputs; c

   let add_output (c:hwcomp) hwid : hwcomp = 
      c.outputs <- hwid::c.outputs; c

   let add_param (c:hwcomp) name value = 
      c.params <- (name,value)::c.params; c

   let comp2str (c:hwcomp) : string = 
      let print_param p = match p with
         |(n, Some(v)) -> "param "^n^" = "^(string_of_float v)^"\n"
         |(n, None) -> "param "^n^" = ?\n"
      in
      let print_input i = "in "^(HWUtil.hwid2str i)^"\n" in
      let print_output i = "out "^(HWUtil.hwid2str i)^"\n" in
      let rec print_list func lst = match lst with
         |h::t -> (func h)^(print_list func t)
         |[] -> ""
      in
      (HWUtil.hwid2str c.id)^"\n"^
      (print_list (print_param) c.params)^
      (print_list (print_input) c.inputs)^
      (print_list (print_output) c.outputs)
end

module HWElem :
sig
   val elem2str : hwelem -> string
end = 
struct 
   let elem2str e = match e with
      | Component(x) -> HWComp.comp2str x
      | _ -> "unsupported.\n"
end

module HWSchem :
sig
   val create : hwid -> hwschem
   val schem2str: hwschem -> string
   val add_wire: hwschem -> hwire -> hwschem
   val add_elem: hwschem -> hwelem -> hwschem
end = 
struct
   let create hwid : hwschem = 
      {inputs=[];outputs=[];elems=[];wires=[];id=hwid}

   let add_wire sc w =
      sc.wires <- w::sc.wires; sc

   let add_elem sc e =
      sc.elems <- e::sc.elems; sc

   let schem2str h = 
      let wire2str ws = match ws with
         | {id=Wire(idx,Some(name)); conns=clst} -> "wire "^name^"=[]\n"
         | _ -> raise (HWLibException "unexpected type for wire.")
      in
      let elem2str e = HWElem.elem2str e in
      let rec list2str func ws = match ws with
         | h::t -> (func h )^(list2str func t)
         | [] -> ""
      in 
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
      let sid = HWSymTbl.add st "schem" "root" in
      {schem=HWSchem.create(sid); st=st}
   let create_config () = Constraints([])
   let config2str c = ""
   let arch2str a = HWSchem.schem2str a.schem
end
