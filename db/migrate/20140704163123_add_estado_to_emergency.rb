class AddEstadoToEmergency < ActiveRecord::Migration
  def change
    add_column :emergencies, :estado, :boolean
  end
end
