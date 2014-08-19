class RemoveReferencesFromMaterialsExplosives < ActiveRecord::Migration
  def self.down
      remove_column :explosive_material_useds, :user_id
  end
end
