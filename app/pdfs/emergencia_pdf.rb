class EmergenciaPdf < Prawn::Document
  def initialize(emergencia)
    super(top_margin: 70)
    @emergencia = emergencia
    numero_de_caso
    datos
  end
  def numero_de_caso
    text "emergencia \##{@emergencia.numero_caso}"
  end
  def datos
    move_down 20
     filas
  end
  def filas
    ["Numero de caso", "Hora de salida","Denunciante","Telefono denunciante", "Direccion", "Referencias", "Tipo","Observacion"].each do | item|
      text item
    end
      [@emergencia.numero_caso, @emergencia.hora_salida, @emergencia.denunciante, @emergencia.telefono_denunciante, @emergencia.lugar, @emergencia.referencia_lugar, @emergencia.tipo, @emergencia.observacion].each do |item|
        text item.to_s
      end
  end
end

