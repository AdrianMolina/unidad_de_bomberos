class Material < ActiveRecord::Base
	has_many :explosive_material_useds

  def nombre_codigo_material
  	"#{codigo} #{nombre_material}"
  end
end
