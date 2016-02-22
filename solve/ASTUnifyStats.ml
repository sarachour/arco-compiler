open ASTUnifyData
open Util

module ASTUnifyStats =
struct
  let stats = {nconflicts=MAP.make}

  let clear () =
    MAP.clear stats.nconflicts

  let conflict lhs rhs =
    if MAP.has (lhs,rhs) then
      MAP.get (lhs,rhs)
    else
      0

end
