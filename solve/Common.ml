type mkind =   MInput | MOutput | MLocal

type hwvkind = HWKInput | HWKOutput

type compid =
  | HCMLocal of string
  | HCMGlobal of string* int
