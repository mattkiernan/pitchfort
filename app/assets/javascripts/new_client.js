$(function(){
  $("body").on("click", ".new-client-button", function(){
    $(".new-client").show("slow");
    $(".new-client-button").hide("slow");
    return false;
  });
});
