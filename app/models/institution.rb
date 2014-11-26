class Institution < ActiveRecord::Base
  belongs_to :explosive, inverse_of: :institutions
  validates :nombre, :presence => true
  validates :trabajo, :presence => true
  validates :explosive, :presence => true
end
