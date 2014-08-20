class AffectedPerson < ActiveRecord::Base
    belongs_to :explosive, inverse_of: :affected_people
end
