class Vehicle < ActiveRecord::Base
	has_many :emergencies
	has_many :drivers, :dependent => :destroy, inverse_of: :vehicle
	belongs_to :android
	validates :placa, :sigla, :uniqueness => { :message => "ya se encuentra registrada" }
	validates :android_id, :uniqueness => { :message => "el dispositivo android ya esta asociado a otro vehiculo" }
	validates :modelo, :numericality => { :only_integer => true, :message => "sólo se admite numeros" }, :allow_blank => true
  	accepts_nested_attributes_for :drivers, :allow_destroy => true
  	def self.nombreDispositivo(vehicle)
  		resultado = "Este vehiculo no tiene asignado un dispositivo android"
  		if !vehicle.android.nil?
  			resultado = vehicle.android_id
  			if !vehicle.android.nombre.nil? or vehicle.android.nombre != ""
  				resultado = vehicle.android.nombre
  			end
  		end
  		resultado
  	end
end
