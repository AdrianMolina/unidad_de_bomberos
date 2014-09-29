class CreateInstitutionLists < ActiveRecord::Migration
  def change
    create_table :institution_lists do |t|
      t.string :sigla
      t.string :nombre

      t.timestamps
    end
  end
end
