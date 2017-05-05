open AST
open Std.Core


module AlgebraicUnificationProblem =
struct

  type t =
    | DefineSymbol of string
    | DefineWildcard of string
    | Unify of (string ast)*(string ast)
    | Disable of string*string ast
    | Solve of int

end

module AlgebraicUnifier =
struct

  type t =
    | Sympy
    | Mathematica

  let to_wolfram (prob:AlgebraicUnificationProblem.t list) =
    List.iter 
      (fun (step:AlgebraicUnificationProblem.t ) ->
         match step with
         | DefineSymbol(varname) -> ()
         | DefineWildcard(varname) -> ()
         | Unify(expr_a,expr_b) -> ()
         | Disable(varname,expr) -> ()
         | Solve(nslns) -> ()
      ) prob

  let to_sympy (prob:AlgebraicUnificationProblem.t list) =
    List.iter 
      (fun (step:AlgebraicUnificationProblem.t ) ->
         match step with
         | DefineSymbol(varname) -> ()
         | DefineWildcard(varname) -> ()
         | Unify(expr_a,expr_b) -> ()
         | Disable(varname,expr) -> ()
         | Solve(nslns) -> ()
      ) prob

  let solve_sympy (prob) =
    let script = to_sympy prob in
    ()

  let solve_mathematica (prob) =
    let script = to_sympy prob in
    ()

  let unify (prob:AlgebraicUnificationProblem.t list) =
    let solver = Sympy in
    match solver with
    | Sympy -> solve_sympy prob
    | Mathematica -> solve_mathematica prob


end
