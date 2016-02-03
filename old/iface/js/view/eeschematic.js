
var EESchematic = function(id){
   this.rect = function(x,y,w,h){
      return this.s.append('rect').attr({x:x,y:y,width:w,height:h})
   }
   this.circle = function(x,y,r){
      return this.s.append('circle').attr({cx:x,cy:y,r:r})
   }
   this.path = function(){
      return this.s.append('path');
   }
   this.g = function(l){
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
      this.groot = this.g([]);
      this.create_layout(id);
   }
   
   this.capacitor = function(id){
      var style = {fill:"#000"};
      var w = 20;
      var h = 40;
      var sp = 5;
      var th = 3;
      var r = 2;
      var center_trans = "translate("+(-w/2)+","+(-h/2)+")";
      var top = this.rect(0,h/2-sp-th,w,th)
         .attr(style)
         .attr("transform",center_trans);
      var bot = this.rect(0,h/2+sp,w,th)
         .attr(style)
         .attr("transform",center_trans);
      var conn_top = this.circle(w/2,r,r)
         .attr(style)
         .attr("transform",center_trans);
      var conn_bot = this.circle(w/2,h-r,r)
         .attr(style)
         .attr("transform",center_trans);
      var line_top = this.rect(w/2-r/2,r,r,h/2-sp-th)
         .attr(style)
         .attr("transform",center_trans);
      var line_bottom = this.rect(w/2-r/2,h/2+sp+th,r,h/2-sp-th)
         .attr(style)
         .attr("transform",center_trans);

      var bg = this.circle(0,0,h/2).attr({fill:"#fff",stroke:"#444",strokewidth:2});

      conn_top.classed("connector input", true);
      conn_bot.classed("connector output", true);
      var g = this.g([bg,top,bot,conn_top,conn_bot,line_top, line_bottom])
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
      var center_trans = "translate("+(-w/2)+","+(-h/2)+")";
      
      var line1 = this.rect(0,h-sp*3-th,w,th)
         .attr(style)
         .attr("transform",center_trans);
      var line2 = this.rect(w*0.33/2,h-sp*2-th,w*0.66,th)
         .attr(style)
         .attr("transform",center_trans);
      var line3 = this.rect(w*0.66/2,h-sp-th,w*0.33,th)
         .attr(style)
         .attr("transform",center_trans);
      var line4 = this.rect(w*0.90/2,h-th,w*0.10,th)
         .attr(style)
         .attr("transform",center_trans);
      var conn_top = this.circle(w/2,r,r)
         .attr(style)
         .attr("transform",center_trans);
      var line_top = this.rect(w/2-r/2,r,r,h-sp*3-th)
         .attr(style)
         .attr("transform",center_trans);
      conn_top.classed("connector input", true);

      var bg = this.circle(0,0,h/2).attr({fill:"#fff",stroke:"#444",strokewidth:2});

      var g = this.g([bg, line1,line2,line3,line4,conn_top, line_top])
         .classed("element ground", true);
      return g;
   }
   this.joint = function(id){
      var that = this;
      var jnt = this.circle(0,0,4)
         .attr({
            fill: "#000",
            stroke:"#000",
            strokewidth:2
         })
         .classed("element connector input output joint", true);
      var g = this.g([jnt]);
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
      var p = this.path()
         .attr({fill:"rgba(0,0,0,0)",stroke:"#F00",strokewidth:2,"z-index":-3})
      var g = this.g([p]);

      return g;
   }
   
   this.create_layout = function(id){
      var that = this;
      this.layout = {};
      this.layout.nodes = [];
      this.layout.links = [];
      this.layout.constraints = [];
      this.layout.groups = [];
      this.layout.make = {};
      this.layout.make.align = function(axis,src,snk){
         return {
            type: "alignment",
            axis: axis,
            offsets: [
               {node:src.layout.id, offset:0},
               {node:snk.layout.id, offset:0}
            ]
         }
      }
      this.layout.make.ineq = function(axis,src,snk,gap){
         if(axis == "x"){
            return {
               axis:"x",
               left:src.layout.id,
               right:snk.layout.id,
               gap:gap
            }
         }
         else{
            return {
               axis:"y",
               left:src.layout.id,
               right:snk.layout.id,
               gap:gap
            }
         }
      }
   }

   this.draw = function(){
      var that = this;

      var tick = function(){
         //draw
         that.s.selectAll(".node")
            .attr("transform", function(d){
               var x = d.layout.x;
               var y = d.layout.y;
               return "translate("+x+","+y+")";
            })
         that.s.selectAll(".link")
            .each(function(d){
               var x1 = d.layout.source.x, y1 = d.layout.source.y;
               var x2 = d.layout.target.x, y2 = d.layout.target.y;
               var midx = (x1+x2)/2
               var midy = (y1+y2)/2;
               var p = d3.select(this).select("path");
               var c = function(x,y){return Math.floor(x)+" "+Math.floor(y)}
               var path = "M "+c(x1,y1)+
                  //" L "+c(midx,y1)+
                  //" L "+c(midx,y2)+
                  " L "+c(x2,y2);

               p.attr('d', path)
                  .attr("stroke-width","3px")
                  .attr("stroke","red");
            })
      }
      this.s.selectAll("g").sort(function(a,b){
         if(a == undefined || b == undefined) return 1;
         if(a.layout.type != "edge") return 1;
         else return -1;
      })
      this.layout.force = cola.d3adaptor()
        .nodes(this.layout.nodes)
        .links(this.layout.links)
        .groups(this.layout.groups)
        .constraints(this.layout.constraints)
        .linkDistance(60)
        .handleDisconnected(true)
        .avoidOverlaps(true)
        .size([this.w, this.h])
        .on('tick', function(){tick()})
        .start();

   }
   this.group = function(){
      var grp = {
         leaves:[]
      };
      this.layout.groups.push(grp);
      return this.layout.groups.length - 1;
   }
   this.add = function(type,id,data,source,sink, grp){
      this.data[id] = clone(data);
      var group = null;
      if(grp != undefined){
         group = grp;
      }
      else if(type != "wire" && source != undefined){
         group = source;
      }
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
         var src = this.data[source], snk = this.data[sink];
         var stype = src.type, etype = snk.type;


         this.layout.constraints.push(this.layout.make.ineq("y",src,snk,45))

         this.layout.links.push({
            source:src.layout.id,
            target:snk.layout.id,
            type:"edge",
            id: id
         })
         g.classed("link", true)
         .data([{
            data: this.data[id],
            layout:this.layout.links[this.data[id].layout.id]
         }]).enter()
      }
      else{
         var b = g.node().getBBox();
         this.data[id].layout.id = this.layout.nodes.length;
         this.layout.nodes.push({
            index:this.data[id].layout.id,
            width: b.width,
            height: b.height,
            rx: b.width/2,
            ry: b.height/2,
            type:"node",
            id: id
         })
         g.classed("node", true)
         .data([{
            data: this.data[id],
            layout: this.layout.nodes[this.data[id].layout.id]
         }]).enter()
      }
      if(group != null && type != "wire"){
         console.log(this.data[id].layout.id);
         this.layout.groups[group].leaves.push(this.data[id].layout.id);
      }
      
   }
   

   this.init(id);
}