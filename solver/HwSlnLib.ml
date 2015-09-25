open HwData
open HwLib
open HwSlnData

module SlnUtil:
sig
   val action2str : string -> sln_action -> string
   val actions2str : string -> sln_action list -> string
   val sln2str : string -> sln -> string

end =
struct
  let action2str (prefix:string) (d:sln_action) : string = match d with
      | DUseComponent(hwc) ->
         prefix^"use component "^(HwUtil.compid2str hwc)
      | DAddWire(src,sink) ->
         prefix^(HwUtil.portid2str src)^" -> "^(HwUtil.portid2str sink)
      | DSetPort(p,n,e) ->
         (HwUtil.hwprop2str p)^" "^(HwUtil.portid2str n)^":="^(string_of_float e)
      | DNone -> "none"

    let actions2str prefix (d:sln_action list) : string =
      List.fold_right (fun x r -> r^(action2str prefix x)^"\n") d ""

    let sln2str prefix (d:sln) : string =
      actions2str prefix d.actions
end
