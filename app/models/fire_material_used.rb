class FireMaterialUsed < ActiveRecord::Base
  belongs_to :material, inverse_of: :fire_material_useds
  belongs_to :fire, inverse_of: :fire_material_useds
end
