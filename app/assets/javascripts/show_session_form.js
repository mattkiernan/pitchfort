$(function(){
  $("body").on("click", ".show-email-signin", function(){
    $(".email-signin").show("slow");
    $(".email-signup").hide("slow");
    return false;
  });
});
