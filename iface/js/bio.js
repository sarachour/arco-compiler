var model;
var view;
$(document).ready(function(){
   model = new BioSchematic();
   view = new BioDiagram("diag", model, 500,400);
})