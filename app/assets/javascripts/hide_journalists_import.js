$(function(){
  $("body").on("click", ".hide-me", function(){
    $(".import-journalists").hide("slow");
    $(".import-journalists-button").show("slow");
    return false;
  });
});
