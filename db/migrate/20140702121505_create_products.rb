class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :format
      t.string :genre
      t.string :style
      t.string :label
      t.text :review
      t.decimal :rating, precision: 2, scale: 1
      t.integer :price_in_cents
      t.boolean :doomtown_release
      t.integer :band_id
      t.string :bandcamp_embed_url
      t.string :cover_art
      t.date :release_date

      t.timestamps
    end
  end
end
