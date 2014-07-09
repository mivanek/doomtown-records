module ReleasesHelper
  def release_title(release)
    release.band_name + ' - ' + release.name
  end
end
