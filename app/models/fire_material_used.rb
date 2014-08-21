class FireMaterialUsed < ActiveRecord::Base
  belongs_to :material
  belongs_to :fire
end
