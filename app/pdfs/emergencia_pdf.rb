require "prawn/table"

class EmergenciaPdf < Prawn::Document
  def initialize(emergencia)
    super(top_margin: 70)
    @emergencia = emergencia
    numero_de_caso
    datos
  end

  def numero_de_caso
    text "Emergencia"
  end

  def datos
    move_down 20
     filas
  end

  def filas
    emergenciainfo = [["Numero de caso:", "#{ @emergencia.numero_caso }"], ["Hora de salida:", "#{ @emergencia.hora_salida }"], 
    ["Denunciante:", "#{ @emergencia.denunciante }"], ["Telefono denunciante:", "#{ @emergencia.telefono_denunciante }"], 
    ["Direccion:", "#{ @emergencia.lugar }"], ["Referencias:", "#{ @emergencia.referencia_lugar }"], 
    ["Tipo:", "#{ @emergencia.tipo }"], ["Observacion:", "#{ @emergencia.observacion }"]]

    table emergenciainfo, 
    :position => :center,
    :column_widths => [200,200]
  end
end

