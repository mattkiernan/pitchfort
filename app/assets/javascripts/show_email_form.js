$(function(){
  $("body").on("click", ".show-email-signup", function(){
    $(".email-signup").show("slow");
    return false;
  });

  $("body").on("click", ".show-email-signin", function(){
    $(".email-signin").show("slow");
    console.log('hello');
    return false;
  });
});
