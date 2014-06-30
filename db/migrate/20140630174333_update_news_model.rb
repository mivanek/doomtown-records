class UpdateNewsModel < ActiveRecord::Migration
  def change
    change_table :news do |t|
      t.string :image_path
    end
  end
end
