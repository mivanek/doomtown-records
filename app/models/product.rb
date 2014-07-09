class Product < ActiveRecord::Base
  belongs_to :band
  scope :doomtown_products, -> { where(doomtown_release: true) }

  def product_image
    if cover_art
      "covers/" + cover_art
    else
      nil
    end
  end

  def price
    price_in_cents / 100
  end

  def full_name
    band_name + ' - ' + name
  end
end
