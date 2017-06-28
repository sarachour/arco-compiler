
open HWLib
open HWData

open MathData
open MathLib

open AST
open Util
open Unit
open SolverData


let mid2str = MathLib.mid2str

let unid2str (a:unid) = match a with
  | HwId(x) -> HwLib.hwvid2str x
  | MathId(x) -> MathLib.mid2str x

let uast2str (a:unid ast) = ASTLib.ast2str a unid2str

let hwid2str (a:hwvid) = HwLib.hwvid2str a

let mid2unid (a:mid) = MathId(a)

let hwid2unid (a:hwvid) = HwId(a)

let unid2mid (a:unid) = match a with
  | MathId(x) ->x
  | _ -> error "unid2mid" "cannot cast to unid"

let uast2mast (a:unid ast) : mid ast =
  ASTLib.map a (unid2mid)


let mast2uast (a:mid ast) =
  ASTLib.map a (mid2unid)

let hwast2uast (a:hwvid ast) =
  ASTLib.map a (hwid2unid)
