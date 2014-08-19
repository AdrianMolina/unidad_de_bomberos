class CreateExplosiveMaterialUseds < ActiveRecord::Migration
  def change
    create_table :explosive_material_useds do |t|
      t.references :user, index: true
      t.references :material, index: true

      t.timestamps
    end
  end
end
