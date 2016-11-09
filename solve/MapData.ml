open HWData 
open AST
open IntervalData
open StochData

open SolverData

open Util

(*determines the kind of variable*)
type linear_slack_dir =
  | SVMin | SVMax

type linear_id =
  | SVScaleVar of wireid
  | SVOffsetVar of wireid

type linear_smt_id =
  | SVLinVar of linear_id
  | SVSlackVar of linear_slack_dir*float*wireid

type linear_stmt =
  | SVEquals of (linear_id ast) list
  | SVCoverEq of (linear_smt_id ast) list
  | SVCoverLTE of (linear_smt_id ast) list
  | SVCoverGTE of (linear_smt_id ast) list
  | SVDeclMapVar of linear_smt_id
  | SVLTE of (linear_id ast*linear_id ast)

type linear_mapping = {
  scale : linear_id ast;
  offset : linear_id ast;
  term: hwvid ast;
}

type map_req =
  | RequireOffset of num_interval*num_interval
  | RequireScale of num_interval*num_interval
  | RequireNoScale
  | RequireNoOffset
  | RequireScaleEq of wireid

type hw_mapping = {
  mutable scale:float;
  mutable offset:float;
  mutable mrng:num_interval;
  mutable hrng:num_interval;
  mutable wire: wireid;
  mutable expr: unid ast;
}

type map_heuristic = {
  mapping:hw_mapping;
  math_noise:rand_var;
  hw_noise:rand_var;
  math_ival:rand_var;
  hw_ival:rand_var;
  mutable reqs:map_req list;
}

type map_heuristics = {
  mappings:(wireid,map_heuristic) map;
}
