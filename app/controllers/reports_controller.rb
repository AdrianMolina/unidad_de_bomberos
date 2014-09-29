class ReportsController < ApplicationController
  before_action :authenticate_user!
  def asistencia_incendios
    vector = User.all
    @usuarios = ordenar_incedio(vector)
  end

  def asistencia_rescates
    vector = User.all
    @usuarios = ordenar_rescate(vector)
  end

  def asistencia_explosivos
    vector = User.all
    @usuarios = ordenar_explosivo(vector)
  end

  def asistencia_pre_hospitalarios
    vector = User.all
    @usuarios = ordenar_prehospitalario(vector)
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
