open Unit
open Util
open AST
open Common


type meid =
  | MEVar of mkind*string*unt
  | MEError of mkind*string*unt
  | MEParam of string*number*unt
  | METime of unt

type merel =
  | MEState of (meid ast)
  | MEFunction of (meid ast)

type mckind = MCEnsure | MCAssume

type mcstrs = {
  mutable errs: (string,mckind*merel) map;
  mutable mags: (string,mckind*range) map;
}

exception MathCstrLibException of string

let error s e =
  raise (MathCstrLibException (s^": "^e))
module MathCstrLib =
struct
  let mkcstrs () = {errs=MAP.make(); mags=MAP.make()}

  let mkrng e vname k r =
    if MAP.has (e.mags) vname then
      error "mkrngasm" "already exists"
    else
    let _ = MAP.put (e.mags) vname (k,r) in
    e

  let mkerr e vname k r =
    if MAP.has (e.errs) vname then
      error "mkerr" "already exists"
    else
    let _ = MAP.put (e.errs) vname (k,r) in
    e

  let mag e vname =
    match MAP.get e.mags vname with
    | (MCAssume,(min,max))-> Some (min,max)
    | _ -> None


  let print e =
    let id2str e = match e with
      |MEVar(k,s,i)->s
      |MEError(k,s,i)->"E("^s^")"
      |MEParam(s,f,i) -> string_of_number f
      |METime(i) -> "t"
    in
    let ckind2str k = match k with
      | MCAssume -> "assume"
      | MCEnsure -> "ensure"
    in
    let err2str s (k,e) =
      match e with
      | MEState(e) -> (ckind2str k)^" err per-t "^s^" <= "^(ASTLib.ast2str e id2str)
      | MEFunction(e) ->(ckind2str k)^" err "^s^" <= "^(ASTLib.ast2str e id2str)
    in
    let mag2str s (k,m) =
      (ckind2str k)^" "^s^" in "^(RANGE.range2str m)
    in
    let mags = MAP.fold e.mags (fun k x r -> r^"\n"^(mag2str k x)) "" in
    let errs = MAP.fold e.errs (fun k x r -> r^"\n"^(err2str k x)) "" in
    Printf.printf "%s\n\n%s\n" mags errs
end
