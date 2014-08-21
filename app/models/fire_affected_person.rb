class FireAffectedPerson < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_affected_people
end
