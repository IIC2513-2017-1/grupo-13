// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  $( ".card" ).hover(
  function() {
    $( this ).addClass( "open" );
  }, function() {
    $( this ).removeClass( "open" );
  }
);
});

$(document).on('turbolinks:load', function() {
  var modal = document.getElementById('id01');
// When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
});
