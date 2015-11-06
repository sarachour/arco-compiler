open Util
open Unit
open AST
open Common

exception HwCstrError of string


type propid = string

type hevid =
  | HENPort of hwvkind*compid*string*propid*untid
  | HENPortErr of hwvkind*compid*string*propid*untid
  | HENParam of string*float*unt
  | HENTime of untid

type herel =
  | HERFunction of hevid ast
  | HERState of hevid ast
  | HERNoError

type hcinst = int


type hcmag =
  | HCMagRange of range
  | HCNoMag

type hcconn =
  | HCConnLimit of (string*string, (int*int) set) map
  | HCConnNoLimit

type hcdigital =
  | HCDigSample of string*string*float*untid

type hwcstrs = {
  conns: (string*string, hcconn) map;
  mags: (string*string*string,hcmag) map;
  tcs: (string,hcmag) map;
  errs: (string*string*string, herel) map;
  digs: (string, hcdigital list) map;
  insts: (string,hcinst) map;
}

let error s n =
  raise (HwCstrError (s^": "^n))

exception HwCstrLibException of string

let error s n = raise (HwCstrLibException (s^": "^n))

module HwCstrLib =
struct
  let refl x y = x = y

  let mkcstrs ()  : hwcstrs=
    {
      conns= MAP.make();
      mags= MAP.make();
      errs = MAP.make();
      insts = MAP.make();
      tcs = MAP.make();
      digs=MAP.make();
    }
  let hevid2str x =
    match x with
    |HENPortErr(_,_,v,p,_) -> "E("^v^"."^p^")"
    |HENPort(_,_,v,p,_) -> v^"."^p
    |HENTime(_) -> "t"
    |HENParam(n,v,_) -> n

  let mkinst e iname cnt =
    if MAP.has e.insts iname && MAP.get e.insts iname <> 0 then
      error "mkinst" "already exists"
    else
      let _ = MAP.put e.insts iname cnt in
      ()

  let getinsts e cname =
    if MAP.has e.insts cname = false then
      error "getinsts" "there is no instance count."
    else
      MAP.get e.insts cname

  let dflport e cname pname prop =
    let k = (cname,pname,prop) in
    let _ = if MAP.has e.insts cname = false then
      MAP.put e.insts cname 0 else e.insts
    in
    let _ = if MAP.has e.tcs cname = false then
      MAP.put e.tcs cname HCNoMag else e.tcs
    in
    let _ = if MAP.has e.mags k = false then
      MAP.put e.mags k HCNoMag else e.mags
    in
    let _ = if MAP.has e.errs k = false then
      MAP.put e.errs k HERNoError else e.errs
    in
    let _ = if MAP.has e.conns (cname,pname) = false then
      MAP.put e.conns (cname,pname) HCConnNoLimit
      else e.conns
    in
    let _ = if MAP.has e.digs cname = false then
      MAP.put e.digs cname []
      else e.digs
    in
    ()

  let mag e cmp port prop  =
    match MAP.get e.mags (cmp,port,prop) with
    | HCMagRange(min,max) -> Some (min,max)
    | HCNoMag -> None

  let tc e cmp  =
    match MAP.get e.mags cmp with
    | HCMagRange(min,max) -> Some (min,max)
    | HCNoMag -> None

  let mktc e iname rng =
    let key = (iname) in
    if MAP.has e.tcs key then
      let ov = MAP.get e.tcs key in
        match ov with
        | HCMagRange(orng) ->
          let nrng = RANGE.resolve orng rng in
          let _ = MAP.put e.tcs key (HCMagRange nrng) in
          ()
        | HCNoMag -> let _ =  MAP.put e.tcs key (HCMagRange rng) in ()
    else
      let _ = MAP.put e.tcs key (HCMagRange rng) in
      ()

  let mkdigital e cname v =
    if MAP.has e.digs cname = false then
      let _ = MAP.put e.digs cname [v] in e
    else
      let rest = MAP.get e.digs cname in
      let _ = MAP.put e.digs cname (v::rest) in
      e

  let mkglbltc e rng =
    let mkg  k v =
        match v with
        | HCMagRange(orng) -> HCMagRange(RANGE.resolve orng rng)
        | HCNoMag -> HCMagRange rng
    in
    let _ = MAP.map e.tcs mkg in
    ()

  let mkmag e iname portname propname rng =
    let key = (iname,portname,propname) in
    if MAP.has e.mags key then
      let ov = MAP.get e.mags key in
        match ov with
        | HCMagRange(orng) ->
          let nrng = RANGE.resolve orng rng in
          let _ = MAP.put e.mags key (HCMagRange nrng) in
          ()
        | HCNoMag -> let _ =  MAP.put e.mags key (HCMagRange rng) in ()
    else
      let _ = MAP.put e.mags key (HCMagRange rng) in
      ()

  let mkglblmag e prop rng =
    let mkg  (c,i,p) v =
      if p = prop then
        match v with
        | HCMagRange(orng) -> HCMagRange(RANGE.resolve orng rng)
        | HCNoMag -> HCMagRange rng
      else
        v
    in
    let _ = MAP.map e.mags mkg in
    ()

  let mkerr e iname pname propname efun =
    let key = (iname,pname,propname) in
    if MAP.has e.errs key && MAP.get e.errs key <> HERNoError then
      error "mkerr" "error definition already exists"
    else
      let _ = MAP.put e.errs key efun in
      ()

  let mkconn e srccomp srcport srcinst destcomp destport destinst =
    let ksrc = (srccomp,srcport) and ksnk = (destcomp,destport) in
    let src2dest = (srcinst,destinst) and dest2src = (destinst,srcinst) in
    let _ = if MAP.has e.conns ksrc = false || MAP.get e.conns ksrc = HCConnNoLimit then
      let _ = MAP.put e.conns ksrc (HCConnLimit (MAP.make())) in ()
    in
    let _ = if MAP.has e.conns ksnk = false || MAP.get e.conns ksnk = HCConnNoLimit then
      let _ = MAP.put e.conns ksnk (HCConnLimit (MAP.make())) in ()
    in
    let tblsrc = MAP.get e.conns ksrc and tblsnk = MAP.get e.conns ksnk in
    match (tblsrc,tblsnk) with
    | (HCConnLimit(mapsrc), HCConnLimit(mapsnk)) ->
      begin
        let _ = if MAP.has mapsrc ksnk = false then MAP.put mapsrc ksnk (SET.make refl) else mapsrc in
        let _ = if MAP.has mapsnk ksrc = false then MAP.put mapsnk ksrc (SET.make refl) else mapsnk in
        let setsrc = MAP.get mapsrc ksnk in
        let setsnk = MAP.get mapsnk ksrc in
        let _ = SET.add setsrc src2dest in
        let _ = SET.add setsnk dest2src in
        e
      end
    | _ -> error "mkconn" "doesn't make sense bro."


  let print e =
    let pr_inst k v = k^" has "^(string_of_int v)^" instances"
    in
    let pr_mag (c,port,prop) v =
      let prefix = "comp "^c^"."^port^" prop "^prop in
      match v with
      | HCMagRange(v) -> prefix^" in "^(RANGE.range2str v)
      | HCNoMag -> prefix^" infinite operating range"
    in
    let pr_err (c,port,prop) v =
      let prefix = "comp "^c^"."^port^" prop "^prop in
      match v with
      | HERState(a) -> prefix^" error(t) <= "^(ASTLib.ast2str a hevid2str)
      | HERFunction(a) -> prefix^" error <= "^(ASTLib.ast2str a hevid2str)
      | HERNoError -> prefix^" no error"
    in
    let pr_tc (c) v =
      let prefix = "comp "^c^" time-const" in
      match v with
      | HCMagRange(v) -> prefix^" in "^(RANGE.range2str v)
      | HCNoMag -> prefix^" infinite operating range"
    in
    let pr_conns (c,p) v =
      let prefix = "conn "^c^"."^p in
      let intpairlst2str lst =
        let one (x,y) = "("^(string_of_int x)^","^(string_of_int y)^")" in
        List.fold_right (fun x r -> (one x)^" "^r) (SET.to_list lst) ""
      in
      match v with
      | HCConnLimit(snks) -> prefix^":"^(MAP.fold snks (fun (c,v) pairs r -> r^"\n   "^c^"."^v^"->"^(intpairlst2str pairs)) "")
      | HCConnNoLimit -> prefix^" is *"
    in
    let apply f k x r = r^"\n"^(f k x) in
    let istr = MAP.fold e.insts (apply pr_inst) "" in
    let mstr = MAP.fold e.mags (apply pr_mag) "" in
    let estr = MAP.fold e.errs (apply pr_err) "" in
    let tcstr = MAP.fold e.tcs (apply pr_tc) "" in
    let cnstr = MAP.fold e.conns (apply pr_conns) "" in
    let _ = Printf.printf "%s\n%s\n%s\n%s\n%s\n" istr mstr estr tcstr cnstr in
    ()

end
