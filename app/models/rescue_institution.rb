class RescueInstitution < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_institutions
  validates :nombre, :presence => { :message => "Se debe seleccionar una institucion de la lista" }
  validates :trabajo, :presence => { :message => "No puede estar vacio" }
  validates :rescue, :presence => true
end 