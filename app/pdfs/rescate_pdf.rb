require "prawn/table"
require "User"
require "assist_fire"

class RescatePdf < Prawn::Document
  def initialize(rescate)
    super(top_margin: 70)
    @rescate = rescate
    encabezado
    mostrar
  end

  def encabezado
    text "Formulario de rescate"
  end

  def mostrar
    move_down 10
    datos_basicos
    move_down 40
    text "Bomberos que intervinieron"
    move_down 10
    datos_asistencia
    move_down 40
    text "Materiales utilizados"
    move_down 10
    datos_materiales
    move_down 40
    text "Personas afectadas"
    move_down 10
    datos_personas
    move_down 40
    text "Instituciones que intervinieron"
    move_down 10
    datos_instituciones
  end

  def datos_basicos

    formularioRescateInfo = [["Numero de caso:", "#{ @rescate.numero_caso }"], ["Hora del incidente:", "#{ @rescate.hora_incidente }"], 
    ["Lugar del incidente:", "#{ @rescate.lugar_incidente }"], ["Descripcion:", "#{ @rescate.descripcion_incidente }"], 
    ["Observaciones:", "#{ @rescate.observaciones }"], ["Daños materiales:", "#{ @rescate.danos_materiales }"], 
    ["Jefe de brigada:", "#{ @rescate.jefe_brigada }"], ["jefe de seguridad:", "#{ @rescate.jefe_seguridad }"]]

    table formularioRescateInfo,
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_asistencia
    if (@rescate.assist_rescues.size != 0)
      asistencia = [["Nombre", "Apellido paterno", "Apellido materno"]]
      for i in (0..@rescate.assist_rescues.size - 1)
        nombre = @rescate.assist_rescues[i - 1].user.nombre
        ap_pat = @rescate.assist_rescues[i - 1].user.apellido
        ap_mat = @rescate.assist_rescues[i - 1].user.ap_materno
        asistencia = asistencia << ["#{nombre}", "#{ap_pat}", "#{ap_mat}"]
      end
    else
      asistencia = [["No se registraron asistencias"]]
    end

    table asistencia, 
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_materiales
    if (@rescate.rescue_material_useds.size != 0)
      materiales = [["Codigo de material", "Nombre de material"]]
      for i in (0..@rescate.rescue_material_useds.size - 1)
        codigo = @rescate.rescue_material_useds[i - 1].material.codigo 
        nombre = @rescate.rescue_material_useds[i - 1].material.nombre_material
        materiales = materiales << ["#{ codigo }","#{ nombre }"]
      end
    else
      materiales = [["No se registraron materiales"]]
    end

    table materiales, 
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_personas
    if (@rescate.rescue_affected_people.size != 0)
      personas = [["Nombre", "Telefono"]]
      for i in (0..@rescate.rescue_affected_people.size - 1)
        nombre = @rescate.rescue_affected_people[i - 1].nombre 
        telefono = @rescate.rescue_affected_people[i - 1].telefono
        personas = personas << ["#{ nombre }","#{ telefono }"]
      end
    else
      personas = [["No se registraron datos de personas afectadas"]]
    end

    table personas, 
    :position => :center,
    :column_widths => [200,200]
  end

    def datos_instituciones
    if (@rescate.rescue_institutions.size != 0)
      instituciones = [["Nombre", "Trabajo realizado"]]
      for i in (0..@rescate.rescue_institutions.size - 1)
        nombre = @rescate.rescue_institutions[i - 1].nombre 
        trabajo = @rescate.rescue_institutions[i - 1].trabajo
        instituciones = instituciones << ["#{ nombre }","#{ trabajo }"]
      end
    else
      instituciones = [["No se registraron datos de instituciones"]]
    end

    table instituciones, 
    :position => :center,
    :column_widths => [200,200]
  end
end