class RescueAffectedPerson < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_affected_people
  validates :nombre, :presence => true
  validates :telefono, :presence => true
  validates :rescue, :presence => true
end
