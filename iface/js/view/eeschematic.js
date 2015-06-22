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
      this.s = Snap("#"+id);
      this.create_layout();
   }
   this.capacitor = function(id){
      var style = {fill:"#000"};
      var w = 40;
      var h = 50;
      var sp = 5;
      var th = 3;
      var r = 2;

      var top = this.s.rect(0,h/2-sp-th,w,th).attr(style);
      var bot = this.s.rect(0,h/2+sp,w,th).attr(style);
      var conn_top = this.s.circle(w/2,r,r).attr(style);
      var conn_bot = this.s.circle(w/2,h-r,r).attr(style);
      var line_top = this.s.rect(w/2-r/2,r,r,h/2-sp-th);
      var line_bottom = this.s.rect(w/2-r/2,h/2+sp+th,r,h/2-sp-th);

      conn_top.addClass("connector input");
      conn_bot.addClass("connector output");
      var g = this.s.group(top,bot,conn_top,conn_bot,line_top, line_bottom)
         .addClass("element capacitor");
      return g;
   }
   this.ground = function(id){
      var style = {fill:"#000"};
      var w = 40;
      var h = 40;
      var sp = 8;
      var th = 2;
      var r = 2;

      var line1 = this.s.rect(0,h-sp*3-th,w,th).attr(style);
      var line2 = this.s.rect(w*0.33/2,h-sp*2-th,w*0.66,th).attr(style);
      var line3 = this.s.rect(w*0.66/2,h-sp-th,w*0.33,th).attr(style);
      var line4 = this.s.rect(w*0.90/2,h-th,w*0.10,th).attr(style);
      var conn_top = this.s.circle(w/2,r,r).attr(style);
      var line_top = this.s.rect(w/2-r/2,r,r,h-sp*3-th);
      conn_top.addClass("connector input");
      var g = this.s.group(line1,line2,line3,line4,conn_top, line_top)
         .addClass("element ground");
      return g;
   }
   this.joint = function(id){
      var jnt = this.s.circle(4,4,4);
      var that = this;
      jnt.attr({
         fill: "#000",
         stroke:"#000",
         strokewidth:2
      }).addClass("element connector input output joint");
      var g = this.s.group(jnt);
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
      var p = this.s.path().attr({fill:"rgba(0,0,0,0)",stroke:"#F00",strokewidth:2})
      var g = this.s.group(p);

      var src = this.data[source];
      var snk = this.data[sink];
      /*
      var update = function(){
         var inp = src.svg.select(".output");
         var out = snk.svg.select(".input");
         var ix = inp.attr("cx"); 
         var iy = inp.attr("cy");
         var ox = out.attr("cx"); 
         var oy = out.attr("cy");
         var newpath = "M "+ix+" "+iy+" L "+ox+" "+oy
         console.log(newpath);
         p.animate({d:newpath})
      }
      update();
      */
      return g;
   }
   this.create_layout = function(){
      var that = this;
      if(this.layout == undefined){
         this.layout = {};
         this.layout.g = new dagre.graphlib.Digraph();
         this.layout.g.setGraph({});

         this.layout.g.setDefaultEdgeLabel(function(){return {};});

      }
      /*
      if(this.layout == undefined){
         this.layout = {};
         this.layout.nodes = {};
         this.layout.edges = {};
         this.layout.graph = new Springy.Graph();
         this.layout.layout = new Springy.Layout.ForceDirected(
           that.layout.graph,
           400.0, // Spring stiffness
           400.0, // Node repulsion
           0.5 // Damping
         );

         this.layout.renderer = new Springy.Renderer(
           that.layout.layout,
           function clear() {
             // code to clear screen
           },
           function drawEdge(edge, p1, p2) {
             var id = edge.data.id;
             var e = that.data[id].svg;
             var ix = p1.x, iy = p1.y;
             var ox = p2.x, oy = p2.y;
             // draw an edge
             var newpath = "M "+ix+" "+iy+" L "+ox+" "+oy
             e.select("path").attr({d:newpath})
           },
           function drawNode(node, p) {
             var id = node.data.id;
             var t = new Snap.Matrix();
             t.translate(p.x*5+50, p.y*5+50); 
             that.data[id].svg.transform(t);
             //that.data[id].obs.trigger('update');
             // draw a node
           }
         );
         this.layout.renderer.start();
      }
      */
   }
   this.draw = function(){
      var g = this.layout.g;
      var that = this;
      dagre.layout(g);
      this.layout.g.nodes().forEach(function(v){
         var n = g.node(v);
         var el = that.data[v].svg;
         var width = el.getBBox().width;
         var height = el.getBBox().height;
         var t = new Snap.Matrix();
         t.translate(n.x-width/2,n.y-height/2); 
         el.transform(t);
      })
      this.layout.g.edges().forEach(function(e){
         var ed = g.edge(e);
         var path = "";

         path += "M"+ed.points[0].x + " "+ed.points[0].y;
         for(var i=1; i < ed.points.length; i++){
            path += " L "+ed.points[i].x + " "+ed.points[i].y;
         }
         console.log(path);
         that.data[ed.id].svg.select('path').attr("d",path)
      })
   }
   this.add = function(type,id,data,source,sink){
      this.data[id] = clone(data);
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
      this.data[id].obs = new Observer();

      if(type == "wire"){
         this.layout.g.setEdge(id,source,sink);
      }
      else{
         var width = g.getBBox().width;
         var height = g.getBBox().height;
         this.layout.g.setNode(id, {width:width, height:height})
         
      }
      /*
      if(type == "wire"){
         
         this.layout.edges[id] = this.layout.graph.newEdge(
            this.layout.nodes[source],
            this.layout.nodes[sink],
         {id:id});
         
      }
      else {
         this.layout.nodes[id+".input"] = this.layout.graph.newNode({
            id:id,
            type:"input"
         }
         this.layout.nodes[id+".output"] = this.layout.graph.newNode({
            id:id
            type:"output"
         }
         var length = g.getBBox().height;
         var type = 
      */
   }
   

   this.init(id);
}