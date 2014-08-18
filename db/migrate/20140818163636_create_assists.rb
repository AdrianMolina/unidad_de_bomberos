class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.references :user, index: true
      t.references :explosive, index: true

      t.timestamps
    end
  end
end
