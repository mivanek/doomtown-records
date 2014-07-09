class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :club_name
      t.string :city
      t.string :country
      t.date :date
      t.integer :band_id

      t.timestamps
    end
  end
end
