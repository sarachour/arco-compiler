open Util;;

type ('a,'b) smap = {
  data: (string,'a*'b) map;
  tokey: 'a -> string;
}

module SMAP =

struct

  let mk (conv) =
    {
      data=MAP.make();
      tokey=conv;
    }

  let put (map:('a,'b) smap) (k:'a) (v:'b) =
    let key = map.tokey k in
    MAP.put map.data key (k,v);
    ()

  let has (map:('a,'b) smap) (k:'a) =
    let key = map.tokey k in
    MAP.has map.data key

  let get (map:('a,'b) smap) (k:'a) =
    let key = map.tokey k in
    let _,v = MAP.get map.data key in
    v

  let ifget (map:('a,'b) smap) (k:'a) =
    let key = map.tokey k in
    OPTION.map
      (MAP.ifget map.data key)
      (fun (_,v) -> v)


  let iter (map:('a,'b) smap) f :unit  =
    MAP.iter map.data (fun _ (k,v) -> f k v)

  let fold (type c) (map:('a,'b) smap) f (init:c) : c=
    MAP.fold map.data (fun _ (k,v) -> f k v) init

  let str (map:('a,'b) smap) f : string=
    MAP.str map.data (fun _ -> "") (fun (k,v) -> (map.tokey k)^"="^(f v)) 

  let size (map) =
    MAP.size map.data
end
