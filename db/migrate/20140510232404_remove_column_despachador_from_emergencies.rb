class RemoveColumnDespachadorFromEmergencies < ActiveRecord::Migration
  def change
  	remove_column :emergencies, :despachador 
  end
end
