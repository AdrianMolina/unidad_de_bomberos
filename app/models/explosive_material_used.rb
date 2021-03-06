class ExplosiveMaterialUsed < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :explosive_material_useds
  belongs_to :material, inverse_of: :explosive_material_useds
  validates :explosive, :presence => true
  validates :material, :presence => { :message => "Se debe seleccionar un material de la lista" }
end
