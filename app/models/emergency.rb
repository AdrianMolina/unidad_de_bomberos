class Emergency < ActiveRecord::Base
	belongs_to :user
	belongs_to :vehicle
	has_many :explosives
	has_many :fires
	has_many :rescues
	has_many :pre_hospitals
	validates :numero_caso, :uniqueness => true
	validates :lugar, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
	validates :denunciante, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }
	validates :telefono_denunciante, :numericality => { :only_integer => true, :message => "Sólo se admiten numeros" }, :allow_blank => true
	scope :search, lambda { |start_date, end_date, search_word| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND (emergencies.denunciante LIKE ? OR emergencies.lugar LIKE ? OR emergencies.numero_caso LIKE ?)', start_date, end_date, "%#{search_word}%", "%#{search_word}%", "%#{search_word}%") }
	#scope :search, lambda {|start_date, end_date, type| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND (emergencies.tipo LIKE ? OR emergencies.lugar LIKE ?)', start_date, end_date, "%#{type}%", "%#{type}%" )}
  scope :buscar, lambda {|start_date, end_date, type| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND emergencies.tipo LIKE ?', start_date, end_date, "%#{type}%" )}
	def self.check_box(params, tipo)
	  resp = false
		if params == tipo
			resp = true
		end
		resp
	end

	def self.numero_de_caso
		emegencias = Emergency.all.order('numero_caso ASC')
		if emegencias == []
			"UBNA-%.4d" % 1
		else
			numero = emegencias.last.numero_caso.split("-").last.to_i + 1
			"UBNA-%.4d" % numero
		end
	end
	def self.incendios(emergencias)
		c=0
		emergencias.each do |e|
			if e.tipo == "incendio"
				c+=1
			end 
		end
		c
	end
	
	def self.pre_hospitals(emergencias)
		c=0
		emergencias.each do |e|
			if e.tipo == "prehospitalaria"
				c+=1
			end 
		end
		c
	end
	def self.rescates(emergencias)
		c=0
		emergencias.each do |e|
			if e.tipo == "rescate"
				c+=1
			end 
		end
		c
	end
	def self.explosivos(emergencias)
		c=0
		emergencias.each do |e|
			if e.tipo == "explosivo"
				c+=1
			end 
		end
		c
	end
  def self.busqueda(tipo, fecha,fecha_fin)
    resultado = Emergency.all
    if fecha.nil? || fecha == ""
      resultado = self.buscar("1/1/2014".to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,tipo)
    else
      resultado = self.buscar(fecha.to_date.beginning_of_day ,fecha_fin.to_date.end_of_day,tipo)
    end
    resultado
	end
  def self.busqueda_index(search_word, fecha,fecha_fin)
    resultado = Emergency.all
    if fecha.nil? || fecha == ""
      resultado = self.search("1/1/2014".to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,search_word)
    else
      resultado = self.search(fecha.to_date.beginning_of_day ,fecha_fin.to_date.end_of_day,search_word)
    end
    resultado
	end
end
