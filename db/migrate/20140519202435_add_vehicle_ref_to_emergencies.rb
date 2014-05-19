class AddVehicleRefToEmergencies < ActiveRecord::Migration
  def change
    add_reference :emergencies, :vehicle, index: true
  end
end
