class AddNombreMaterialToMaterials < ActiveRecord::Migration
  def change
  	add_column :materials, :nombre_material, :string
  end
end
