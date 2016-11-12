open SolverData
open Util
open Globals

let force (fxn:unit->unit) =
  set_glbl_bool "_force" true;
  fxn();
  set_glbl_bool "_force" false

let _if_interactive (ilevel:int) (f:unit->'a) =
  if get_glbl_bool "_force" || ilevel <= get_glbl_int "interactive" then
    let _ = f () in
    ()
  else ()

let _if_debug (ilevel:int) (f:unit->'a) =
  if get_glbl_bool "_force" || ilevel <= get_glbl_int "debug" then
    let _ = f () in
    ()
  else ()

let print_inter (i:int) (v:string) =
  let fxn () =
    let _ = Printf.printf "%s\n" v  in
    flush_all()
  in
  _if_interactive i fxn


let exec_inter (i:int) (v:unit->unit) =
    let fxn () =
      let _ = v ()  in
      flush_all()
    in
    _if_interactive i fxn

let menu (i:int) (label:string) (handle:string->unit) (menu:string) =
let fxn () =
  let _ = Printf.printf "%s: (%s):" label menu in
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
_if_interactive i fxn

let wait (i:int) =
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
  _if_interactive i fxn

let print_debug (i:int) (x:string) (v:string) =
  let fxn () =
    let _ = Printf.printf "[%s] %s\n" x v in
    flush_all()
  in
  _if_debug i fxn

let exec_debug (i:int) (e:unit->unit) =
  _if_debug i e
