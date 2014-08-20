class CreateAffectedPeople < ActiveRecord::Migration
  def change
    create_table :affected_people do |t|
      t.string :nombre
      t.string :telefono
      t.references :explosive, index: true

      t.timestamps
    end
  end
end
