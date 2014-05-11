class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :lugar
      t.string :denunciante
      t.string :telefono_denunciante
      t.string :numero_caso
      t.string :sigla_vehiculo
      t.datetime :hora_salida
      t.text :observacion
      t.string :despachador
      t.text :referencia_lugar
      t.string :tipo

      t.timestamps
    end
  end
end
