class InstitutionList < ActiveRecord::Base
	validates :nombre, :sigla, :uniqueness => true
	def sigla_nombre
		"#{sigla} #{nombre}"
	end
end
