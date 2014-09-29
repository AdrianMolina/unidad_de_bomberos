class Material < ActiveRecord::Base
	has_many :explosive_material_useds
	validates :nombre_material, :codigo, :uniqueness => true
  def nombre_codigo_material
  	"#{codigo} #{nombre_material}"
  end
end
