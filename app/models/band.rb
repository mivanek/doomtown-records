class Band < ActiveRecord::Base
  has_many :products
  has_many :shows

  def band_image
    "bands/" + image
  end

  def discography
    products.collect(&:name).join(', ')
  end

  def album_images
    products.collect(&:product_image)
  end

  def show_dates
    shows.collect(&:show_string)
  end
end
