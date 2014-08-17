class CreateFires < ActiveRecord::Migration
  def change
    create_table :fires do |t|
      t.string :numero_caso
      t.string :lugar_incidente
      t.time :hora_incidente
      t.text :descripcion_incidente
      t.string :jefe_brigada
      t.string :jefe_seguridad
      t.float :latitude
      t.float :longitude
      t.references :emergency, index: true

      t.timestamps
    end
  end
end
