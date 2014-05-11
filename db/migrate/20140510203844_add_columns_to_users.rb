class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :rango, :string
  end
end
