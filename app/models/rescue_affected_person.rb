class RescueAffectedPerson < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_affected_people
end
