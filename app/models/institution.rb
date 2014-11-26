class Institution < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :institutions
  validates :nombre, :presence => { :message => "Se debe seleccionar una institucion de la lista" }
  validates :trabajo, :presence => { :message => "No puede estar vacio" }
  validates :explosive, :presence => true
end
