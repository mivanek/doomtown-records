module ReleasesHelper
  def release_title(release)
    release.band_name + ' - ' + release.name
  end

  def filter_options
    [["ALL", "all"], ["VINYL", "vinyl"], ["CD-s", "cd"], ["TAPES", "cs"], ["T-SHIRTS", "shirt"], ["ZINES", "zine"], ["SPECIAL OFFERS", "special"]]
  end

  def sort_by_options
    [["NEWEST!!!", "release_date DESC"], ["ALPHABET", "band_name ASC"], ["LOWEST PRICE", "price_in_cents ASC"], ["HIGHEST PRICE", "price_in_cents DESC"]]
  end
end
