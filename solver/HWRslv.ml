
open HWCstr
open Util
open SolverData


module HwConnRslvr =
struct

  let is_valid cfg sol =
    true

end


module HwErrRslvr =
struct

  let is_valid cfg sln =
    let cmps : (unodeid,(int set)*int) map = sln.comps in
    let conns : (wireid, wireid set) map = sln.conns in
    true

end
