open SolverData
open Util
open Globals

let _if_interactive (f:unit->'a) =
  if get_glbl_bool "interactive" then
    let _ = f () in
    ()
  else ()

let _if_debug (f:unit->'a) =
  if get_glbl_bool "debug" then
    let _ = f () in
    ()
  else ()

let print_inter (v:string) =
  let fxn () =
    let _ = Printf.printf "%s\n" v  in
    flush_all()
  in
  _if_interactive fxn

let exec_inter (v:unit->unit) =
    let fxn () =
      let _ = v ()  in
      flush_all()
    in
    _if_interactive fxn

let menu (handle:string->unit) (menu:string) =
let fxn () =
  let _ = Printf.printf "select an action (%s):" menu in
  let _ = flush_all() in
  let inp = input_line stdin in
  let _ = Printf.printf "\n" in
  let _ = flush_all() in
  let _ = handle(inp) in
  let _ = flush_all() in
  if STRING.startswith inp "q" then
    let _ = exit 0 in
    ()
  else
    ()
in
_if_interactive fxn

let wait () =
  let fxn s =
    let _ = Printf.printf "<please press key to continue. 'q' to quit>:"  in
    let _ = flush_all() in
    let inp = input_line stdin in
    let _ = Printf.printf "\n" in
    let _ = flush_all() in
    if STRING.startswith inp "q" then
      let _ = exit 0 in
      ()
    else
      ()
  in
  _if_interactive fxn

let print_debug (v:string) =
  let fxn () =
    let _ = Printf.printf "[DBG]: %s\n" v in
    flush_all()
  in
  _if_debug fxn

let exec_debug (e:unit->unit) =
  _if_debug e
