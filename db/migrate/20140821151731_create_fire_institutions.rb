class CreateFireInstitutions < ActiveRecord::Migration
  def change
    create_table :fire_institutions do |t|
      t.string :nombre
      t.string :trabajo
      t.references :fire, index: true

      t.timestamps
    end
  end
end
