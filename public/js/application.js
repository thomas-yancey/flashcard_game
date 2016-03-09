$(document).ready(function() {

  if (!($("#card-list").children().length > 0)){
    $("#card-add-done").hide();
    $("#card-list").hide();
  }

  $("#add-card").submit(function(){
    event.preventDefault();
    var url = "/cards"
    $.ajax({
      method: "POST",
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      $("#card-list").show();
      $("#card-add-done").show();
      $("#card-list").append(response);
    });
  });
});
