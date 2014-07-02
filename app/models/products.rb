class Products < ActiveRecord::Base
  scope :doomtown_products, -> { where(doomtown_release: true) }

  def price
    price_in_cents / 100
  end
end
