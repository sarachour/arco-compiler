var BioDiagram = function(id,model,w,h){
   this.init = function(){
      var that = this;
      this.model = model;
      this.width  =w;
      this.height = h;
      this.evt = new Observer();
      this.instances = {};
      this.div = $("#"+id);
      jsPlumb.setContainer($(id));

      jsPlumb.ready(function(){
         console.log("ready");
         that.root = jsPlumb.getInstance({
            DragOptions: {cursor: 'pointer', zIndex:2000},
            Container: id
         })
         that.evt.trigger('ready');
         that._build();
      })
      $("#"+id).width(w).height(h);
   }
   this._build_locus = function(l){
      console.log(l);
      var lname = "locus."+l.name+".inst"+this._get_instance(l);
      var locus = $("<div/>").attr('id',lname).addClass("locus");
      var locus_cap = $("<div/>").addClass('locus-cap')
                        .attr('id', lname+".start")
                        .html(l.name);
      var last = locus_cap;

      locus.append(locus_cap);
      this.div.append(locus);

      for(var i=0; i < l.members.length; i++){
         var gene_name = l.members[i];
         var gene = this._build_gene(this.model.gene(gene_name));
         gene.css('margin-left', "5em");
         locus.append(gene);
         jsPlumb.connect({
            source: last.attr('id'),
            target: gene.attr('id'),
            connector: "Straight",
            anchor: ["Continuous", {faces:["left","right"]}],
            endpoint: ["Rectangle", {cssClass:"locus-cap",width:10, height:10}]
         })
         last = gene;
      }
      return locus;
   }
   this._get_instance = function(name, id){
      if(!(name in this.instances)){
         this.instances[name] = {count:0, id:id};
      }
      else this.instances[name]+=1;

      return this.instances[name].count;
   }
   this._build_gene = function(g){
      var inst_name = "gene."+g.name+".inst"+this._get_instance(g.name, g.id);
      var gene = $("<div/>")
         .attr('id',inst_name)
         .html(g.name)
         .addClass('gene')
         .data("info",g)
         .click(function(){
            console.log($(this).data('info'));
         });
      return gene;
   }
   this._build_inhibitory = function(l){

   }
   this._build_excitatory = function(l){

   }
   this._build = function(){
      var d = this.model.get_data();
      var genes = [];
      for(locus in d.structure.loci){
         var locus_data = d.structure.loci[locus];
         var locus_view = this._build_locus(locus_data);
      }
      console.log(genes);

   }


   this.init();
}