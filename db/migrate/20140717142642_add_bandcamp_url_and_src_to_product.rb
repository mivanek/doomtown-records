class AddBandcampUrlAndSrcToProduct < ActiveRecord::Migration
  def change
    add_column :products, :bandcamp_id, :string
    remove_column :products, :bandcamp_embed_url, :string
    add_index :products, :name
    add_index :products, :band_name
  end
end
