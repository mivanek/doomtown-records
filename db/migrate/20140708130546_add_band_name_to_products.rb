class AddBandNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :band_name, :string
  end
end
