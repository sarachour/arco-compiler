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

  let _mkrng e vname r =
    if MAP.has (e.mags) vname then
      error "mkrngasm" "already exists"
    else
    let _ = MAP.put (e.mags) vname r in
    e

  let mkmagasm e vname min max = _mkrng e vname (MCAsmMag (min,max))
  let mkmagens e vname min max = _mkrng e vname (MCEnsMag (min,max))



end
