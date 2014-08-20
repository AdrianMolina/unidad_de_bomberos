class CreateAssistRescues < ActiveRecord::Migration
  def change
    create_table :assist_rescues do |t|
      t.references :user, index: true
      t.references :rescue, index: true

      t.timestamps
    end
  end
end
