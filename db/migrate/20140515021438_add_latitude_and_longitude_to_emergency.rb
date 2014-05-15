class AddLatitudeAndLongitudeToEmergency < ActiveRecord::Migration
  def change
    add_column :emergencies, :latitude, :float
    add_column :emergencies, :longitude, :float
  end
end
