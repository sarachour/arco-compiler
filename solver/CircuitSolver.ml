open Sys
open SimpleFPAA
open Generic 
open HWData
open HWLib
open Util
open GenToHW


let main () =
   if Array.length Sys.argv <> 1 then begin
      Format.printf "Usage: solver\n";
   end else begin
      let hw = simpleFPAAChip in 
      let expr : grel= Eq(
        Deriv(Literal(Symbol(0, Some "X"))),
        Add(
          [Literal(Symbol(1, Some "Y"));
          Literal(Symbol(2, Some "Z"))]
        )
      ) in
      let config = HWConv.convert hw expr Current in
      Format.printf "%s\n" (HWArch.config2str config)
   end
;;


if !Sys.interactive then () else main ();;
