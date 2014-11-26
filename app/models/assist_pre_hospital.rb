class AssistPreHospital < ActiveRecord::Base
  belongs_to :user, inverse_of: :assist_pre_hospitals
  belongs_to :pre_hospital, inverse_of: :assist_pre_hospitals
  validates :pre_hospital, :presence => true
  validates :user, :presence => { :message => "Se debe seleccionar un bombero de la lista" }
end
