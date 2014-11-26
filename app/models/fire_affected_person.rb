class FireAffectedPerson < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_affected_people
  validates :nombre, :presence => { :message => "No puede estar vacio" }
  validates :telefono, :presence => { :message => "No puede estar vacio" }
  validates :fire, :presence => true
end
