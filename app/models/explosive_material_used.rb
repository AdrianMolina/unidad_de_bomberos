class ExplosiveMaterialUsed < ActiveRecord::Base
  belongs_to :user, inverse_of: :explosive_material_useds
  belongs_to :material, inverse_of: :explosive_material_useds
end
