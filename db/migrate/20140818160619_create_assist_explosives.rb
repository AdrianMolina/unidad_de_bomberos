class CreateAssistExplosives < ActiveRecord::Migration
  def change
    create_table :assist_explosives do |t|
      t.references :user, index: true
      t.references :explosive, index: true

      t.timestamps
    end
  end
end
