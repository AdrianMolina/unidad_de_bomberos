class Vehicle < ActiveRecord::Base
	has_many :emergencies
	has_many :drivers, :dependent => :destroy, inverse_of: :vehicle
	has_many :androids
	validates :placa, :sigla, :uniqueness => { :message => "ya se encuentra registrada" }
	validates :modelo, :numericality => { :only_integer => true, :message => "sólo se admite numeros" }, :allow_blank => true
  	accepts_nested_attributes_for :drivers, :allow_destroy => true
end
