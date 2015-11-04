type mkind =   MInput | MOutput | MLocal

type hwvkind = HNInput | HNOutput

type compid =
  | HCMLocal of string
  | HCMGlobal of string* int
