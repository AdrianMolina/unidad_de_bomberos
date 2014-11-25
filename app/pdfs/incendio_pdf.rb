require "prawn/table"
require "User"
require "assist_fire"

class IncendioPdf < Prawn::Document
  def initialize(incendio)
    super(top_margin: 70)
    @incendio = incendio
    encabezado
    mostrar
  end

  def encabezado
    text "Formulario de Incendio"
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

    formularioIncedioInfo = [["Numero de caso:", "#{ @incendio.numero_caso }"], ["Hora del incidente:", "#{ @incendio.hora_incidente }"], 
    ["Lugar del incidente:", "#{ @incendio.lugar_incidente }"], ["Descripcion:", "#{ @incendio.descripcion_incidente }"], 
    ["Jefe de brigada:", "#{ @incendio.jefe_brigada }"], ["jefe de seguridad:", "#{ @incendio.jefe_seguridad }"]]

    table formularioIncedioInfo,
    :position => :center,
    :column_widths => [200,200]
  end

  def datos_asistencia
    if (@incendio.assist_fires.size != 0)
      asistencia = [["Nombre", "Apellido paterno", "Apellido materno"]]
      for i in (0..@incendio.assist_fires.size - 1)
        nombre = @incendio.assist_fires[i - 1].user.nombre
        ap_pat = @incendio.assist_fires[i - 1].user.apellido
        ap_mat = @incendio.assist_fires[i - 1].user.ap_materno
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
    if (@incendio.fire_material_useds.size != 0)
      materiales = [["Codigo de material", "Nombre de material"]]
      for i in (0..@incendio.fire_material_useds.size - 1)
        codigo = @incendio.fire_material_useds[i - 1].material.codigo 
        nombre = @incendio.fire_material_useds[i - 1].material.nombre_material
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
    if (@incendio.fire_affected_people.size != 0)
      personas = [["Nombre", "Telefono"]]
      for i in (0..@incendio.fire_affected_people.size - 1)
        nombre = @incendio.fire_affected_people[i - 1].nombre 
        telefono = @incendio.fire_affected_people[i - 1].telefono
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
    if (@incendio.fire_institutions.size != 0)
      instituciones = [["Nombre", "Trabajo realizado"]]
      for i in (0..@incendio.fire_institutions.size - 1)
        nombre = @incendio.fire_institutions[i - 1].nombre 
        trabajo = @incendio.fire_institutions[i - 1].trabajo
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
