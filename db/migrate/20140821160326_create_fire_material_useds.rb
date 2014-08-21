class CreateFireMaterialUseds < ActiveRecord::Migration
  def change
    create_table :fire_material_useds do |t|
      t.references :material, index: true
      t.references :fire, index: true

      t.timestamps
    end
  end
end
