var model;
var view;

$(document).ready(function(){
   var name = "test1.json"
   $.getJSON( "data/"+name, function( data ) {
      model = data;
      view.load(model);
   });
   view = new EESchematic("viewport");

})