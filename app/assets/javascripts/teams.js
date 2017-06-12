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
