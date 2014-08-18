class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.references :vehicle, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
