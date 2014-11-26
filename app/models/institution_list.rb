class InstitutionList < ActiveRecord::Base
	validates :nombre, :sigla, :uniqueness => { :message => "ya se encuentra registrada" }
	def sigla_nombre
		"#{sigla} #{nombre}"
	end
end
