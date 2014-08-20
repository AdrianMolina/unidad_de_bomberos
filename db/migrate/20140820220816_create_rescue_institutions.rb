class CreateRescueInstitutions < ActiveRecord::Migration
  def change
    create_table :rescue_institutions do |t|
      t.string :nombre
      t.string :trabajo
      t.references :rescue, index: true

      t.timestamps
    end
  end
end
