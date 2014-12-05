$(function(){
  var updateActionLink = function(select) {
    var $select = $(select);
    pitchState = $select.val();
    var followupButton = $select.parents(".pitch-row").find(".followup-button");
    if (checkIfComplete(pitchState)) {
      followupButton.hide();
    } else {
      followupButton.show();
    }
  };

  var checkIfComplete = function(pitchState){
    if (pitchState === "Accepted" || pitchState === "Declined"){
    return true;
    };
  };

  $(".pitch-status").each(function(i, select) {
    updateActionLink(select);
  });

  $("body").on("change", ".pitch-status", function(){
    updateActionLink(this);
  });
});
