class Emergency < ActiveRecord::Base
	belongs_to :user
	belongs_to :vehicle
	has_many :explosives
	has_many :fires
	has_many :rescues
	validates :numero_caso, :uniqueness => true
	validates :lugar, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
	validates :denunciante, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
	validates :telefono_denunciante, :numero_caso, :numericality => { :only_integer => true, :message => "Sólo se admiten numeros" }, :allow_blank => true
	scope :search, lambda { |search_word| where('emergencies.denunciante LIKE ? OR emergencies.lugar LIKE ? OR emergencies.numero_caso LIKE ? OR emergencies.sigla_vehiculo LIKE ?', "%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%") }
end
