class CreateAssistFires < ActiveRecord::Migration
  def change
    create_table :assist_fires do |t|
      t.references :user, index: true
      t.references :fire, index: true

      t.timestamps
    end
  end
end
