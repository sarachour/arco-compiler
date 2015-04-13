var BioDiagram = function(id,model,w,h){
   this.init = function(){
      this.model = model;
      this.width  =w;
      this.height = h;
      this.graph = new joint.dia.Graph;
      this.paper = new joint.dia.Paper({
         el: $("#"+id),
         width: w,
         height: h,
         model: this.graph,
         gridSize:1
      })
      this.styles = {};
      this._build();
   }
   this._build_gene = function(obj,x,y,w,h){
      var background = "#EEEEEE";
      var border = "#dddddd";

      var cell = new joint.shapes.bio.Gene({
         position:{x:x,y:y},
         size:{w:w,h:h},
         attrs: {
            '.card': {fill: background, stroke: border},
            '.name': {text:obj.name}

         }
      })
      return cell;
   }
   this._build = function(){
      var genes = [];
      for(gene in this.model.get_data().members.genes){
         genes.push(this._build_gene({name:gene}, 0,0,100,100));
      }
      console.log(genes);
      this.graph.addCells(genes);

   }


   this.init();
}