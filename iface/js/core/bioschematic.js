var BioSchematic = function(){
   this.init = function(){
      this.data = {};
      this.data.members = {
         genes: {}, // all the genes in the schematic
         molecules: {}, // all the molecules in the schematic
         protiens: {}
      }
      this.data.structure = {
         loci: {}
      }
      this.data.interactions = {
         inhibit: {},
         excite: {}
      }
      this.data.info = {

      }
      this._id = 0;
      this.all = {};

      this.info("Linearization Circuit");

      this.gene("Plux", 'promoter');
      this.gene('luxR', 'gene');
      this.gene('gfp', 'gene');
      this.gene('mCherry', 'gene');

      this.inhibits('Coloring inhibits promoter','gene', 'mCherry', 'gene', 'Plux');

      var l1 = this.locus('low copy plasmid');
      this.add_to_locus('low copy plasmid', 'Plux');
      this.add_to_locus('low copy plasmid', 'luxR');
      this.add_to_locus('low copy plasmid', 'gfp');

      var l1 = this.locus('high copy plasmid');
      this.add_to_locus('high copy plasmid', 'Plux');
      this.add_to_locus('high copy plasmid', 'mCherry');

   }
   this.info = function(name){
      if(name != undefined){
         this.data.info.name = name;
      }
      return this.data.info.name;
   }
   //genes have unique names
   this.gene = function(name, type){
      if(!(name in this.data.members.genes)){
         this.data.members.genes[name] = {
            name:name,
            id: this._id,
            type: type
         };
         this.all[this._id] = this.data.members.genes[name];
         this._id++;
      }
      return this.data.members.genes[name];
   }
   //loci have unique names
   this.locus = function(name){
      if(!(name in this.data.structure.loci)){
         this.data.structure.loci[name] = {
            name:name,
            id: this._id,
            members: []
         }
         this.all[this._id] = this.data.structure.loci[name];
         this._id++;
      }
      return this.data.structure.loci[name];
   }
   this._get_dynamic = function(t,e){
      if(t == 'gene') return this.gene(e);
      else if(t == "locus") return this.locus(e);

   }
   this._add_interaction = function(itype, desc, t1, e1, t2, e2){
      if(e1 != undefined && e2 != undefined){
         var e = {};
         e.compound = this._get_dynamic(t1,e1);
         e.target = this._get_dynamic(t2,e2);
         this.data.interactions[itype][desc] = e;
      }
   }
   this.inhibits = function(desc,t1,e1,t2,e2){
      this._add_interaction('inhibit',desc,t1,e1,t2,e2);
   }
   this.excites = function(desc,t1,e1,t2,e2){
      this._add_interaction('excite',desc,t1,e1,t2,e2);
   }
   //adds to locus in left-to-right order
   this.add_to_locus = function(locus, gene){
      this.locus(locus).members.push(this.gene(gene).name);
   }
   this.get = function(id){
      return this.all[id];
   }

   this.get_data = function(){
      return this.data;
   }

   this.init();
}