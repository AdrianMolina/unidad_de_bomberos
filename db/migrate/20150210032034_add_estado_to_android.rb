class AddEstadoToAndroid < ActiveRecord::Migration
  def change
    add_column :androids, :estado, :boolean
  end
end
