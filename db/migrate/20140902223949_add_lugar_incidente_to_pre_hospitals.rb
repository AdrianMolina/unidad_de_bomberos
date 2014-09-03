class AddLugarIncidenteToPreHospitals < ActiveRecord::Migration
  def change
  	add_column :pre_hospitals, :lugar_incidente, :string
  end
end
