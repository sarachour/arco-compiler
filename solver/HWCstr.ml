open Util
open Unit
open AST
open Common

exception HwCstrError of string


type propid = string

type hevid =
  | HENPort of hwvkind*compid*string*propid*untid
  | HENPortErr of hwvkind*compid*string*propid*untid
  | HENParam of string*float*unt
  | HENTime of untid

type herel =
  | HERFunction of hevid ast
  | HERState of hevid ast

type hcinst =
  | HCInstFinite of int
  | HCInstInfinite

type hcconn =
 | HCConnInstPort of (string*string*int)
 | HCConnCompPort of (string*string)

type hwcstrs = {
  conns: (string*string*int,hcconn set) map;
  mags: (string*string*string,range) map;
  errs: (string*string*string, herel) map;
  insts: (string,hcinst) map;
}

let error s n =
  raise (HwCstrError (s^": "^n))

exception HwCstrLibException of string

let error s n = raise (HwCstrLibException (s^": "^n))

module HwCstrLib =
struct
  let mkcstrs ()  : hwcstrs=
    {
      conns= MAP.make();
      mags= MAP.make();
      errs = MAP.make();
      insts = MAP.make()
    }
  let hevid2str x =
    match x with
    |HENPortErr(_,_,v,p,_) -> "E("^v^"."^p^")"
    |HENPort(_,_,v,p,_) -> v^"."^p
    |HENTime(_) -> "t"
    |HENParam(n,v,_) -> n

  let mkinst e iname cnt =
    if MAP.has e.insts iname then
      error "mkinst" "already exists"
    else
      let _ = MAP.put e.insts iname cnt in
      ()

  let mkmag e iname portname propname rng =
    let key = (iname,portname,propname) in
    if MAP.has e.mags key then
      let orng = MAP.get e.mags key in
      let nrng = RANGE.resolve orng rng in
      let _ = MAP.put e.mags key nrng in
      ()
    else
      let _ = MAP.put e.mags key rng in
      ()

  let mkglblmag e rng =
    let _ = MAP.map e.mags (fun k v -> RANGE.resolve v rng) in
    ()

  let mkerr e iname pname propname efun =
    let key = (iname,pname,propname) in
    if MAP.has e.errs key then
      error "mkerr" "error definition already exists"
    else
      let _ = MAP.put e.errs key efun in
      ()

  let print e =
    let pr_inst k v = match v with
      | HCInstFinite(x) -> k^" has "^(string_of_int x)^" instances"
      | HCInstInfinite -> k^" has infinite instances"
    in
    let pr_mag (c,port,prop) v =
      "comp "^c^"."^port^" prop "^prop^" in "^(RANGE.range2str v)
    in
    let pr_err (c,port,prop) v =
      let prefix = "comp "^c^"."^port^" prop "^prop in
      match v with
      | HERState(a) -> prefix^" error(t) <= "^(ASTLib.ast2str a hevid2str)
      | HERFunction(a) -> prefix^" error <= "^(ASTLib.ast2str a hevid2str)
    in
    let apply f k x r = r^"\n"^(f k x) in
    let istr = MAP.fold e.insts (apply pr_inst) "" in
    let mstr = MAP.fold e.mags (apply pr_mag) "" in
    let estr = MAP.fold e.errs (apply pr_err) "" in
    let _ = Printf.printf "%s\n%s\n%s\n" istr mstr estr in
    ()

end
