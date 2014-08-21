class FireInstitution < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_institutions
end
