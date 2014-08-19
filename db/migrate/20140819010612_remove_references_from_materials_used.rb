class RemoveReferencesFromMaterialsUsed < ActiveRecord::Migration
  def change
      remove_column :explosive_material_useds, :user_id
  end
end
