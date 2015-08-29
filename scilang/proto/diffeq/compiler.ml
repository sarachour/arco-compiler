open DEQParser
open DEQLexer
open Data

let print_result x =
   (string_of_int x)

let compile f = 
   let in_chan = open_in(f) in
   let out = (Filename.chop_extension f) in
   let out_chan = open_out(out ^ ".bc") in
   let lexbuf = Lexing.from_channel in_chan in
   let 
      result = DEQParser.main DEQLexer.main lexbuf 
   in
      Format.printf "-Result-\n";
      Format.print_flush();
      Format.printf "%s\n" (Data.DEQEnv.env2str result);
      Format.printf "------\n"

let help() = print_string "biospec <file>\n"

let () = if Array.length Sys.argv = 1 then help()
         else
            let file = Array.get Sys.argv 1 in 
            Format.printf "compiling %s\n" file;
            Format.print_flush();
            compile file;