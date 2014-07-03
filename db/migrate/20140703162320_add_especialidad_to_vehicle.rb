class AddEspecialidadToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :especialidad, :string
  end
end
