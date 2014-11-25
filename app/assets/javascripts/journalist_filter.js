$(function(){
  $("body").on("change", "input:checkbox.coverage-topics", function(){
    var topicIds = $("input:checked").map(function(index, checkbox){
      return $(checkbox).val();
    }).get();

    getJournalistIds(topicIds).done(function(){
      selectedJournalists = arguments[0]
      buildFormFields(selectedJournalists);
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

  var buildFormFields = function(selectedJournalists){
    $(".journalist-list").empty();
    $(".selected-journalist").attr("class", "unselected-journalist")
      $.each(selectedJournalists, function(index, value){
        var journalistId = value["id"]
        var journalistName = value["first_name"] + " " + value["last_name"]
        appendToForm(journalistId, journalistName);
      });
  };

  var appendToForm = function(journalistId, journalistName){
    var checkbox = $("<input />", {
        id: "pitch_journalist_id_" + journalistId,
        name: "pitch[journalist_id][]",
        type: "checkbox",
        value: journalistId
    });

    var label = $("<label>", {
      for: "pitch_journalist_id_" + journalistId,
    }).text(journalistName);

    $(".journalist-list").append(checkbox)
    $(".journalist-list").append(label)
    $(".journalist-list").append($("<br />"))
  };
});
