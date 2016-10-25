type z3expr =
  | Z3And of z3expr*z3expr
  | Z3Or of z3expr*z3expr
  | Z3Mult of z3expr*z3expr
  | Z3Var of string
  | Z3Int of int
  | Z3Not of z3expr
  | Z3Plus of z3expr*z3expr
  | Z3Bool of bool
  | Z3LTE of z3expr*z3expr
  | Z3GTE of z3expr*z3expr
  | Z3LT of z3expr*z3expr
  | Z3GT of z3expr*z3expr
  | Z3IfThenElse of z3expr*z3expr*z3expr
  | Z3Eq of z3expr*z3expr


type z3vartyp =
  | Z3Bool
  | Z3Int
  | Z3Real

type z3st =
  | Z3ConstDecl of string*z3vartyp
  | Z3Assert of z3expr
  | Z3SAT
  | Z3Minimize of z3expr
  | Z3Maximize of z3expr
  | Z3DispModel

type z3assign =
  | Z3SetBool of string*bool
  | Z3SetInt of string*int

type z3model = z3assign list

type z3sln = {
  sat: bool;
  mutable model: z3model option;
}
