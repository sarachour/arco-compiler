open Util
open Printf

type glblprop = GlblPropInt of int
  | GlblPropFloat of float
  | GlblPropBool of bool
  | GlblPropString of string


let glbls : (string,glblprop) map = MAP.make ();;

let _ = MAP.put glbls "_force" (GlblPropBool false)
let _ = MAP.put glbls "interactive" (GlblPropInt 0)
let _ = MAP.put glbls "debug" (GlblPropInt 0)

let _ = MAP.put glbls "enable-jaunt" (GlblPropBool true)
let _ = MAP.put glbls "enable-jaunt-feasible" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-solve-method" (GlblPropString "smt")
let _ = MAP.put glbls "jaunt-validate" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-fallback" (GlblPropBool true)
let _ = MAP.put glbls "enable-jaunt-cover" (GlblPropBool true)

let _ = MAP.put glbls "jaunt-optimize-reddof-enabled" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-optimize-reddof-timeout" (GlblPropInt 2)
(*solve local optimization problem for seed points*)
let _ = MAP.put glbls "jaunt-optimize-localopt-enabled" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-optimize-localopt-nooff-enabled" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-optimize-localopt-timeout" (GlblPropInt 2)

(*solve linearized problem*)
let _ = MAP.put glbls "jaunt-optimize-linearize-enabled" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-optimize-linearize-timeout" (GlblPropInt 2)
let _ = MAP.put glbls "jaunt-optimize-linearize-results" (GlblPropInt 2)

let _ = MAP.put glbls "jaunt-scipy-tries" (GlblPropInt 25)
let _ = MAP.put glbls "jaunt-scipy-ctol" (GlblPropFloat 1e-8)
let _ = MAP.put glbls "jaunt-scipy-xtol" (GlblPropFloat 1e-7)
let _ = MAP.put glbls "jaunt-scipy-results" (GlblPropInt 1)
let _ = MAP.put glbls "jaunt-simplify" (GlblPropBool true)
let _ = MAP.put glbls "jaunt-scipy-iters" (GlblPropInt 3000)
let _ = MAP.put glbls "jaunt-scipy-linear-iters" (GlblPropInt 1000)
let _ = MAP.put glbls "jaunt-scale-range" (GlblPropString "*")
let _ = MAP.put glbls "jaunt-offset-range" (GlblPropString "*")

let _ = MAP.put glbls "multi-num-partial-solutions" (GlblPropInt 8)
let _ = MAP.put glbls "multi-num-global-solutions" (GlblPropInt 2)
let _ = MAP.put glbls "multi-num-global-solutions-per-partial" (GlblPropInt 1)
let _ = MAP.put glbls "multi-selector-branch" (GlblPropString "depth")
    

let _ = MAP.put glbls "unify-branch" (GlblPropInt 1)
let _ = MAP.put glbls "unify-restrict-size" (GlblPropInt 1)

let _ = MAP.put glbls "eqn-use-map-heuristic" (GlblPropBool true)
let _ = MAP.put glbls "eqn-unifications" (GlblPropInt 1)
let _ = MAP.put glbls "eqn-selector-goal" (GlblPropString "uniform")
let _ = MAP.put glbls "eqn-selector-branch" (GlblPropString "uniform")

let _ = MAP.put glbls "slvr-solutions" (GlblPropInt 1)
let _ = MAP.put glbls "slvr-partial-depth" (GlblPropInt 32)
let _ = MAP.put glbls "slvr-global-depth" (GlblPropInt 5)

let _ = MAP.put glbls "z3-minimize-depth" (GlblPropInt 3)
let _ = MAP.put glbls "z3-minimize-strategy" (GlblPropString "binary")

let _ = MAP.put glbls "map-infer-feasible-timeout" (GlblPropInt 60)
let _ = MAP.put glbls "map-infer-solution-timeout" (GlblPropInt 60)
(*

*)
let set_glbl key v =
  let _ = MAP.put glbls key v in
  ()

let upd_glbl key v =
  if MAP.has glbls key then
    set_glbl key v
  else
    error "upd_glbl" ("no global with the name: "^key)

let get_glbl key =
  if MAP.has glbls key then
    MAP.get glbls key
  else
    error "get_glbl" ("no global property with name: "^key)

let get_glbl_int key =
  match get_glbl key with
  | GlblPropInt(i) -> i
  | _ -> error "get_glbl_int" "unexpected property type with name. Expected int"

let get_glbl_float key =
  match get_glbl key with
  | GlblPropFloat(i) -> i
  | _ -> error "get_glbl_int" "unexpected property type with name. Expected int"

let get_glbl_bool key =
  match get_glbl key with
  | GlblPropBool(i) -> i
  | _ -> error "get_glbl_int" "unexpected property type with name. Expected int"

let get_glbl_string key =
  match get_glbl key with
  | GlblPropString(i) -> i
  | _ -> error "get_glbl_int" "unexpected property type with name. Expected int"

let set_glbl_bool key v =
        upd_glbl key (GlblPropBool v)

let get_glbls () =
  glbls

let glbl2str k v = match v with
  | GlblPropBool(b) -> "bool "^k^" "^(string_of_bool b)
  | GlblPropInt(i) -> "int "^k^" "^(string_of_int i)
  | GlblPropFloat(f) -> "float "^k^" "^(string_of_float f)
  | GlblPropString(s) -> "string "^k^" "^s


let print_glbls () =
  let _ = MAP.iter glbls (fun k v -> Printf.printf "%s\n" (glbl2str k v)) in
  ()

let upd_glbls v =
  let _ = MAP.iter v (fun k v -> upd_glbl k v) in
  ()

let glbls_to_file file =
  let oc = open_out file in    (* create or truncate file, return channel *)
     (* write something *)
  let _ = MAP.iter glbls (fun k v -> fprintf oc "%s\n" (glbl2str k v)) in
  close_out oc;
