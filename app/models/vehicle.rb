class Vehicle < ActiveRecord::Base
	has_many :emergencies
	has_many :vehicle_drivers, :dependent => :destroy, inverse_of: :vehicle
  	accepts_nested_attributes_for :vehicle_drivers, :allow_destroy => true
end
