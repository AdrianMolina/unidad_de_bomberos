class RescueMaterialUsed < ActiveRecord::Base
  belongs_to :rescue
  belongs_to :material
end
