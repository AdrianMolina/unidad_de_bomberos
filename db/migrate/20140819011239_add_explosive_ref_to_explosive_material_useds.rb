class AddExplosiveRefToExplosiveMaterialUseds < ActiveRecord::Migration
  def change
    add_reference :explosive_material_useds, :explosive, index: true
  end
end
