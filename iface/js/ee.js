var model;
var view;

this.load = function(data){
   var that = this;
   var name = data.id.name;
   this.data = {};
   this.svg = {};

   data.wires.forEach(function(w){
      var g = view.add("wire",w.id.id,w);
   })
   data.circuits.forEach(function(c){
      var grp = view.group();
      c.blocks.forEach(function(b){
         var g = view.add(b.type,b.id.id,b, grp);
      })

      c.wires.forEach(function(w){
         var g = view.add("wire",w.id.id,w,w.source.id,w.sink.id, grp);
      })

      
      
   })
   view.draw();
}

$(document).ready(function(){
   var name = "test1.json"
   $.getJSON( "data/"+name, function( data ) {
      model = data;
      load(model);
   });
   view = new EESchematic("viewport");
   view.create_layout();

})