var EESchematic = function(id){
   this.init = function(id){
      this.root = $("#"+id);
      var w = $(window).width();
      var h = $(window).height();

      this.root.attr({
         width:w,
         height:h
      })
      this.root.css({
         width:w,
         height:h
      })

      this.data = null;
      this.s = Snap("#"+id);
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
      var g = this.s.group(top,bot,conn_top,conn_bot,line_top, line_bottom);
      g.attr({"transform":"t250,170s"})
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
      
      var g = this.s.group(line1,line2,line3);

      return g;
   }
   this.joint = function(id){
      var jnt = this.s.circle(Math.random()*400+100,100,4);
      var that = this;
      jnt.attr({
         fill: "#000",
         stroke:"#000",
         strokewidth:2
      })
      jnt.click(function(){
         var d = that.data[id];
         console.log(d);
      })
      return jnt;
   }
   this.load = function(data){
      var that = this;
      var name = data.id.name;
      this.data = {};
      this.svg = {};

      data.wires.forEach(function(w){
         var name = w.id.name;
         var id = w.id.id;
         that.data[id] = w;
         console.log(w);
      })
      data.circuits.forEach(function(c){
         var name = c.id.name;
         var id = c.id.id;

         that.data[id] = c;
         c.wires.forEach(function(w){
            var name = w.id.name;
            var id = w.id.id;
            that.data[id] = w; 
            console.log(w);
         })

         c.blocks.forEach(function(b){
            var name = b.id.name;
            var id = b.id.id;
            var type = b.type;
            that.data[id] = b; 
            if(type == "capacitor"){
               that.capacitor(id);
            }
            else if(type == "ground"){
               that.ground(id);
            }
            else if(type == "joint"){
               that.joint(id);
            }
            console.log(type,b);
         })
         
      })
   }

   this.init(id);
}