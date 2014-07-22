$(document).ready(function() {
  $('.latest-releases').hide();
  cycle(0);
});

function cycle(next_release_index) {
  var latestReleases = $('.latest-releases');
  var index = (next_release_index % 3)
  $(latestReleases[index]).delay(200).fadeIn(500).delay(3000).fadeOut(500, function() { cycle(index + 1) });
};
