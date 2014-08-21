class CreateFireAffectedPeople < ActiveRecord::Migration
  def change
    create_table :fire_affected_people do |t|
      t.string :nombre
      t.string :telefono
      t.references :fire, index: true

      t.timestamps
    end
  end
end
