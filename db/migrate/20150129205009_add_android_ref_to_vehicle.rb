class AddAndroidRefToVehicle < ActiveRecord::Migration
  def change
    add_reference :vehicles, :android, index: true
  end
end
