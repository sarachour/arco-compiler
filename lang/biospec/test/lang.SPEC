
type NAME {
   properties:
      name : TYPE
   parameters:
      name : TYPE
}

/*
process component name
*/
process NAME {
   inputs:
      (REQUIRED) INPUTNAME : TYPE = IV
      ...
   outputs:
      OUTPUTNAME : TYPE
   parameters:
      (REQUIRED) NAME := DEFAULT VALUE
   relations:
      (pattern|expression) RELATION
}

/*
analog component name
*/
analog NAME {
   inputs:
      (REQUIRED) InputName : TYPE = IV
      ...
   outputs:
      OUTPUTNAME : TYPE
   parameters:
      (REQUIRED) NAME := DEFAULT VALUE
   properties:
   relations:
      (pattern|fixed) RELATION
}

