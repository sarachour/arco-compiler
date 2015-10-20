open Unit
open Util
open AST
open Common


type meid =
  | MEVar of mkind*string*unt
  | MEError of mkind*string*unt
  | MEParam of string*float*unt
  | METime of unt

type merel =
  | MEState of (meid ast)
  | MEFunction of (meid ast)

type mcmag =
  | MCEnsMag of range
  | MCAsmMag of range

type mcstrs = {
  mutable errs: (string,merel) map;
  mutable mags: (string,mcmag) map;
}

exception MathCstrLibException of string

let error s e =
  raise (MathCstrLibException (s^": "^e))
module MathCstrLib =
struct
  let mkcstrs () = {errs=MAP.make(); mags=MAP.make()}

  let mkrng e vname r =
    if MAP.has (e.mags) vname then
      error "mkrngasm" "already exists"
    else
    let _ = MAP.put (e.mags) vname r in
    e

  let mkerr e vname r =
    if MAP.has (e.errs) vname then
      error "mkerr" "already exists"
    else
    let _ = MAP.put (e.errs) vname r in
    e




  let print e =
    let id2str e = match e with
      |MEVar(k,s,i)->s
      |MEError(k,s,i)->"E("^s^")"
      |MEParam(s,f,i) -> string_of_float f
      |METime(i) -> "i"
    in
    let err2str s e =
      match e with
      | MEState(e) -> "err per-t "^s^" <= "^(ASTLib.ast2str e id2str)
      | MEFunction(e) -> "err "^s^" <= "^(ASTLib.ast2str e id2str)
    in
    let mag2str s m = match m with
      | MCAsmMag(r) -> "assume "^s^" in "^(RANGE.range2str r)
      | MCAsmMag(r) -> "ensure "^s^" in "^(RANGE.range2str r)
    in
    let mags = MAP.fold e.mags (fun k x r -> r^"\n"^(mag2str k x)) "" in
    let errs = MAP.fold e.errs (fun k x r -> r^"\n"^(err2str k x)) "" in
    Printf.printf "%s\n\n%s\n" mags errs
end
