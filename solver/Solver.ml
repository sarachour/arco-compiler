open Sys

let main () =
   if Array.length Sys.argv <> 1 then begin
      Format.printf "Usage: solver\n";
   end else begin
      Format.printf "%s\n" "done."
   end
;;


if !Sys.interactive then () else main ();;
