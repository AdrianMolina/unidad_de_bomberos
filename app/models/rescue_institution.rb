class RescueInstitution < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_institutions
end 