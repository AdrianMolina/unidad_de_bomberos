class Assist < ActiveRecord::Base
  belongs_to :user, inverse_of: :assists
  belongs_to :explosive, inverse_of: :assists
  validates :explosive, :presence => true
  validates :user, :presence => true
end
