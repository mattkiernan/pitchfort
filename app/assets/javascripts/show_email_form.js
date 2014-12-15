$(function(){
  $("body").on("click", ".show-email-signup", function(){
    $(".email-signup").show("slow");
    $(".email-signin").hide("slow");
    return false;
  });
});
