class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :sigla
      t.string :placa
      t.string :modelo

      t.timestamps
    end
  end
end
