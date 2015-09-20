open HWSolData

module Util:
sig
   val portid2str : port_id -> string
   val compid2str : comp_id -> string
   val action2str : sln_action -> string
   val actions2str : sln_action list -> string

end =
struct
  let compid2str (n,i) = n^"."^(string_of_int i)
  let portid2str (n,c,i) : string = (compid2str (c,i))^"["^n^"]"
  let _action2str (prefix:string) (d:sln_action) : string = match d with
      | DUseComponent(hwc) ->
         prefix^"use component "^(compid2str)
      | DAddWire(src,sink) ->
         prefix^(portid2str src)^" -> "^(portid2str sink)
      | DSetPort(n,e) ->
         n^":="^(string_of_float e)
      | DNone -> "none"

    let action2str (d:sln_action) : string = _action2str "" d
    let actions2str (d:sln_action list) : string =
      List.fold_right (fun x r -> r^(action2str x)"\n") d ""

end
