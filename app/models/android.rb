class Android < ActiveRecord::Base
  belongs_to :emergency
  has_many :vehicles
end
