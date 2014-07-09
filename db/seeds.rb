# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Bands

bands = YAML.load_file("#{Rails.root}/db/seeds/bands.yml")
bands.each do |band_name, band_info|
  band = Band.new(name: band_name)
  band.assign_attributes(band_info)
  band.save
end

# Releases

releases = YAML.load_file("#{Rails.root}/db/seeds/releases.yml")
releases.each do |band_name, release_data|
  band = Band.find_by_name(band_name)
  release_data.each do |release_name, release_info|
    release = Product.new(band_name: band_name, band_id: band.try(:id), name: release_name)
    release_info.each do |key, value|
      if key.include? "date"
        release.send("#{key}=", Date.strptime(value, "%d-%m-%Y"))
      else
        release.send("#{key}=", value)
      end
    end
    release.save
  end
end

# Shows
shows = YAML.load_file("#{Rails.root}/db/seeds/shows.yml")
shows.each do |band_name, show_data|
  band = Band.find_by_name(band_name)
  next unless band
  show_data.each do |show_date, show_info|
    show = Show.new(band_id: band.try(:id))
    show.date = Date.strptime(show_date, "%d-%m-%Y")
    show.assign_attributes(show_info)
    show.save
  end
end
# News

news = YAML.load_file("#{Rails.root}/db/seeds/news.yml")
news.each do |news_title, news_info|
  news_item = News.new(title: news_title)
  news_item.assign_attributes(news_info)
  news_item.save
end
