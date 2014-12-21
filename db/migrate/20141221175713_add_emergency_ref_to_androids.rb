class AddEmergencyRefToAndroids < ActiveRecord::Migration
  def change
    add_reference :androids, :emergency, index: true
  end
end
