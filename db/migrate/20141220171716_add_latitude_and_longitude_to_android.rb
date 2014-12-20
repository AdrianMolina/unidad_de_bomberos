class AddLatitudeAndLongitudeToAndroid < ActiveRecord::Migration
  def change
    add_column :androids, :latitude, :float
    add_column :androids, :longitude, :float
  end
end
