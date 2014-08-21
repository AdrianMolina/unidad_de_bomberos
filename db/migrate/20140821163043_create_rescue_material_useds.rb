class CreateRescueMaterialUseds < ActiveRecord::Migration
  def change
    create_table :rescue_material_useds do |t|
      t.references :rescue, index: true
      t.references :material, index: true

      t.timestamps
    end
  end
end
