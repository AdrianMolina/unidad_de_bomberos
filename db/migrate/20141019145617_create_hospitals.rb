class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :nombre_hospital
      t.integer :telefono
      t.string :nivel
      t.string :tipo
      t.string :direccion
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
