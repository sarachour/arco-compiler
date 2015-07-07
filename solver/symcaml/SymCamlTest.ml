
open SymCaml
open SymCamlData

let main () = 
   let s = SymCaml.init() in
   let a = SymCaml.define_symbol s "a" in 
   let b = SymCaml.define_symbol s "b" in 
   let c = SymCaml.define_symbol s "c" in 
   let x = SymCaml.define_wildcard s "x" [] in
   let y = SymCaml.define_wildcard s "y" [] in
   let e = SymCaml.define_expr s "e" (Exp(Add([a;a;c]), Integer(3))) in
   let ex = SymCaml.define_expr s "ex" (Exp(Add([x;x;y]), Integer(3))) in
   Printf.printf "-------\n";
   let res = SymCaml.simpl s e in
   Printf.printf "simpl: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.expand s e in
   Printf.printf "expand: %s\n" (SymCaml.expr2py s res);
   let res = SymCaml.pattern s (Exp(c,Integer(3))) ex in 
   Printf.printf "pattern: %s\n" (List.fold_right 
      (fun ((n,e):string*symexpr) (r:string) -> r^"\n    "^n^":"^(SymCaml.expr2py s e))
      res "assignments:");
   let res = SymCaml.eval s e in
   Printf.printf "doit: %s\n" (SymCaml.expr2py s res);
   ()
;;

if !Sys.interactive then () else main ();;

