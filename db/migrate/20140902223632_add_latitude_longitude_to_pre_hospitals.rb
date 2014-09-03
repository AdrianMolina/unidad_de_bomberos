class AddLatitudeLongitudeToPreHospitals < ActiveRecord::Migration
  def change
  	add_column :pre_hospitals, :latitude, :float
    add_column :pre_hospitals, :longitude, :float
  end
end
