open HWLib
open HWData
open GenericData
open HWSpecMatcher


type cvanalogy = Current | Voltage


module HWConfigGenerator : 
sig
   type gencfg = {
      analogy: cvanalogy;
      arch: hwarch; 
      matcher: HWSpecMatcher.hsmatcher; 
      mutable config: hwconfig; 
   }
   val init : cvanalogy -> hwarch -> gencfg
   val convert : gencfg -> genv -> hwconfig
end =
struct
   type gencfg = {
      analogy: cvanalogy;
      arch: hwarch; 
      matcher: HWSpecMatcher.hsmatcher; 
      mutable config: hwconfig; 
   }
   let init anlgy arch : gencfg = 
      let c = HWArch.create_config() in
      let m = HWSpecMatcher.init() in
      {analogy=anlgy; arch=arch; config=c; matcher=m}

   let convert c rel= 
      c.config



end