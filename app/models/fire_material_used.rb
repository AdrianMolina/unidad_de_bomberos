class FireMaterialUsed < ActiveRecord::Base
  belongs_to :material, inverse_of: :fire_material_useds
  belongs_to :fire, inverse_of: :fire_material_useds
  validates :fire, :presence => true
  validates :material, :presence => { :message => "Se debe seleccionar un material de la lista" }
end
