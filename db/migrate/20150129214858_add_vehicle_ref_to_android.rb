class AddVehicleRefToAndroid < ActiveRecord::Migration
  def change
    add_reference :androids, :vehicle, index: true
  end
end
