open Hardware
open Generic

module HWConvAlgorithm : 
sig
   val convert : hwchip -> grel -> hwconfig
end =
struct
   let convert c r = 
      let c = Chip.config() in
      c


end