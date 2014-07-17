ready = function() {
  $('.raty-rating').raty({
    score: function() {
      return $(this).attr('data-rating')
    },
    half: false,
    halfShow: false,
    starOn: "/assets/star.png",
    starOff:"/assets/empty-star.png"
  });

  $('.filter-select, .sort-by-select').change(function() {
    $('#filter-sort-form').submit();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
