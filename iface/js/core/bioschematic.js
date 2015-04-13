var BioSchematic = function(){
   this.init = function(){
      this.data = {};
      this.data.members = {
         genes: {}, // all the genes in the schematic
         molecules: {}, // all the molecules in the schematic
         protiens: {}, // all the protiens in the schematic
         promoters: {}
      }
      this.data.structure = {
         loci: []
      }
      this.data.interactions = {
         inhibit: {},
         excite: {}
      }

      this.data.members.genes.luxR = {};
      this.data.members.genes.gfp = {};
      this.data.members.promoters.Plux = {};
      this.data.members.genes.mCherry = {};
      this.data.members.molecules.AHL = {};

      var l1 = {};
      l1.name = "low copy plasmid";
      l1.members = [];
      l1.members.push({type:'promoter', name:'Plux'})
      l1.members.push({type:'gene',name:'luxR'})
      l1.members.push({type:'gene',name:'gfp'});

      var l2 = {};
      l2.name = 'high copy plasmid';
      l2.members = [];
      l2.members.push({type:'promoter', name:'Plux'})
      l2.members.push({type:'gene', name:'mCherry'});
      l2.members = [];

      this.data.structure.loci.push(l1);
      this.data.structure.loci.push(l2);
   }
   this.get = function(name){

   }

   this.get_data = function(){
      return this.data;
   }

   this.init();
}