class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :especialidad
      t.string :codigo
      t.string :estado
      t.string :ubicacion

      t.timestamps
    end
  end
end
