class AffectedPerson < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :affected_people
  validates :nombre, :presence => { :message => "No puede estar vacio" }
  validates :telefono, :presence => { :message => "No puede estar vacio" }
  validates :explosive, :presence => true
end
