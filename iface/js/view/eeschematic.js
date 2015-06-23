
var EESchematic = function(id){
   this.init = function(id){
      this.root = $("#"+id);
      var w = $(window).width();
      var h = $(window).height();
      this.w = w;
      this.h = h;
      this.root.attr({
         width:w,
         height:h
      })
      this.root.css({
         width:w,
         height:h
      })

      this.data = {};
      this.create_layout(id);
   }
   /*
   this.capacitor = function(id){
      var style = {fill:"#000"};
      var w = 40;
      var h = 50;
      var sp = 5;
      var th = 3;
      var r = 2;

      var top = this.rect(0,h/2-sp-th,w,th).attr(style);
      var bot = this.rect(0,h/2+sp,w,th).attr(style);
      var conn_top = this.circle(w/2,r,r).attr(style);
      var conn_bot = this.circle(w/2,h-r,r).attr(style);
      var line_top = this.rect(w/2-r/2,r,r,h/2-sp-th);
      var line_bottom = this.rect(w/2-r/2,h/2+sp+th,r,h/2-sp-th);

      conn_top.classed("connector input", true);
      conn_bot.classed("connector output", true);
      var g = this.group([top,bot,conn_top,conn_bot,line_top, line_bottom])
         .classed("element capacitor", true);
      return g;
   }
   this.ground = function(id){
      var style = {fill:"#000"};
      var that = this;
      var w = 40;
      var h = 40;
      var sp = 8;
      var th = 2;
      var r = 2;
      
      var line1 = this.rect(0,h-sp*3-th,w,th).attr(style);
      var line2 = this.rect(w*0.33/2,h-sp*2-th,w*0.66,th).attr(style);
      var line3 = this.rect(w*0.66/2,h-sp-th,w*0.33,th).attr(style);
      var line4 = this.rect(w*0.90/2,h-th,w*0.10,th).attr(style);
      var conn_top = this.circle(w/2,r,r).attr(style);
      var line_top = this.rect(w/2-r/2,r,r,h-sp*3-th);
      conn_top.classed("connector input", true);

      var g = this.group([line1,line2,line3,line4,conn_top, line_top])
         .classed("element ground", true);
      return g;
   }
   this.joint = function(id){
      var that = this;
      var jnt = this.circle(4,4,4)
         .attr({
            fill: "#000",
            stroke:"#000",
            strokewidth:2
         })
         .classed("element connector input output joint", true);
      var g = this.group([jnt]);
      return g;
   }
   this.hole = function(id){
      alert("hole not supported");
   }
   this.smthole = function(id){
      alert("smt hole not supported");
   }
   this.circuit = function(id){
      alert("circuit not supported");
   }
   this.wire = function(id,source,sink){
      var p = this.s.append("path").attr({fill:"rgba(0,0,0,0)",stroke:"#F00",strokewidth:2})
      var g = this.group([p]);

      return g;
   }
   */
   this.create_layout = function(id){
      var that = this;
      
      if(this.layout == undefined){
         this.layout = {};
         this.layout.g = new joint.dia.Graph;
         this.layout.paper = new joint.dia.Paper({
            el: $("#"+id),
            width: that.w,
            height: that.h,
            model: that.layout.g,
            gridsize: 1
         });
         this.layout.auto = new joint.layout.GridLayout.layout(this.layout.g, {
            columns:20,
            columnWidth: 100,
            rowHeight: 70
         })
         this.layout.templates = {};
         this.layout.templates.box = new joint.shapes.basic.Rect({
               position: { x: 0, y: 0 },
               size: { width: 100, height: 30 },
               attrs: { rect: { fill: 'blue' }, text: { text: 'my box', fill: 'white' } }
         })

         this.layout.templates.link = function(source,sink){
            var link = new joint.dia.Link({
               source: {id: source},
               target: {id: sink}
            });
            link.attr({
               '.connection': { stroke: 'blue' },
               '.marker-source': { fill: 'red', d: 'M 10 0 L 0 5 L 10 10 z' },
               '.marker-target': { fill: 'yellow', d: 'M 10 0 L 0 5 L 10 10 z' }
            });
            return link;
          }
      }
   }
   this.draw = function(){
      
   }
   this.add = function(type,id,data,source,sink){
      this.data[id] = clone(data);
      /*
      if(type == "capacitor"){
         var g= this.capacitor(id);
      }
      else if(type == "ground"){
         var g= this.ground(id);
      }
      else if(type == "joint"){
         var g= this.joint(id);
      }
      else if(type == "hole"){
         var g= this.hole(id);
      }
      else if(type == "circuit"){
         var g= this.circuit(id);
      }
      else if(type == "smthole"){
         var g= this.smthole(id);
      }
      else if(type == "wire"){
         var g= this.wire(id,source,sink);
      }
      
      g.attr("id",id);
      this.data[id].svg = g;

      if(type == "wire"){
         g.attr("class","link");
      }
      else{
         g.attr("class","node")
      }
      */
      if(type == "wire"){
         var sid = this.data[source].view.id;
         var eid = this.data[sink].view.id;

         this.data[id].view = this.layout.templates.link(sid,eid);
         this.layout.g.addCell(this.data[id].view);
      }
      else {
         this.data[id].view = this.layout.templates.box.clone();
         this.layout.g.addCell(this.data[id].view);
      }
   }
   

   this.init(id);
}