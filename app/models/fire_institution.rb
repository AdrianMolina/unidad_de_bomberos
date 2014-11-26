class FireInstitution < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_institutions
  validates :nombre, :presence => { :message => "Se debe seleccionar una institucion de la lista" }
  validates :trabajo, :presence => { :message => "No puede estar vacio" }
  validates :fire, :presence => true
end
