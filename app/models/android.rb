class Android < ActiveRecord::Base
  belongs_to :emergency
  belongs_to :vehicle
end
