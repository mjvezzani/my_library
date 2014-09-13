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
    $("#synopsis").slideUp(function(){
      $("#review").slideToggle("slow");
      $("#synopsis-label").fadeOut("slow", function(){
        $("#review-label").fadeToggle("slow");
      });
    });
    $("#edit-book").slideUp();
  });
  // Display Synopsis Box
  $("#synopsis-link").click(function() {
    $("#review").slideUp(function(){
      $("#synopsis").slideToggle("slow"); 
      $("#review-label").fadeOut("slow", function(){
        $("#synopsis-label").fadeToggle("slow");
      });
    });
    $("#edit-book").slideUp();
  });
});
