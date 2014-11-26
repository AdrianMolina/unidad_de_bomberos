class RescueAffectedPerson < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_affected_people
  validates :nombre, :presence => { :message => "No puede estar vacio" }
  validates :telefono, :presence => { :message => "No puede estar vacio" }
  validates :rescue, :presence => true
end
