$(function(){
  $("body").on("click", ".hide-me", function(){
    $(".new-client").hide("slow");
    $(".new-client-button").show("slow");
    return false;
  });
});
