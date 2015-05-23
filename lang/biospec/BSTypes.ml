
open BSLexicon

module Gene = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="Gene";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module Protein = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="Protein";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module MRNA = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="MRNA";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module PreMRNA = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="PreMRNA";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module PolyPeptide = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="PolyPeptide";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module Metabolite = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="Metabolite";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module SmallMolecule = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="SmallMolecule";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end

module Promoter = struct 
   type impl = {
      name : string
   }
   include Kind (struct type typ = impl end)

   let create() = {
      name="Promoter";
      phrase=[Required([Variable("name")])];
   }
   (* Bind to struct *)
   let rec bind vlist = 
      match vlist with
         ("name",v)::t -> 
            let q = bind t in {name=v}
         |(k,v)::t -> 
            raise_bind_error ("Unknown key "^k);
         | [] -> {name=""}

   (* Bind from struct *)
   let rec unbind imp = 
      [("name",imp.name)]

end