open Util

open HWLib

module HwInstLib = struct

  let mkinst e iname cnt =()
(*    if MAP.has e.insts iname && MAP.get e.insts iname <> 0 then
      error "mkinst" "already exists"
    else
      let _ = MAP.put e.insts iname cnt in
      ()
*)

  let getinsts e iname = (HwLib.getcomp e iname).insts


end
