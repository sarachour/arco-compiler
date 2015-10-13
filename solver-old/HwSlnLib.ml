open HwData
open HwLib
open HwSlnData
open Util

exception SlnException of string;;

module SlnUtils:
sig
   val action2str : string -> sln_action -> string
   val actions2str : string -> sln_action list -> string
   val sln2str : string -> sln -> string
   val sln2stdout : string -> sln -> unit

end =
struct
  let action2str (prefix:string) (d:sln_action) : string = match d with
      | SUseComponent(hwc) ->
         prefix^"use component "^(HwUtil.compid2str hwc)
      | SAddWire(src,sink) ->
         prefix^(HwUtil.portid2str src)^" -> "^(HwUtil.portid2str sink)
      | SSetPort(p,n,e) ->
         (HwUtil.hwprop2str p)^" "^(HwUtil.portid2str n)^":="^(string_of_float e)

    let actions2str prefix (d:sln_action list) : string =
      List.fold_right (fun x r -> r^(action2str prefix x)^"\n") d ""

    let sln2str prefix (d:sln) : string =
      (*actions2str prefix d.actions*)
      "sln2str: not implemented"


    let sln2stdout prefix (d:sln) : unit =
      (*actions2str prefix d.actions*)
      let _ = Printf.printf "sln2str: not implemented" in
      ()

end


module Constraint :
sig
    (*Add elem to state*)
    val action2state : sln_action -> sln_state option
    val rule_applies : (elem_cstr,conn_cstr) pair -> sln_action -> bool
    val check: system_cstr -> sln_state list -> sln_action -> bool
end =
struct
    let action2state = raise (SlnException "action2state: unimplemented")
    let rule_applies = raise (SlnException "rule_applies: unimplemented")
    let check= raise (SlnException "check: unimplemented")

end

module Solution :
sig
  val create : unit -> sln
  val update_actions : sln -> sln_action -> sln
  val update_state : sln -> sln_state -> sln
  val sln2str : sln -> string
  val sln2spice : sln -> string
end =
struct

    let create= raise (SlnException "create: unimplemented")
    let update_actions= raise (SlnException "update_actions: unimplemented")
    let update_state= raise (SlnException "update_state: unimplemented")
    let sln2str= raise (SlnException "sln2str: unimplemented")
    let sln2spice= raise (SlnException "sln2spice: unimplemented")

end
