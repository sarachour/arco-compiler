open IntervalData
open Util

type z3number = number

type z3expr =
  | Z3And of z3expr*z3expr
  | Z3Or of z3expr*z3expr
  | Z3Mult of z3expr*z3expr
  | Z3Var of string
  | Z3Number of z3number 
  | Z3Not of z3expr
  | Z3Plus of z3expr*z3expr
  | Z3Bool of bool
  | Z3LTE of z3expr*z3expr
  | Z3GTE of z3expr*z3expr
  | Z3LT of z3expr*z3expr
  | Z3GT of z3expr*z3expr
  | Z3IfThenElse of z3expr*z3expr*z3expr
  | Z3Eq of z3expr*z3expr
  | Z3Fun of string*(z3expr list)
  | Z3Neg of z3expr
  | Z3Sub of z3expr*z3expr
  | Z3Div of z3expr*z3expr
  | Z3Power of z3expr*z3expr

type z3vartyp =
  | Z3Bool
  | Z3Int
  | Z3Real

type z3st =
  | Z3Stmt of string
  | Z3ConstDecl of string*z3vartyp
  | Z3Assert of z3expr
  | Z3SAT
  | Z3Minimize of z3expr
  | Z3Maximize of z3expr
  | Z3DispModel
  | Z3Comment of string
  | Z3Exit

type z3interval =
  | Z3QRange of float*float
  | Z3QLowerBound of float
  | Z3QUpperBound of float
  | Z3QAny
  | Z3QInfinite of bound_dir
  

type z3qty =
  | Z3QBool of bool
  | Z3QInt of int
  | Z3QFloat of float
  | Z3QInterval of z3interval

type z3assign =
  | Z3Set of string*z3qty

type z3model = z3assign list

type z3status =
  | Z3SAT | Z3UNSAT | Z3Timeout | Z3DeltaSAT of float | Z3Unknown | Z3Error


type z3sln = {
  mutable sat: z3status;
  mutable model: z3model option;
}
