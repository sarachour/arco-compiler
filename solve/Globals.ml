open Util
open Printf

type glblprop = GlblPropInt of int
  | GlblPropFloat of float
  | GlblPropBool of bool
  | GlblPropString of string


let glbls : (string,glblprop) map = MAP.make ();;

let _ = MAP.put glbls "test-component-reachability" (GlblPropBool false)
let _ = MAP.put glbls "downgrade-trivial" (GlblPropBool false)
let _ = MAP.put glbls "downgrade-trivial-global" (GlblPropBool true)
let _ = MAP.put glbls "downgrade-trivial-partial" (GlblPropBool false)
let _ = MAP.put glbls "interactive" (GlblPropInt 0)
let _ = MAP.put glbls "debug" (GlblPropInt 0)

let _ = MAP.put glbls "uast-prune-unrelated" (GlblPropBool true)
let _ = MAP.put glbls "uast-prune-unrelated-hops" (GlblPropInt 2)
let _ = MAP.put glbls "uast-selector-branch" (GlblPropString "uniform")
let _ = MAP.put glbls "uast-depth" (GlblPropInt 8)
let _ = MAP.put glbls "uast-duplicates" (GlblPropInt 1)

let _ = MAP.put glbls "uast-selector-restrict" (GlblPropString "single")
let _ = MAP.put glbls "uast-restrict-fraction-set-prop" (GlblPropFloat 2.0)
let _ = MAP.put glbls "uast-restrict-fraction-ban-prop" (GlblPropFloat 0.50)
let _ = MAP.put glbls

let _ = MAP.put glbls "multi-force-value-to-port" (GlblPropBool true)

let _ = MAP.put glbls "eqn-smt-defer" (GlblPropBool true)
let _ = MAP.put glbls "eqn-unifications" (GlblPropInt 1)
let _ = MAP.put glbls "eqn-selector-branch" (GlblPropString "uniform")
let _ = MAP.put glbls "eqn-selector-goal" (GlblPropString "uniform")
let _ = MAP.put glbls "eqn-concretize-only-when-finished" (GlblPropBool false)

let _ = MAP.put glbls "slvr-solutions" (GlblPropInt 1)
let _ = MAP.put glbls "slvr-partial-depth" (GlblPropInt 32)
let _ = MAP.put glbls "slvr-global-depth" (GlblPropInt 5)



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
