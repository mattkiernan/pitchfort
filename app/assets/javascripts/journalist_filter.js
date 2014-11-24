$(function(){
  $("body").on("change", "input:checkbox", function(){
    var topicIds = $("input:checked").map(function(index, checkbox){
      return $(checkbox).val();
    }).get();
    getJournalistIds(topicIds).done(function(){
      var selectedJournalists = arguments[0]
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
    $(".selected-journalist").attr("class", "unselected-journalist")
      $.each(selectedJournalists, function(index, value){
        $("#pitch_journalist_id_" + value["id"]).attr("class", "selected-journalist")
      });
  };
});
