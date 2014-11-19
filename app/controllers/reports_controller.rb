class ReportsController < ApplicationController
  before_action :authenticate_user!
  def asistencia_incendios
    vector = User.where(:estado => 'activo')
    @usuarios = ordenar_incedio(vector)
    @usuarios = Kaminari.paginate_array(@usuarios).page(params[:page]).per(8)
  end

  def asistencia_rescates
    vector = User.where(:estado => 'activo')
    @usuarios = ordenar_rescate(vector)
    @usuarios = Kaminari.paginate_array(@usuarios).page(params[:page]).per(8)
  end

  def asistencia_explosivos
    vector = User.where(:estado => 'activo')
    @usuarios = ordenar_explosivo(vector)
    @usuarios = Kaminari.paginate_array(@usuarios).page(params[:page]).per(8)
  end

  def asistencia_pre_hospitalarios
    vector = User.where(:estado => 'activo')
    @usuarios = ordenar_prehospitalario(vector)
    @usuarios = Kaminari.paginate_array(@usuarios).page(params[:page]).per(8)
  end

  def exportar_asistencias_incendios
    @usuarios = User.where(:estado => 'activo')
    usuarios_csv = CSV.generate do |csv|
      csv << ["Nombre", "Apellido", "Rango", "Numero de asistencias"]
      @usuarios.each do |usuario|
        csv << [usuario.nombre, usuario.apellido, usuario.rango, usuario.assist_fires.count]
      end
    end
    send_data(usuarios_csv, :type => 'text/csv', :filename => 'asistencias_incendios.csv')
  end

  def exportar_asistencias_rescates
    @usuarios = User.where(:estado => 'activo')
    usuarios_csv = CSV.generate do |csv|
      csv << ["Nombre", "Apellido", "Rango", "Numero de asistencias"]
      @usuarios.each do |usuario|
        csv << [usuario.nombre, usuario.apellido, usuario.rango, usuario.assist_rescues.count]
      end
    end
    send_data(usuarios_csv, :type => 'text/csv', :filename => 'asistencias_rescates.csv')
  end

  def exportar_asistencias_explosivos
    @usuarios = User.where(:estado => 'activo')
    usuarios_csv = CSV.generate do |csv|
      csv << ["Nombre", "Apellido", "Rango", "Numero de asistencias"]
      @usuarios.each do |usuario|
        csv << [usuario.nombre, usuario.apellido, usuario.rango, usuario.assists.count]
      end
    end
    send_data(usuarios_csv, :type => 'text/csv', :filename => 'asistencias_explosivos.csv')
  end

  def exportar_asistencias_pre_hospitalarios
    @usuarios = User.where(:estado => 'activo')
    usuarios_csv = CSV.generate do |csv|
      csv << ["Nombre", "Apellido", "Rango", "Numero de asistencias"]
      @usuarios.each do |usuario|
        csv << [usuario.nombre, usuario.apellido, usuario.rango, usuario.assist_pre_hospitals.count]
      end
    end
    send_data(usuarios_csv, :type => 'text/csv', :filename => 'asistencias_pre_hospitalario.csv')
  end

  private
  def ordenar_incedio(vector_usuarios)
    vec = vector_usuarios
    for i in (0..vec.size - 1)
      for j in (0..vec.size - 2)
        if vec[j].assist_fires.count < vec[j+1].assist_fires.count
          aux = vec[j]
          vec[j] = vec[j+1]
          vec[j+1] = aux 
        end
      end
    end
    vec
  end

  def ordenar_explosivo(vector_usuarios)
    vec = vector_usuarios
    for i in (0..vec.size - 1)
      for j in (0..vec.size - 2)
        if vec[j].assists.count < vec[j+1].assists.count
          aux = vec[j]
          vec[j] = vec[j+1]
          vec[j+1] = aux 
        end
      end
    end
    vec
  end

  def ordenar_rescate(vector_usuarios)
    vec = vector_usuarios
    for i in (0..vec.size - 1)
      for j in (0..vec.size - 2)
        if vec[j].assist_rescues.count < vec[j+1].assist_rescues.count
          aux = vec[j]
          vec[j] = vec[j+1]
          vec[j+1] = aux 
        end
      end
    end
    vec
  end

  def ordenar_prehospitalario(vector_usuarios)
    vec = vector_usuarios
    for i in (0..vec.size - 1)
      for j in (0..vec.size - 2)
        if vec[j].assist_pre_hospitals.count < vec[j+1].assist_pre_hospitals.count
          aux = vec[j]
          vec[j] = vec[j+1]
          vec[j+1] = aux 
        end
      end
    end
    vec
  end
end
