class AddMaterialRefToExplosiveMaterialUseds < ActiveRecord::Migration
  def self.down
    add_reference :explosive_material_useds, :material, index: true
  end
end
