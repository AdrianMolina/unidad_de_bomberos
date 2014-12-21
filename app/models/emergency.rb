class Emergency < ActiveRecord::Base
	belongs_to :user
	belongs_to :vehicle
	has_many :explosives
	has_many :fires
	has_many :rescues
	has_many :pre_hospitals
  has_many :androids
	validates :numero_caso, :uniqueness => true
  #validates :lugar, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" } da error al guardar
	validates :denunciante, :format => { :with => /[a-zA-Z]+/i, :message => "Sólo se permiten letras" }, :allow_blank => true
  validates :lugar, :presence => true
	validates :telefono_denunciante, :numericality => { :only_integer => true, :message => "Sólo se admiten numeros" }, :allow_blank => true
	scope :search, lambda { |start_date, end_date, search_word| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND (emergencies.tipo LIKE ? OR emergencies.denunciante LIKE ? OR emergencies.lugar LIKE ? OR emergencies.numero_caso LIKE ?)', start_date, end_date,"%#{search_word}%", "%#{search_word}%", "%#{search_word}%", "%#{search_word}%") }
	#scope :search, lambda {|start_date, end_date, type| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND (emergencies.tipo LIKE ? OR emergencies.lugar LIKE ?)', start_date, end_date, "%#{type}%", "%#{type}%" )}
  scope :buscar, lambda {|start_date, end_date, type| where('emergencies.hora_salida >= ? AND emergencies.hora_salida <= ? AND emergencies.tipo LIKE ?', start_date, end_date, "%#{type}%" )}

	def self.check_box(params, tipo)
	  resp = false
   if !params.nil?
    params.each do |p|
		if p == tipo
			resp = true
		end
    end
   end
		resp
	end

	def self.contador_explosivos(id_emergencia)
		explosivos = Explosive.all
		cont = 0
		explosivos.each do |exp|
			if id_emergencia == exp.emergency_id
				cont = cont + 1
			else
				cont = cont
			end
		end
		cont
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
  def self.busqueda(tipos, fecha,fecha_fin)
    res=Emergency.all
    if !tipos.nil?
        res=[]
        tipos.each do |tipo|
          if fecha.nil? || fecha == ""
            resultado = self.buscar("1/1/2014".to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,tipo)
            res+=resultado
          elsif fecha_fin.nil? || fecha_fin == ""
               resultado = self.search(fecha.to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,tipo)
               res+=resultado
          else
            resultado = self.buscar(fecha.to_date.beginning_of_day ,fecha_fin.to_date.end_of_day,tipo)
            res+=resultado
          end
        end
    end
    res
	end
  def self.busqueda_index(search_word, fecha,fecha_fin)
    resultado = Emergency.all
    if fecha.nil? || fecha == ""
      resultado = self.search("1/1/2014".to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,search_word)
    elsif fecha_fin.nil? || fecha_fin == ""
      resultado = self.search(fecha.to_date.beginning_of_day ,"1/1/2020".to_date.end_of_day,search_word)
    else
      resultado = self.search(fecha.to_date.beginning_of_day ,fecha_fin.to_date.end_of_day,search_word)
    end
    resultado
	end
end
