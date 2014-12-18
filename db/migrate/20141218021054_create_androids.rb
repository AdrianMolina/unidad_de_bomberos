class CreateAndroids < ActiveRecord::Migration
  def change
    create_table :androids do |t|
      t.string :registrationId

      t.timestamps
    end
  end
end
