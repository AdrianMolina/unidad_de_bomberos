class VehicleDriver < ActiveRecord::Base
  belongs_to :vehicle, inverse_of: :vehicle_drivers
  belongs_to :user, inverse_of: :vehicle_drivers
end
