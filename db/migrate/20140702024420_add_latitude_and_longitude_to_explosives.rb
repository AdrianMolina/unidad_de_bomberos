class AddLatitudeAndLongitudeToExplosives < ActiveRecord::Migration
  def change
    add_column :explosives, :latitude, :float
    add_column :explosives, :Longitude, :float
  end
end
