open HWLib
open HWData
open Generic

type cvanalogy = Current | Voltage


module HWConv : 
sig
   val convert : hwarch -> grel -> cvanalogy -> hwconfig
end =
struct

   let convert c rel algy= 
      let c = HWArch.create_config() in
      c



end