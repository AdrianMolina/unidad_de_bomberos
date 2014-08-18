class CreateVehicleDrivers < ActiveRecord::Migration
  def change
    create_table :vehicle_drivers do |t|
      t.references :vehicle, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
