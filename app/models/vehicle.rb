class Vehicle < ActiveRecord::Base
	has_many :emergencies
end
