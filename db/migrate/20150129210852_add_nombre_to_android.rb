class AddNombreToAndroid < ActiveRecord::Migration
  def change
    add_column :androids, :nombre, :string
  end
end
