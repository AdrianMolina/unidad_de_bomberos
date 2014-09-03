class CreatePreHospitals < ActiveRecord::Migration
  def change
    create_table :pre_hospitals do |t|
      t.string :numero_caso
      t.time :hora_incidente
      t.string :accidente_vehicular
      t.string :peritaje_vehicular
      t.string :trauma
      t.text :diagnostico
      t.string :prioridad_traslado
      t.text :desarrollo_atencion
      t.string :pertenencias_victima
      t.references :emergency, index: true

      t.timestamps
    end
  end
end
