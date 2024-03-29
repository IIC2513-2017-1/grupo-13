$(".toggle").on("click", function() {
  $(".toggle").parent().toggleClass('active');
});

$(document).on('turbolinks:load', function () {
  $('.tablinks').on('click', function() {
    var link = $(this);
    var tab = $('.' + link.data('tab'));

    // Get all elements with class="tabcontent" and hide them
    $('.tabcontent').each(function() {
      $(this).hide();
    });

    // Get all elements with class="tablinks" and remove the class "active"
    $('.tablinks').each(function() {
      $(this).removeClass('active');
    });

    // Show the current tab, and add an "active" class to the button that opened the tab
    tab.show();
    link.addClass('active');
  });
  $('.defaultOpen').click();
});
