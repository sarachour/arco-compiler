open Hardware
open Generic

type analogy = Current | Voltage

type config = {
   conns : hwconn list
}

module HWConvAlgorithm : 
sig
   val convert : hwchip -> grel -> analogy -> config
   val create : unit -> config
   val config2str : config -> string
end =
struct
   let create () = {conns=[]}
   let convert c r algy= 
      let c = create() in
      c
   let config2str c = ""


end