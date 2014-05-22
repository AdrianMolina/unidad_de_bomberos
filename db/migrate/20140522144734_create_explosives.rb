class CreateExplosives < ActiveRecord::Migration
  def change
    create_table :explosives do |t|
      t.string :numero_caso
      t.date :fecha
      t.string :lugar_incidente
      t.time :hora_incidente
      t.text :descripcion_incidente
      t.text :material_utilizado
      t.text :observaciones_incidente
      t.string :jefe_brigada
      t.string :jefe_seguridad
      t.references :emergency, index: true

      t.timestamps
    end
  end
end
