
open HWCstr
open Util
open SolverData
open SolverUtil

module HwConnRslvr =
struct

  let is_valid cfg sol =
    let cmps : (unodeid,(int set)*int) map = sol.comps in
    let conns : (wireid, wireid set) map = sol.conns in
    let cstr_cmps : (string,hcinst) map= cfg.hw.cstr.insts in
    let vc_map = MAP.make() in
    let vs_map = MAP.make() in
    let print_sol_inst id iid =
      let name = UnivLib.unodeid2name id in
      let _ = Printf.printf "SOL VAR || %s %d\n" name iid in
      ()
    in
    let print_cstr_inst name iid=
      let _ = Printf.printf "CSTR VAR || %s %d\n" name iid in
      ()
    in
    let iter_sol_insts fn = MAP.iter cmps (fun k (v,cnt) -> SET.iter v (fun x -> fn k x)) in
    let iter_cstr_insts fn = MAP.iter cstr_cmps (fun k q -> List.iter (fun x -> fn k x) (LIST.mkrange 1 q)) in
    let _ = iter_sol_insts print_sol_inst in
    let _ = iter_cstr_insts print_cstr_inst in
    true

end


module HwErrRslvr =
struct

  let is_valid cfg sln =
    true

end
