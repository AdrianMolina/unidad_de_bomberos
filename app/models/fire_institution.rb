class FireInstitution < ActiveRecord::Base
  belongs_to :fire, inverse_of: :fire_institutions
  validates :nombre, :presence => true
  validates :trabajo, :presence => true
  validates :fire, :presence => true
end
