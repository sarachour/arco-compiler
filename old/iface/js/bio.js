var model;
var view;
$(document).ready(function(){
   model = new BioSchematic();
   view = new BioDiagram("diag", model, 1200,800);
})