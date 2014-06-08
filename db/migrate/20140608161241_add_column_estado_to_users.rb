class AddColumnEstadoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :estado, :string
  end
end
