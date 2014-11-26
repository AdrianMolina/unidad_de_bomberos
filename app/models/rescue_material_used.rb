class RescueMaterialUsed < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_material_useds
  belongs_to :material, inverse_of: :rescue_material_useds
  validates :material, :presence => { :message => "Se debe seleccionar un material de la lista" }
  validates :rescue, :presence => true
end
