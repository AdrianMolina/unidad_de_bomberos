class AddUserRefToEmergencies < ActiveRecord::Migration
  def change
    add_reference :emergencies, :user, index: true
  end
end
