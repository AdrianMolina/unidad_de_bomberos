class InstitutionList < ActiveRecord::Base
	def sigla_nombre
		"#{sigla} #{nombre}"
	end
end
