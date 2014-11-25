class RescueInstitution < ActiveRecord::Base
  belongs_to :rescue, inverse_of: :rescue_institutions
  validates :nombre, :presence => true
  validates :trabajo, :presence => true
  validates :rescue, :presence => true
end 