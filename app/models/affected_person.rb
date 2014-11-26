class AffectedPerson < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :affected_people
  validates :nombre, :presence => true
  validates :telefono, :presence => true
  validates :explosive, :presence => true
end
