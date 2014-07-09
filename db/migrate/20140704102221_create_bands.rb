class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :email
      t.string :lastfm
      t.string :bandcamp

      t.timestamps
    end
  end
end
