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
