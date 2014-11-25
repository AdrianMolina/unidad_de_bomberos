require "prawn/table"
require "User"
require "assist_fire"

class ExplosivoPdf < Prawn::Document
  def initialize(explosivo)
    super(top_margin: 70)
    @explosivo = explosivo
    encabezado
    mostrar
  end

  def encabezado
    text "Formulario de explosivo"
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

    formularioRescateInfo = [["Numero de caso:", "#{ @explosivo.numero_caso }"], ["Hora del incidente:", "#{ @explosivo.hora_incidente }"], 
    ["Lugar del incidente:", "#{ @explosivo.lugar_incidente }"], ["Descripcion:", "#{ @explosivo.descripcion_incidente }"], 
    ["Observaciones:", "#{ @explosivo.observaciones_incidente }"],
    ["Jefe de brigada:", "#{ @explosivo.jefe_brigada }"], ["jefe de seguridad:", "#{ @explosivo.jefe_seguridad }"]]

    table formularioRescateInfo,
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_asistencia
    if (@explosivo.assists.size != 0)
      asistencia = [["Nombre", "Apellido paterno", "Apellido materno"]]
      for i in (0..@explosivo.assists.size - 1)
        nombre = @explosivo.assists[i - 1].user.nombre
        ap_pat = @explosivo.assists[i - 1].user.apellido
        ap_mat = @explosivo.assists[i - 1].user.ap_materno
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
    if (@explosivo.explosive_material_useds.size != 0)
      materiales = [["Codigo de material", "Nombre de material"]]
      for i in (0..@explosivo.explosive_material_useds.size - 1)
        codigo = @explosivo.explosive_material_useds[i - 1].material.codigo 
        nombre = @explosivo.explosive_material_useds[i - 1].material.nombre_material
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
    if (@explosivo.affected_people.size != 0)
      personas = [["Nombre", "Telefono"]]
      for i in (0..@explosivo.affected_people.size - 1)
        nombre = @explosivo.affected_people[i - 1].nombre 
        telefono = @explosivo.affected_people[i - 1].telefono
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
    if (@explosivo.institutions.size != 0)
      instituciones = [["Nombre", "Trabajo realizado"]]
      for i in (0..@explosivo.institutions.size - 1)
        nombre = @explosivo.institutions[i - 1].nombre 
        trabajo = @explosivo.institutions[i - 1].trabajo
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