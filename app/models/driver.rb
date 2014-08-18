class Driver < ActiveRecord::Base
  belongs_to :vehicle, inverse_of: :drivers
  belongs_to :user, inverse_of: :drivers
end
