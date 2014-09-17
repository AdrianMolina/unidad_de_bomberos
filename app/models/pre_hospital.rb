class PreHospital < ActiveRecord::Base
  belongs_to :emergency
  has_many :assist_pre_hospitals, :dependent => :destroy, inverse_of: :pre_hospital
  accepts_nested_attributes_for :assist_pre_hospitals, :allow_destroy => true
end
