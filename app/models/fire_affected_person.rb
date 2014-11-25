class FireAffectedPerson < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_affected_people
  validates :nombre, :presence => true
  validates :telefono, :presence => true
  validates :fire, :presence => true
end
