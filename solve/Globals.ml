import Util

let __max_depth = 65
let __pattern_depth = 5

let __ast_pattern_breadth = 15
let __ast_pattern_depth = 2
let __ast_pattern_frac_ban = 0.65

let debug = false

let glbls = MAP.make ()

type glblprop = GlblPropInt of int
  | GlblPropFloat of float
  | GlblPropBool of bool
  | GlblPropString of string

let _ = MAP.put glbls "ast_pattern_breadth" (GlblPropInt 15)
let _ = MAP.put glbls "ast_pattern_depth" (GlblPropInt 2)
let _ = MAP.put glbls "ast_pattern_frac_ban" (GlblPropFloat 0.65)
let _ = MAP.put glbls "search_max_depth" (GlblPropInt 65)
let _ = MAP.put glbls "search_pattern_depth" (GlblPropInt 5)
let _ = MAP.put glbls "interactive" (GlblPropBool true)
let _ = MAP.put glbls "debug" (GlblPropBool false)

let set_prop key val =
  MAP.put glbls key val
