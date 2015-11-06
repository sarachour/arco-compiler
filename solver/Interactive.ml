open SolverData
open Util

let _if_interactive (s:slvr) (f:slvr->'a) =
  if s.interactive then
    let _ = f s in
    ()
  else ()

let pr (s:slvr) (v:string) =
  let fxn s =
    let _ = Printf.printf "%s\n" v  in
    flush_all()
  in
  _if_interactive s fxn

let prf (s:slvr) (v:unit->unit) =
    let fxn s =
      let _ = v ()  in
      flush_all()
    in
    _if_interactive s fxn

let menu (s:slvr) (handle:string->unit) (menu:string) =
let fxn s =
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
_if_interactive s fxn

let wait (s:slvr)  =
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
  _if_interactive s fxn
