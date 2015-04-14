
/*create special nodes*/
var SVGUtil = function(){
   this.createTextBox = function(s,c,text){
      var view = {};
      var padding = {x:8,y:5};
      view.box = s.rect(0,0,0,0,10,10)
         .attr('fill',c.fill)
         .attr('stroke',c.stroke)
         .attr('strokeWidth',3);

      view.text = s.text(0,0,text)
         .attr('font-size',"20px")
         .attr('text-anchor',"start")
         .attr('fill', c.text)
         .attr('x', padding.x)

      view.box
         .attr('width', view.text.node.clientWidth+padding.x*2)
         .attr('height', view.text.node.clientHeight+padding.y*2)

      view.text
         .attr('y', view.text.node.clientHeight)


      view.all = s.group(view.box,view.text);
      return view;
   }
   this.createArrow = function(s,c,size, text){
      var view = {};
      var padding = {x:8,y:5};
      view = this.createTextBox(s,{fill:c, stroke:c, text:"#eeeeee"},text);


      var arrow = s.polygon([0,10,4,10,2,0,0,10])
         .attr('fill', c)
         .transform('r90');
      var marker = arrow.marker(0,0,10,10,0,5);

      var ch = view.all.node.getBBox().height;
      var cw = view.all.node.getBBox().width;
      console.log(ch,cw);
      view.line1 = s.paper.line(0,0,0,-ch/2)
         .attr('stroke',c)
         .attr('strokeWidth', size);

      view.line2 = s.paper.line(0,-ch/2,cw,-ch/2)
         .attr('stroke',c)
         .attr('strokeWidth', size)
         .attr('markerEnd', marker)
      
      view.all.append(view.line1);
      view.all.append(view.line2);

      return view;
   }
}
var svgUtil = new SVGUtil();


var GeneElement = function(paper, parent, gene){
   this.init = function(){
      this.model = gene;
      this.paper = paper;
      this.parent = parent;
      this.view = {};
      this.view =  svgUtil.createTextBox(paper,{fill:"#2574A9", stroke:"#222222", text:"#ffffff"}, gene.name);
      this.view.all
         .data('info',this)
         .click(function(){
            console.log(this.data('info'));
         });
   }
   this.get_view = function(){
      return this.view;
   }

   this.init();
}
var PromoterElement = function(paper,parent,gene){
   this.init = function(){
      this.model = gene;
      this.paper = paper;
      this.parent = parent;
      this.view = svgUtil.createArrow(paper,"#444444", 5, gene.name);
   }
   this.get_view = function(){
      return this.view;
   }
   this.init();
}
var LocusElement = function(paper, parent, locus){
   this.init = function(){
      this.model = locus;
      this.parent = parent;
      this.paper = paper;
      this.gene = [];

      this.p = {};
      this.p.pad = 20; // space between genes
      this.p.height = 10;

      this.view = {};
      this.view.gaps = paper.group();
      this.view.name = paper.text(0,0,locus.name)
         .attr('alignment-baseline', 'text-before-edge')
         .attr('font-size',20);
      this.view.genes = paper.group();
      this.view.all = paper.group(this.view.gaps,this.view.genes, this.view.name);
   }
   this.get_view = function(){
      return this.view;
   }
   this._update = function(){
      var that = this;
      var x = this.p.pad;
      var h = 0;
      var create_gap = function(x,y,l,r){
         var gap = paper.rect(0,0,0,0,0,0)
         .attr('fill','#444444')
         .attr('width',that.p.pad)
         .attr('height',that.p.height)
         .data('left', l)
         .data('right',r)
         .click(function(){
            console.log(this.data('left'), this.data('right'))
         });

         var mat = new Snap.Matrix();
         mat.translate(x,y);
         gap.transform(mat.toTransformString());
         that.view.gaps.append(gap);

      }
      var last = null;
      for(var i=0; i < this.gene.length; i++){
         var v = this.gene[i].get_view();
         var cw = v.box.getBBox().width;
         var ch = v.box.getBBox().height;

         var mat = new Snap.Matrix();
         mat.translate(x,-ch/2);
         v.all.transform(mat.toTransformString());
         
         create_gap(x-this.p.pad, 0, last,this.gene[i]);
         
         x += cw+this.p.pad;
         if(ch > h) h = ch;
         last = this.gene[i];
      }
      create_gap(x-this.p.pad, 0, last,null);

      var mat = new Snap.Matrix();
      mat.translate(0,h+10);
      this.view.name.transform(mat.toTransformString());
   }
   this.add_gene = function(gene_data, gene_after){
      if(gene_after == undefined){
         if(gene_data.type == "gene")
            var ge = new GeneElement(this.paper, this, gene_data);
         else if(gene_data.type == "promoter")
            var ge = new PromoterElement(this.paper, this, gene_data);
         this.view.genes.append(ge.get_view().all);
         this.gene.push(ge);
      }
      this._update();
      return ge;
   }
   this.init();

}
var PathwayElement = function(paper, name){
   this.init = function(){
      this.paper = paper;
      this.name = name;
      this.loci = [];
      this.view = {};
      this.view.all = this.paper.group();
   }
   this.add_locus = function(locus_data){
      var le = new LocusElement(this.paper, this, locus_data);
      var mat = new Snap.Matrix();
      var v = le.get_view().all;
      
      mat.translate(0,100+this.loci.length*150);
      v.transform(mat.toTransformString());
      this.view.all.append(v);
      this.loci.push(le);
      return le;
   }
   this.init();
}

var BioDiagram = function(id,model,w,h){
   this.init = function(){
      var that = this;
      this.model = model;
      this.p = {}
      this.p.width  =w;
      this.p.height = h;
      this.evt = new Observer();

      this.paper = Snap("#"+id)
         .attr('width',w)
         .attr('height',h)

      this.load();
   }

   this.load = function(){
      var d = this.model.get_data();
      var pathway = new PathwayElement(this.paper, d.name);
      for(locus in d.structure.loci){
         var loc = d.structure.loci[locus];
         var locv = pathway.add_locus(loc);
         for(var j=0; j < loc.members.length; j++){
            locv.add_gene(this.model.gene(loc.members[j]));
         }

      }

   }


   this.init();
}