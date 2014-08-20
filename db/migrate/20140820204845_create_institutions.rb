class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :nombre
      t.string :trabajo
      t.references :explosive, index: true

      t.timestamps
    end
  end
end
