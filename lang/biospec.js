var process_line = function(l, keyword, cl){
   var replace_with = "<span class='"+cl+"'>"+keyword+"</span>";
   var re = new RegExp(keyword, 'g');

   return l.replace(re, replace_with);
}
$(document).ready(function(){
   var code = CODE.ex1;

   var lines = code.split('\n');
   lines.forEach(function(line){
      var l = line.trim();
      l = process_line(l,"Gene",'gene');
      l = process_line(l,"Protein",'protein');
      l = process_line(l,"Promoter",'promoter');

      l = process_line(l,"promotes",'action');
      l = process_line(l,"inhibits",'action');
      l = process_line(l,"yields",'action');
      var e = $("<div/>").html(l);
      $("#code").append(e);
   });
})