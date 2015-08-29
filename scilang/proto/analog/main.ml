
let process g = 
   print_string (g^"\n")

let help() = print_string "analog <file>\n"

let () = if Array.length Sys.argv = 1 then help()
         else
            let formula = Array.get Sys.argv 1 in 
            process formula