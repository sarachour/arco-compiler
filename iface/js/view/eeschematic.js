var EESchematic = function(id){
   this.rect = function(x,y,w,h){
      return this.s.append('rect').attr({x:x,y:y,width:w,height:h})
   }
   this.circle = function(x,y,r){
      return this.s.append('circle').attr({cx:x,cy:y,r:r})
   }
   this.group = function(l){
      var g = this.s.append("g");
      l.forEach(function(x){g.node().appendChild(x.node())})
      return g
   }
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
      this.s = d3.select("#"+id);
      this.groot = this.group([]);
      this.create_layout();
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
   this.create_layout = function(){
      var that = this;
      if(this.layout == undefined){
         this.layout = {};
         this.layout.g = new dagreD3.graphlib.Graph().setGraph({});
         this.layout.render = new dagreD3.render();
         this.layout.render.shapes().capacitor = function(parent, bbox, node) {
           var w = bbox.width,
               h = bbox.height,
               points = [
                 { x:   0, y:        0 },
                 { x:   w, y:        0 },
                 { x:   w, y:       -h },
                 { x: w/2, y: -h * 3/2 },
                 { x:   0, y:       -h }
               ];
               shapeSvg = 
                  parent
                 .insert("polygon", ":first-child")
                 .attr("points", points.map(function(d) { return d.x + "," + d.y; }).join(" "))
                 .attr("transform", "translate(" + (-w/2) + "," + (h * 3/4) + ")");

           node.intersect = function(point) {
             return dagreD3.intersect.polygon(node, points, point);
           };

           return shapeSvg;
         };
         // Set up zoom support
         this.layout.zoom = d3.behavior.zoom().on("zoom", function() {
            that.groot.attr("transform", "translate(" + d3.event.translate + ")" +
              "scale(" + d3.event.scale + ")");
         });
         this.s.call(this.layout.zoom);
      }
   }
   this.draw = function(){
      console.log(this.layout.g);
      this.layout.render(this.groot, this.layout.g);
      // Center the graph
      var initialScale = 0.75;
      this.layout.zoom
        .translate([(this.s.attr("width") - this.layout.g.graph().width * initialScale) / 2, 20])
        .scale(initialScale)
        .event(this.s);
      this.s.attr('height', this.layout.g.graph().height * initialScale + 40);
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
         this.layout.g.setEdge(source, sink,{
            arrowhead:"vee",
            style:"stroke:#F00; stroke-width:2px;fill:rgba(0,0,0,0);",
            arrowheadStyle:"fill:#F00",
            lineInterpolate: "bundle",
            id:id
         });
      }
      else {
         var colors = {
            "capacitor": "0f0",
            "ground" : "ff0",
            "joint" : "00f"
         }
         this.layout.g.setNode(id, {
            shape: "capacitor", 
            style:"stroke:#0F0; stroke-width:1px; fill:#"+colors[type]+";",
            label: data.name
         })  
      }
   }
   

   this.init(id);
}