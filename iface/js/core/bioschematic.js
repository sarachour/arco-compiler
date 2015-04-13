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
      this._id = 0;
      this.all = {};



      this.gene("Plux", 'promoter');
      this.gene('luxR', 'gene');
      this.gene('gfp', 'gene');
      this.gene('mCherry', 'gene');


      var l1 = this.locus('low copy plasmid');
      this.add_to_locus('low copy plasmid', 'Plux');
      this.add_to_locus('low copy plasmid', 'luxR');
      this.add_to_locus('low copy plasmid', 'gfp');

      var l1 = this.locus('high copy plasmid');
      this.add_to_locus('high copy plasmid', 'Plux');
      this.add_to_locus('high copy plasmid', 'mCherry');

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