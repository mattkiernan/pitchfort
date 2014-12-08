$(function(){
  $("body").on("click", ".import-journalists-button", function(){
    $(".import-journalists").show("slow");
    $(".import-journalists-button").hide("slow");
    return false;
  });
});
