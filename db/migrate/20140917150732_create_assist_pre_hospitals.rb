class CreateAssistPreHospitals < ActiveRecord::Migration
  def change
    create_table :assist_pre_hospitals do |t|
      t.references :user, index: true
      t.references :pre_hospital, index: true

      t.timestamps
    end
  end
end
