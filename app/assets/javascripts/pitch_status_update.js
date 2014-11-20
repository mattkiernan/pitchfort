$(function(){
  $("body").on("change", ".pitch-status", function(){
    selection = $(this);
    var updatePitchStatus = $.ajax({
      type: "PATCH",
      url: selection.parent().attr("action"),
      data: {pitch:{status: selection.val()}}
    });
    updatePitchStatus.done(function(){
      console.log("Updated!")
    });
  });
});
