$(function(){
  var updateActionLink = function(select) {
    var $select = $(select);
    var pitchState = $select.val();
    var followupButton = $select.parents(".pitch-row").find(".followup-button");
    if (pitchState === "Accepted" || pitchState === "Declined") {
      followupButton.hide();
    } else {
      followupButton.show();
    }
  };

  $(".pitch-status").each(function(i, select) {
    updateActionLink(select);
  });

  $("body").on("change", ".pitch-status", function() {
    updateActionLink(this);
  });
});
