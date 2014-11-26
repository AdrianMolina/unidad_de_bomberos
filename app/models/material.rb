class Material < ActiveRecord::Base
	has_many :explosive_material_useds
	has_many :fire_material_useds
	has_many :rescue_material_useds
	validates :nombre_material, :codigo, :uniqueness => { :message => "ya se encuentra registrada" }
  def nombre_codigo_material
  	"#{codigo} #{nombre_material}"
  end
end
