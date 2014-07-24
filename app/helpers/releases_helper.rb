module ReleasesHelper
  def release_title(release)
    release.band_name + ' - ' + release.name
  end

  def filter_options
    [["ALL", ""], ["VINYL", "vinyl"], ["CD-s", "cd"], ["TAPES", "cs"], ["T-SHIRTS", "shirt"], ["ZINES", "zine"], ["SPECIAL OFFERS", "special"]]
  end

  def sort_by_options
    [["NEWEST!!!", "release_date"], ["ALPHABET", "alphabetically"], ["LOWEST PRICE", "lowest_price"], ["HIGHEST PRICE", "highest_price"]]
  end
end
