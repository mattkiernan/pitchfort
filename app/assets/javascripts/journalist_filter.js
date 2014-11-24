$(function(){
  $("body").on("change", "input:checkbox.coverage-topics", function(){
    var topicIds = $("input:checked").map(function(index, checkbox){
      return $(checkbox).val();
    }).get();
    getJournalistIds(topicIds).done(function(){
      selectedJournalists = arguments[0]
      console.log(selectedJournalists)
      display(selectedJournalists);
    });
  });

  var getJournalistIds = function(topicIds){
    var options = {
      type: "GET",
      dataType: "json",
      url: "/journalists",
      data: { topic_ids: topicIds }
    };

    return $.ajax(options);
  };

  var display = function(selectedJournalists){
    $(".journalist-list").children().remove();
    $(".selected-journalist").attr("class", "unselected-journalist")
      $.each(selectedJournalists, function(index, value){
        journalistId = value["id"]
        journalistName = value["first_name"] + " " + value["last_name"]
        journalistInput(journalistId, journalistName);
      });
  };

  var journalistInput = function(journalistId, journalistName){
    $(".journalist-list").append(
            "<input id='pitch_journalist_id_" + journalistId + "' name='pitch[journalist_id][]' type='checkbox' value='" + journalistId + "'><label for='" + "pitch_journalist_id_" + journalistId + "'>" + journalistName + "</label><br>")
  };
});
