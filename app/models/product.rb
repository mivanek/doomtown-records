class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_line_item

  belongs_to :band

  scope :doomtown_products, -> { where(doomtown_release: true) }
  scope :filter, -> (format) { where(format: format) }
  scope :search, -> (search_params) { where('name ~* ? or band_name ~* ?', search_params, search_params) }
  scope :sort_by, -> (sort_params) { order(SORT_DICTIONARY[sort_params] || 'release_date ASC') }

  SORT_DICTIONARY = {
    "release_date" => "release_date DESC",
    "alphabetically" => "band_name ASC",
    "lowest_price" => "price_in_cents ASC",
    "highest_price" => "price_in_cents DESC"
  }

  def product_image
    if cover_art
      "covers/" + cover_art
    else
      nil
    end
  end

  def price
    price_in_cents / 100.0
  end

  def full_name
    band_name + ' - ' + name
  end

  private

    def ensure_not_referenced_by_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
