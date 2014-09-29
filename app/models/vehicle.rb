class Vehicle < ActiveRecord::Base
	has_many :emergencies
	has_many :drivers, :dependent => :destroy, inverse_of: :vehicle
	validates :placa, :sigla, :uniqueness => true
  	accepts_nested_attributes_for :drivers, :allow_destroy => true
end
