$(document).ready(function() {
  // Set how things look when page is first loaded
  $("#edit-book").hide();
  $("#review").hide();
  $("#synopsis").hide();
  $("#review-label").hide();
  $("#synopsis-label").hide();
  
  // Display Edit Box
  $("#edit-link").click(function(){
    $("#synopsis").slideUp("slow");
    $("#synopsis-label").fadeOut("slow");
    $("#review").slideUp("slow");
    $("#review-label").fadeOut("slow");
    $("#edit-book").slideToggle("slow");
  });

  // Display Review Box
  $("#review_link").click(function() {
    $("#synopsis").slideUp("slow");
    $("#synopsis-label").fadeOut("slow");
    $("#edit-book").slideUp("slow");
    $("#review").slideToggle("slow");
    $("#review-label").fadeToggle("slow");
  });

  // Display Synopsis Box
  $("#synopsis-link").click(function() {
    $("#review").slideUp("slow");
    $("#review-label").fadeOut("slow");
    $("#edit-book").slideUp("slow");
    $("#synopsis").slideToggle("slow");
    $("#synopsis-label").fadeToggle("slow");
  });
});
