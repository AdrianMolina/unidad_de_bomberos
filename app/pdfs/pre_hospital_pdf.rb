require "prawn/table"
require "User"
require "assist_fire"

class PreHospitalPdf < Prawn::Document
  def initialize(prehospital)
    super(top_margin: 70)
    @prehospital = prehospital
    encabezado
    mostrar
  end

  def encabezado
    text "Formulario de Atencion pre hospitalaria "
  end

  def mostrar
    move_down 10
    datos_basicos
    move_down 40
    text "Bomberos que intervinieron"
    move_down 10
    datos_asistencia
  end

  def datos_basicos

    formularioRescateInfo = [["Numero de caso:", "#{ @prehospital.numero_caso }"], ["Hora del incidente:", "#{ @prehospital.hora_incidente }"], 
    ["Lugar del incidente:", "#{ @prehospital.lugar_incidente }"], ["Accidente vehicular:", "#{ @prehospital.accidente_vehicular }"], 
    ["Peritaje vehicular:", "#{ @prehospital.peritaje_vehicular }"], ["Trauma:", "#{ @prehospital.trauma }"], 
    ["Prioridad traslado:", "#{ @prehospital.prioridad_traslado }"], ["Diagnostico:", "#{ @prehospital.diagnostico }"], 
    ["Desarrollo atencion:", "#{ @prehospital.desarrollo_atencion }"], ["Pertenencias victima:", "#{ @prehospital.pertenencias_victima }"]]

    table formularioRescateInfo,
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_asistencia
    if (@prehospital.assist_pre_hospitals.size != 0)
      asistencia = [["Nombre", "Apellido paterno", "Apellido materno"]]
      for i in (0..@prehospital.assist_pre_hospitals.size - 1)
        nombre = @prehospital.assist_pre_hospitals[i - 1].user.nombre
        ap_pat = @prehospital.assist_pre_hospitals[i - 1].user.apellido
        ap_mat = @prehospital.assist_pre_hospitals[i - 1].user.ap_materno
        asistencia = asistencia << ["#{nombre}", "#{ap_pat}", "#{ap_mat}"]
      end
    else
      asistencia = [["No se registraron asistencias"]]
    end

    table asistencia, 
    :position => :center,
    :column_widths => [200,200]
  end
end