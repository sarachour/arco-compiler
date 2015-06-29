open Sys
open ZZ3
open SimpleFPAA
open HWConvAlgorithm
open Generic 
open Hardware


module Z = ZZ3.Make (struct let ctx = Z3.mk_context [] end)


(** The result of the functor is safe for opening (contains only types and modules. *)
open Z


let () =

  (** We create a solver for future usage. *)
  let solver = Solver.make () in

  (** We create new SMT variables and specify their types. *)
  let x = Symbol.declare Real "x" in
  let y = Symbol.declare Real "y" in

  (** We can define SMT formulas using an OCaml-like syntax.
      [!] transforms a symbol into a term.
  *)
  let t = T.( !y <= int 3 && !x + !y <= rat Q.(5 // 2)) in

  (** We assert the formula in the SMT solver. *)
  Solver.add ~solver t ;

  (** We can now solve it and extract the result: *)
  let result = Solver.check ~solver [] in

  let model = match result with
    | Unsat _ | Unkown _ -> failwith "Oh noees"
    | Sat (lazy model) -> model
  in

(** Finally we easily get back the values in the model as inferred by Z3 without any casting! *)
  let vy = Model.get_value ~model y in
  let vx = Model.get_value ~model x in

  Printf.printf "y = %s \nx = %s\n" (Q.to_string vy) (Q.to_string vx)

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
      let config = HWConvAlgorithm.convert hw expr Current in
      Format.printf "%s\n" (HWConvAlgorithm.config2str config)
   end
;;


if !Sys.interactive then () else main ();;
