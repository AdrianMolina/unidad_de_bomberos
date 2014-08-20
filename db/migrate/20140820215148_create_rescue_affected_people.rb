class CreateRescueAffectedPeople < ActiveRecord::Migration
  def change
    create_table :rescue_affected_people do |t|
      t.string :nombre
      t.string :telefono
      t.references :rescue, index: true

      t.timestamps
    end
  end
end
