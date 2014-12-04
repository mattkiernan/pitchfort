$(function(){

var accepted = $.find(".pitch-status :selected[value='Accepted']")
var declined = $.find(".pitch-status :selected[value='Declined']")


  $("body").on("change", ".pitch-status", function(){
    var value = $(this).val();
    var followUpButton = $(this).parents().eq(3).find(".followup-button")
    if (value === "Accepted" || value === "Declined"){
      followUpButton.addClass("hidden");
    };
  });
});
