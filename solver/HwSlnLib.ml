open HwSlnData

module SlnUtil:
sig
   val portid2str : port_id -> string
   val compid2str : comp_id -> string
   val action2str : string -> sln_action -> string
   val actions2str : string -> sln_action list -> string

end =
struct
  let compid2str (n,i) = n^"."^(string_of_int i)
  let portid2str (n,c) : string = (compid2str c)^"["^n^"]"

  let action2str (prefix:string) (d:sln_action) : string = match d with
      | DUseComponent(hwc) ->
         prefix^"use component "^(compid2str hwc)
      | DAddWire(src,sink) ->
         prefix^(portid2str src)^" -> "^(portid2str sink)
      | DSetPort(n,e) ->
         (portid2str n)^":="^(string_of_float e)
      | DNone -> "none"

    let actions2str prefix (d:sln_action list) : string =
      List.fold_right (fun x r -> r^(action2str prefix x)^"\n") d ""

end
