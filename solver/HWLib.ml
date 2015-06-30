open HWData
open Util

exception HWLibException of string;;

module HWComp :
sig
   val create : hwid -> hwcomp 
   val create_agg : hwid -> hwcomp_agg
   val create_switch : hwid -> hwcomp_switch
end = 
struct
   let create hwid : hwcomp = 
      {inputs=[];outputs=[];params=[];behavior=[];id=hwid}
   let create_agg hwid : hwcomp_agg = 
      {inputs=[];outputs=[];params=[];subcomps=[];conns=[];id=hwid}
   let create_switch hwid : hwcomp_switch = 
      {inputs=[];outputs=[];params=[];subcomps=[];conns=[];id=hwid}


end

module HWSchem :
sig
   val create : hwid -> hwschem
   val schem2str: hwschem -> string
   val add_wire: hwschem -> hwire -> hwschem

end = 
struct
   let create hwid : hwschem = 
      {inputs=[];outputs=[];elems=[];wires=[];id=hwid}

   let add_wire sc w =
      sc.wires <- w::sc.wires; sc

   let schem2str h = 
      let wire2str ws = match ws with
         | {id=Wire(idx,Some(name)); conns=clst} -> "wire "^name^"=[]\n"
         | _ -> raise (HWLibException "unexpected type for wire.")
      in
      let rec wires2str ws = match ws with
         | h::t -> (wire2str h )^(wires2str t)
         | [] -> ""
      in 
         "schematic.\n"^
         (wires2str h.wires)

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
