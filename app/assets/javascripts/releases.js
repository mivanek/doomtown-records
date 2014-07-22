$(document).ready(function() {
  if ($('.raty-rating').length != 0) {
    $('.raty-rating').raty({
      score: function() {
        return $(this).attr('data-rating')
      },
      half: false,
      halfShow: false,
      starOn: "/assets/star.png",
      starOff:"/assets/empty-star.png"
    });
  };

  $('.filter-select, .sort-by-select').change(function() {
    $('#filter-sort-form').submit();
  });

  $('.release-listen').click(function() {
    if ($('.bandcamp-player').hasClass('active')) {
      $('.bandcamp-player').removeClass('active');
      $('.release-listen').removeClass('active');
      $('.bandcamp-player iframe').remove();
    } else {
      $('.bandcamp-player').addClass('active').append(
        "<iframe style='width: 424px; height: 472px; border: 0;', src='http://bandcamp.com/EmbeddedPlayer/album=" + gon.bandcamp_id + "/size=large/bgcol=333334/linkcol=0f91ff/artwork=small/transparent=true/'></iframe>"
        )
      $('.release-listen').addClass('active');
    };
  });
});
