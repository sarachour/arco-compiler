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
      this.ids = [];
      this.s = d3.select("#"+id);
      this.groot = this.group([]);
      this.create_layout(id);
   }
   
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
   
   this.create_layout = function(id){
      var that = this;
      this.layout = {};
      this.layout.nodes = [];
      this.layout.links = [];
   }
   this.collide = function(node) {
      var r = node.radius + 16,
      nx1 = node.x - r,
      nx2 = node.x + r,
      ny1 = node.y - r,
      ny2 = node.y + r;
     return function(quad, x1, y1, x2, y2) {
       if (quad.point && (quad.point !== node)) {
         var x = node.x - quad.point.x,
             y = node.y - quad.point.y,
             l = Math.sqrt(x * x + y * y),
             r = node.radius + quad.point.radius;
         if (l < r) {
           l = (l - r) / l * .5;
           node.x -= x *= l;
           node.y -= y *= l;
           quad.point.x += x;
           quad.point.y += y;
         }
       }
       return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
     };
   }
   this.draw = function(){
      var that = this;

      var tick = function(){
         //collision detection
         var nodes = that.layout.nodes;
         var q = d3.geom.quadtree(nodes);
         var i = 0;
         var n = nodes.length;
         while (++i < n) q.visit(that.collide(nodes[i]));

         that.s.selectAll(".node")
            .attr("transform", function(d){
               return "translate("+d.layout.x+","+d.layout.y+")";
            })
         that.s.selectAll(".link")
            .attr("transform", function(d){
               var x1 = d.layout.source.x, y1 = d.layout.source.y;
               var x2 = d.layout.target.x, y2 = d.layout.target.y;
               var midx = (x1+x2)/2
               var midy = (y1+y2)/2;
               var p = that.s.select("path",$(this));
               var c = function(x,y){return Math.floor(x)+" "+Math.floor(y)}
               var path = "M "+c(x1,y1)+
                  " L "+c(midx,y1)+
                  " L "+c(midx,y2)+
                  " L "+c(x2,y2);

               p.attr('d', path)
                  .attr("stroke-width","3px")
                  .attr("stroke","red");
               console.log(p,path);
               //return "translate("+d.layout.x+","+d.layout.y+")";
            })
      }
      this.layout.force = d3.layout.force()
       .nodes(this.layout.nodes)
       .links(this.layout.links)
       .size([this.w, this.h])
       .charge(-200)
       .gravity(0.05)
       .size([this.w, this.h])
       .on("tick", function(){ tick(); })
       .start();
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
      this.ids.push(id);
      this.data[id].view = g;
      this.data[id].layout = {};

      if(type == "wire"){
         this.data[id].layout.id = this.layout.links.length;
         var sid = this.data[source].layout.id;
         var eid = this.data[sink].layout.id;
         this.layout.links.push({
            source:sid,
            target:eid,
            id: id
         })
         g.classed("link", true)
         .data([{
            data: this.data[id],
            layout:this.layout.links[this.data[id].layout.id]
         }]).enter()
      }
      else{
         this.data[id].layout.id = this.layout.nodes.length;
         this.layout.nodes.push({
            index:this.data[id].layout.id,
            x: 0,
            y:0,
            radius:Math.max(g.node().getBBox().width,g.node().getBBox().height)/2,
            id: id
         })
         g.classed("node", true)
         .data([{
            data: this.data[id],
            layout: this.layout.nodes[this.data[id].layout.id]
         }]).enter()
      }
      
   }
   

   this.init(id);
}