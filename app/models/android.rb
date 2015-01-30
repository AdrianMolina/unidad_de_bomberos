class Android < ActiveRecord::Base
  belongs_to :emergency
  has_many :vehicles
  def self.estaAsignado(android_id)
  	android = Android.find(android_id)
  	resultado = "no esta asignado a ningun vehiculo"
  	if !android.vehicles.first.nil?
  		resultado = android.vehicles.first.sigla
  	end
  	resultado
  end
end
